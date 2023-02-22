Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890E69FB93
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuI8-0006P7-Oz; Wed, 22 Feb 2023 13:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuI6-0006NF-Hu; Wed, 22 Feb 2023 13:56:34 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuI4-00059z-U1; Wed, 22 Feb 2023 13:56:34 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 9EEEF5FEA7;
 Wed, 22 Feb 2023 21:56:21 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a528::1:22])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id BuTfTE0KlSw0-soz6c0io; Wed, 22 Feb 2023 21:56:20 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@yandex-team.ru, alexander.ivanov@virtuozzo.com
Subject: [PATCH v6 2/7] block/export: add blk_by_export_id()
Date: Wed, 22 Feb 2023 21:55:47 +0300
Message-Id: <20230222185552.913733-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222185552.913733-1-vsementsov@yandex-team.ru>
References: <20230222185552.913733-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We need it for further blockdev-replace functionality.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/sysemu/block-backend-global-state.h |  1 +
 block/export/export.c                       | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 5db83ed8cb..b9dc81c34d 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -71,6 +71,7 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
 DeviceState *blk_get_attached_dev(BlockBackend *blk);
 BlockBackend *blk_by_dev(void *dev);
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+BlockBackend *blk_by_export_id(const char *id, Error **errp);
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
 
 void blk_activate(BlockBackend *blk, Error **errp);
diff --git a/block/export/export.c b/block/export/export.c
index 28a91c9c42..016943860c 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -368,3 +368,21 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
 
     return head;
 }
+
+BlockBackend *blk_by_export_id(const char *id, Error **errp)
+{
+    BlockExport *exp;
+
+    exp = blk_exp_find(id);
+    if (exp == NULL) {
+        error_setg(errp, "Export '%s' not found", id);
+        return NULL;
+    }
+
+    if (!exp->blk) {
+        error_setg(errp, "Export '%s' is empty", id);
+        return NULL;
+    }
+
+    return exp->blk;
+}
-- 
2.34.1


