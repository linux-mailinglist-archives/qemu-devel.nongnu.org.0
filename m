Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFED69E511
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVmV-0008Pq-2u; Tue, 21 Feb 2023 11:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV91-0001cM-0c
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:31 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV8y-0007oa-HT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:30 -0500
Received: by mail-pl1-x630.google.com with SMTP id ky4so6718809plb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ff4mjQm2Eyfc+5mxMY2Zc7LsV1YfI5gwPkWD+DS9CXU=;
 b=Vuuvb7/8J/LwD5JfQYZ59C19591zQ553X2luTKWE1HLAvZqAs2XqCN15WG9bH/9kAH
 cGpSoef793eSz4uaeQ2CudHyTnRYdA5jw0ap/NC+5vw3iBHd4qwErtqMRIyqxv35qdk7
 BIDFjsKbFFGlFygiBvdNQobYvVTZXRftxor1w1yOeLYyWkB5uwLdhZf8SGtXYywp7yCZ
 brOIqnyiAC7HgA0radQARH9TszN8oXTfPqypxo+MuCHJ9k7zgcg4NBSFwcY4cg466UCz
 QXSgyufnJQZTW+ufQLjb4iSMYZwyAKX7anqJBSq7OnacsuCsdXhJ/o+yf9ejK1RFlARE
 h1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ff4mjQm2Eyfc+5mxMY2Zc7LsV1YfI5gwPkWD+DS9CXU=;
 b=uMHhZDWwA/4RnE2SXxCY+BzDXP7m3EDbAHk+HM0hGmTdwJhOsPTbva7GT9kJtIwlXv
 1LFjmsVerGzH45wmU9nR9X00YtGuo7l4Y0KJattPk3YQJR356piG48PQ2vdehg0d0oca
 gSgh2LzCNvcPMoe0scXzdOQM2nMjm48TiMFyQiYIt83gKefO/ct6Vg8JhOgR1LLo8I+k
 Wb/AhptnOnRzmD9cIRkPcyVMqxwxb7Obc3n+SVUvaflVxrEsLVYzSeAHyitKei+7rpRK
 YW6gVetpujtAgaFYiivgYtnaZB2t6gFZ4xmMoM4529CHtALLdaK4Rl2dmwWvjHP9m4lS
 gaYw==
X-Gm-Message-State: AO0yUKWIhQXfjy6z4AE2dIBLVMggpQHV23RVdWO+Q3wHQw/7oikXG34M
 Fs8+R4B9DOXm1qkhFdUWW94n1R+gTcm0cA==
X-Google-Smtp-Source: AK7set+0tOdWJg7NhfO0wxiZdmD+/Aw/W/FRRPllX7oG69v8dkWkVgxPHCo0/k7MuyW2zD0H2qJX3Q==
X-Received: by 2002:a17:902:d4ce:b0:19a:5939:51dd with SMTP id
 o14-20020a170902d4ce00b0019a593951ddmr8406298plg.20.1676995526299; 
 Tue, 21 Feb 2023 08:05:26 -0800 (PST)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 b15-20020a170902650f00b001943d58268csm10076295plk.55.2023.02.21.08.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:05:25 -0800 (PST)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH 1/4] apic: add support for x2APIC mode
Date: Tue, 21 Feb 2023 23:04:57 +0700
Message-Id: <20230221160500.30336-2-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221160500.30336-1-minhquangbui99@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Feb 2023 11:46:13 -0500
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

This commit refactors APIC registers read/write function to support both
MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
support larger APIC ID, self IPI, new IPI destination determination in
x2APIC mode.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
 hw/intc/apic_common.c           |   2 +-
 include/hw/i386/apic.h          |   5 +-
 include/hw/i386/apic_internal.h |   2 +-
 4 files changed, 172 insertions(+), 48 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 2d3e55f4e2..205d5923ec 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -30,6 +30,7 @@
 #include "hw/i386/apic-msidef.h"
 #include "qapi/error.h"
 #include "qom/object.h"
+#include "tcg/helper-tcg.h"
 
 #define MAX_APICS 255
 #define MAX_APIC_WORDS 8
