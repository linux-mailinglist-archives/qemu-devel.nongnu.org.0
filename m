Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2156F926C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 16:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvIZI-0001zU-Rc; Sat, 06 May 2023 10:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZH-0001zL-C9
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:23 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZF-0005YV-A3
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-51b661097bfso1971297a12.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683382040; x=1685974040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7W4pDkhcac09mFrjFsZbEkDtV1NHTK2f4k2CnUb2rY4=;
 b=oNpFKuahIcjXYosIU91q1vf3eIGaRJekQ870UZtRuaEHZLLuRr07+XqYtLgKV3h7/p
 Obpo5q/NxJ5OwqFC/tZEAjdVOzMulPFiM4OXaVO5mbS4ohoZOLeV0mBSW4m5jYRdHqTQ
 7ymscb/hAGHa/7dJqFQ42XC/6R75awHYoRvj+iyqnchtyqM7mQIUevXYXSLSVx9m4qh8
 KIa6bHHJRf/jvQfwNxbX/z3VQOq1ec25do7RtX8rj7YUQdGUi4dXXvxdezgGZIQzcwsl
 WbNQ6nODHygDfdHGB3MdEMOqzvCuIJPZfzVNT4L+Py5hHbR+GMWcpR7XFeHGg28SZ7le
 uFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683382040; x=1685974040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7W4pDkhcac09mFrjFsZbEkDtV1NHTK2f4k2CnUb2rY4=;
 b=TTRrppz9ePid6C7HbnAAgVDuSHjnML9DtZZ0O6Sn03EiCL0Tch2lH7UeRiJY34uHpx
 FpapylHKgDu2a622NyH4KuJaoPRV7bTaTbYoxSGET3Kx1gzzPLTYoGxmtFEfL42HMttF
 qCVpvAvLgDPXZyeg1o0luLpkQrG0YBDPgWkJA3cE4En6nkOiYDh/kiXHZbLK3sAt7Ukc
 f0+xonsT52WaTzMcBbyXhTtoaB8EmFI4iGBM1t1JAG01GQOsJ7gEXLHd1n9hJJ1FTrJ5
 5AGVg+upM11T64cI2N52t6v7ATveVYdZrsZwMOQsIfJKvwS2lY6QLww3MonVY96AhTEs
 BlXQ==
X-Gm-Message-State: AC+VfDwFZAdzOR/9mVSmaZuaFM7FHcQNAJz4xeqtUFXz3LRnBt/dBuZE
 lscbbWzldw7wyrjekJfIZbo=
X-Google-Smtp-Source: ACHHUZ5Ojfes26X5jQP6vx1c0LbF0JkEfHrLMYbBbpZHDTEYaN4X47dfgcVL66ABYzj5iThAyV7NYA==
X-Received: by 2002:a17:902:f547:b0:1ac:3e56:41b1 with SMTP id
 h7-20020a170902f54700b001ac3e5641b1mr5858898plf.30.1683382039677; 
 Sat, 06 May 2023 07:07:19 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 nh9-20020a17090b364900b0024decfb1ec2sm6739684pjb.30.2023.05.06.07.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 07:07:19 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] vdpa: send CVQ state load commands in parallel
Date: Sat,  6 May 2023 22:06:13 +0800
Message-Id: <7d800315d04359d0bb91f61ec348eda1bdb972be.1683371965.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683371965.git.yin31149@gmail.com>
References: <cover.1683371965.git.yin31149@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=yin31149@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch introduces the vhost_vdpa_net_cvq_add() and
refactors the vhost_vdpa_net_load*(), so that QEMU can
send CVQ state load commands in parallel.

To be more specific, this patch introduces vhost_vdpa_net_cvq_add()
to add SVQ control commands to SVQ and kick the device,
but does not poll the device used buffers. QEMU will not
poll and check the device used buffers in vhost_vdpa_net_load()
until all CVQ state load commands have been sent to the device.

