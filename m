Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80D66D1B3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXpS-0007Om-92; Mon, 16 Jan 2023 17:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXpH-0007Nw-CR
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:35 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXpE-00070d-RU
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=234DlIIfWSw2Nl7QChPa+mP7E68KCZwqADrwc5yxWHs=; b=g09TsnzPmxOWPGDPGk05/2MQwz
 KLbYOkiFLU2VtTDkxUnz1YCP5bODGkgJ3xKrtoWBWD3QB0drqxxQk0jP5Y1V/x+OPuwm8qqGpvg6r
 BC2iqlVsahjpS9ovzfXFR/xNFIUm98M9uyp1eFhugu1VuKEsBppDn8j03Iv01zWxEs/zBv/7zkmrp
 9nxPHxdxPRrZAD6DNNq50QmHGJq/LU7VkrjOYgKsrO6UOdW5bqFmvxdojAcjMrhUtuhhV7/ai/W4t
 DVkDKWQlVn7DGW0wQPVPP6t9XQNkhEN+pwTmWWJEX0cWCVwT2lRJxEflAwXe8UNhJoJWn2GtLZAWB
 SglRH1Yg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXpL-0098V0-Nq; Mon, 16 Jan 2023 22:19:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp8-004iY3-01; Mon, 16 Jan 2023 22:19:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
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
Subject: [RFC PATCH v7bis 13/19] hw/xen: Implement soft reset for emulated
 gnttab
Date: Mon, 16 Jan 2023 22:19:13 +0000
Message-Id: <20230116221919.1124201-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116221919.1124201-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116221919.1124201-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

This is only part of it; we will also need to get the PV back end drivers
to tear down their own mappings (or do it for them, but they kind of need
to stop using the pointers too).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_gnttab.c  | 26 ++++++++++++++++++++++++--
 hw/i386/kvm/xen_gnttab.h  |  1 +
 target/i386/kvm/xen-emu.c |  5 +++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 8008a391bd..3fe3a8043b 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -72,13 +72,11 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Xen grant table support is for Xen emulation");
         return;
     }
-    s->nr_frames = 0;
     s->max_frames = kvm_xen_get_gnttab_max_frames();
     memory_region_init_ram(&s->gnt_frames, OBJECT(dev), "xen:grant_table",
                            XEN_PAGE_SIZE * s->max_frames, &error_abort);
     memory_region_set_enabled(&s->gnt_frames, true);
     s->entries.v1 = memory_region_get_ram_ptr(&s->gnt_frames);
-    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
 
     /* Create individual page-sizes aliases for overlays */
     s->gnt_aliases = (void *)g_new0(MemoryRegion, s->max_frames);
@@ -90,8 +88,11 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
         s->gnt_frame_gpas[i] = INVALID_GPA;
     }
 
+    s->nr_frames = 0;
+    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
+
     qemu_mutex_init(&s->gnt_lock);
 
     xen_gnttab_singleton = s;
@@ -524,3 +525,24 @@ static struct gnttab_backend_ops emu_gnttab_backend_ops = {
     .unmap = xen_be_gnttab_unmap,
 };
 
+int xen_gnttab_reset(void)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->gnt_lock);
+
+    s->nr_frames = 0;
+
+    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
+
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
+
+    memset(s->map_track, 0, s->max_frames * ENTRIES_PER_FRAME_V1);
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
index 3bdbe96191..ee215239b0 100644
--- a/hw/i386/kvm/xen_gnttab.h
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -13,6 +13,7 @@
 #define QEMU_XEN_GNTTAB_H
 
 void xen_gnttab_create(void);
+int xen_gnttab_reset(void);
 int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
 
 struct gnttab_set_version;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 0cd7113681..e2e5e96b67 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1341,6 +1341,11 @@ static int kvm_xen_soft_reset(void)
         return err;
     }
 
+    err = xen_gnttab_reset();
+    if (err) {
+        return err;
+    }
+
     err = xen_xenstore_reset();
     if (err) {
         return err;
-- 
2.39.0


