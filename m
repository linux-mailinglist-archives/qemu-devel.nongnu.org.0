Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321196A8B2F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:25:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNV-0000hj-9K; Thu, 02 Mar 2023 16:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNT-0000hE-Fc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:15 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNR-0002Ot-RZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:15 -0500
Received: by mail-ed1-x534.google.com with SMTP id a25so2721345edb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gjH43qb7avbFX6b03B2Ne+efa+RigTC/CP5x/Y5O8Q=;
 b=ggvVTsh8XImDvxn/+28Sj31PzsyrxfhRFHGh6rRfdDoOwrc8dFVO6V00tKjrTPik6i
 CorAiGAAYnnZ87yvNiyA0J82dEhPMz/Xwi90RVPjoZWmuOZX9rcO8/HuBUId+9r6BYII
 i+4CHbCGco/6LvYSNPszGEJI4fcUIu7w+rolTrozYzfgkWsQadmcMZ5XUdIyQeQJ67i1
 XA57uGxjNTa1fQPl1sHnmhchcR12rrjNns8L/yjwuSrvlBn/V0wh00eXf5IA1MqwuBnY
 ePaGLQ0GpkpdahMhmLOedNyCxDdzqCUPJ6r+YcvyGCTRscFCVWK8264D3mAsr0JHDYuZ
 40Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gjH43qb7avbFX6b03B2Ne+efa+RigTC/CP5x/Y5O8Q=;
 b=1g1tz3kRAAV2xpb8qnjk7+fMWdo41EeBBlr0KPTcysp+/U34CnHJRaeHthsTQpxNEq
 Nnl3GiH5D2Ip3nvmCW7Wi26NUEZBamcionAm6AI3oZevVal+n1K7CWy2H8Tdm9Oa1Pkk
 7GxBsrPgAwzowTOf4xUGrltmKjdZjj6qrtgRwx+W/EytaHa3SoRo24AGc8eosusCHWuQ
 c6uwjfsXDOS8vZJBRA17eSJGyHThRVOSOZ6oNYKNeNfjhiKr1F7HrsMAMzxNjuhzjAkn
 /g/SVThr071XI2lvePmkTF9M8C0rd/Cjk1zKMlXLxW2/2vEWzM0YfIEoUWpz6P+hgG94
 YwbQ==
X-Gm-Message-State: AO0yUKUgQenmRhspcl8ny3cqj8CIhF6V1NllC/33jrJzhxASgBgJPJDV
 +q4CsJa/MCzAFk/ICPp68exsX4ea470=
X-Google-Smtp-Source: AK7set9cQKHj8hiizkKBszIZgUPvdRFKc1AFTvBHf3zYEMEwKMuZNcpOG9/m/vkWYffE2a9MVBcjOg==
X-Received: by 2002:a17:906:f751:b0:887:8f6:c1d7 with SMTP id
 jp17-20020a170906f75100b0088708f6c1d7mr13249410ejb.38.1677792132319; 
 Thu, 02 Mar 2023 13:22:12 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v8 02/23] hw/i386/pc: No need for rtc_state to be an
 out-parameter
Date: Thu,  2 Mar 2023 22:21:40 +0100
Message-Id: <20230302212201.224360-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that the RTC is created as part of the southbridges it doesn't need
to be an out-parameter any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-12-shentey@gmail.com>
---
 include/hw/i386/pc.h |  2 +-
 hw/i386/pc.c         | 12 ++++++------
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 66e3d059ef..5ba814aca6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -168,7 +168,7 @@ uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
 void pc_cmos_init(PCMachineState *pcms,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8fed01ce5d..209a9c138f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1253,7 +1253,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
 
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs)
 {
@@ -1308,17 +1308,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
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
index 93d2be469e..2b5884d3d2 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -277,7 +277,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 5ccfad84f6..ae49146d46 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -293,7 +293,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, !mc->no_floppy,
                          0xff0104);
 
     if (pcms->sata_enabled) {
-- 
2.39.2


