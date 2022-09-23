Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21D5E7A4A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:16:20 +0200 (CEST)
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhbN-0004vP-T2
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhMA-0001gy-P7
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhM8-0000Cn-37
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKD5dj5BRbB/dUJ9ghUyxSIdmCnlPxmqIrhKCIATiRM=;
 b=YYPcQTR29/ob1hkfQuxWd7/vCTnAHm7c77zGTvg2lMBPj78JZ4BFIKqgyPrXubBuykjWYO
 JZs9AGDdCV7we9WkOMlnJy7+LUiOvq484rgx57QkwMZyUXy769cmo7weCUm9CFIPLky7xB
 gbR6eTtuegjsxZ3AaorvFcBlorVPFes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-JcE96BXGMQiG8MwW8D2Zvw-1; Fri, 23 Sep 2022 08:00:28 -0400
X-MC-Unique: JcE96BXGMQiG8MwW8D2Zvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACE8386865C;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E20C15BB9;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2746121E691D; Fri, 23 Sep 2022 14:00:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 2/3] Drop useless casts from g_malloc() & friends to pointer
Date: Fri, 23 Sep 2022 14:00:24 +0200
Message-Id: <20220923120025.448759-3-armbru@redhat.com>
In-Reply-To: <20220923120025.448759-1-armbru@redhat.com>
References: <20220923120025.448759-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These memory allocation functions return void *, and casting to
another pointer type is useless clutter.  Drop these casts.