What's more, in order to avoid buffer overwriting caused by
using `svq->cvq_cmd_out_buffer` and `svq->status` as the
buffer for all CVQ state load commands when sending
CVQ state load commands in parallel, this patch introduces
`out_cursor` and `in_cursor` in vhost_vdpa_net_load(),
pointing to the available buffer for in descriptor and
out descriptor, so that different CVQ state load commands can
use their unique buffer.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1578
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 net/vhost-vdpa.c | 152 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 120 insertions(+), 32 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 10804c7200..14e31ca5c5 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -590,6 +590,44 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     vhost_vdpa_net_client_stop(nc);
 }
 
+/**
+ * vhost_vdpa_net_cvq_add() adds SVQ control commands to SVQ,
+ * kicks the device but does not poll the device used buffers.
+ *
+ * Return the number of elements added to SVQ if success.
+ */
+static int vhost_vdpa_net_cvq_add(VhostVDPAState *s,
+                                void **out_cursor, size_t out_len,
+                                virtio_net_ctrl_ack **in_cursor, size_t in_len)
+{
+    /* Buffers for the device */
+    const struct iovec out = {
+        .iov_base = *out_cursor,
+        .iov_len = out_len,
+    };
+    const struct iovec in = {
+        .iov_base = *in_cursor,
+        .iov_len = sizeof(virtio_net_ctrl_ack),
+    };
+    VhostShadowVirtqueue *svq = g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
+    int r;
+
+    r = vhost_svq_add(svq, &out, 1, &in, 1, NULL);
+    if (unlikely(r != 0)) {
+        if (unlikely(r == -ENOSPC)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
+                          __func__);
+        }
+        return r;
+    }
+
+    /* Update the cursor */
+    *out_cursor += out_len;
+    *in_cursor += 1;
+
+    return 1;
+}
+
 /**
  * vhost_vdpa_net_cvq_add_and_wait() adds SVQ control commands to SVQ,
  * kicks the device and polls the device used buffers.
@@ -628,69 +666,82 @@ static ssize_t vhost_vdpa_net_cvq_add_and_wait(VhostVDPAState *s,
     return vhost_svq_poll(svq);
 }
 
-static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t class,
-                                       uint8_t cmd, const void *data,
-                                       size_t data_size)
+
+/**
+ * vhost_vdpa_net_load_cmd() restores the NIC state through SVQ.
+ *
+ * Return the number of elements added to SVQ if success.
+ */
+static int vhost_vdpa_net_load_cmd(VhostVDPAState *s,
+                                void **out_cursor, uint8_t class, uint8_t cmd,
+                                const void *data, size_t data_size,
+                                virtio_net_ctrl_ack **in_cursor)
 {
     const struct virtio_net_ctrl_hdr ctrl = {
         .class = class,
         .cmd = cmd,
     };
 
-    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl));
+    assert(sizeof(ctrl) < vhost_vdpa_net_cvq_cmd_page_len() -
+                          (*out_cursor - s->cvq_cmd_out_buffer));
+    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(ctrl) -
+                       (*out_cursor - s->cvq_cmd_out_buffer));
 
-    memcpy(s->cvq_cmd_out_buffer, &ctrl, sizeof(ctrl));
-    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
+    memcpy(*out_cursor, &ctrl, sizeof(ctrl));
+    memcpy(*out_cursor + sizeof(ctrl), data, data_size);
 
-    return vhost_vdpa_net_cvq_add_and_wait(s, sizeof(ctrl) + data_size,
-                                  sizeof(virtio_net_ctrl_ack));
+    return vhost_vdpa_net_cvq_add(s, out_cursor, sizeof(ctrl) + data_size,
+                                  in_cursor, sizeof(virtio_net_ctrl_ack));
 }
 
