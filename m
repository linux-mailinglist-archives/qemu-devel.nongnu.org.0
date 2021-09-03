Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF594001DF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:17:50 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAwv-0007Xa-AG
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtw-0004bk-Mk
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtu-0007O1-85
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso4011668wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sE2ls29dfSsN30EdvESz1JIj1pUVIWRUf+dXCYAoZ+w=;
 b=P1UAWB2PZcnkZWO3PUTJ+XYo/vvtBJHl0ITqJrtK6OmgZt/+dlOLaYF+HsyEYs4rHC
 umSh2+BJyLqpLPEUF4kGYDAVMDk9hQ/Jm2684x78oO6N7ZS1qEjhdQ4XIjFspJewncUK
 oOqhcz7F1AYHpmjRlAsFQ+GSFkRJm8cPTyMVwxWtqRdmce5KeqGcqGV+MXVC/bR8zM8P
 wqY4hJReejmUKZPw8BFiJkuJb2jxAs5sZ/MrhgFwcsNxlkza3eO8BPIgrfJnQHy4E9LD
 xRQlO0fDlUA/fh0OPKMJKq9l9aVBMmBupo/9C/Teg6FRlcstDtfZH7y6iX7mEpllkbpo
 WDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sE2ls29dfSsN30EdvESz1JIj1pUVIWRUf+dXCYAoZ+w=;
 b=lBsNYQcRQw//SdIWHO3J8WvObadxhpOHVO3A5UEDTmGjZZcq8sZnGBnMoQfQcXokju
 kA0bxh1SBDitA7f4T/tpzxj7/AI+D1+LhyQKl94J9TePm22PHo9fdSq0Alj3P2VahKkJ
 pCaHgU4buXKn4OuoKhrU4qiDP+hbSDKbva7J/Feo+c7JNCD3x1WdSV7Ph04nl1tixtIe
 lOgAyMCB2wEZs3gkjekyiNLaoIchEgADbFgzqWugLi2/CJVQziE2yYUsx5xbsj9Ojboy
 mj3QmfypS2+BOeYFxBcGbybmHQ/GKPBjhyVTmmm/Vry09erlvFwDzaNrLosz02Wbujk7
 XMWA==
X-Gm-Message-State: AOAM5335HyXgzAzm/Dxi6XnYqsiz8niVQ6IEawp8N8OUfeXykZ5Lngy+
 rPMsQdWB/pLC85c4sL+DdUcNlg==
X-Google-Smtp-Source: ABdhPJzqztgYFBjzcDPk7CTMX409SaT8FIRgRpGCwATe0mVvooBzCPDE0Z0UKCsQuxrdA2Po2G+x4g==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr8929730wme.149.1630682080442; 
 Fri, 03 Sep 2021 08:14:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/arm/mps2-tz.c: Add extra data parameter to MakeDevFn
Date: Fri,  3 Sep 2021 16:14:33 +0100
Message-Id: <20210903151435.22379-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mps2-tz boards use a data-driven structure to create the devices
that sit behind peripheral protection controllers.  Currently the
functions which create these devices are passed an 'opaque' pointer
which is always the address within the machine struct of the device
to create, and some "all devices need this" information like irqs and
addresses.

If a specific device needs more information than this, it is
currently not possible to pass that through from the PPCInfo
data structure. Add support for passing an extra data parameter,
so that we can more flexibly handle the needs of specific
device types. To provide some type-safety we make this extra
parameter a pointer to a union (which initially has no members).

In particular, we would like to be able to indicate which of the
i2c controllers are for on-board devices only and which are
connected to the external 'shield' expansion port; a subsequent
patch will use this mechanism for that purpose.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index e23830f4b7d..746ba3cc59e 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -373,6 +373,10 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
     }
 }
 
+/* Union describing the device-specific extra data we pass to the devfn. */
+typedef union PPCExtraData {
+} PPCExtraData;
+
 /* Most of the devices in the AN505 FPGA image sit behind
  * Peripheral Protection Controllers. These data structures
  * define the layout of which devices sit behind which PPCs.
@@ -382,7 +386,8 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
  */
 typedef MemoryRegion *MakeDevFn(MPS2TZMachineState *mms, void *opaque,
                                 const char *name, hwaddr size,
-                                const int *irqs);
+                                const int *irqs,
+                                const PPCExtraData *extradata);
 
 typedef struct PPCPortInfo {
     const char *name;
@@ -391,6 +396,7 @@ typedef struct PPCPortInfo {
     hwaddr addr;
     hwaddr size;
     int irqs[3]; /* currently no device needs more IRQ lines than this */
+    PPCExtraData extradata; /* to pass device-specific info to the devfn */
 } PPCPortInfo;
 
 typedef struct PPCInfo {
@@ -401,7 +407,8 @@ typedef struct PPCInfo {
 static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
                                     void *opaque,
                                     const char *name, hwaddr size,
-                                    const int *irqs)
+                                    const int *irqs,
+                                    const PPCExtraData *extradata)
 {
     /* Initialize, configure and realize a TYPE_UNIMPLEMENTED_DEVICE,
      * and return a pointer to its MemoryRegion.
@@ -417,7 +424,7 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
 
 static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size,
-                               const int *irqs)
+                               const int *irqs, const PPCExtraData *extradata)
 {
     /* The irq[] array is tx, rx, combined, in that order */
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -441,7 +448,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     MPS2SCC *scc = opaque;
     DeviceState *sccdev;
@@ -465,7 +472,7 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
                                  const char *name, hwaddr size,
-                                 const int *irqs)
+                                 const int *irqs, const PPCExtraData *extradata)
 {
     MPS2FPGAIO *fpgaio = opaque;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -480,7 +487,8 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
                                   const char *name, hwaddr size,
-                                  const int *irqs)
+                                  const int *irqs,
+                                  const PPCExtraData *extradata)
 {
     SysBusDevice *s;
     NICInfo *nd = &nd_table[0];
@@ -500,7 +508,8 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
                                   const char *name, hwaddr size,
-                                  const int *irqs)
+                                  const int *irqs,
+                                  const PPCExtraData *extradata)
 {
     /*
      * The AN524 makes the ethernet and USB share a PPC port.
@@ -543,7 +552,7 @@ static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     TZMPC *mpc = opaque;
     int i = mpc - &mms->mpc[0];
@@ -615,7 +624,7 @@ static void remap_irq_fn(void *opaque, int n, int level)
 
 static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     /* The irq[] array is DMACINTR, DMACINTERR, DMACINTTC, in that order */
     PL080State *dma = opaque;
@@ -672,7 +681,7 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     /*
      * The AN505 has five PL022 SPI controllers.
@@ -694,7 +703,7 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     ArmSbconI2CState *i2c = opaque;
     SysBusDevice *s;
@@ -707,7 +716,7 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
 
 static MemoryRegion *make_rtc(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
-                              const int *irqs)
+                              const int *irqs, const PPCExtraData *extradata)
 {
     PL031State *pl031 = opaque;
     SysBusDevice *s;
@@ -1084,7 +1093,7 @@ static void mps2tz_common_init(MachineState *machine)
             }
 
             mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size,
-                              pinfo->irqs);
+                              pinfo->irqs, &pinfo->extradata);
             portname = g_strdup_printf("port[%d]", port);
             object_property_set_link(OBJECT(ppc), portname, OBJECT(mr),
                                      &error_fatal);
-- 
2.20.1


