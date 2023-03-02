Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CC66A82BE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAK-0006EO-77; Thu, 02 Mar 2023 07:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi76-0002s5-21
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi73-0003Q2-CS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dB6WbxKXppn/pBKWsu4ZTdMZRThfOq9ma6VEMSb9U9w=;
 b=GYfek5T4AaNGZI9mj+dnxksU47t+hhHFORCmTpgat6GrL2UiHR1HaYuRGEHoYP4Y7Jq7Rd
 rF6ecJSiHv35rr21K8V4hi+zyr5rGAF5piHNfZcW3tz4rzgvwqznGlTaO2Bfq/O2FkOXXn
 A9wh1T93tvwVKYuXB8M6b44x9iH/twI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-W8SGBWovM_aYp-f-HOYvWA-1; Thu, 02 Mar 2023 07:32:43 -0500
X-MC-Unique: W8SGBWovM_aYp-f-HOYvWA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t19-20020a0560001a5300b002ce013276b8so176316wry.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dB6WbxKXppn/pBKWsu4ZTdMZRThfOq9ma6VEMSb9U9w=;
 b=j1/NZdEgKLbmetLKsiCwXVnvjYjv4OHlos51LAwDYnW2huw0MboKes5P7hpx+IDZW4
 9m2XQ1PB7C1RevtLKlrgNkb5EsAM6QrXrfbzt0a+auJJEoTOmP8X344qfi+TKe0XwUYo
 y0Cqj/tyJF1fmuBM/tDcfWNeAAhs7gAqXJWmEJ+MmEyRCrPIOVFCw6w21g3HA84fdX2S
 VVT6oAuFvO1NRud4UpNFuhOk60o1PtKRGQuwf//lTmxH5BauhDVlMLPl0iGspgo5L5c5
 Y/kmGytGyXl5rWG71pjUW5T6ruYFGitEoEDk+D7uy1OdMZddWOYaftD36l1sHznEXzDG
 e92A==
X-Gm-Message-State: AO0yUKVdXhorW18WrpfOy/Mh5va+4oMzN5emlWP0/FUcHAWP+fhI+7/7
 trSlyGwzGqP9kbEGu8ozyFq/xXI5Px6TLj9kNc04gUek6vygLUL8mIDWxdTPTcGCf1px+Cw82lM
 7O7f1Zam/3VuY1/Hjfxpoookr2qWP8S1ZOdtJ3jIy0kY3h+SJGRl5PlFtn6ge+hcg1P0Ut3+++R
 c=
X-Received: by 2002:a5d:570e:0:b0:2cb:b1dd:9adb with SMTP id
 a14-20020a5d570e000000b002cbb1dd9adbmr7791500wrv.17.1677760361978; 
 Thu, 02 Mar 2023 04:32:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9RgEebUENZxQ+06g7zWv80Z5ZBGn5x6KEWUvKVgj4X7OyNdRAXBKxLvYbHUPQQFz04kPD3Vw==
X-Received: by 2002:a5d:570e:0:b0:2cb:b1dd:9adb with SMTP id
 a14-20020a5d570e000000b002cbb1dd9adbmr7791484wrv.17.1677760361667; 
 Thu, 02 Mar 2023 04:32:41 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4c47000000b002c5534db60bsm15114788wrt.71.2023.03.02.04.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 44/62] hw/xen: Support mapping grant frames
Date: Thu,  2 Mar 2023 13:30:11 +0100
Message-Id: <20230302123029.153265-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c  | 73 ++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_overlay.c |  2 +-
 hw/i386/kvm/xen_overlay.h |  2 ++
 3 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index ef8857e50c7b..72e87aea6ad6 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -37,13 +37,26 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
 #define XEN_PAGE_SHIFT 12
 #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
 
+#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
+
 struct XenGnttabState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
 
+    QemuMutex gnt_lock;
+
     uint32_t nr_frames;
     uint32_t max_frames;
+
+    union {
+        grant_entry_v1_t *v1;
+        /* Theoretically, v2 support could be added here. */
+    } entries;
+
+    MemoryRegion gnt_frames;
+    MemoryRegion *gnt_aliases;
+    uint64_t *gnt_frame_gpas;
 };
 
 struct XenGnttabState *xen_gnttab_singleton;
