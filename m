Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07A57A63B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:12:31 +0200 (CEST)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrht-0004Dl-F4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXK-0007y3-Sp
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:34 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXJ-0006IE-1c
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:34 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u76so7655002oie.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwT6lAxq0oWE+Pulu76+OAU+DA1mJYbR9ucIFpn3LTM=;
 b=jexCdY1UR8DhJVwTht2ePzGHiM/dzn5Rb0b1K7BCIksEg68qAguWLHPDEfVCY6v2n2
 uxm/Ik+0j6YF4yiqkn5rhVZJ+AAYvXuu9NNphfidNfj/YcA5el3Dml/TyL0EJ5iHLfb2
 GrAjNU0joA0Ejbh9jshvdofJE7lTs21I0aDxMYb37URlvaAXUMm47MoFrcdKSkcwuFxi
 m5MX87uKVpPZ4yrD5lhacXHgTzAmYdcmBTCiwByX4fwwrgWkkATWGhGGULzMQ6eNwCmk
 8UHwNaaEHSyermECFAhqFiPoAh12dMByNweryKge7M0bCrwyI/wkE/yKxAquZegFiNUZ
 WP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwT6lAxq0oWE+Pulu76+OAU+DA1mJYbR9ucIFpn3LTM=;
 b=4Dj0O+yQfJapJqLlOJCuCDPPa5plpgY4ECproengCgNv8krKC6kyTeiaP7uk34VLQb
 cataSW04Rl1W2b24hTKsaSxKO2yzmqRQD3h9Vw+mSch1KCyOlL4MT0DIFqh6XjR9+ikm
 l8vaeHq4d8PGh64r+MYyUadUuaQQgQ2pOMvLAk7tUX+bv6x5FDQ7IxIikQ1/xWjUHE8Q
 BBG/79HtTG8rvbxvG8liXmBW3Ccbo9WGV/KNJUHNQli++J/MzLzbeRD+VsCDWaohZ26n
 1Bjr4ND5ckk9RVjniKrgbdZpptBedE7R8AYj42Ey9j4yov6XM8/JLqow5Rtxmv8s1JAL
 WbHg==
X-Gm-Message-State: AJIora+GOsB7VFTxD25kzLloPHF5QCyUKNkvV2SRbuVFZsPW9RtizZlj
 ke4einvWtqOOXd3nfvgTxp6rH5gE2wuDZi+5
X-Google-Smtp-Source: AGRyM1sNf6xLlCevLPvzUJzHpW6IGrPxXGuIvMqin4YfCgGadn5WZPGMemmabXx4MyjQoRuoSiMaQA==
X-Received: by 2002:a05:6808:169e:b0:331:522a:4521 with SMTP id
 bb30-20020a056808169e00b00331522a4521mr307938oib.293.1658253692353; 
 Tue, 19 Jul 2022 11:01:32 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 19/21] hw/loongarch: Add smbios support
Date: Tue, 19 Jul 2022 23:29:58 +0530
Message-Id: <20220719180000.378186-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add smbios support for loongarch virt machine, and put them into fw_cfg
table so that bios can parse them quickly. The weblink of smbios spec:
https://www.dmtf.org/dsp/DSP0134, the version is 3.6.0.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220712083206.4187715-5-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/loongarch/virt.h |  1 +
 hw/loongarch/loongson3.c    | 36 ++++++++++++++++++++++++++++++++++++
 hw/loongarch/Kconfig        |  1 +
 3 files changed, 38 insertions(+)

diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index ec37d86e44..9b7cdfae78 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -33,6 +33,7 @@ struct LoongArchMachineState {
     bool         bios_loaded;
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
+    Notifier     machine_done;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 88e38ce17e..205894d343 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -30,11 +30,45 @@
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
 #include "target/loongarch/cpu.h"
+#include "hw/firmware/smbios.h"
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
 #define PM_CTRL 0x10
 
+static void virt_build_smbios(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    MachineClass *mc = MACHINE_GET_CLASS(lams);
+    uint8_t *smbios_tables, *smbios_anchor;
+    size_t smbios_tables_len, smbios_anchor_len;
+    const char *product = "QEMU Virtual Machine";
+
+    if (!lams->fw_cfg) {
+        return;
+    }
+
+    smbios_set_defaults("QEMU", product, mc->name, false,
+                        true, SMBIOS_ENTRY_POINT_TYPE_64);
+
+    smbios_get_tables(ms, NULL, 0, &smbios_tables, &smbios_tables_len,
+                      &smbios_anchor, &smbios_anchor_len, &error_fatal);
+
+    if (smbios_anchor) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/smbios/smbios-tables",
+                        smbios_tables, smbios_tables_len);
+        fw_cfg_add_file(lams->fw_cfg, "etc/smbios/smbios-anchor",
+                        smbios_anchor, smbios_anchor_len);
+    }
+}
+
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    LoongArchMachineState *lams = container_of(notifier,
+                                        LoongArchMachineState, machine_done);
+    virt_build_smbios(lams);
+}
+
 struct memmap_entry {
     uint64_t address;
     uint64_t length;
@@ -512,6 +546,8 @@ static void loongarch_init(MachineState *machine)
     }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
+    lams->machine_done.notify = virt_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 35b6680772..610552e522 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,3 +14,4 @@ config LOONGARCH_VIRT
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
     select LS7A_RTC
+    select SMBIOS
-- 
2.34.1


