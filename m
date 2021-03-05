Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88B32F23B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:15:54 +0100 (CET)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEzR-0006pT-5J
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3T-00078h-GW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007cY-IG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id e10so2861798wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K/jZXCP6LksMYUYaChqccij/aV0P097t4ytaapQVG2o=;
 b=UCjDKAsGSuHoxlEnK0nUVftZSbaPLAEMAQN99uuGWyELCNRtlQk8fdshOAZkt2K0Xx
 TgW6GxGILiy0lhU/346mDwTs/XDhoytlKSiiqP5TTkAuhG0wJ7D8ZA3vLrEq6VOcBdrX
 DxloWrYI7r9Uap/UO+FPokpexR4cM0avj45Pn88bIqEc0af3z/Mcap4mtVZRsjEah/ns
 6d4cyTDdddA0O28Uw2O1kTCuRYeMvVBGkXNOAn4V3Ir2aY/db7D67h+hZsh+oSZA6c75
 Ezw69Pih+TLdv62cyWA26F4DmF542spDFaT2/taLspJOlD9lc7ZbphYt5Dw5L/ji4T6Z
 z1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/jZXCP6LksMYUYaChqccij/aV0P097t4ytaapQVG2o=;
 b=NANxyyZcerpWdRCqy2toiFNVYU2rRX53WqHIgUcNCBNYiNrjFMm36rmxSXkrgcG0sb
 y2c1jXOIoT/5J+JujQwGkm5ort6Nbsq1BkjUewKwrvWROBBAl33pooU5MnK0oP3s+M59
 t0vMNJgrDnyzvFBQrYwcfMsEW9frr3jB16AQKJZ/UU5ppwx4IZmcOGjkThTiu0Rp72E8
 dEHeQfSlZhwRBA11FMpSGTiZqvCSsozz1ngUmMt2HSAXxzLcIuIv6ncZqcKowpjStl2y
 Db+Io08V86K+6yotKYN6s2vChG9uO2hcEYLEC3KBtmwWIcgK9iGUnPGeyFdiwa77utDG
 nxmQ==
X-Gm-Message-State: AOAM5312UdyQunm0PCCvZM9Rei8VKpSP9l1REjGVaHINq4+9HYLQhJpC
 M+6dWMhZ88wlCotNlFy4v9c1jldG5L8CRA==
X-Google-Smtp-Source: ABdhPJxLqi7c6ImepGhB0fgueOiBaUOF5KtFd2/blAAw+v70LEBnPSe07bYTEZULzfjRmVnyhPfMXA==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr10650616wrh.363.1614964536545; 
 Fri, 05 Mar 2021 09:15:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/49] hw/misc/mps2-scc: Support configurable number of OSCCLK
 values
Date: Fri,  5 Mar 2021 17:14:53 +0000
Message-Id: <20210305171515.1038-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Currently the MPS2 SCC device implements a fixed number of OSCCLK
values (3).  The variant of this device in the MPS3 AN524 board has 6
OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
to specify how large the OSCCLK array should be as well as its
values.

With a variable-length property array, the SCC no longer specifies
default values for the OSCCLKs, so we must set them explicitly in the
board code.  This defaults are actually incorrect for the an521 and
an505; we will correct this bug in a following patch.

This is a migration compatibility break for all the mps boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-3-peter.maydell@linaro.org
---
 include/hw/misc/mps2-scc.h |  7 +++----
 hw/arm/mps2-tz.c           |  5 +++++
 hw/arm/mps2.c              |  5 +++++
 hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
 4 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index f65d8732031..514da49f69e 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -19,8 +19,6 @@
 #define TYPE_MPS2_SCC "mps2-scc"
 OBJECT_DECLARE_SIMPLE_TYPE(MPS2SCC, MPS2_SCC)
 
