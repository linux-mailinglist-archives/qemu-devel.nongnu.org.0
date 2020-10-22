Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283592964A1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 20:24:48 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVfGZ-0001Eq-7I
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 14:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kVf64-0000WC-VF; Thu, 22 Oct 2020 14:14:01 -0400
Received: from relay.sw.ru ([185.231.240.75]:52088 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kVf5x-0001nq-Hf; Thu, 22 Oct 2020 14:13:56 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kVf5r-005dVw-JD; Thu, 22 Oct 2020 21:13:43 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v12 06/14] copy-on-read: pass bottom node name to COR driver
Date: Thu, 22 Oct 2020 21:13:35 +0300
Message-Id: <1603390423-980205-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 14:13:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

We are going to use the COR-filter for a block-stream job.
To limit COR operations by the base node in the backing chain during
stream job, pass the bottom node name, that is the first non-filter
overlay of the base, to the copy-on-read driver as the base node itself
may change due to possible concurrent jobs.
The rest of the functionality will be implemented in the patch that
follows.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 618c4c4..3d8e4db 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,18 +24,24 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *bottom_bs;
 } BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BlockDriverState *bottom_bs = NULL;
     BDRVStateCOR *state = bs->opaque;
+    /* Find a bottom node name, if any */
+    const char *bottom_node = qdict_get_try_str(options, "bottom");
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -51,7 +57,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (bottom_node) {
+        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
+        if (!bottom_bs) {
+            error_setg(errp, QERR_BASE_NOT_FOUND, bottom_node);
+            qdict_del(options, "bottom");
+            return -EINVAL;
+        }
+        qdict_del(options, "bottom");
+    }
     state->active = true;
+    state->bottom_bs = bottom_bs;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
-- 
1.8.3.1


