Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3E6E7976
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 14:15:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp6hQ-0002AP-L6; Wed, 19 Apr 2023 08:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6Kg-00059k-74
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6KU-00065I-Ab
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a6f0d8cdfeso15430265ad.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681905029; x=1684497029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QAULlSw53JLsLvmavzKWkXLeU05mO+xcLRPRW6r8RE=;
 b=CX4lKPvsggR/fQ7TbuOyhT/2KQpyzqf8hd5zanHELsqfKoY2LpQ0oxmjSdV1zgjBqu
 TCh6OGWvKH+eNip1gVjNVTOIr/KFUgxWqP1vLEYw6aIs9yBJnAKTLdhGro7jn3WL3Nd/
 oMlLTm+qLS8HRRGNxEwYti+q66hYTBjDBFWBAY9/eI7WtOeTkOFhQOFw6jbh/hvUvk8I
 HMQwa3BS0KnM+1IPZG8KV+EXr9tJJNKB+1bYxGvJ4vg/PX6zVpTspn7XwdQFg6WQHVMQ
 yg+9NAc/JJd1yBKuKXK9M8J4Cw4FWH6a14Vb7kcy1hdgDbEvLxp9eTjl98urvqPk3akI
 L/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681905029; x=1684497029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QAULlSw53JLsLvmavzKWkXLeU05mO+xcLRPRW6r8RE=;
 b=TxPMRmd6PzmoDUY5gPRZuyZ1AVay/rEOHRko6IeyCBMZuwBUxQ1rTIKVPfBZLsuzpw
 gEVa30Js+7EjyNENiUEb4uxPkWKiAOqYw/teXWrt9N0ISR8VBVj+NgapUr3uZ24kDNdc
 GuZBEkxIr6oCHmK4LfxhrYjb5nk/FXSeChNWehWEuCTpgHAbShP2CrpWNl78eZSzlzy6
 BFQC3iEVoEk2zihPrA+A98ADuCTcpIRoKXXErndYTyxFbXj403MG3ckIG1lCE+93+CIz
 qX2DqXSXLNDQuEykVXsYtUi+DVldPHyiN1EaeBLzy9PoRyCW6qgh/ekKGmzIrmrdlbMI
 3ASA==
X-Gm-Message-State: AAQBX9euDAwmnkwOxUEeWaCaj45zFJRz8tLrCDSVqmrf+POjVRpF7InD
 y76ciZbRAYwykbvM9eBus/U=
X-Google-Smtp-Source: AKy350Z/fY9HnaNhdVZU29uH6tGmjSXOkTpBmIczdYJHdXLq21ru2rNxBfzL854FEDFSfRcbC00dKw==
X-Received: by 2002:a17:903:110e:b0:1a6:6fe3:df91 with SMTP id
 n14-20020a170903110e00b001a66fe3df91mr5862478plh.50.1681905028771; 
 Wed, 19 Apr 2023 04:50:28 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 o2-20020a170902bcc200b001a6a53c3b04sm8922738pls.306.2023.04.19.04.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 04:50:28 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] vdpa: send CVQ state load commands in parallel
Date: Wed, 19 Apr 2023 19:49:53 +0800
Message-Id: <3bd9b7f8a7dc2c9b68679139623308e184a6de85.1681732982.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681732982.git.yin31149@gmail.com>
References: <cover.1681732982.git.yin31149@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=yin31149@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Apr 2023 08:14:05 -0400
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
 net/vhost-vdpa.c | 137 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 102 insertions(+), 35 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 10804c7200..d1f7113992 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -590,6 +590,44 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     vhost_vdpa_net_client_stop(nc);
 }
 
+/**
+ * vhost_vdpa_net_cvq_add() adds SVQ control commands to SVQ,
+ * kicks the device but does not poll the device used buffers.
+ *
+ * Return the length of the device used buffers.
+ */
+static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s,
+                                void **out_cursor, size_t out_len,
+                                void **in_cursor, size_t in_len)
+{
+    /* Buffers for the device */
+    const struct iovec out = {
+        .iov_base = *out_cursor,
+        .iov_len = out_len,
+    };
+    const struct iovec in = {
+        .iov_base = *in_cursor,
+        .iov_len = in_len,
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
+    *in_cursor += in_len;
+
+    return in_len;
+}
+
 /**
  * vhost_vdpa_net_cvq_add_and_wait() adds SVQ control commands to SVQ,
  * kicks the device and polls the device used buffers.
@@ -628,69 +666,64 @@ static ssize_t vhost_vdpa_net_cvq_add_and_wait(VhostVDPAState *s,
     return vhost_svq_poll(svq);
 }
 
-static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t class,
-                                       uint8_t cmd, const void *data,
-                                       size_t data_size)
+static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s,
+                                void **out_cursor, uint8_t class, uint8_t cmd,
+                                const void *data, size_t data_size,
+                                void **in_cursor)
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
+static ssize_t vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n,
+                                   void **out_cursor, void **in_cursor)
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
+static ssize_t vhost_vdpa_net_load_mq(VhostVDPAState *s, const VirtIONet *n,
+                                  void **out_cursor, void **in_cursor)
 {
     struct virtio_net_ctrl_mq mq;
     uint64_t features = n->parent_obj.guest_features;
-    ssize_t dev_written;
 
     if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
         return 0;
     }
 
-    mq.virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs);
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
+    void *out_cursor, *in_cursor;
     struct vhost_vdpa *v = &s->vhost_vdpa;
     const VirtIONet *n;
-    int r;
+    ssize_t need_poll_len = 0, r, dev_written;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
@@ -699,16 +732,50 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     }
 
     n = VIRTIO_NET(v->dev->vdev);
-    r = vhost_vdpa_net_load_mac(s, n);
+
+    need_poll_len = 0;
+    out_cursor = s->cvq_cmd_out_buffer;
+    in_cursor = s->status;
+
+    r = vhost_vdpa_net_load_mac(s, n, &out_cursor, &in_cursor);
     if (unlikely(r < 0)) {
-        return r;
+        goto load_err;
+    }
+    need_poll_len += r;
+
+    r = vhost_vdpa_net_load_mq(s, n, &out_cursor, &in_cursor);
+    if (unlikely(r < 0)) {
+        goto load_err;
+    }
+    need_poll_len += r;
+
+load_err:
+    /* Poll for all SVQ control commands used buffer from device */
+    svq = g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
+    while (need_poll_len > 0) {
+        /*
+         * We can poll here since we've had BQL from the time we sent the
+         * descriptor. Also, we need to take the answer before SVQ pulls
+         * by itself, when BQL is released
+         */
+        dev_written = vhost_svq_poll(svq);
+        need_poll_len -= dev_written;
     }
-    r = vhost_vdpa_net_load_mq(s, n);
-    if (unlikely(r)) {
+
+    /* If code comes from `load_err` label, then we should return directly */
+    if (unlikely(r < 0)) {
         return r;
     }
 
-    return 0;
+    /* Check the used buffer from device */
+    for (virtio_net_ctrl_ack * status = s->status; (void *)status < in_cursor;
+         ++status) {
+        if (*status != VIRTIO_NET_OK) {
+            ++r;
+        }
+    }
+
+    return r;
 }
 
 static NetClientInfo net_vhost_vdpa_cvq_info = {
-- 
2.25.1