-static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
+/**
+ * vhost_vdpa_net_load_mac() restores the NIC mac through SVQ.
+ *
+ * Return the number of elements added to SVQ if success.
+ */
+static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n,
+                            void **out_cursor, virtio_net_ctrl_ack **in_cursor)
 {
     uint64_t features = n->parent_obj.guest_features;
     if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
-        ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MAC,
-                                                  VIRTIO_NET_CTRL_MAC_ADDR_SET,
-                                                  n->mac, sizeof(n->mac));
-        if (unlikely(dev_written < 0)) {
-            return dev_written;
-        }
-
-        return *s->status != VIRTIO_NET_OK;
+        return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_MAC,
+                                       VIRTIO_NET_CTRL_MAC_ADDR_SET,
+                                       n->mac, sizeof(n->mac), in_cursor);
     }
 
     return 0;
 }
 
-static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
-                                  const VirtIONet *n)
+/**
+ * vhost_vdpa_net_load_mac() restores the NIC mq state through SVQ.
+ *
+ * Return the number of elements added to SVQ if success.
+ */
+static int vhost_vdpa_net_load_mq(VhostVDPAState *s, const VirtIONet *n,
+                            void **out_cursor, virtio_net_ctrl_ack **in_cursor)
 {
     struct virtio_net_ctrl_mq mq;
     uint64_t features = n->parent_obj.guest_features;
-    ssize_t dev_written;
 
     if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
         return 0;
     }
 
     mq.virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs);
-    dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MQ,
-                                          VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET, &mq,
-                                          sizeof(mq));
-    if (unlikely(dev_written < 0)) {
-        return dev_written;
-    }
-
-    return *s->status != VIRTIO_NET_OK;
+    return vhost_vdpa_net_load_cmd(s, out_cursor, VIRTIO_NET_CTRL_MQ,
+                                   VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
+                                   &mq, sizeof(mq), in_cursor);
 }
 
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    VhostShadowVirtqueue *svq;
+    void *out_cursor;
+    virtio_net_ctrl_ack *in_cursor;
     struct vhost_vdpa *v = &s->vhost_vdpa;
     const VirtIONet *n;
-    int r;
+    ssize_t cmds_in_flight = 0, dev_written, r;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
@@ -699,14 +750,51 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     }
 
     n = VIRTIO_NET(v->dev->vdev);
-    r = vhost_vdpa_net_load_mac(s, n);
+    out_cursor = s->cvq_cmd_out_buffer;
+    in_cursor = s->status;
+
+    r = vhost_vdpa_net_load_mac(s, n, &out_cursor, &in_cursor);
     if (unlikely(r < 0)) {
         return r;
     }
-    r = vhost_vdpa_net_load_mq(s, n);
-    if (unlikely(r)) {
+    cmds_in_flight += r;
+
+    r = vhost_vdpa_net_load_mq(s, n, &out_cursor, &in_cursor);
+    if (unlikely(r < 0)) {
         return r;
     }
+    cmds_in_flight += r;
+
+    /* Poll for all used buffer from device */
+    svq = g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
+    while (cmds_in_flight > 0) {
+        /*
+         * We can poll here since we've had BQL from the time we sent the
+         * descriptor. Also, we need to take the answer before SVQ pulls
+         * by itself, when BQL is released
+         */
+        dev_written = vhost_svq_poll(svq);
+
+        if (unlikely(!dev_written)) {
+            /*
+             * vhost_svq_poll() return 0 when something wrong, such as
+             * QEMU waits for too long time or no available used buffer
+             * from device, and there is no need to continue polling
+             * in this case.
+             */
+            return -EINVAL;
+        }
+
+        --cmds_in_flight;
+    }
+
+    /* Check the buffers written by device */
+    for (virtio_net_ctrl_ack *status = s->status; status < in_cursor;
+         ++status) {
+        if (*status != VIRTIO_NET_OK) {
+            return -EINVAL;
+        }
+    }
 
     return 0;
 }
-- 
2.25.1


