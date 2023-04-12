Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F66DFE0B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:53:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfYu-0000kI-4P; Wed, 12 Apr 2023 14:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYm-0000iw-Lc
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYk-0003BH-AN
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tO8ebQO7hdBkDVSP4r+H8wDgeYM8ejzEVuKZ0cLSybE=; b=XNrj8BMABVv6sUMXdtjglSDnX8
 3vqc0BHSKUVoTm4KdYsPLXfvX4sg8NBLll2N3jWqzzy1XjtXhTso4UClv3zK+Wo/lXaWTIKROWAXk
 n8V6T9UBtmYBSg9NMdsP7hiQhPxZoolCMSUzWdMFVrb/wHfVc4To4//Se0e86u8oU9+t4hyPezTbH
 f5MJasfK2wQfTiJs7w5l/hYZYx2CDcsMh7Hwr5uho1w8CUdyi62f2QwEgOT7RJLjBRi8CwnVD9JNN
 4T2rynFSIcpVIvoF02xBSckWGDbUY0yH2mpFcVj7EgK7zOJFQpvAXN7f/sN77jA/1LGpvocufAjv5
 3J7SUvwQ==;
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lC-4l; Wed, 12 Apr 2023 18:51:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1E-1o; Wed, 12 Apr 2023 19:51:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH 1/5] hw/xen: Simplify emulated Xen platform init
Date: Wed, 12 Apr 2023 19:50:58 +0100
Message-Id: <20230412185102.441523-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org;
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

I initially put the basic platform init (overlay pages, grant tables,
event channels) into mc->kvm_type because that was the earliest place
that could sensibly test for xen_mode==XEN_EMULATE.

The intent was to do this early enough that we could then initialise the
XenBus and other parts which would have depended on them, from a generic
location for both Xen and KVM/Xen in the PC-specific code, as seen in
https://lore.kernel.org/qemu-devel/20230116221919.1124201-16-dwmw2@infradead.org/

However, then the Xen on Arm patches came along, and *they* wanted to
do the XenBus init from a 'generic' Xen-specific location instead:
https://lore.kernel.org/qemu-devel/20230210222729.957168-4-sstabellini@kernel.org/

Since there's no generic location that covers all three, I conceded to
do it for XEN_EMULATE mode in pc_basic_devices_init().

And now there's absolutely no point in having some of the platform init
done from pc_machine_kvm_type(); we can move it all up to live in a
single place in pc_basic_devices_init(). This has the added benefit that
we can drop the separate xen_evtchn_connect_gsis() function completely,
and pass just the system GSIs in directly to xen_evtchn_create().

While I'm at it, it does no harm to explicitly pass in the *number* of
said GSIs, because it does make me twitch a bit to pass an array of
impicit size. During the lifetime of the KVM/Xen patchset, that had
already changed (albeit just cosmetically) from GSI_NUM_PINS to
IOAPIC_NUM_PINS.

And document a bit better that this is for the *output* GSI for raising
CPU0's events when the per-CPU vector isn't available. The fact that
we create a whole set of them and then only waggle the one we're told
to, instead of having a single output and only *connecting* it to the
GSI that it should be connected to, is still non-intuitive for me.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c | 40 ++++++++++++++++++++--------------------
 hw/i386/kvm/xen_evtchn.h |  3 +--
 hw/i386/pc.c             | 13 ++++---------
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 3048329474..3d810dbd59 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -147,7 +147,10 @@ struct XenEvtchnState {
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
-    qemu_irq gsis[IOAPIC_NUM_PINS];
+
+    /* Connected to the system GSIs for raising callback as GSI / INTx */
+    unsigned int nr_callback_gsis;
+    qemu_irq *callback_gsis;
 
     struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
 
@@ -299,7 +302,7 @@ static void gsi_assert_bh(void *opaque)
     }
 }
 
-void xen_evtchn_create(void)
+void xen_evtchn_create(unsigned int nr_gsis, qemu_irq *system_gsis)
 {
     XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
                                                         -1, NULL));
@@ -310,8 +313,19 @@ void xen_evtchn_create(void)
     qemu_mutex_init(&s->port_lock);
     s->gsi_bh = aio_bh_new(qemu_get_aio_context(), gsi_assert_bh, s);
 
-    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
-        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
+    /*
+     * These are the *output* GSI from event channel support, for
+     * signalling CPU0's events via GSI or PCI INTx instead of the
+     * per-CPU vector. We create a *set* of irqs and connect one to
+     * each of the system GSIs which were passed in from the platform
+     * code, and then just trigger the right one as appropriate from
+     * xen_evtchn_set_callback_level().
+     */
+    s->nr_callback_gsis = nr_gsis;
+    s->callback_gsis = g_new0(qemu_irq, nr_gsis);
+    for (i = 0; i < nr_gsis; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->callback_gsis[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
     }
 
     /*
@@ -336,20 +350,6 @@ void xen_evtchn_create(void)
     xen_evtchn_ops = &emu_evtchn_backend_ops;
 }
 
-void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-{
-    XenEvtchnState *s = xen_evtchn_singleton;
-    int i;
-
-    if (!s) {
-        return;
-    }
-
-    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
-    }
-}
-
 static void xen_evtchn_register_types(void)
 {
     type_register_static(&xen_evtchn_info);
@@ -430,8 +430,8 @@ void xen_evtchn_set_callback_level(int level)
         return;
     }
 
-    if (s->callback_gsi && s->callback_gsi < IOAPIC_NUM_PINS) {
-        qemu_set_irq(s->gsis[s->callback_gsi], level);
+    if (s->callback_gsi && s->callback_gsi < s->nr_callback_gsis) {
+        qemu_set_irq(s->callback_gsis[s->callback_gsi], level);
         if (level) {
             /* Ensure the vCPU polls for deassertion */
             kvm_xen_set_callback_asserted();
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index bfb67ac2bc..b740acfc0d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,10 +16,9 @@
 
 typedef uint32_t evtchn_port_t;
 
-void xen_evtchn_create(void);
+void xen_evtchn_create(unsigned int nr_gsis, qemu_irq *system_gsis);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
-void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
 void xen_evtchn_set_callback_level(int level);
 
 int xen_evtchn_set_port(uint16_t port);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1489abf010..25584cb8f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1319,7 +1319,10 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
-        xen_evtchn_connect_gsis(gsi);
+        xen_overlay_create();
+        xen_evtchn_create(IOAPIC_NUM_PINS, gsi);
+        xen_gnttab_create();
+        xen_xenstore_create();
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
@@ -1868,14 +1871,6 @@ static void pc_machine_initfn(Object *obj)
 
 int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
 {
-#ifdef CONFIG_XEN_EMU
-    if (xen_mode == XEN_EMULATE) {
-        xen_overlay_create();
-        xen_evtchn_create();
-        xen_gnttab_create();
-        xen_xenstore_create();
-    }
-#endif
     return 0;
 }
 
-- 
2.39.2