@@ -51,6 +64,7 @@ struct XenGnttabState *xen_gnttab_singleton;
 static void xen_gnttab_realize(DeviceState *dev, Error **errp)
 {
     XenGnttabState *s = XEN_GNTTAB(dev);
+    int i;
 
     if (xen_mode != XEN_EMULATE) {
         error_setg(errp, "Xen grant table support is for Xen emulation");
@@ -58,6 +72,38 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
     }
     s->nr_frames = 0;
     s->max_frames = kvm_xen_get_gnttab_max_frames();
+    memory_region_init_ram(&s->gnt_frames, OBJECT(dev), "xen:grant_table",
+                           XEN_PAGE_SIZE * s->max_frames, &error_abort);
+    memory_region_set_enabled(&s->gnt_frames, true);
+    s->entries.v1 = memory_region_get_ram_ptr(&s->gnt_frames);
+    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
+
+    /* Create individual page-sizes aliases for overlays */
+    s->gnt_aliases = (void *)g_new0(MemoryRegion, s->max_frames);
+    s->gnt_frame_gpas = (void *)g_new(uint64_t, s->max_frames);
+    for (i = 0; i < s->max_frames; i++) {
+        memory_region_init_alias(&s->gnt_aliases[i], OBJECT(dev),
+                                 NULL, &s->gnt_frames,
+                                 i * XEN_PAGE_SIZE, XEN_PAGE_SIZE);
+        s->gnt_frame_gpas[i] = INVALID_GPA;
+    }
+
+    qemu_mutex_init(&s->gnt_lock);
+
+    xen_gnttab_singleton = s;
+}
+
+static int xen_gnttab_post_load(void *opaque, int version_id)
+{
+    XenGnttabState *s = XEN_GNTTAB(opaque);
+    uint32_t i;
+
+    for (i = 0; i < s->nr_frames; i++) {
+        if (s->gnt_frame_gpas[i] != INVALID_GPA) {
+            xen_overlay_do_map_page(&s->gnt_aliases[i], s->gnt_frame_gpas[i]);
+        }
+    }
+    return 0;
 }
 
 static bool xen_gnttab_is_needed(void *opaque)
@@ -70,8 +116,11 @@ static const VMStateDescription xen_gnttab_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = xen_gnttab_is_needed,
+    .post_load = xen_gnttab_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(nr_frames, XenGnttabState),
+        VMSTATE_VARRAY_UINT32(gnt_frame_gpas, XenGnttabState, nr_frames, 0,
+                              vmstate_info_uint64, uint64_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -106,6 +155,28 @@ type_init(xen_gnttab_register_types)
 
 int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
 {
-    return -ENOSYS;
+    XenGnttabState *s = xen_gnttab_singleton;
+    uint64_t gpa = gfn << XEN_PAGE_SHIFT;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (idx >= s->max_frames) {
+        return -EINVAL;
+    }
+
+    QEMU_IOTHREAD_LOCK_GUARD();
+    QEMU_LOCK_GUARD(&s->gnt_lock);
+
+    xen_overlay_do_map_page(&s->gnt_aliases[idx], gpa);
+
+    s->gnt_frame_gpas[idx] = gpa;
+
+    if (s->nr_frames <= idx) {
+        s->nr_frames = idx + 1;
+    }
+
+    return 0;
 }
 
diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
index 8685d879594e..39fda1b72c3f 100644
--- a/hw/i386/kvm/xen_overlay.c
+++ b/hw/i386/kvm/xen_overlay.c
@@ -49,7 +49,7 @@ struct XenOverlayState {
 
 struct XenOverlayState *xen_overlay_singleton;
 
-static void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa)
+void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa)
 {
     /*
      * Xen allows guests to map the same page as many times as it likes
diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
index 5c46a0b03659..75ecb6b3598b 100644
--- a/hw/i386/kvm/xen_overlay.h
+++ b/hw/i386/kvm/xen_overlay.h
@@ -21,4 +21,6 @@ int xen_sync_long_mode(void);
 int xen_set_long_mode(bool long_mode);
 bool xen_is_long_mode(void);
 
+void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa);
+
 #endif /* QEMU_XEN_OVERLAY_H */
-- 
2.39.1


