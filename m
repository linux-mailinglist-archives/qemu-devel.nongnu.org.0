Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9D28BF34
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 19:49:41 +0200 (CEST)
Received: from localhost ([::1]:36032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS1x6-0003IK-Pe
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 13:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1uz-0001tJ-LF; Mon, 12 Oct 2020 13:47:29 -0400
Received: from relay.sw.ru ([185.231.240.75]:33202 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1uy-0007e7-0E; Mon, 12 Oct 2020 13:47:29 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1u1-0047iC-IW; Mon, 12 Oct 2020 20:46:29 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com, fam@euphon.net,
 stefanha@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v11 04/13] copy-on-read: pass overlay base node name to COR
 driver
Date: Mon, 12 Oct 2020 20:43:16 +0300
Message-Id: <1602524605-481160-5-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 13:44:17
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
stream job, pass the name of overlay base node to the copy-on-read
driver as base node itself may change due to possible concurrent jobs.
The rest of the functionality will be implemented in the patch that
follows.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index bcccf0f..c578b1b 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,19 +24,24 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *base_overlay;
 } BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BlockDriverState *base_overlay = NULL;
     BDRVStateCOR *state = bs->opaque;
+    /* We need the base overlay node rather than the base itself */
+    const char *base_overlay_node = qdict_get_try_str(options, "base");
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -52,7 +57,16 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (base_overlay_node) {
+        qdict_del(options, "base");
+        base_overlay = bdrv_lookup_bs(NULL, base_overlay_node, errp);
+        if (!base_overlay) {
+            error_setg(errp, QERR_BASE_NOT_FOUND, base_overlay_node);
+            return -EINVAL;
+        }
+    }
     state->active = true;
+    state->base_overlay = base_overlay;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
-- 
1.8.3.1


