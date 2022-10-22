Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC86609865
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:01:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgzC-0003t7-O3
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4s-00077p-6z; Sat, 22 Oct 2022 11:06:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4q-00026R-Im; Sat, 22 Oct 2022 11:06:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id u21so16098625edi.9;
 Sat, 22 Oct 2022 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR9CJIBgt9N+B9FKDmAgyhzq/HDc453u4Nxt6YUO8PE=;
 b=KamZZ1ho3l94LDdtEhSATSyGjX2ZfouQ8d81CqLJQfqnerOcZ9Xr9hdPX9SjuHXW4N
 KqwVCcvCtY4VYSFoDobZTijPL6zLVIFvx0YNJmrlF+NFye5mrmVVrqcf/t/YysEt6aIx
 hgLbL6S+aCmJcS2Xiy7zBOSiHWih8SMymJSyvTrLxHqWsi3jf95ezLxRnTAQuQgqKxEY
 +0yTz57MhvPPhasWAgxNXyo82oaXF6o2hxoB93WXxXeKZ93/G6zPDTJMHJrK5ZwLBqz1
 cuhZAHi7vIYTB3uazEb0RsEUAqZm37p+EESSrlfFxrPpf0+5ZTZX+8xG6FSXJ/4OBZ1D
 PlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GR9CJIBgt9N+B9FKDmAgyhzq/HDc453u4Nxt6YUO8PE=;
 b=pbb95XAKwdcVsUe4PtVQsv/ZpiEEcl1VyAzYbwSii8tE5sjQ20QrGMjhHCorC460N7
 W0GyvYBbabXkhQgbnxYRAJcjTQhHMK1dXwbAGP76G/l9Z08Qc94kH4YFo7AoehbzyY9X
 FRssjFWhf/dhyrUuI4ooxSHCpBOEVo1EXxnfaBAeQKvxTTWJV50kkj4khVBS1j5josY5
 dEjrHiJ2ekxCzhdJ1wsJIfL6a53MBTJPI1tYIZy9HwCCfGPUlPlXNaZ3RIleqxgjYcX9
 HiBkB24TLbaEp/+0X/qDPpsjEzNH3ebv/QLY+FEgv/peHmBv7ZiqcqHElx86iJojBegd
 gFhg==
X-Gm-Message-State: ACrzQf2zKk5TKOTQKvOUtj1intZToCz/hlN7B2BfxQVpJJbuAnk76h9z
 QH1znkyOkcvTCueyqluIACoQ94KeTscmHg==
X-Google-Smtp-Source: AMsMyM4oEg2uHL4mHdM4QRyNJz+lp8yva0HsPH/sYMEfGpCCnuqVpe2ZsyB+cXToV1xaJl3KzMuL0Q==
X-Received: by 2002:a17:906:c152:b0:78d:9dbb:150b with SMTP id
 dp18-20020a170906c15200b0078d9dbb150bmr19347990ejc.542.1666451178595; 
 Sat, 22 Oct 2022 08:06:18 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/43] hw/i386/pc: No need for rtc_state to be an
 out-parameter
Date: Sat, 22 Oct 2022 17:04:36 +0200
Message-Id: <20221022150508.26830-12-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the RTC is created as part of the southbridges it doesn't need
to be an out-parameter any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc.c         | 12 ++++++------
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 include/hw/i386/pc.h |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8f72aedea4..8619a295f2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1248,7 +1248,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
 
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs)
 {
@@ -1303,17 +1303,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     }
 
     if (rtc_irq) {
-        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
+        qdev_connect_gpio_out(DEVICE(rtc_state), 0, rtc_irq);
     } else {
-        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
+        uint32_t irq = object_property_get_uint(OBJECT(rtc_state),
                                                 "irq",
                                                 &error_fatal);
-        isa_connect_gpio_out(*rtc_state, 0, irq);
+        isa_connect_gpio_out(rtc_state, 0, irq);
     }
-    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_state),
+    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(rtc_state),
                               "date");
 
-    qemu_register_boot_set(pc_boot_set, *rtc_state);
+    qemu_register_boot_set(pc_boot_set, rtc_state);
 
     if (!xen_enabled() &&
         (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7de2f1092b..b97bff5674 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -262,7 +262,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index bf0888db97..bee932fb8f 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -293,7 +293,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, !mc->no_floppy,
                          0xff0104);
 
     /* connect pm stuff to lpc */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c95333514e..0cf3ccdf0d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -169,7 +169,7 @@ uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
 void pc_cmos_init(PCMachineState *pcms,
-- 
2.38.1


