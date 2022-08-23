Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12A59D0A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 07:43:24 +0200 (CEST)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQMh9-0002zs-Fc
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 01:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oQMca-0001Ry-Ji
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 01:38:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oQMcW-0002eE-Dh
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 01:38:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id m15so4999017pjj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=L7up1liUtUBXDpzZUCUuRnd4V6VdL4Act02RfmpmxBQ=;
 b=Zz+agWXloSp6n/bu/4qqyGTINvLXccpMPHcyv8CpjeG8hrNj2F1gNJeq5afXPF49LJ
 2zz9qwJDdT8SaYLgKZvRFQA6Yh05dtzitiYdEOzrUwspmXzZrP3USFQ1nF0ZPvXEedRC
 rDT18pe4I2UGGqt87z++OFGx0R+NzdKGUFTMNpL0JF7kdfQYPAD+iNHMs/RvLfmh1wDl
 lNPJnDOryCU1zhyPqDRwHqYMCBdKBos3gJQEeWF5MYMXvTEZDyt94iIYoX24MJjqAK32
 t1m4xoDlU3praVR7pNynDJ9Qk3jYtQx8kkab+6eO9j6VvcWAfvr1L/TBe/Au1FHQOjfj
 XQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=L7up1liUtUBXDpzZUCUuRnd4V6VdL4Act02RfmpmxBQ=;
 b=sAWeqk9qdfny6ucnALAMIeO/FcEWtYjNyxM1IW8/55IakpHv6XxazlzIINEjAkwjGF
 YZUEpF/MJ+dgZEQcNZrqH1t7QbaAmN9xv/YeOCFKZ7WlRsroaSCgkQ5S4yq6hBDT+JGP
 XEdkYa1tx/v5Dd6tGpcJ4uT/AdjAssQR4SEIdWHXY8g7v1S3mAmbWN+rXZCYZyZn1neo
 7uwry9/1zlxEbWYEIEgV90T8eOMhtETUgxYvNAu5BhONqNi74bI+LCjlGbGp1E2/O7xo
 /koLYyTgZZEVgcilZszPBY8BexUXnZzf6R+Hht3DZA1+b3aFkI3PcHFFj+ilbTYwLL9F
 Qkdw==
X-Gm-Message-State: ACgBeo2tEkZDPeRMsRT6ZRzlg/ALfDV8V6LO2F/Yse+uuq45r2B3+dCD
 o7BNHnTDi9MnWt609LGXhOpTkg==
X-Google-Smtp-Source: AA6agR6yOkAGd8WNfFGnFYKRWfUjy+iwYXWzcB1ZDrQOWLJGCPGB8HMTo5AWcibJBhhd5+HBJD6IcQ==
X-Received: by 2002:a17:903:2346:b0:16e:c9fa:c3ed with SMTP id
 c6-20020a170903234600b0016ec9fac3edmr22923033plh.30.1661233112317; 
 Mon, 22 Aug 2022 22:38:32 -0700 (PDT)
Received: from 64217.smartx.com ([154.31.112.34])
 by smtp.gmail.com with ESMTPSA id
 b66-20020a62cf45000000b00536779d43e7sm4179892pfg.201.2022.08.22.22.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 22:38:31 -0700 (PDT)
From: Li Feng <fengli@smartx.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Cc: lifeng1519@gmail.com,
	Li Feng <fengli@smartx.com>
Subject: [PATCH] vhost: reduce the set_mem_table call frenquency
Date: Tue, 23 Aug 2022 13:38:20 +0800
Message-Id: <20220823053820.35499-1-fengli@smartx.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=fengli@smartx.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the vhost memory layout doesn't change, don't need to call the vhost
backend.
The set_mem_table is time consuming when sending to vhost-user backend.

On aarch64, the edk2 uefi firmware will write the pflash which will
trigger the vhost_commit hundreds of times.

Signed-off-by: Li Feng <fengli@smartx.com>
---
 hw/virtio/vhost.c         | 14 ++++++++++++++
 include/hw/virtio/vhost.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..848d2f20d6 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -523,6 +523,11 @@ static void vhost_commit(MemoryListener *listener)
     /* Rebuild the regions list from the new sections list */
     regions_size = offsetof(struct vhost_memory, regions) +
                        dev->n_mem_sections * sizeof dev->mem->regions[0];
+    if (dev->mem && dev->started) {
+        g_free(dev->old_mem);
+        dev->old_mem = dev->mem;
+        dev->mem = NULL;
+    }
     dev->mem = g_realloc(dev->mem, regions_size);
     dev->mem->nregions = dev->n_mem_sections;
     used_memslots = dev->mem->nregions;
@@ -542,6 +547,12 @@ static void vhost_commit(MemoryListener *listener)
         goto out;
     }
 
+    if (dev->old_mem && dev->regions_size == regions_size &&
+            memcmp(dev->mem, dev->old_mem, dev->regions_size) == 0) {
+        goto out;
+    }
+
+    dev->regions_size = regions_size;
     for (i = 0; i < dev->mem->nregions; i++) {
         if (vhost_verify_ring_mappings(dev,
                        (void *)(uintptr_t)dev->mem->regions[i].userspace_addr,
@@ -1445,6 +1456,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->mem = g_malloc0(offsetof(struct vhost_memory, regions));
     hdev->n_mem_sections = 0;
     hdev->mem_sections = NULL;
+    hdev->old_mem = NULL;
+    hdev->regions_size = 0;
     hdev->log = NULL;
     hdev->log_size = 0;
     hdev->log_enabled = false;
@@ -1491,6 +1504,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
     }
     g_free(hdev->mem);
     g_free(hdev->mem_sections);
+    g_free(hdev->old_mem);
     if (hdev->vhost_ops) {
         hdev->vhost_ops->vhost_backend_cleanup(hdev);
     }
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..b1d7287099 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -73,6 +73,8 @@ struct vhost_dev {
     MemoryListener memory_listener;
     MemoryListener iommu_listener;
     struct vhost_memory *mem;
+    struct vhost_memory *old_mem;
+    int regions_size;
     int n_mem_sections;
     MemoryRegionSection *mem_sections;
     int n_tmp_sections;
-- 
2.37.2


