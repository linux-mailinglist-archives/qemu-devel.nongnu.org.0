Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1556E707C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 02:40:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1povrY-0000ec-2o; Tue, 18 Apr 2023 20:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peili.dev@gmail.com>)
 id 1pouFi-0001AP-Ht
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:56:46 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peili.dev@gmail.com>)
 id 1pouFg-0006sT-P6
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:56:46 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id me15so10619214qvb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681858599; x=1684450599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QCFwWrX25kJSvBvwNyNTdbJhUgeLifkPPy7L2EURcFU=;
 b=pb+/mMg0swMc6/VKuDWzcU4D8nOFgCcDd8EPfg6McX8BI1bjwPmbvyKbVl4M80Q2kN
 1szHKzv0Y68S0a5F2fQML3/MdzRbNzXAyv46Yg/V1/XHW6tFRZcUYRuEhj91ZG5o/LdE
 1yPLtXjTBNdWrgfFskyefn9l21aV/l/O5cZDXU215LS87XQ1VNcvv5Y+an45axMApFlL
 Oroa99uq09hXZ1XtGKL3Yu3E61B9njsPRMWIXiciWACBVohqdaPWs+24xnqi87+mFhlo
 TNhdj8MGnmxIo1UTuaP7Nf+eXjKp4ozphcOxEaWLBOUrV/B20CQBGdRNpXyhylOz6VTF
 KrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858599; x=1684450599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCFwWrX25kJSvBvwNyNTdbJhUgeLifkPPy7L2EURcFU=;
 b=hOdLivuogUv04xGhDYLXlSTgANfjj7JQBevPUoAOLmQCg1qYemv3xYezUCV0X8LUW9
 yy9IWvKHqYDSBo0Gz1oO9+iH04Vlpo9e9On2qvFH5wusldyFjLuMSUR40csmRlNQLRuV
 /NE+jl6P1U1cotIFf+UUAX85yvDmTv/y1pxYvRVtNcUAwmZkvnF+aFucAmPQEmfrOSkD
 5TsJXAErlwEkQyVaVo3YlHS/ioEgcV3MyW48Phg5CpWh8FWcTkJP+axWWs2AGLIPv6Al
 mxrY1wHu0qS8S64uk0Y97skSByayXfxvji9bqYt0KPs54YqRiymSf8w/8o4CI6fgvwA2
 9ZHw==
X-Gm-Message-State: AAQBX9deGHV+xYpJELTHtSpeaKlL6VM4iTyMtZorR15Yv2u8T2l1tnnE
 DSHFvWrafOnF7DDxat1LhpNEiYOkgc8=
X-Google-Smtp-Source: AKy350ZeTLBIyoq+/GiwPLZq+bS/A1Czd1BmoDtQ0yRnwIahXLvPtFNlQP8TCazUi+uM/tjhXwycvw==
X-Received: by 2002:a05:6214:29e1:b0:5ef:8b22:69a1 with SMTP id
 jv1-20020a05621429e100b005ef8b2269a1mr9941418qvb.12.1681858598977; 
 Tue, 18 Apr 2023 15:56:38 -0700 (PDT)
Received: from entropy.pdl.local.cmu.edu (NAT1.PDL.CMU.EDU. [128.2.147.192])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a0cf802000000b005ef5b1006c5sm3163243qvn.38.2023.04.18.15.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:56:38 -0700 (PDT)
From: peili.dev@gmail.com
To: qemu-devel@nongnu.org
Cc: eperezma@redhat.com,
	Pei Li <peili.dev@gmail.com>
Subject: [PATCH 1/2] Reduce vdpa initialization / startup overhead
Date: Tue, 18 Apr 2023 18:56:37 -0400
Message-Id: <20230418225638.1467969-1-peili.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=peili.dev@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 20:39:50 -0400
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

From: Pei Li <peili.dev@gmail.com>

Currently, part of the vdpa initialization / startup process
needs to trigger many ioctls per vq, which is very inefficient
and causing unnecessary context switch between user mode and
kernel mode.

This patch creates an additional ioctl() command, namely
VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching
commands of VHOST_VDPA_GET_VRING_GROUP into a single
ioctl() call.

Signed-off-by: Pei Li <peili.dev@gmail.com>
---
 hw/virtio/vhost-vdpa.c                       | 31 +++++++++++++++-----
 include/standard-headers/linux/vhost_types.h |  3 ++
 linux-headers/linux/vhost.h                  |  7 +++++
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc6bad23d5..6d45ff8539 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
         0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
         0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
-        0x1ULL << VHOST_BACKEND_F_SUSPEND;
+        0x1ULL << VHOST_BACKEND_F_SUSPEND |
+        0x1ULL << VHOST_BACKEND_F_IOCTL_BATCH;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
@@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
 
 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
 {
-    int i;
+    int i, nvqs = dev->nvqs;
+    uint64_t backend_features = dev->backend_cap;
+
     trace_vhost_vdpa_set_vring_ready(dev);
-    for (i = 0; i < dev->nvqs; ++i) {
-        struct vhost_vring_state state = {
-            .index = dev->vq_index + i,
-            .num = 1,
-        };
-        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
+
+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH))) {
+        for (i = 0; i < nvqs; ++i) {
+            struct vhost_vring_state state = {
+                .index = dev->vq_index + i,
+                .num = 1,
+            };
+            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
+        }
+    } else {
+        struct vhost_vring_state states[nvqs + 1];
+        states[0].num = nvqs;
+        for (i = 1; i <= nvqs; ++i) {
+            states[i].index = dev->vq_index + i - 1;
+            states[i].num = 1;
+        }
+
+        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE_BATCH, &states[0]);
     }
     return 0;
 }
diff --git a/include/standard-headers/linux/vhost_types.h b/include/standard-headers/linux/vhost_types.h
index c41a73fe36..068d0e1ceb 100644
--- a/include/standard-headers/linux/vhost_types.h
+++ b/include/standard-headers/linux/vhost_types.h
@@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {
 /* Device can be suspended */
 #define VHOST_BACKEND_F_SUSPEND  0x4
 
+/* IOCTL requests can be batched */
+#define VHOST_BACKEND_F_IOCTL_BATCH 0x6
+
 #endif
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index f9f115a7c7..4c9ddd0a0e 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -180,4 +180,11 @@
  */
 #define VHOST_VDPA_SUSPEND		_IO(VHOST_VIRTIO, 0x7D)
 
+/* Batch version of VHOST_VDPA_SET_VRING_ENABLE
+ *
+ * Enable/disable the ring while batching the commands.
+ */
+#define VHOST_VDPA_SET_VRING_ENABLE_BATCH	_IOW(VHOST_VIRTIO, 0x7F, \
+					     struct vhost_vring_state)
+
 #endif
-- 
2.25.1


