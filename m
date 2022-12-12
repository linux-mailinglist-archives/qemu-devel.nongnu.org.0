Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8B64A544
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m0l-0002HU-Rm; Mon, 12 Dec 2022 11:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0c-0002Cu-Rf
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0Y-00032C-4y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:27 -0500
Received: by mail-pl1-x629.google.com with SMTP id g10so12651328plo.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHygLy2vPOJV/Fky9RB+7iOYpBea60FaHFYeg5SQFYY=;
 b=OJjcFdwH7d262/CzFZShlW9lXF/StOZiII2rtlfXMNcBlSZBrZaKNloahfYxS6JPR5
 VarIZ52qRG4K1iJAG6WgsSf/2gzPv6GyXOW4ApIWDBQdSAt2zmJK6GwVz3NhZ1rQ5WTa
 3yndoCO/E23S7oITbxEeuo69xUyCeGXQCaeUiMtV7XZXtaM6jhZd36KqLoEPu7/T1ON0
 4WMvHoqou0nLZt4mS5lixHKVCkuXMp4IksN3USuGLHvIDCJ2T2qUGb9yn12aqP4/D9h0
 mALbnkD82y6wMfJrwKhyOu3KzoPefXqDzknVJdEIo+gnisiMhtbstHlJfBah2GAvN6vD
 VIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHygLy2vPOJV/Fky9RB+7iOYpBea60FaHFYeg5SQFYY=;
 b=ihUTqYABfX5qOKTVFYARdHsIilcRmKog4/Vv4tyyNJP4fjFwEZgEWHD33zblpPJFUq
 qGWihvE+ZJw+DycWoZQumCVJia4M+cMH70kLM9GfyU8vQbh9pLEz0c/02x3SGEl758yN
 P17Ac+PlnEdHF+b46xrrmIfOxC449EGl5QEsTM1Wi9CuVj6yP1I077vub6oXoscCJ8yI
 eWhcJG6mlPq1O7g1v0n5mQeg+Y4t4Q0WuRVJxUuDi4CLNEbIfuxubl2zWyP3mv4aXo0N
 eZEmRzJ8e8V1WiYR+xu3rYRq39yir5BHIcChoE3JUSmKt4WemN/2TEy7TmYkTTqawopL
 FPXQ==
X-Gm-Message-State: ANoB5pla10l9qz1MrzuTFUN/AfsHH41b7KmqalW01+DjZvMEYoQMFnG0
 o3Kpmt4RodTrpT1K7PUCxE7UjU0LchU8vUcj
X-Google-Smtp-Source: AA0mqf7E2gghMP4NSRj6ptdVIqtHGsGFp7J//xbb07TCmGgs8/RT9yDWrYbXrcQkYoV6X2dasRyAkQ==
X-Received: by 2002:a17:902:edc5:b0:187:3a79:6038 with SMTP id
 q5-20020a170902edc500b001873a796038mr18934469plk.18.1670863823071; 
 Mon, 12 Dec 2022 08:50:23 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902ea9500b0018f69009f3esm3012125plb.284.2022.12.12.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 08:50:22 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v2 2/3] virtio: support delay of checks in virtio_load()
Date: Tue, 13 Dec 2022 00:49:41 +0800
Message-Id: <20221212164942.3614611-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Delay checks in virtio_load() to avoid possible address_space_to_flatview() call
during memory region's begin/commit.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 hw/virtio/virtio.c      | 33 ++++++++++++++++++++++-----------
 include/sysemu/sysemu.h |  1 +
 softmmu/globals.c       |  3 +++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..3e3fa2a89d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -33,6 +33,7 @@
 #include "hw/virtio/virtio-access.h"
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_blk.h"
@@ -3642,8 +3643,20 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
         vdev->start_on_kick = true;
     }
 
+    if (vdc->post_load) {
+        ret = vdc->post_load(vdev);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static void virtio_load_check_delay(VirtIODevice *vdev)
+{
     RCU_READ_LOCK_GUARD();
-    for (i = 0; i < num; i++) {
+    for (int i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (vdev->vq[i].vring.desc) {
             uint16_t nheads;
 
@@ -3696,19 +3709,12 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
                              i, vdev->vq[i].vring.num,
                              vdev->vq[i].last_avail_idx,
                              vdev->vq[i].used_idx);
-                return -1;
+                abort();
             }
         }
     }
 
-    if (vdc->post_load) {
-        ret = vdc->post_load(vdev);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    return 0;
+    return;
 }
 
 void virtio_cleanup(VirtIODevice *vdev)
@@ -4158,7 +4164,12 @@ static void virtio_memory_listener_commit(MemoryListener *listener)
         if (vdev->vq[i].vring.num == 0) {
             break;
         }
-        virtio_init_region_cache(vdev, i);
+
+        if (migration_enable_load_check_delay) {
+            virtio_load_check_delay(vdev);
+        } else {
+            virtio_init_region_cache(vdev, i);
+        }
     }
 }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6a7a31e64d..0523091445 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -12,6 +12,7 @@ extern int only_migratable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
+extern bool migration_enable_load_check_delay;
 
 const char *qemu_get_vm_name(void);
 
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 527edbefdd..1bd8f6c978 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -65,3 +65,6 @@ bool qemu_uuid_set;
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_EMULATE;
 bool xen_domid_restrict;
+
+bool migration_enable_load_check_delay;
+
-- 
2.20.1


