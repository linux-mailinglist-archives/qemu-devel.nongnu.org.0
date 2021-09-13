Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03F4099E9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:48:27 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPp86-0007I6-35
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYz-0001C9-Qr
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYv-0008HO-Hq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so14784125wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K6n3SsAGE/Xg6IHlS+ExdQzk++OHTVIMQJzivKpwBXE=;
 b=IwLPJQW4xaiXNBPM9+ZeOxSkmfk9W3fZK2s6Q0wfDfsXdAANJD9OorMchQJeAJphf5
 VA5c9/Bz15t8RHCrLMDgd0447oSWpySdjdq79tABiFNkoMWAzkHHePu3PVXoUhjolZtC
 0y1oVFiSmd7Wl/SwcoRRiZj9fqBlqYTVe0otxdZJEGm0S5Uof+/CSKNgrOVh1pDkWnDP
 tSmdKAk8rcmdratvpVP5x4dd4XxchTn1alC4aXE1JbRKGnH8g78NvXEZeJ9YghyZEJtw
 hOSU9XXdTz5RyD0Lhsm7BjTM9IKyO+WMleQOyIgJJHYduIRQKZ5OcCmCLveT1hX5g6zq
 XmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6n3SsAGE/Xg6IHlS+ExdQzk++OHTVIMQJzivKpwBXE=;
 b=zmQBhGt8pZu3OJRCnDJlTZLcrkoypdIpQDveSEKKA4xV2RQdTSJpIoWcQWkrppJ5i2
 G1zfshuMmMroNrqeUMWYGtYbgRyobomC2TPQHLOX1z52QB6wFcF038RrXl9PnLlqbLIv
 vuBEZiqn/NStdHufDBowTOTrdb0lZ7QOScYp15ZNKrIaiXYbbKFGbspuE4XaKpmxlACF
 g8td4B1FCKxB9vsRHlVxTMd72VtQdMypIcjUcjOrdY2hXYEAxov+i40KaMcLkGU7MI6X
 YZhfTl0as+i8ROaUMyGL8wDat5F4Aai+jx4v4eoz3Z5s6eKW3YQZ5fZ54QECItDI4XrC
 XBmg==
X-Gm-Message-State: AOAM531/Ga2KTRGFiRsY8ppk5Xsr8yF5c901oucjj01wXK7bkYF4Xuy+
 M3vi5vX+M+98S8ca6se0goSWZ+DIyeJAnQ==
X-Google-Smtp-Source: ABdhPJxkkJ5BQm6RIKFiIZCvf8a/Qp5vN4h9B0pDBoT7xTJeKaC02up2K0ySISzjUh0hjWINwjdnEA==
X-Received: by 2002:a5d:6dd0:: with SMTP id d16mr13242136wrz.177.1631549523533; 
 Mon, 13 Sep 2021 09:12:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.12.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] hw/arm/mps2-tz.c: Add extra data parameter to MakeDevFn
Date: Mon, 13 Sep 2021 17:11:42 +0100
Message-Id: <20210913161144.12347-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210903151435.22379-3-peter.maydell@linaro.org
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


