Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A447591060
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:52:22 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTDB-0005Eg-F9
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oMT5r-0007wJ-R6
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:47 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:38307
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oMT5o-00029e-V5
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:44:47 -0400
HMM_SOURCE_IP: 172.18.0.48:45914.1860825121
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id AAFD72800B5;
 Fri, 12 Aug 2022 19:44:40 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id a814a91a80944a169063d287d92060d2 for
 peter.maydell@linaro.org; Fri, 12 Aug 2022 19:44:43 CST
X-Transaction-ID: a814a91a80944a169063d287d92060d2
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: tugy@chinatelecom.cn
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 tugy@chinatelecom.cn
Subject: [PATCH 2/2] vhost-user: Call qemu_socketpair() instead of socketpair()
Date: Fri, 12 Aug 2022 19:44:30 +0800
Message-Id: <3e370aa5326809d63f7eef573be558da987d27f5.1660303075.git.tugy@chinatelecom.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660303075.git.tugy@chinatelecom.cn>
References: <cover.1660303075.git.tugy@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guoyi Tu <tugy@chinatelecom.cn>

set close-on-exec flag on the new opened file descriptors at default

Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 hw/display/vhost-user-gpu.c | 3 ++-
 hw/virtio/vhost-user.c      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3340ef9e5f..19c0e20103 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/sockets.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "chardev/char-fe.h"
@@ -375,7 +376,7 @@ vhost_user_gpu_do_set_socket(VhostUserGPU *g, Error **errp)
     Chardev *chr;
     int sv[2];
 
-    if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
+    if (qemu_socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
         error_setg_errno(errp, errno, "socketpair() failed");
         return false;
     }
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..4d2b227028 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1726,7 +1726,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return 0;
     }
 
-    if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
+    if (qemu_socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
         int saved_errno = errno;
         error_report("socketpair() failed");
         return -saved_errno;
-- 
2.25.1


