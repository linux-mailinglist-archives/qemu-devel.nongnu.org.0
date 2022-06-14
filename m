Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9954A8AA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:23:51 +0200 (CEST)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z1q-0002Wk-7b
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvF-0000lx-Tu
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:01 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvE-0000zX-DP
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id e11so7622850pfj.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bra4MXrkftG1CgYi5VJNtBbeWDP0NTrpYw+kRy2gXBY=;
 b=AVc4O/qX6GXxIN2/hewf9JY909hPO3jhYlwOjXk13mYY+Nxp1kLAgVjNd/SpsbTwT4
 ps3tYPDePZ6NuOLIDBrCQcIabBcHHpBpQa/B5jeHteAos2MKZ0n0Nhr+O+OIptIFE4EQ
 LBQ/A7RdOgH4ZFOHJRB3zEH2IR2IN4SVHGlHhvxzqDl/XRYe7jGGHKM5tQayWu5GQVdf
 AYEeldbntlpRtQgkSnj5y6b7BsqJCwGKCyJge1AoGF9+Oz7lPQVs5iye/ECmiLY+A9b+
 RW18uQMm1x4021xVFJh2Dj1imQ7A131xVBfE1AVLgXq91c1iywxrGlEhZEvDei+AXf1h
 RcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bra4MXrkftG1CgYi5VJNtBbeWDP0NTrpYw+kRy2gXBY=;
 b=3QbgbjKse9eWTU72OmDoG5RCe4qwLi18bLha0klWTxqSMJIyAVYhDk47ouoHJt1EMQ
 pJMieUPS9erHf7JbRXpQdaC4K8N5A56zkvzGmo1Cz6ygumL9BLnsnPmyPYFIUNI+bRMz
 PKZROP6p5ZV30uwh7UOI//Q08guk8ahNpAj7Ks1LxJVsC/ZaeblBuYxa1lSrGmgV3i7U
 QBgWy425SEVA/7+BXQ98rs0LpV7anF0FfwAP3Lk9evRjGFyt5geBypPvjNm9/Q6Epz+j
 Wm+UVn7JiYkr+buxebN848l8p0PmEM1+Dta9sL+zre9TAdl1uX2RoTNEMzfajiakDK6J
 XkQg==
X-Gm-Message-State: AOAM530urJCcbyUgR6t1w9bLrzf0iZZWD+imlPkR67+77Ia86tTfByz7
 SYAjsMMK+A35Yhaw/6xeWgJX
X-Google-Smtp-Source: ABdhPJw5o8ipotRVWPh8t5pRkUhxV9RSIprQmN/+k89ajNUKvaqsMVgVHB7cTxR683wv1A8G3IDXyw==
X-Received: by 2002:a05:6a00:1350:b0:51c:26d2:9ce5 with SMTP id
 k16-20020a056a00135000b0051c26d29ce5mr2891428pfu.69.1655183819091; 
 Mon, 13 Jun 2022 22:16:59 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 o9-20020a62f909000000b0052089e1b88esm5389979pfh.192.2022.06.13.22.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:16:58 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] libvduse: Fix some compile errors with clang
Date: Tue, 14 Jun 2022 13:15:27 +0800
Message-Id: <20220614051532.92-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614051532.92-1-xieyongji@bytedance.com>
References: <20220614051532.92-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This fixes some compile errors with clang:

../subprojects/libvduse/libvduse.c:578:20: error: unused function
'vring_used_flags_set_bit' [-Werror,-Wunused-function]
static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
                   ^
../subprojects/libvduse/libvduse.c:587:20: error: unused function
'vring_used_flags_unset_bit' [-Werror,-Wunused-function]
static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask)

../subprojects/libvduse/libvduse.c:325:20: error: cast to pointer from
integer of different size [-Werror=int-to-pointer-cast]
   325 |             munmap((void *)dev->regions[i].mmap_addr,
       |                    ^
../subprojects/libvduse/libvduse.c: In function 'vduse_dev_create':
../subprojects/libvduse/libvduse.c:1318:54: error: format '%lu' expects
argument of type 'long unsigned int', but argument 3 has type 'uint64_t'
{aka 'long long unsigned int'} [-Werror=format=]
 1318 |         fprintf(stderr, "Failed to set api version %lu: %s\n",
      |                                                    ~~^
      |                                                      |
      |                                                      long unsigned int
      |                                                    %llu
 1319 |                 version, strerror(errno));
      |                 ~~~~~~~
      |                 |
      |                 uint64_t {aka long long unsigned int}

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 78bb777402..dd1faffe66 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -27,6 +27,7 @@
 #include <unistd.h>
 #include <limits.h>
 #include <fcntl.h>
+#include <inttypes.h>
 
 #include <sys/ioctl.h>
 #include <sys/eventfd.h>
@@ -322,7 +323,7 @@ static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
 
         if (start <= dev->regions[i].iova &&
             last >= (dev->regions[i].iova + dev->regions[i].size - 1)) {
-            munmap((void *)dev->regions[i].mmap_addr,
+            munmap((void *)(uintptr_t)dev->regions[i].mmap_addr,
                    dev->regions[i].mmap_offset + dev->regions[i].size);
             dev->regions[i].mmap_addr = 0;
             dev->num_regions--;
@@ -575,24 +576,6 @@ void vduse_queue_notify(VduseVirtq *vq)
     }
 }
 
-static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
-{
-    uint16_t *flags;
-
-    flags = (uint16_t *)((char*)vq->vring.used +
-                         offsetof(struct vring_used, flags));
-    *flags = htole16(le16toh(*flags) | mask);
-}
-
-static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask)
-{
-    uint16_t *flags;
-
-    flags = (uint16_t *)((char*)vq->vring.used +
-                         offsetof(struct vring_used, flags));
-    *flags = htole16(le16toh(*flags) & ~mask);
-}
-
 static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
 {
     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
@@ -1315,7 +1298,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
 
     version = VDUSE_API_VERSION;
     if (ioctl(ctrl_fd, VDUSE_SET_API_VERSION, &version)) {
-        fprintf(stderr, "Failed to set api version %lu: %s\n",
+        fprintf(stderr, "Failed to set api version %" PRIu64 ": %s\n",
                 version, strerror(errno));
         goto err_dev;
     }
-- 
2.20.1


