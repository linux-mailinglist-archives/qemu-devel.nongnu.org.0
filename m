Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF83409907
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:26:28 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPomp-0006UL-As
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYm-0000qa-5w
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYj-000866-B2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id d21so7850662wra.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W1m+efY/6GMnWBMpz/5KqQHrR+9ltxKm9JEf0bLzWQw=;
 b=u89gkGbgKzotz3NkexmuJAuazz386yB5aD0/trTLs4tKJnrVFO8DkDDtugAk3p6Ast
 WYCz+rlEbssLvt0dLbNA8IS0FcQbUvY6t7PJEdtFkLPZK5fWYeYjRBP5ZCQLOiELjBDT
 D1KNg6dQO6Mr0nR9meRhcWlcTnS1mzdOI9pjtPJRWyyNFFkSNPlRuJwAVmFmTfotm9WR
 tytUKCwTz31UMsYfwZGt+rZXGW6Y+OAbTLB4bgyJ00gh2zTAtmuB0pUIJGrVNhwWdSWK
 tNIyGceKl/QAO4zb9SGEorvEsERy8pUMWcFpgNhGbYrtKEqnzqdsuXaiYsjRDStJ11Ro
 PZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1m+efY/6GMnWBMpz/5KqQHrR+9ltxKm9JEf0bLzWQw=;
 b=5lYuoSnlb94L0yh6qhJdp6ZMnjxNS/5fspKgSYe3FJ56um6Hqun2rqZoZtOmIpaiiI
 nZcqxNpyrySmVCDiBf5QctCcKh1lZl4BD7+3r/BPeu2vqHmJPaK1vmeqE/uKxWG49GKr
 8bR941p5A2MyfmV50/vj+Hkw5qOWZq7BlXdv0c48OAS+OivrrYS9dpXnSVoVxbJgF8oP
 Utt+VM+/lWBVA6xJnJ+s6mTynufk6XKqPi9QhJk5O+g+UgWrnye5AUCnQxHOgxT4p+Om
 6t1C0f+eWV3v2iEVtUCQ7Kro41RpaQ1wnmXx5u7fxH05whC9OBPjyGIVtfaldrgRRoXT
 vsWg==
X-Gm-Message-State: AOAM531tgbR/UagZ3p+Vm4k98mQVUwbZqSaNhKMyenh4cjQg+HhB2bEJ
 S10iqjm7x7A4JBPdyL1gyofVn8r/G5UbBQ==
X-Google-Smtp-Source: ABdhPJzUDCsxWvw46LynKK1ZjXXJEUXrm+hcL7gPENMA5QwxzMk328RkpmkzhWAp5C4WgCW7nKzWnw==
X-Received: by 2002:adf:e643:: with SMTP id b3mr13837198wrn.67.1631549512041; 
 Mon, 13 Sep 2021 09:11:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] hw/arm: Add support for kudo-bmc board.
Date: Mon, 13 Sep 2021 17:11:29 +0100
Message-Id: <20210913161144.12347-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Chris Rauer <crauer@google.com>

kudo-bmc is a board supported by OpenBMC.
https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo

Since v1:
- hyphenated Cortex-A9

Tested: Booted kudo firmware.
Signed-off-by: Chris Rauer <crauer@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Message-id: 20210907223234.1165705-1-crauer@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 69f57c2886f..adf497e6791 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -20,6 +20,7 @@ Hyperscale applications. The following machines are based on this chip :
 
 - ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
+- ``kudo-bmc``          Fii USA Kudo server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e5a32439954..a656169f61e 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -31,6 +31,7 @@
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
+#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void kudo_bmc_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
 }
 
+static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Kudo BMC (Cortex-A9)";
+    mc->init = kudo_bmc_init;
+    mc->default_ram_size = 1 * GiB;
+};
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gbs_bmc_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("kudo-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = kudo_bmc_machine_class_init,
     },
 };
 
-- 
2.20.1


