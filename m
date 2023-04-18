Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC226E707D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 02:40:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1povrY-0000ed-3W; Tue, 18 Apr 2023 20:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peili.dev@gmail.com>)
 id 1pouFi-0001AQ-HG
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:56:46 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peili.dev@gmail.com>)
 id 1pouFg-0006sW-P1
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:56:46 -0400
Received: by mail-qv1-xf35.google.com with SMTP id l17so10357486qvq.10
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681858599; x=1684450599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiycUZJ0nXkvvRNvHas9yRNRXmm9AKIGo6at3LAejXU=;
 b=jKZ29ICHvQdVinMG9D2x4mD4Wb+Fbtp12cVBNUQHON9KOLbEYdndMfFVfzpV5htg1e
 dnKct4vWF78E3HbVpKt7F6rDwzJNuuZ8UZeThaMKhivCWkHXbHPaorSFQWaICzYeTzfm
 Xqof1njemQ6+/HB/97jCBPoe03vzKV9hsnrwR4GdcS+DDRW31qGCISW3+/+4LGRChiC1
 Ye+QW9Y+89TQ+RbPq2XgjU/GDI3EI3n9xYfDSozyWLVTFramPlWzDLdWhcLhAlWlfjp+
 bShL8dKnox0jBZMO1uvbtNeAnTJdQ9nTILR30+1/j8qTahBwKYswBmPxZwRhvHBMt35x
 +Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858599; x=1684450599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiycUZJ0nXkvvRNvHas9yRNRXmm9AKIGo6at3LAejXU=;
 b=CDCBlVlXytRoCg8liY4yS8XrNO5Yf5BgKl4lrBZpADm2XLhSCw8bcD18i+Yxm9bu8S
 6gb84z5vQXLjQqX+C6cciiWjvfoE538xik6NaBcAxS9NRgnob45MyRa2OyXcB2JZnS2z
 155iJusLqZWDNF4sEtTkfTI+D4qITmA96xxyvGtQdJJ7AEFWDwFy8S4F5LT0g2fGHHbO
 XKCe1uLwz1tYC1zsxI3WjDHRfomSoS9KpfovSE2Z63nrreRQxl7YSneWvFYOIP/3i76v
 t0RDOwRuAZMM3a/k7nG28L3EmGGLPi4q9OYPLEDoJiEG7wRKIdjiPRzrT9IVQKpAq/GQ
 UdEQ==
X-Gm-Message-State: AAQBX9ccZHdsE+q3qdp+IgkE7mVVVCCa+Yp2pbIAR/T4newkgpJlL9VO
 2ZGwK8WGOtUDrJI2bqmi9KBzZZ9rLVg=
X-Google-Smtp-Source: AKy350aDLR+IuTGXOnZnk2KNGb/51/PivzZTC8wZhFVVRBiU/NbMVqXlkT09FJN5rWdqtOe5VX9XeA==
X-Received: by 2002:a05:6214:501b:b0:56e:bfda:a138 with SMTP id
 jo27-20020a056214501b00b0056ebfdaa138mr28667006qvb.10.1681858599536; 
 Tue, 18 Apr 2023 15:56:39 -0700 (PDT)
Received: from entropy.pdl.local.cmu.edu (NAT1.PDL.CMU.EDU. [128.2.147.192])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a0cf802000000b005ef5b1006c5sm3163243qvn.38.2023.04.18.15.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:56:39 -0700 (PDT)
From: peili.dev@gmail.com
To: qemu-devel@nongnu.org
Cc: eperezma@redhat.com,
	Pei Li <peili.dev@gmail.com>
Subject: [PATCH 2/2] Reduce vdpa initialization / startup overhead
Date: Tue, 18 Apr 2023 18:56:38 -0400
Message-Id: <20230418225638.1467969-2-peili.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418225638.1467969-1-peili.dev@gmail.com>
References: <20230418225638.1467969-1-peili.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=peili.dev@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 20:39:48 -0400
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
VHOST_VDPA_SET_VRING_ENABLE_BATCH, that will batching
commands of VHOST_VDPA_SET_VRING_ENABLE_BATCH into a single
ioctl() call.

Signed-off-by: Pei Li <peili.dev@gmail.com>
---
 linux-headers/linux/vhost.h | 10 ++++++
 net/vhost-vdpa.c            | 70 +++++++++++++++++++++++++++++++------
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 4c9ddd0a0e..f7cfa324c4 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -187,4 +187,14 @@
 #define VHOST_VDPA_SET_VRING_ENABLE_BATCH	_IOW(VHOST_VIRTIO, 0x7F, \
 					     struct vhost_vring_state)
 
+/* Batch version of VHOST_VDPA_GET_VRING_GROUP
+ *
+ * Get the group for a virtqueue: read index, write group in num,
+ * The virtqueue index is stored in the index field of
+ * vhost_vring_state. The group for this specific virtqueue is
+ * returned via num field of vhost_vring_state while batching commands.
+ */
+#define VHOST_VDPA_GET_VRING_GROUP_BATCH	_IOWR(VHOST_VIRTIO, 0x82, \
+					      struct vhost_vring_state)
+
 #endif
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99904a0da7..ed4f2d5c49 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -377,6 +377,47 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
     return state.num;
 }
 
+static int64_t vhost_vdpa_get_vring_group_batch(int device_fd, unsigned vq_index)
+{
+    int r;
+    struct vhost_vring_state states[vq_index + 1];
+    int64_t cvq_group;
+
+    states[0].num = vq_index;
+
+    for (int i = 1; i <= vq_index; ++i) {
+        states[i].index = i - 1;
+    }
+
+    r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP_BATCH, &states[0]);
+
+    if (unlikely(r < 0)) {
+        error_report("Cannot get VQ %d group: %s", vq_index - 1,
+                     g_strerror(errno));
+        return r;
+    }
+
+    cvq_group = states[vq_index].num;
+
+    if (unlikely(cvq_group < 0)) {
+        return cvq_group;
+    }
+
+    for (int i = 1; i < vq_index; ++i) {
+        int64_t group = states[i].num;
+
+        if (unlikely(group < 0)) {
+            return group;
+        }
+
+        if (group == cvq_group) {
+            return 0;
+        }
+    }
+
+    return vq_index;
+}
+
 static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
                                            unsigned vq_group,
                                            unsigned asid_num)
@@ -512,19 +553,28 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
      * than the last vq. VQ group of last group passed in cvq_group.
      */
     cvq_index = v->dev->vq_index_end - 1;
-    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
-    if (unlikely(cvq_group < 0)) {
-        return cvq_group;
-    }
-    for (int i = 0; i < cvq_index; ++i) {
-        int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
 
-        if (unlikely(group < 0)) {
-            return group;
+    if (! (backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH))) {
+        cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
+        if (unlikely(cvq_group < 0)) {
+            return cvq_group;
         }
+        for (int i = 0; i < cvq_index; ++i) {
+            int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
 
-        if (group == cvq_group) {
-            return 0;
+            if (unlikely(group < 0)) {
+                return group;
+            }
+
+            if (group == cvq_group) {
+                return 0;
+            }
+        }
+    } else {
+        cvq_group = vhost_vdpa_get_vring_group_batch(v->device_fd, cvq_index + 1);
+
+        if (unlikely(cvq_group <= 0)) {
+            return cvq_group;
         }
     }
 
-- 
2.25.1


