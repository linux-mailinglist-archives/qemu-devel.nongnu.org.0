Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E9699235
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbqX-0002Y3-9s; Thu, 16 Feb 2023 05:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSbqV-0002Xm-5u; Thu, 16 Feb 2023 05:50:35 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSbqT-0001GC-F4; Thu, 16 Feb 2023 05:50:34 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16ab8581837so2081343fac.4; 
 Thu, 16 Feb 2023 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2McuxgyDdy+pIfq2cCai2mR/uIJsTTitJRkORgh4d8=;
 b=GZdbxcyr79NCmH55WT5fp5J/m5w1z6MZli4ApF2h5Og+zxjWpO1PA77JtX/Vp6+/eg
 eMqkVXS2fpgItdOp70uway7nPCsFpimEc4qR+UGO948gwXZIVE0g2MtdOUdXg7a98N8D
 6cxvTSofyrpV+r2iNqZXKUr0lnEM3hr7ZuDujA79tgOyOxByQsgQusZuw8Lg2mFUMAar
 3btANb6nYYCV8899GfbH5fdmtSdYVDTOX9meKFFignL2d5sfq9VezGCFZrm0RT+STZii
 OHXNVvqGZvxq0Hk1u3HJPvmVnEwfChz72HyBDKRiPArIxzyMM/pTTHCEMUy88E2qNuzM
 OAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2McuxgyDdy+pIfq2cCai2mR/uIJsTTitJRkORgh4d8=;
 b=jrwZBy5PCRRE1dNKegX0OC+hHGR6NYd4QRxEaWFgxc1Kil6eryHG+WLFxqmvqfZyCw
 kcZ7DqPGi+WsPkdyDjFd+kFTcPCmG0DXXihji7YtxXGZq74eiJNkX29XV/lokQzPdaRR
 Rp6PX2VDEsGaoq9iCX9IeZapu9Rnn8cf2ZG9rnNWVhVO1tZ3fakQSjlTt5pAtOFmDM7N
 BlSyu3uz7UFyUxoako1ViKJXt43ynKU+dWWwrRUNvE7oSLYYIrt9TsD10oKRRSboRTWc
 N2rnzssRd7Z8iqGZ0FuOiwAKh9enSQhuSH5md20RnH60w9SgU7gmohA3+VuR9wQ3tX6w
 Ql6w==
X-Gm-Message-State: AO0yUKW8+XAHqGUU8jniJuu4OAbauV8k3PN9XpsQaaQYTBNofMDypSY8
 bP3TS3o6ymJq3MfqNe9wQdM=
X-Google-Smtp-Source: AK7set+Jb0FyAL4fE7YPDpk/zqeQrtWeiY48EgsG2+xKtHKwFUsCTrLjQIejFXrYpBB3wHgFfCt9mw==
X-Received: by 2002:a05:6870:808b:b0:16d:cd55:a4ae with SMTP id
 q11-20020a056870808b00b0016dcd55a4aemr3062599oab.44.1676544632102; 
 Thu, 16 Feb 2023 02:50:32 -0800 (PST)
Received: from hcl-ThinkPad-T495.hclt.corp.hcl.in ([192.8.226.44])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05687072c500b0016a79d94885sm423264oak.27.2023.02.16.02.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:50:31 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v2] Adding new machine Yosemitev2 in QEMU
Date: Thu, 16 Feb 2023 16:19:36 +0530
Message-Id: <20230216104934.192713-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch support Yosemitev2 in QEMU environment.
and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
along with the machine support.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c        | 38 ++++++++++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h |  3 +++
 3 files changed, 64 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..35ff29b752 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -521,6 +521,22 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
                      TYPE_TMP105, 0x4d);
 }
 
+static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    I2CBus *i2c[16];
+
+    for (int i = 0; i < 16; i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
+
+    at24c_eeprom_init_rom(i2c[8], 0x51, 128 * KiB, fbyv2_bmc_fruid,
+                          fbyv2_bmc_fruid_len);
+}
+
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1174,6 +1190,24 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_fbyv2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = yosemitev2_bmc_i2c_init;
+    mc->default_ram_size       = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1562,6 +1596,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_fbyv2_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 04463acc9d..807036d416 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -77,6 +77,29 @@ const uint8_t fby35_bmc_fruid[] = {
     0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
 };
 
+// Yosemite V2 BMC FRU
+const uint8_t fbyv2_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
+
 const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
 const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
 const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
+
+const size_t fbyv2_bmc_fruid_len = sizeof(fbyv2_bmc_fruid);
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index a0f848fa6e..14d2533a28 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -16,4 +16,7 @@ extern const size_t fby35_nic_fruid_len;
 extern const size_t fby35_bb_fruid_len;
 extern const size_t fby35_bmc_fruid_len;
 
+extern const uint8_t fbyv2_bmc_fruid[];
+extern const size_t fbyv2_bmc_fruid_len;
+
 #endif
-- 
2.25.1


