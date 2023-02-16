Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6569944C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdKk-0002k2-G3; Thu, 16 Feb 2023 07:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKW-0002eO-VB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKQ-00083Y-Rl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y1so1691763wru.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AcG5UdzDyIGyRqR706CT/5ZNP7noXX1ZENMA65+7uwQ=;
 b=NUvOs9FVMECdGx0qUNazGoGwxFLBjyvFnCsfTwUlLQKTDU+KSxqYwUNbwvtLz/T25f
 CphCPPpH9n2hh9UBC5w28+UPviYzP8b6RldflAEu5neTdKt070gyv0s/CJDbZkEgnjLp
 CzBTKnh5CWrjjvReCs/aI/iB+rYDEWMb6544x1wQ6LWKpusoUv2U+sS84oWOqkhfRftV
 XZhed8JBcL3/QrgaCPgcqTgVOy6am1Tn4KOUrc6uj4/X3Lv6ZTSAuK0rCOKFiZGqhJvG
 vNIBLMb6z1fgEYTvCLwS1LMisGmFLu5vmltyGUWMSdKC+52kLdP7gKJrVnnrw8X2bqj1
 tCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AcG5UdzDyIGyRqR706CT/5ZNP7noXX1ZENMA65+7uwQ=;
 b=T7d7gruNxPXv1SywINxVDtGxrZ4cnYq3wG9PQHIJ0Fg9/TEjokF1r06NLtS/8Qya4F
 f5icFaxrr5YC88kuIL4j3XIayz3rm3DBBuzhBSPlio9FPe1d3vzEBAIXVBQ2BSY08l44
 JbzWWpODITRY1pbWnrkkN6h1xFL/iGUi/v3NxVGJNaN+VG/C1E1E4UzglK9OSaXgMkUJ
 MWOLd/sVMrvuUAVLXG2PJQIX29fFkGzRhuWGak+dH83/QPjVu5mSXgfl8En0mdMOmQVe
 qJmkx3v8iM/u8txGaOPDzWlZOrxdF90tA59mo6sGjTXU9c3PiMKraGnU9nVugrssyQs8
 uRCA==
X-Gm-Message-State: AO0yUKWsyJ+Pi1+xOtRbYrzbLOTNA3H1OiaLGfT57hKVMlm5MGQ8MVrJ
 pAIlUKCszOgiCRmusufrB3Wsi6aYftZymcMa
X-Google-Smtp-Source: AK7set8FCU3j+l3FoBI8dJjPzYxOUCBScxd/oWaDnxBueFQfMvwGV5/4i/a8gkVFFLrR7hegjIL4JA==
X-Received: by 2002:a5d:6882:0:b0:2c3:fb3e:ae85 with SMTP id
 h2-20020a5d6882000000b002c3fb3eae85mr5542920wru.44.1676550332076; 
 Thu, 16 Feb 2023 04:25:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm5859047wmq.2.2023.02.16.04.25.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 1/5] hw/nmi: Have nmi_monitor_handler() return a boolean
 indicating error
Date: Thu, 16 Feb 2023 13:25:20 +0100
Message-Id: <20230216122524.67212-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216122524.67212-1-philmd@linaro.org>
References: <20230216122524.67212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have the nmi_monitor_handler
return a boolean indicating whether an error is set or not and
convert its implementations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/nmi.c              | 3 +--
 hw/hppa/machine.c          | 3 ++-
 hw/i386/x86.c              | 3 ++-
 hw/intc/m68k_irqc.c        | 4 +++-
 hw/m68k/q800.c             | 4 +++-
 hw/misc/macio/gpio.c       | 4 +++-
 hw/ppc/pnv.c               | 3 ++-
 hw/ppc/spapr.c             | 3 ++-
 hw/s390x/s390-virtio-ccw.c | 4 +++-
 include/hw/nmi.h           | 3 ++-
 10 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index 481c4b3c7e..76cb3ba3b0 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -43,8 +43,7 @@ static int do_nmi(Object *o, void *opaque)
         NMIClass *nc = NMI_GET_CLASS(n);
 
         ns->handled = true;
