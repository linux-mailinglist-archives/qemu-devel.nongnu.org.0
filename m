Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2949B73A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:08:57 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNRI-0002H0-37
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nCHze-0003P1-Vc
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:20:03 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:55560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nCHzd-0003Dl-4k
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:20:02 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 7144611EFFE;
 Tue, 25 Jan 2022 09:19:57 +0000 (UTC)
From: ~dengxuehua <dengxuehua@git.sr.ht>
Date: Tue, 25 Jan 2022 14:33:10 +0800
Subject: [PATCH qemu] qxl: COLO secondary node not need to release resources
MIME-Version: 1.0
Message-ID: <164310239719.1016.2386682120107304758-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Jan 2022 10:01:45 -0500
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
Reply-To: ~dengxuehua <dengxh2@chinatelecom.cn>
Cc: dengxh2@chinatelecom.cn, kraxel@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dengxuehua <dengxh2@chinatelecom.cn>

---
From: Dengxuehua<dengxh2@chinatelecom.cn>

During COLO checkpoint,
the Secondary VM's qemu has loaded Primary VM's qxl states,
so it not
need to release qxl resources.

Resolves: https://gitlab.com/qemu-
project/qemu/-/issues/839
Signed-off-by:
Dengxuehua<dengxh2@chinatelecom.cn>

 hw/display/qxl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 1f9ad31943..41af36344a 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
+#include "migration/colo.h"
 #include "trace.h"
 
 #include "qxl.h"
@@ -757,6 +758,10 @@ static void interface_release_resource(QXLInstance *sin,
     if (!ext.info) {
         return;
     }
+    /* The SVM load PVM states,so it not need to release resources */
+    if (get_colo_mode() == COLO_MODE_SECONDARY) {
+        return;
+    }
     if (ext.group_id == MEMSLOT_GROUP_HOST) {
         /* host group -> vga mode update request */
         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
@@ -880,6 +885,10 @@ static int interface_flush_resources(QXLInstance *sin)
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
     int ret;
 
+    /* The SVM load PVM states,so it not need to release resources */
+    if (get_colo_mode() == COLO_MODE_SECONDARY) {
+        return 0;
+    }
     ret = qxl->num_free_res;
     if (ret) {
         qxl_push_free_res(qxl, 1);
-- 
2.32.0