@@ -48,7 +49,7 @@ DECLARE_INSTANCE_CHECKER(APICCommonState, APIC,
 static void apic_set_irq(APICCommonState *s, int vector_num, int trigger_mode);
 static void apic_update_irq(APICCommonState *s);
 static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
-                                      uint8_t dest, uint8_t dest_mode);
+                                      uint32_t dest, uint8_t dest_mode);
 
 /* Find first bit starting from msb */
 static int apic_fls_bit(uint32_t value)
@@ -275,7 +276,7 @@ static void apic_bus_deliver(const uint32_t *deliver_bitmask,
                  apic_set_irq(apic_iter, vector_num, trigger_mode) );
 }
 
-void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
+void apic_deliver_irq(uint32_t dest, uint8_t dest_mode, uint8_t delivery_mode,
                       uint8_t vector_num, uint8_t trigger_mode)
 {
     uint32_t deliver_bitmask[MAX_APIC_WORDS];
@@ -287,8 +288,38 @@ void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
     apic_bus_deliver(deliver_bitmask, delivery_mode, vector_num, trigger_mode);
 }
 
+bool is_x2apic_mode(DeviceState *dev)
+{
+    APICCommonState *s = APIC(dev);
+
+    return s->apicbase & MSR_IA32_APICBASE_EXTD;
+}
+
 static void apic_set_base(APICCommonState *s, uint64_t val)
 {
+    /*
+     * Transition into invalid state
+     * (s->apicbase & MSR_IA32_APICBASE_ENABLE == 0) &&
+     * (s->apicbase & MSR_IA32_APICBASE_EXTD) == 1
+     */
+    if (!(val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from disabled mode to x2APIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from x2APIC to xAPIC */
+    if ((s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        !(val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
     s->apicbase = (val & 0xfffff000) |
         (s->apicbase & (MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE));
     /* if disabled, cannot be enabled again */
@@ -297,6 +328,21 @@ static void apic_set_base(APICCommonState *s, uint64_t val)
         cpu_clear_apic_feature(&s->cpu->env);
         s->spurious_vec &= ~APIC_SV_ENABLE;
     }
+
+    /* Transition from xAPIC to x2APIC */
+    if (cpu_has_x2apic_feature(&s->cpu->env) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        s->apicbase |= MSR_IA32_APICBASE_EXTD;
+
+        s->log_dest = ((s->initial_apic_id & 0xffff0) << 16) |
+                      (1 << (s->initial_apic_id & 0xf));
+
+        /* disable MMIO interface */
+        qemu_mutex_lock_iothread();
+        memory_region_set_enabled(&s->io_memory, false);
+        qemu_mutex_unlock_iothread();
+    }
 }
 
 static void apic_set_tpr(APICCommonState *s, uint8_t val)
@@ -454,7 +500,7 @@ static int apic_find_dest(uint8_t dest)
 }
 
 static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
-                                      uint8_t dest, uint8_t dest_mode)
+                                      uint32_t dest, uint8_t dest_mode)
 {
     APICCommonState *apic_iter;
     int i;
@@ -474,14 +520,22 @@ static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
         for(i = 0; i < MAX_APICS; i++) {
             apic_iter = local_apics[i];
             if (apic_iter) {
-                if (apic_iter->dest_mode == 0xf) {
-                    if (dest & apic_iter->log_dest)
-                        apic_set_bit(deliver_bitmask, i);
-                } else if (apic_iter->dest_mode == 0x0) {
-                    if ((dest & 0xf0) == (apic_iter->log_dest & 0xf0) &&
-                        (dest & apic_iter->log_dest & 0x0f)) {
+                /* x2APIC mode */
+                if (apic_iter->apicbase & MSR_IA32_APICBASE_EXTD) {
+                    if ((dest & 0xffff0000) == (apic_iter->log_dest & 0xffff0000) &&
+                        (dest & apic_iter->log_dest & 0xffff)) {
                         apic_set_bit(deliver_bitmask, i);
                     }
+                } else {
+                    if (apic_iter->dest_mode == 0xf) {
+                        if (dest & apic_iter->log_dest)
+                            apic_set_bit(deliver_bitmask, i);
+                    } else if (apic_iter->dest_mode == 0x0) {
+                        if ((dest & 0xf0) == (apic_iter->log_dest & 0xf0) &&
+                            (dest & apic_iter->log_dest & 0x0f)) {
+                            apic_set_bit(deliver_bitmask, i);
+                        }
+                    }
                 }
             } else {
                 break;
@@ -508,13 +562,12 @@ void apic_sipi(DeviceState *dev)
     s->wait_for_sipi = 0;
 }
 
-static void apic_deliver(DeviceState *dev, uint8_t dest, uint8_t dest_mode,
+static void apic_deliver(DeviceState *dev, uint32_t dest, uint8_t dest_mode,
                          uint8_t delivery_mode, uint8_t vector_num,
-                         uint8_t trigger_mode)
+                         uint8_t trigger_mode, uint8_t dest_shorthand)
 {
     APICCommonState *s = APIC(dev);
     uint32_t deliver_bitmask[MAX_APIC_WORDS];
-    int dest_shorthand = (s->icr[0] >> 18) & 3;
     APICCommonState *apic_iter;
 
     switch (dest_shorthand) {
@@ -635,16 +688,11 @@ static void apic_timer(void *opaque)
     apic_timer_update(s, s->next_time);
 }
 
-static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
+uint64_t apic_register_read(int index)
 {
     DeviceState *dev;
     APICCommonState *s;
-    uint32_t val;
-    int index;
-
-    if (size < 4) {
-        return 0;
-    }
+    uint64_t val;
 
     dev = cpu_get_current_apic();
     if (!dev) {
@@ -652,10 +700,12 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
     }
     s = APIC(dev);
 
-    index = (addr >> 4) & 0xff;
     switch(index) {
     case 0x02: /* id */
-        val = s->id << 24;
+        if (is_x2apic_mode(dev))
+            val = s->initial_apic_id;
+        else
+            val = s->id << 24;
         break;
     case 0x03: /* version */
         val = s->version | ((APIC_LVT_NB - 1) << 16);
@@ -678,9 +728,16 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
         val = 0;
         break;
     case 0x0d:
-        val = s->log_dest << 24;
+        if (is_x2apic_mode(dev))
+            val = s->log_dest;
+        else
+            val = s->log_dest << 24;
         break;
     case 0x0e:
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
         val = (s->dest_mode << 28) | 0xfffffff;
         break;
     case 0x0f:
@@ -719,6 +776,22 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
         val = 0;
         break;
     }
+
+    return val;
+}
+
+static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t val;
+    int index;
+
+    if (size < 4) {
+        return 0;
+    }
+
+    index = (addr >> 4) & 0xff;
+    val = (uint32_t) apic_register_read(index);
+
     trace_apic_mem_readl(addr, val);
     return val;
 }
@@ -736,27 +809,10 @@ static void apic_send_msi(MSIMessage *msi)
     apic_deliver_irq(dest, dest_mode, delivery, vector, trigger_mode);
 }
 
-static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
-                           unsigned size)
+void apic_register_write(int index, uint64_t val)
 {
     DeviceState *dev;
     APICCommonState *s;
-    int index = (addr >> 4) & 0xff;
-
-    if (size < 4) {
-        return;
-    }
-
-    if (addr > 0xfff || !index) {
-        /* MSI and MMIO APIC are at the same memory location,
-         * but actually not on the global bus: MSI is on PCI bus
-         * APIC is connected directly to the CPU.
-         * Mapping them on the global bus happens to work because
-         * MSI registers are reserved in APIC MMIO and vice versa. */
-        MSIMessage msi = { .address = addr, .data = val };
-        apic_send_msi(&msi);
-        return;
-    }
 
     dev = cpu_get_current_apic();
     if (!dev) {
@@ -764,10 +820,12 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     }
     s = APIC(dev);
 
-    trace_apic_mem_writel(addr, val);
-
     switch(index) {
     case 0x02:
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
         s->id = (val >> 24);
         break;
     case 0x03:
@@ -787,9 +845,17 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         apic_eoi(s);
         break;
     case 0x0d:
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
         s->log_dest = val >> 24;
         break;
     case 0x0e:
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
         s->dest_mode = val >> 28;
         break;
     case 0x0f:
@@ -801,13 +867,27 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     case 0x20 ... 0x27:
     case 0x28:
         break;
-    case 0x30:
+    case 0x30: {
+        uint32_t dest;
+
         s->icr[0] = val;
-        apic_deliver(dev, (s->icr[1] >> 24) & 0xff, (s->icr[0] >> 11) & 1,
+        if (is_x2apic_mode(dev)) {
+            s->icr[1] = val >> 32;
+            dest = s->icr[1];
+        } else {
+            dest = (s->icr[1] >> 24) & 0xff;
+        }
+
+        apic_deliver(dev, dest, (s->icr[0] >> 11) & 1,
                      (s->icr[0] >> 8) & 7, (s->icr[0] & 0xff),
-                     (s->icr[0] >> 15) & 1);
+                     (s->icr[0] >> 15) & 1, (s->icr[0] >> 18) & 3);
         break;
+    }
     case 0x31:
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
         s->icr[1] = val;
         break;
     case 0x32 ... 0x37:
@@ -836,12 +916,53 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
             s->count_shift = (v + 1) & 7;
         }
         break;
+    case 0x3f: {
+        int vector = val & 0xff;
+
+        if (is_x2apic_mode(dev)) {
+            raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+        }
+
+        /*
+         * Self IPI is identical to IPI with
+         * - Destination shorthand: 1 (Self)
+         * - Trigger mode: 0 (Edge)
+         * - Delivery mode: 0 (Fixed)
+         */
+        apic_deliver(dev, 0, 0, APIC_DM_FIXED, vector, 0, 1);
+
+        break;
+    }
     default:
         s->esr |= APIC_ESR_ILLEGAL_ADDRESS;
         break;
     }
 }
 
+static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
+                           unsigned size)
+{
+    int index = (addr >> 4) & 0xff;
+
+    if (size < 4) {
+        return;
+    }
+
+    if (addr > 0xfff || !index) {
+        /* MSI and MMIO APIC are at the same memory location,
+         * but actually not on the global bus: MSI is on PCI bus
+         * APIC is connected directly to the CPU.
+         * Mapping them on the global bus happens to work because
+         * MSI registers are reserved in APIC MMIO and vice versa. */
+        MSIMessage msi = { .address = addr, .data = val };
+        apic_send_msi(&msi);
+        return;
+    }
+
+    trace_apic_mem_writel(addr, val);
+    apic_register_write(index, val);
+}
+
 static void apic_pre_save(APICCommonState *s)
 {
     apic_sync_vapic(s, SYNC_FROM_VAPIC);
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 4a34f03047..9ea1397530 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -366,7 +366,7 @@ static const VMStateDescription vmstate_apic_common = {
         VMSTATE_UINT8(arb_id, APICCommonState),
         VMSTATE_UINT8(tpr, APICCommonState),
         VMSTATE_UINT32(spurious_vec, APICCommonState),
-        VMSTATE_UINT8(log_dest, APICCommonState),
+        VMSTATE_UINT32(log_dest, APICCommonState),
         VMSTATE_UINT8(dest_mode, APICCommonState),
         VMSTATE_UINT32_ARRAY(isr, APICCommonState, 8),
         VMSTATE_UINT32_ARRAY(tmr, APICCommonState, 8),
diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index bdc15a7a73..871ca94c5c 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -3,7 +3,7 @@
 
 
 /* apic.c */
-void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
+void apic_deliver_irq(uint32_t dest, uint8_t dest_mode, uint8_t delivery_mode,
                       uint8_t vector_num, uint8_t trigger_mode);
 int apic_accept_pic_intr(DeviceState *s);
 void apic_deliver_pic_intr(DeviceState *s, int level);
@@ -18,6 +18,9 @@ void apic_sipi(DeviceState *s);
 void apic_poll_irq(DeviceState *d);
 void apic_designate_bsp(DeviceState *d, bool bsp);
 int apic_get_highest_priority_irr(DeviceState *dev);
+uint64_t apic_register_read(int index);
+void apic_register_write(int index, uint64_t val);
+bool is_x2apic_mode(DeviceState *d);
 
 /* pc.c */
 DeviceState *cpu_get_current_apic(void);
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 5f2ba24bfc..5f60cd5e78 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -164,7 +164,7 @@ struct APICCommonState {
     uint8_t arb_id;
     uint8_t tpr;
     uint32_t spurious_vec;
-    uint8_t log_dest;
+    uint32_t log_dest;
     uint8_t dest_mode;
     uint32_t isr[8];  /* in service register */
     uint32_t tmr[8];  /* trigger mode register */
-- 
2.25.1


