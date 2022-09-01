Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A95A9D37
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:37:02 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnBd-0005Mk-LC
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1q-0001be-1j
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:54 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1n-0001T5-KZ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:53 -0400
Received: by mail-ej1-x630.google.com with SMTP id cu2so35918557ejb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mGiH/gTsOZjirvxbc9dQFTtmFJYuQJULrmW8EcJwagc=;
 b=nP/tqX2o0YbI7R7R9Dn1okUd8wpUwDBvyE+5XgbqUbKE1h+Sc2LtqgGdB64hC9fb3r
 vfddIylw73kMufkSx8C3pnBJqrS/lkmTCFxOVQqwkVJfebdwAeBcSPxXiIaTTKQxVK1i
 orEfagOBsKWfvEsJaR+QioW8GufPUXfghfOwmdvzX1wMcAVv08k6rETD1iuC01wH154W
 0WW5TMBin+tOvK93rSG2jBP72VMuxlQ8xnhymQ2r/f9YyepD+pXHkumYaRJBV5EANo7A
 /tlMXIPrYQOkaKAoxkQrEXICbh/KXQirQkmfIQLVi2gZ6PCWCNj5+gSBjBEk92q0gaz1
 KCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mGiH/gTsOZjirvxbc9dQFTtmFJYuQJULrmW8EcJwagc=;
 b=h24ZGfwTbapzn6KCiKv2SDBsFqr+knQdjd4T1RnL3F0NZaPIROB4jdZxCm9QDKHUJF
 +5t7chSv0RZZI20JDhrCZ1thsXvKEflujfm3aNuPDHhRB6diWnAVBCc/4n8SNE4b8iEa
 J2+cfMdEHzQtYSqt3xWk5ZJzlsXig6dptQDHXx21q/qYx/ScwTt/rLPH+EMKLDP8f9HG
 gfZdhpyxZ0eILX0+jjcEq0a7eSiozzfE2tRd+00i1EZfVFNZilywbOKx6nwfl13mKj0X
 SbL8dVmIbxttEv+snzAbDjqoKiXU67gaDVXrscXgMaFofRR9rCKdUPKjSY+5yilxVswj
 eEVA==
X-Gm-Message-State: ACgBeo0dOedkKl1vMKZmgGifFeX1QAwawz0w5bNQJa10GoSL4T/Om/vH
 qTUlzfvA9+9otifoSM9thcQ4h3kfoJU=
X-Google-Smtp-Source: AA6agR6xiwswoS1BXhN4Zd8hmTJ5sN2eTd/oiKJvq0kGkom3voP6YZX9qitCaczS5O5YjxoOiWaOEw==
X-Received: by 2002:a17:907:3f0c:b0:73d:60fc:6594 with SMTP id
 hq12-20020a1709073f0c00b0073d60fc6594mr25142432ejc.669.1662049610120; 
 Thu, 01 Sep 2022 09:26:50 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 03/42] hw/i386/pc: No need for rtc_state to be an out-parameter
Date: Thu,  1 Sep 2022 18:25:34 +0200
Message-Id: <20220901162613.6939-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc.c         | 12 ++++++------
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 include/hw/i386/pc.h |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 05d8b0b3d1..b3a61f5ef2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1247,7 +1247,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
 
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs)
 {
@@ -1302,17 +1302,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
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
index 5f282ff8ad..bdad3b6795 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -259,7 +259,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2eaeab7902..ca10fa37c6 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -292,7 +292,7 @@ static void pc_q35_init(MachineState *machine)
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
2.37.3


