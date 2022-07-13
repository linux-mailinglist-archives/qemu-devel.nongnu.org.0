Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE2F573144
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:37:52 +0200 (CEST)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXsV-0002Ra-BU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZb-0005ew-1E
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:23 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZZ-0004of-DC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:18 -0400
Received: by mail-ej1-x635.google.com with SMTP id va17so18573488ejb.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEInLvpkAW1LEe/0KxYlOVjh1DcOAF8NNEJb3GOJEdQ=;
 b=Vx+mc1tQ8fa+bcTZ0ey9SAPeiICSoqswq0f08YyrwPjYwta3yGtwqrYZc4E6VTDUAP
 39HI/WPAc7S1xa811V/0oQhqaE8JOpYZ4yvVtWg2VPvdzI+2rlMqPmQZ3fZus7/ck8ko
 yn2oDkbnqayeCHPKcZfVyfXKc6l2BKwL1VS5wCPHpdn1wFdET9ogweFqOeC0WnEAXIsT
 DsAvN1s6bIbaNQ6OihG72QL2Bf9kI3xisz6aWg+vVJKthYZQJX+sNxBKBLhkvbF9oQiJ
 XGacy6YpTEvptnbfgkWFPdPYPv4T9kol1DiAA68cnmk09TA2CtiIRhahPUwJU7vUdj2i
 6NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEInLvpkAW1LEe/0KxYlOVjh1DcOAF8NNEJb3GOJEdQ=;
 b=mUQDuWRLHHCS4YGm/y9xIT/rHP/+yWcuoukj9+8lcnwoTuQmUYafvAvVl+343Niv/6
 j4rzEgTVnVSEBiFMcOh+izcShvZmYcRuKKfbCmXYBwUuweIzbllekigdgl5h1adZE8Q8
 glIgoNNB8k683FNK2yL9jZ7B9yGQDqEVsJsObahpefBCje1aBn5fSWcec5Ob8iDUQyY2
 7ZXhuLKu/Zk5H9TUgaZJIwKz8KhaCRCwEwKYdwnAF8WbiAMi+f7ODMQf+qor7mqS6jB/
 OxXQ2Y/laL9Uemk+YOTfaXjTf4eJ9JqKiqHHZ7392Hv/YGVMSos+JiB9TAKDwiGpETuX
 Kkzw==
X-Gm-Message-State: AJIora82Qd6Snk9UDXh3uFlnh/dxBx+4tP/NYK7nai85C5NOWtkXtZWM
 6A79B0QgDgnNlYvmFN+vK3xgB+VrCpU=
X-Google-Smtp-Source: AGRyM1tQq8YmfvOd/zqjsj/bxWFXbQyPMzUxjk101A+LhGnQFXOLxSH+bztewDrPnZwNzV2bwMJH+Q==
X-Received: by 2002:a17:906:9b8a:b0:722:e6e0:33d with SMTP id
 dd10-20020a1709069b8a00b00722e6e0033dmr2167218ejc.317.1657700295855; 
 Wed, 13 Jul 2022 01:18:15 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:15 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/11] hw/i386/pc: No need for rtc_state to be an out-parameter
Date: Wed, 13 Jul 2022 10:17:30 +0200
Message-Id: <20220713081735.112016-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that the RTC is created as part of the southbridges it doesn't need
to be an out-parameter any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc.c         | 8 ++++----
 hw/i386/pc_piix.c    | 2 +-
 hw/i386/pc_q35.c     | 2 +-
 include/hw/i386/pc.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index eba1c98b5a..886c6b451a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1128,7 +1128,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
 
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs)
 {
@@ -1183,12 +1183,12 @@ void pc_basic_device_init(struct PCMachineState *pcms,
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
 
     qemu_register_boot_set(pc_boot_set, rtc_state);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 52c550f8b8..0f6cdc5bc4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -263,7 +263,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d850313180..15b8b814c3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -284,7 +284,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, !mc->no_floppy,
                          0xff0104);
 
     /* connect pm stuff to lpc */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b7735dccfc..d1fd8969a0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -164,7 +164,7 @@ uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
 void pc_cmos_init(PCMachineState *pcms,
-- 
2.37.1