-#define NUM_OSCCLK 3
-
 struct MPS2SCC {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -39,8 +37,9 @@ struct MPS2SCC {
     uint32_t dll;
     uint32_t aid;
     uint32_t id;
-    uint32_t oscclk[NUM_OSCCLK];
-    uint32_t oscclk_reset[NUM_OSCCLK];
+    uint32_t num_oscclk;
+    uint32_t *oscclk;
+    uint32_t *oscclk_reset;
 };
 
 #endif
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 82ce6262817..7c066c11ed4 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -219,6 +219,11 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
+    /* This will need to be per-FPGA image eventually */
+    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
 }
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 39add416db5..81413b7133e 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -373,6 +373,11 @@ static void mps2_common_init(MachineState *machine)
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
+    /* All these FPGA images have the same OSCCLK configuration */
+    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(&mms->scc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
     object_initialize_child(OBJECT(mms), "fpgaio",
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index ce1dfe93562..52a4e183b71 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -57,7 +57,7 @@ static bool scc_cfg_write(MPS2SCC *s, unsigned function,
 {
     trace_mps2_scc_cfg_write(function, device, value);
 
-    if (function != 1 || device >= NUM_OSCCLK) {
+    if (function != 1 || device >= s->num_oscclk) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC config write: bad function %d device %d\n",
                       function, device);
@@ -75,7 +75,7 @@ static bool scc_cfg_write(MPS2SCC *s, unsigned function,
 static bool scc_cfg_read(MPS2SCC *s, unsigned function,
                          unsigned device, uint32_t *value)
 {
-    if (function != 1 || device >= NUM_OSCCLK) {
+    if (function != 1 || device >= s->num_oscclk) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC config read: bad function %d device %d\n",
                       function, device);
@@ -227,7 +227,7 @@ static void mps2_scc_reset(DeviceState *dev)
     s->cfgctrl = 0x100000;
     s->cfgstat = 0;
     s->dll = 0xffff0001;
-    for (i = 0; i < NUM_OSCCLK; i++) {
+    for (i = 0; i < s->num_oscclk; i++) {
         s->oscclk[i] = s->oscclk_reset[i];
     }
     for (i = 0; i < ARRAY_SIZE(s->led); i++) {
@@ -254,12 +254,14 @@ static void mps2_scc_realize(DeviceState *dev, Error **errp)
                                       LED_COLOR_GREEN, name);
         g_free(name);
     }
+
+    s->oscclk = g_new0(uint32_t, s->num_oscclk);
 }
 
 static const VMStateDescription mps2_scc_vmstate = {
     .name = "mps2-scc",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(cfg0, MPS2SCC),
         VMSTATE_UINT32(cfg1, MPS2SCC),
@@ -268,7 +270,8 @@ static const VMStateDescription mps2_scc_vmstate = {
         VMSTATE_UINT32(cfgctrl, MPS2SCC),
         VMSTATE_UINT32(cfgstat, MPS2SCC),
         VMSTATE_UINT32(dll, MPS2SCC),
-        VMSTATE_UINT32_ARRAY(oscclk, MPS2SCC, NUM_OSCCLK),
+        VMSTATE_VARRAY_UINT32(oscclk, MPS2SCC, num_oscclk,
+                              0, vmstate_info_uint32, uint32_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -280,14 +283,13 @@ static Property mps2_scc_properties[] = {
     DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
     DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
     DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
-    /* These are the initial settings for the source clocks on the board.
+    /*
+     * These are the initial settings for the source clocks on the board.
      * In hardware they can be configured via a config file read by the
      * motherboard configuration controller to suit the FPGA image.
-     * These default values are used by most of the standard FPGA images.
      */
-    DEFINE_PROP_UINT32("oscclk0", MPS2SCC, oscclk_reset[0], 50000000),
-    DEFINE_PROP_UINT32("oscclk1", MPS2SCC, oscclk_reset[1], 24576000),
-    DEFINE_PROP_UINT32("oscclk2", MPS2SCC, oscclk_reset[2], 25000000),
+    DEFINE_PROP_ARRAY("oscclk", MPS2SCC, num_oscclk, oscclk_reset,
+                      qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


