Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1231B884
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:59:48 +0100 (CET)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcXb-00014q-4q
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQb-0007os-V8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQa-00042S-2d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n8so8477269wrm.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BF8LO9cNQ4akwkDY93h/rSr1/g9V8BvTXqt3kC/A3Q=;
 b=A+JVudyhTK6Zk7cIJI7szYY653TWUCzrSa0Sr/LTbr9pC13but9HWrkliEAK27FQ0P
 4fozVogQp4inrXmtswQ/1mk7IV2YLLwFBvxXuuMj4XQ9yv7JCSlEuQ0/AHE8Yu6xfEuP
 4AYaJeXydD/WM/JF+INQjnfxIc1tiZoCjXdNG7PnW6u6SKgOZJsGUwRsoVruYxFRUKeX
 P1NP3PJ98sKxI1mNU/8bOBVkdmj6D7wXwmky9P3EMzsW0pFzW1lgn83rfcy5XI3EVPIe
 W1S0A/01iVj06U61bWY8bobtzTTAcOV2lXxRRymX17MKpL0YNOAKcm4Go1aPsnLijrRP
 +YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BF8LO9cNQ4akwkDY93h/rSr1/g9V8BvTXqt3kC/A3Q=;
 b=FNU/7C2vbkMK7ZGluHp2a75CCHtY4rrbHQ8LnZsNUHqiSPtHTbAOsC/JrmUBWcDDC8
 MlY2ieXrx8xrhlrSIiBjaywaHXDJ5fze/9rleQaGp+TYN68aAyz/OKR3E8Tv1niOE9mm
 Ov02MpfyPwpRt5CaspJfJUafw27B2sxUx8HWIK3tP48rH/vfz7EoVddDw3HmLkd4nuNT
 H8xQtYX3bX+wRKJwLIjTaCyFu1BoeL/OoNf31PsSfSjj/8HmZHL384rQWlvf/AJo2rPJ
 VnCPq64GP8wut7yipc5aoMiwmcQ+sZG8ZB0XMuGIjbSZPrAKObaovRBdBcslSUZuHHQT
 4R8g==
X-Gm-Message-State: AOAM5331VS1kspNbaThkQ0YyPDV22buDmlASvgx+2EKB+T0LY55Z2wKv
 ADePY9JejWW1zjhzrwFT2tlebw==
X-Google-Smtp-Source: ABdhPJwLzwql+GLzHQjin2n92ekN3sYL9gjL6SDKUKq5EuM4CU1uD6GRtL9uH6Ze34ldp7mKh34WSg==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr18641743wri.77.1613389950852; 
 Mon, 15 Feb 2021 03:52:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/24] hw/arm/mps2-tz: Allow PPCPortInfo structures to
 specify device interrupts
Date: Mon, 15 Feb 2021 11:51:26 +0000
Message-Id: <20210215115138.20465-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
---
 hw/arm/mps2-tz.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index ff8b7e5f1ae..085746ac3e6 100644
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