-        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
-        if (ns->err) {
+        if (!nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err)) {
             return -1;
         }
     }
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7ac68c943f..da7c36c554 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -437,13 +437,14 @@ static void hppa_machine_reset(MachineState *ms, ShutdownCause reason)
     cpu[0]->env.gr[19] = FW_CFG_IO_BASE;
 }
 
-static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool hppa_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     CPUState *cs;
 
     CPU_FOREACH(cs) {
         cpu_interrupt(cs, CPU_INTERRUPT_NMI);
     }
+    return true;
 }
 
 static void hppa_machine_init_class_init(ObjectClass *oc, void *data)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..8bd0691705 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -501,7 +501,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
-static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool x86_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     /* cpu index isn't used */
     CPUState *cs;
@@ -515,6 +515,7 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
             apic_deliver_nmi(cpu->apic_state);
         }
     }
+    return true;
 }
 
 static long get_file_size(FILE *f)
diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
index 0c515e4ecb..e05083e756 100644
--- a/hw/intc/m68k_irqc.c
+++ b/hw/intc/m68k_irqc.c
@@ -70,9 +70,11 @@ static void m68k_irqc_instance_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), m68k_set_irq, M68K_IRQC_LEVEL_NUM);
 }
 
-static void m68k_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool m68k_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     m68k_set_irq(n, M68K_IRQC_LEVEL_7, 1);
+
+    return true;
 }
 
 static const VMStateDescription vmstate_m68k_irqc = {
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9d52ca6613..8631a226cd 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -227,13 +227,15 @@ static void glue_auxmode_set_irq(void *opaque, int irq, int level)
     s->auxmode = level;
 }
 
-static void glue_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool glue_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     GLUEState *s = GLUE(n);
 
     /* Hold NMI active for 100ms */
     GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 1);
     timer_mod(s->nmi_release, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 100);
+
+    return true;
 }
 
 static void glue_nmi_release(void *opaque)
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index c8ac5633b2..0a7214421c 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -182,10 +182,12 @@ static void macio_gpio_reset(DeviceState *dev)
     macio_set_gpio(s, 1, true);
 }
 
-static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     macio_set_gpio(MACIO_GPIO(n), 9, true);
     macio_set_gpio(MACIO_GPIO(n), 9, false);
+
+    return true;
 }
 
 static void macio_gpio_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44b1fbbc93..38e69f3b39 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2309,13 +2309,14 @@ static void pnv_cpu_do_nmi_on_cpu(CPUState *cs, run_on_cpu_data arg)
     }
 }
 
-static void pnv_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool pnv_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     CPUState *cs;
 
     CPU_FOREACH(cs) {
         async_run_on_cpu(cs, pnv_cpu_do_nmi_on_cpu, RUN_ON_CPU_NULL);
     }
+    return true;
 }
 
 static void pnv_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4921198b9d..d298068169 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3464,13 +3464,14 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg)
     }
 }
 
-static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool spapr_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     CPUState *cs;
 
     CPU_FOREACH(cs) {
         async_run_on_cpu(cs, spapr_do_system_reset_on_cpu, RUN_ON_CPU_NULL);
     }
+    return true;
 }
 
 int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f22f61b8b6..af7e6c632a 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -570,11 +570,13 @@ static HotplugHandler *s390_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
-static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
+static bool s390_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     CPUState *cs = qemu_get_cpu(cpu_index);
 
     s390_cpu_restart(S390_CPU(cs));
+
+    return true;
 }
 
 static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index fff41bebc6..3e827a254a 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -37,7 +37,8 @@ typedef struct NMIState NMIState;
 struct NMIClass {
     InterfaceClass parent_class;
 
-    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
+    /** Returns: %true on success, %false on error. */
+    bool (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
 };
 
 void nmi_monitor_handle(int cpu_index, Error **errp);
-- 
2.38.1


