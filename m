Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C5557F8E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:16:30 +0200 (CEST)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PVM-0002lu-Ly
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSr-0000oW-7z
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:55 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:50462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSl-0008EJ-Tz
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:52 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 269B32E1B04;
 Thu, 23 Jun 2022 19:13:39 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ChxU9cgRkk-DcJOaiA6; Thu, 23 Jun 2022 19:13:39 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656000819; bh=uCS2kCwKPv0zqX1Xh/2aWw5ESRj1krgufa0yQpWVfl4=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=SNm9xy7FWIwE++5rRNXobYqjV+fWXFsfUuxUP+Ut4b2N1tHBem+HhoiSgZcPq9LqQ
 o0ERWTHA+5ZS8ZVIoKPvzUfSpBZ6uIQH0JCkrtHLXc2tSCsAKzHcrtuAKnYe9OJ7J6
 p3jshlD1Da3f49GQuaadApLcGQSlSBTgd7ZMklwk=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:14::1:1e])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nZkhqFOnB8-DbNiRAFZ; Thu, 23 Jun 2022 19:13:37 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, vsementsov@yandex-team.ru, yc-core@yandex-team.ru,
 rvkagan@yandex-team.ru, armbru@redhat.com,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: [PATCH v2 1/2] vhost: add method vhost_set_vring_err
Date: Thu, 23 Jun 2022 19:13:24 +0300
Message-Id: <20220623161325.18813-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623161325.18813-1-vsementsov@yandex-team.ru>
References: <20220623161325.18813-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Kernel and user vhost may report virtqueue errors via eventfd.
This is only reliable way to get notification about protocol error.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/vhost-backend.c         | 7 +++++++
 hw/virtio/vhost-user.c            | 6 ++++++
 include/hw/virtio/vhost-backend.h | 3 +++
 3 files changed, 16 insertions(+)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 4de8b6b3b0..8e581575c9 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -146,6 +146,12 @@ static int vhost_kernel_set_vring_call(struct vhost_dev *dev,
     return vhost_kernel_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+static int vhost_kernel_set_vring_err(struct vhost_dev *dev,
+                                      struct vhost_vring_file *file)
+{
+    return vhost_kernel_call(dev, VHOST_SET_VRING_ERR, file);
+}
+
 static int vhost_kernel_set_vring_busyloop_timeout(struct vhost_dev *dev,
                                                    struct vhost_vring_state *s)
 {
@@ -309,6 +315,7 @@ const VhostOps kernel_ops = {
         .vhost_get_vring_base = vhost_kernel_get_vring_base,
         .vhost_set_vring_kick = vhost_kernel_set_vring_kick,
         .vhost_set_vring_call = vhost_kernel_set_vring_call,
+        .vhost_set_vring_err = vhost_kernel_set_vring_err,
         .vhost_set_vring_busyloop_timeout =
                                 vhost_kernel_set_vring_busyloop_timeout,
         .vhost_set_features = vhost_kernel_set_features,
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 4b9be26e84..75b8df21a4 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1313,6 +1313,11 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
+static int vhost_user_set_vring_err(struct vhost_dev *dev,
+                                    struct vhost_vring_file *file)
+{
+    return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_ERR, file);
+}
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 {
@@ -2616,6 +2621,7 @@ const VhostOps user_ops = {
         .vhost_get_vring_base = vhost_user_get_vring_base,
         .vhost_set_vring_kick = vhost_user_set_vring_kick,
         .vhost_set_vring_call = vhost_user_set_vring_call,
+        .vhost_set_vring_err = vhost_user_set_vring_err,
         .vhost_set_features = vhost_user_set_features,
         .vhost_get_features = vhost_user_get_features,
         .vhost_set_owner = vhost_user_set_owner,
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..eab46d7f0b 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -69,6 +69,8 @@ typedef int (*vhost_set_vring_kick_op)(struct vhost_dev *dev,
                                        struct vhost_vring_file *file);
 typedef int (*vhost_set_vring_call_op)(struct vhost_dev *dev,
                                        struct vhost_vring_file *file);
+typedef int (*vhost_set_vring_err_op)(struct vhost_dev *dev,
+                                      struct vhost_vring_file *file);
 typedef int (*vhost_set_vring_busyloop_timeout_op)(struct vhost_dev *dev,
                                                    struct vhost_vring_state *r);
 typedef int (*vhost_set_features_op)(struct vhost_dev *dev,
@@ -145,6 +147,7 @@ typedef struct VhostOps {
     vhost_get_vring_base_op vhost_get_vring_base;
     vhost_set_vring_kick_op vhost_set_vring_kick;
     vhost_set_vring_call_op vhost_set_vring_call;
+    vhost_set_vring_err_op vhost_set_vring_err;
     vhost_set_vring_busyloop_timeout_op vhost_set_vring_busyloop_timeout;
     vhost_set_features_op vhost_set_features;
     vhost_get_features_op vhost_get_features;
-- 
2.25.1


