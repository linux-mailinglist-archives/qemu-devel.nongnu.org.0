Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210732F259
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:21:28 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF4p-0005vV-8z
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3f-0007Jb-Mx
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3F-0007h2-2E
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f12so2877405wrx.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jaKdyUmdPHim/aXpubu6n2b1emubG5YrDH3ab0OG0gQ=;
 b=bQ6T9g3sCHhBV2CG0/9vjAdtm32uX5GS7mWCXLIanchDMvAc4JRcp8yV2TUK2fIh7q
 Je+FS78XO+hH4pmf5JgA3BAIjcUvtMtwVsPCcEd3s86nEA0t+EcF1frYE1xgFWDgGRc0
 jAgbnaLjhyXwKQZ7InsRjuG6ezXG7E0J7zifPsoYDkpR3M2M05a5bNPWBKV1DYA1R5ui
 QWZNY5QjB2F8IYExiXTIIHAPtlSVvcaJXpo5blxNAE6NxfDAC3W3hZK26a4dnfJTSQ/M
 ISBg2Yhhg/1ID38kFQyu91GQHyti+EytLsg2K6ea/EYtRdwPDEzMIKEffm5iv6LE3PMJ
 9bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaKdyUmdPHim/aXpubu6n2b1emubG5YrDH3ab0OG0gQ=;
 b=jbxIwLc28vNDxS3amyu1g39ZXfc/NffToDDh4snwfJgnn1n177GWPZ8M8SfZBXWAMM
 nESW6+BhTwRFQi0++P1OXoYlgiE83Pjm3AFPSKrvaNY0l3UWdHWXdR8vEBZXpU7zodax
 za4UPMaZvBIO/Yza4/Tg2QX2x+WCXg3D8ta9aUmAjilLCPNpWFHoUUNXXQAWXNj7VyHJ
 oRJROc/g4DUrnJOUtdhufxe5zwhW1BzNMxZz3rwQgVBhbfWUX8mIterA6ThHNYdO9weX
 xKsM2gxCNjARbIvlHxkd3yKG6NjuY9C4hux4NMy7dGNBm3UJEKq6T2kN6WgVFHRu2nLH
 tL4g==
X-Gm-Message-State: AOAM531Sj+DUJtePtA6gNIb+y6JsrBzPoz6yuCTq5QOVGc71mZgymsqL
 xYg1ApUhGSZMo4cV/EC6nD+VMnTONg3K0g==
X-Google-Smtp-Source: ABdhPJzJp62zQdET4lrUll4jjkFXLVr0vxRgfVK9rYoDUCmo1yInKdHL2IhVmzjFi9tfVf0IM1Ac/Q==
X-Received: by 2002:a5d:4e83:: with SMTP id e3mr10614259wru.82.1614964543210; 
 Fri, 05 Mar 2021 09:15:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/49] hw/arm/mps2-tz: Allow PPCPortInfo structures to specify
 device interrupts
Date: Fri,  5 Mar 2021 17:15:03 +0000
Message-Id: <20210305171515.1038-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The mps2-tz code uses PPCPortInfo data structures to define what
devices are present and how they are wired up.  Currently we use
these to specify device types and addresses, but hard-code the
interrupt line wiring in each make_* helper function.  This works for
the two boards we have at the moment, but the AN524 has some devices
with different interrupt assignments.

This commit adds the framework to allow PPCPortInfo structures to
specify interrupt numbers.  We add an array of interrupt numbers to
the PPCPortInfo struct, and pass it through to the make_* helpers.
The following commit will change the make_* helpers over to using the
framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-13-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index b9b1351fa74..34ea3389bd1 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -170,7 +170,8 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
  * needs to be plugged into the downstream end of the PPC port.
  */
 typedef MemoryRegion *MakeDevFn(MPS2TZMachineState *mms, void *opaque,
-                                const char *name, hwaddr size);
+                                const char *name, hwaddr size,
+                                const int *irqs);
 
 typedef struct PPCPortInfo {
     const char *name;
@@ -178,6 +179,7 @@ typedef struct PPCPortInfo {
     void *opaque;
     hwaddr addr;
     hwaddr size;
+    int irqs[3]; /* currently no device needs more IRQ lines than this */
 } PPCPortInfo;
 
 typedef struct PPCInfo {
@@ -186,8 +188,9 @@ typedef struct PPCInfo {
 } PPCInfo;
 
 static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
-                                       void *opaque,
-                                       const char *name, hwaddr size)
+                                    void *opaque,
+                                    const char *name, hwaddr size,
+                                    const int *irqs)
 {
     /* Initialize, configure and realize a TYPE_UNIMPLEMENTED_DEVICE,
      * and return a pointer to its MemoryRegion.
@@ -202,7 +205,8 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
 }
 
 static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
-                               const char *name, hwaddr size)
+                               const char *name, hwaddr size,
+                               const int *irqs)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
@@ -227,7 +231,8 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     MPS2SCC *scc = opaque;
     DeviceState *sccdev;
@@ -249,7 +254,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
-                                 const char *name, hwaddr size)
+                                 const char *name, hwaddr size,
+                                 const int *irqs)
 {
     MPS2FPGAIO *fpgaio = opaque;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -262,7 +268,8 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
-                                  const char *name, hwaddr size)
+                                  const char *name, hwaddr size,
+                                  const int *irqs)
 {
     SysBusDevice *s;
     NICInfo *nd = &nd_table[0];
@@ -281,7 +288,8 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     TZMPC *mpc = opaque;
     int i = mpc - &mms->ssram_mpc[0];
@@ -318,7 +326,8 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     PL080State *dma = opaque;
     int i = dma - &mms->dma[0];
@@ -373,7 +382,8 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     /*
      * The AN505 has five PL022 SPI controllers.
@@ -395,7 +405,8 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     ArmSbconI2CState *i2c = opaque;
     SysBusDevice *s;
@@ -604,7 +615,8 @@ static void mps2tz_common_init(MachineState *machine)
                 continue;
             }
 
-            mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size);
+            mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size,
+                              pinfo->irqs);
             portname = g_strdup_printf("port[%d]", port);
             object_property_set_link(OBJECT(ppc), portname, OBJECT(mr),
                                      &error_fatal);
-- 
2.20.1


