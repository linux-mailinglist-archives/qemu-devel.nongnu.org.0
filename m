Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807202B8A59
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 04:12:25 +0100 (CET)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfaMy-000722-IA
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 22:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfaLQ-00065s-Gb; Wed, 18 Nov 2020 22:10:48 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfaLN-0004tH-VF; Wed, 18 Nov 2020 22:10:48 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cc4S21wBVz6v84;
 Thu, 19 Nov 2020 11:10:26 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 11:10:31 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH] hw/display/qxl: Fix bad printf format specifiers
Date: Thu, 19 Nov 2020 02:58:51 +0000
Message-ID: <20201119025851.56487-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/display/qxl-logger.c | 4 ++--
 hw/display/qxl.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index c15175bce3..68bfa47568 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -189,7 +189,7 @@ static void qxl_log_cmd_surface(PCIQXLDevice *qxl, QXLSurfaceCmd *cmd)
             qxl_name(qxl_surface_cmd, cmd->type),
             cmd->surface_id);
     if (cmd->type == QXL_SURFACE_CMD_CREATE) {
-        fprintf(stderr, " size %dx%d stride %d format %s (count %d, max %d)",
+        fprintf(stderr, " size %dx%d stride %d format %s (count %u, max %u)",
                 cmd->u.surface_create.width,
                 cmd->u.surface_create.height,
                 cmd->u.surface_create.stride,
@@ -197,7 +197,7 @@ static void qxl_log_cmd_surface(PCIQXLDevice *qxl, QXLSurfaceCmd *cmd)
                 qxl->guest_surfaces.count, qxl->guest_surfaces.max);
     }
     if (cmd->type == QXL_SURFACE_CMD_DESTROY) {
-        fprintf(stderr, " (count %d)", qxl->guest_surfaces.count);
+        fprintf(stderr, " (count %u)", qxl->guest_surfaces.count);
     }
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 431c107096..874bb8ad9e 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -944,7 +944,7 @@ static void interface_async_complete_io(PCIQXLDevice *qxl, QXLCookie *cookie)
         qxl_spice_destroy_surface_wait_complete(qxl, cookie->u.surface_id);
         break;
     default:
-        fprintf(stderr, "qxl: %s: unexpected current_async %d\n", __func__,
+        fprintf(stderr, "qxl: %s: unexpected current_async %u\n", __func__,
                 current_async);
     }
     qxl_send_events(qxl, QXL_INTERRUPT_IO_CMD);
-- 
2.19.1


