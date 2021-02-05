Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18658310F42
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:58:46 +0100 (CET)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85NV-0004cS-43
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TO-0006eU-S0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T3-000400-GM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id y187so6447735wmd.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6e/ocFlNpbvzWzShp69RWnr5b+cScjq0s1B9GZ0rX5w=;
 b=VU1fOfjB2vqX/Qnx5iw3D6D2LKQ5cXEMGUOcCXoeSDIPHiT8skK9dQ+bcMEdO7KO5o
 mC9qvqGOsXgevNc5lM4IM8r3Ef7vlEABp1I55DxtpSQCkI/t9A5gzCuBvUDkRJ2GuxsJ
 6akzD/X3yWBAUf3FzNvPc5WuJpGhy7SaFS6gSfa/7bBN2as44MgjiZKx0RjVEXWEp4tQ
 1nfZ8cdhpTg1ZZXLJ/q99IZ+ir3NpZ1/x4VkVkH04nsJk1RjSdLmpCH2MpkkWgxJqQvp
 /TLb5A+U15K9ZgKhVfdtxs7GT914ofbI32qNOUKdQ6Xu3agB4xt1DL1Z+m9OexoN6wra
 Twvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6e/ocFlNpbvzWzShp69RWnr5b+cScjq0s1B9GZ0rX5w=;
 b=deSb9FcMmWwAveO051RF8tzWXYAd0HEL93pgT+eTitdjEvExQY+U5cenVP5xkAzU23
 ZMRJoohSzf3VJJro3DfsRztxuCjPWnTQhzv+/AbmQjarwaERXQEyMCbV2y1/xw2Phjxm
 py5v4XlTrECHhSdUAmP8VFsfzXns2vfWkNxsGi9UwhRY9iWUHMJ2jpgW2gew5c7g0/kG
 1uEq+I6KIYBv5r6mfcr/d2/LghL1bynLAekbR2trThTfaMavIwz/0dVuw3mkh3YDED/T
 JkqpYJkYvEvKE87MzjKRT3dlG54Wm1kl9y3TkzxmYehBwukAkEm11qnMZgBBEao7jn5p
 lg/w==
X-Gm-Message-State: AOAM532nbXMdGxHjlQiCxnoRLSSI6buNA0nHCct6WPEzj0A3BnVS58jz
 xcueykyzz/v+s1UoavaNI7wkrw==
X-Google-Smtp-Source: ABdhPJzWKPvIEAKCmVNCEUVyCzbULaEZg7w+QFOYy+JZneu3IYKAOLki6bAyCyBbkIkOrKnM+I3Rsg==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr4348607wmq.139.1612544423375; 
 Fri, 05 Feb 2021 09:00:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/24] hw/misc/mps2-scc: Support configurable number of OSCCLK
 values
Date: Fri,  5 Feb 2021 16:59:57 +0000
Message-Id: <20210205170019.25319-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
---
It would be possible to avoid the compat break, but we've already
broken compat for the mps boards this release cycle (eg in commit
eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
there's no point in trying to keep compat for this change.
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


