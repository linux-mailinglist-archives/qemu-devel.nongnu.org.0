Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870C67F600
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgL9-0001fJ-5M; Sat, 28 Jan 2023 03:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJT-0005vC-SV
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:52 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJL-0007r1-Kg
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=C2v4txMKhpFeO3OOexLiUCDWMH7TQrHO5Iqi394kcCM=; b=etsIA9n+PlKPCfo0eeocMfv9K5
 ardfZH4i1pnA0tixj7N8OiTlh7lNbiWlLaL3KcUDQLxCuqhMOPSj2Y16B46nSE4XgjdbMnKjk9hLb
 Qkrd+WZ0F+PpSgtLHi4p9KOxfHFCd+yUqBaS49zr01wNazO5zvVGw734iIXAWS/8YUSX7gHmJXXGM
 ThsviKJkeLrFj3BaZ37d/GNJCtbw89L+mpSDZUs3doWySyGvtasyG54zZvCmONahFHHnLJsdWLZ8D
 kTc43EK2o4L2tqSpoN1GDKRyxl+kbDII1JCSRSJvWkkoJCtrjfhBnERnv0VZqQUsg4muPOMHfeQEU
 BC1uX8kg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIS-0039wY-2M; Sat, 28 Jan 2023 08:10:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIy-006mKg-0n; Sat, 28 Jan 2023 08:11:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v9 43/58] hw/xen: Support mapping grant frames
Date: Sat, 28 Jan 2023 08:10:58 +0000
Message-Id: <20230128081113.1615111-44-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
 hw/i386/kvm/xen_gnttab.c  | 74 ++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_overlay.c |  2 +-
 hw/i386/kvm/xen_overlay.h |  2 ++
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 437003a933..52fc9ea7b4 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -37,13 +37,27 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
 #define XEN_PAGE_SHIFT 12
 #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
 
+#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
+#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
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
+        grant_entry_v2_t *v2;
+    } entries;
+
+    MemoryRegion gnt_frames;
+    MemoryRegion *gnt_aliases;
+    uint64_t *gnt_frame_gpas;
 };
 
 struct XenGnttabState *xen_gnttab_singleton;
@@ -51,6 +65,7 @@ struct XenGnttabState *xen_gnttab_singleton;
 static void xen_gnttab_realize(DeviceState *dev, Error **errp)
 {
     XenGnttabState *s = XEN_GNTTAB(dev);
+    int i;
 
     if (xen_mode != XEN_EMULATE) {
         error_setg(errp, "Xen grant table support is for Xen emulation");
@@ -58,6 +73,38 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
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
@@ -70,8 +117,11 @@ static const VMStateDescription xen_gnttab_vmstate = {
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
@@ -106,6 +156,28 @@ type_init(xen_gnttab_register_types)
 
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
index e0efcc6395..77171e5dba 100644
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
index 5c46a0b036..75ecb6b359 100644
--- a/hw/i386/kvm/xen_overlay.h
+++ b/hw/i386/kvm/xen_overlay.h
@@ -21,4 +21,6 @@ int xen_sync_long_mode(void);
 int xen_set_long_mode(bool long_mode);
 bool xen_is_long_mode(void);
 
+void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa);
+
 #endif /* QEMU_XEN_OVERLAY_H */
-- 
2.39.0