If you really want another pointer type, consider g_new().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/nseries.c            | 4 ++--
 hw/char/exynos4210_uart.c   | 2 +-
 hw/display/blizzard.c       | 2 +-
 hw/misc/cbus.c              | 6 +++---
 hw/nvram/eeprom93xx.c       | 2 +-
 hw/usb/ccid-card-emulated.c | 2 +-
 target/i386/kvm/kvm.c       | 3 +--
 target/i386/whpx/whpx-all.c | 5 ++---
 target/s390x/kvm/kvm.c      | 2 +-
 ui/vnc-enc-hextile.c        | 4 ++--
 10 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 692c94ceb4..b151113c27 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -702,7 +702,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
 
 static void *mipid_init(void)
 {
-    struct mipid_s *s = (struct mipid_s *) g_malloc0(sizeof(*s));
+    struct mipid_s *s = g_malloc0(sizeof(*s));
 
     s->id = 0x838f03;
     mipid_reset(s);
@@ -1300,7 +1300,7 @@ static int n810_atag_setup(const struct arm_boot_info *info, void *p)
 static void n8x0_init(MachineState *machine,
                       struct arm_boot_info *binfo, int model)
 {
-    struct n800_s *s = (struct n800_s *) g_malloc0(sizeof(*s));
+    struct n800_s *s = g_malloc0(sizeof(*s));
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (machine->ram_size != mc->default_ram_size) {
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index addcd59b02..7b7c56b6ef 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -211,7 +211,7 @@ static void fifo_reset(Exynos4210UartFIFO *q)
     g_free(q->data);
     q->data = NULL;
 
-    q->data = (uint8_t *)g_malloc0(q->size);
+    q->data = g_malloc0(q->size);
 
     q->sp = 0;
     q->rp = 0;
diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..ebe230dd0a 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -1007,7 +1007,7 @@ static const GraphicHwOps blizzard_ops = {
 
 void *s1d13745_init(qemu_irq gpio_int)
 {
-    BlizzardState *s = (BlizzardState *) g_malloc0(sizeof(*s));
+    BlizzardState *s = g_malloc0(sizeof(*s));
     DisplaySurface *surface;
 
     s->fb = g_malloc(0x180000);
diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..653e8ddcd5 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -133,7 +133,7 @@ static void cbus_sel(void *opaque, int line, int level)
 
 CBus *cbus_init(qemu_irq dat)
 {
-    CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
+    CBusPriv *s = g_malloc0(sizeof(*s));
 
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
@@ -388,7 +388,7 @@ static void retu_io(void *opaque, int rw, int reg, uint16_t *val)
 
 void *retu_init(qemu_irq irq, int vilma)
 {
-    CBusRetu *s = (CBusRetu *) g_malloc0(sizeof(*s));
+    CBusRetu *s = g_malloc0(sizeof(*s));
 
     s->irq = irq;
     s->irqen = 0xffff;
@@ -604,7 +604,7 @@ static void tahvo_io(void *opaque, int rw, int reg, uint16_t *val)
 
 void *tahvo_init(qemu_irq irq, int betty)
 {
-    CBusTahvo *s = (CBusTahvo *) g_malloc0(sizeof(*s));
+    CBusTahvo *s = g_malloc0(sizeof(*s));
 
     s->irq = irq;
     s->irqen = 0xffff;
diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index a1b9c78844..1081e2cc0d 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -315,7 +315,7 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
         addrbits = 6;
     }
 
-    eeprom = (eeprom_t *)g_malloc0(sizeof(*eeprom) + nwords * 2);
+    eeprom = g_malloc0(sizeof(*eeprom) + nwords * 2);
     eeprom->size = nwords;
     eeprom->addrbits = addrbits;
     /* Output DO is tristate, read results in 1. */
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 1ddf7297f6..ee41a81801 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -140,7 +140,7 @@ static void emulated_apdu_from_guest(CCIDCardState *base,
     const uint8_t *apdu, uint32_t len)
 {
     EmulatedState *card = EMULATED_CCID_CARD(base);
-    EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent) + len);
+    EmulEvent *event = g_malloc(sizeof(EmulEvent) + len);
 
     assert(event);
     event->p.data.type = EMUL_GUEST_APDU;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f5379..c8f4d500ea 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2252,8 +2252,7 @@ static int kvm_get_supported_feature_msrs(KVMState *s)
     }
 
     assert(msr_list.nmsrs > 0);
-    kvm_feature_msrs = (struct kvm_msr_list *) \
-        g_malloc0(sizeof(msr_list) +
+    kvm_feature_msrs = g_malloc0(sizeof(msr_list) +
                  msr_list.nmsrs * sizeof(msr_list.indices[0]));
 
     kvm_feature_msrs->nmsrs = msr_list.nmsrs;
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..fbb728a36f 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1164,9 +1164,8 @@ static void whpx_translate_cpu_breakpoints(
         (breakpoints->breakpoints ? breakpoints->breakpoints->used : 0);
 
     struct whpx_breakpoint_collection *new_breakpoints =
-        (struct whpx_breakpoint_collection *)g_malloc0(
-        sizeof(struct whpx_breakpoint_collection) +
-            max_breakpoints * sizeof(struct whpx_breakpoint));
+        g_malloc0(sizeof(struct whpx_breakpoint_collection)
+                  + max_breakpoints * sizeof(struct whpx_breakpoint));
 
     new_breakpoints->allocated = max_breakpoints;
     new_breakpoints->used = 0;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7bd8db0e7b..32d23fb617 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1031,7 +1031,7 @@ int kvm_arch_remove_hw_breakpoint(target_ulong addr,
         }
         size = nb_hw_breakpoints * sizeof(struct kvm_hw_breakpoint);
         hw_breakpoints =
-             (struct kvm_hw_breakpoint *)g_realloc(hw_breakpoints, size);
+             g_realloc(hw_breakpoints, size);
     } else {
         g_free(hw_breakpoints);
         hw_breakpoints = NULL;
diff --git a/ui/vnc-enc-hextile.c b/ui/vnc-enc-hextile.c
index 4215bd7daf..c763256f29 100644
--- a/ui/vnc-enc-hextile.c
+++ b/ui/vnc-enc-hextile.c
@@ -50,8 +50,8 @@ int vnc_hextile_send_framebuffer_update(VncState *vs, int x,
     int has_fg, has_bg;
     uint8_t *last_fg, *last_bg;
 
-    last_fg = (uint8_t *) g_malloc(VNC_SERVER_FB_BYTES);
-    last_bg = (uint8_t *) g_malloc(VNC_SERVER_FB_BYTES);
+    last_fg = g_malloc(VNC_SERVER_FB_BYTES);
+    last_bg = g_malloc(VNC_SERVER_FB_BYTES);
     has_fg = has_bg = 0;
     for (j = y; j < (y + h); j += 16) {
         for (i = x; i < (x + w); i += 16) {
-- 
2.37.2


