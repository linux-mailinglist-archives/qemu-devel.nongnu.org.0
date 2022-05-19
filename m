Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59152D608
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:29:13 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrh9M-0006E6-F2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh54-0001v3-Om
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:24:47 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh50-0005KD-Mv
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:24:45 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E6C8A2E1244
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 17:19:28 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 PoFtB88yer-JSJaVLIY; Thu, 19 May 2022 17:19:28 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1652969968; bh=cN8v+N1otPUnPS0jN2PPj36nG7yorTuIWe6DiO1ILv8=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=ZQ5Gvo8sra4R9je07dZogT/w+rHQcWctttIDpYWC0Tm2OFzoxNNYmGjOgG/6fxtnU
 5YzgfSUDM3SdwPluflMgdVdqHf7wiR/eg0JWVQdGH5eD04fdp7zlcNWnfBMJdey5fT
 /Ayp47PTRUWMQ+5a8eGWZDmG9YvWwY5oXCpadAZc=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (unknown [2a02:6b8:b081:8819::1:2b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YbyDbFFlF5-JSNCjT4n; Thu, 19 May 2022 17:19:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 3/4] vhost: add method vhost_set_vring_err
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
Date: Thu, 19 May 2022 17:19:28 +0300
Message-ID: <165296996817.196133.17069691714549471819.stgit@buzz>
In-Reply-To: <165296995578.196133.16183155555450040914.stgit@buzz>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

Kernel and user vhost may report virtqueue errors via eventfd.
This is only reliable way to get notification about protocol error.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/vhost-backend.c         |    7 +++++++
 hw/virtio/vhost-user.c            |    6 ++++++
 include/hw/virtio/vhost-backend.h |    3 +++
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
index b040c1ad2b..37f8d4ab6f 100644
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
@@ -2618,6 +2623,7 @@ const VhostOps user_ops = {
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


