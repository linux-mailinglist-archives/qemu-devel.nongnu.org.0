Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84505A9D7B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:48:52 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnN6-0006bL-2z
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-00022f-IK
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1z-0001Um-R4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id m1so23309632edb.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xpOEupceP6ggkWs0es2939NeRGz3LaBkqUTHnvoPK/k=;
 b=CoDqNwY7PXjfrG63Sl60x5vVn67zV2doOM6JAs/Jx/hrhHlOMG65Wsp6htSS6ftaDY
 kKDRdUdiOAPM+PIY2Bz36l+U/MAs3XqTsosegJS0M31b1ZHNIymzD1Q6hzRd3MZVRFAq
 koSAzm7T0/0iYCGVxbsNFR/VSy8viUgly+/4vWWuMylDefLDAL7B5k84ZJ4E2IV5jPdV
 c2EOc/mgrFUNMRfGzCDVe3BtTzE2hqyUis9fiEVhMwLsfQaBYNje/rz2MEp2LZd4GQ5s
 HsWx4ZEWYGEsKKTzAjEAYm6V0CA5Q86m2dvzX7SnwHGHYI7VdczWOc5wg/vEMOZ0KBHE
 51CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xpOEupceP6ggkWs0es2939NeRGz3LaBkqUTHnvoPK/k=;
 b=Wls+LWyb+51dRacmEsV8+9Ks7QdtD/2QyUMXFC911izYiUMC1rxHnXMsEImtSHO/FU
 WiKBGZL3PqMaJ0ytui6PnvxG1vFHKh0chibOd0SVHpNfoA4ExRPyyOKkZkkH4oodDA9U
 1P05QQfMPhJRQxfKIR/YQtuDyx6kbwkyOIEBJgIbGWODXPklc5vpSpOw6DF42jViITn+
 Oxjo55H9ed9XRFLXGLNYQLn9OD6yBudlcMZ21oV0h4SVWXjPWmDXbAnMXJJRtAyNtbjS
 iyKktVJdRhMSiOzST636rIhLJG1KPeZK5Nk1HvmTxvwTHjVOXPtDorzfxXlB5LIU3LiG
 XUiw==
X-Gm-Message-State: ACgBeo2sAS1HIP3gygtjU+gE47YoWt5SD3S/5fFO+K+lx7S5LymVCpEW
 UI/NidhwW3TmjXR5F+Icrv2rA4UN85U=
X-Google-Smtp-Source: AA6agR4Wd16j0YaawYKMnLtoCEDeyTvZ/6+6p44xA8R31D7v3ycHAWt/j+gNZBSxCFQ/lCvfRisd7g==
X-Received: by 2002:a05:6402:1ccb:b0:446:4346:8597 with SMTP id
 ds11-20020a0564021ccb00b0044643468597mr29048053edb.177.1662049622907; 
 Thu, 01 Sep 2022 09:27:02 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:02 -0700 (PDT)
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
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 16/42] hw/isa/piix3: Allow board to provide PCI interrupt
 routes
Date: Thu,  1 Sep 2022 18:25:47 +0200
Message-Id: <20220901162613.6939-17-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

PIIX3 initializes the PIRQx route control registers to the default
values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
April 1997 manual. PIIX4, however, initializes the routes according to
the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
allow the reset methods to be consolidated, allow board code to specify
the routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c                | 12 ++++++++----
 include/hw/southbridge/piix.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f8fcd47e24..a4a5f33d6e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -167,10 +167,10 @@ static void piix3_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x80;
-    pci_conf[0x61] = 0x80;
-    pci_conf[0x62] = 0x80;
-    pci_conf[0x63] = 0x80;
+    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
+    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
+    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
+    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
@@ -382,6 +382,10 @@ static void pci_piix3_init(Object *obj)
 
 static Property pci_piix3_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], 0x80),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
     DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 1f22eb1444..df3e0084c5 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -54,6 +54,7 @@ struct PIIXState {
 
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
+    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
 
     ISAPICState pic;
     RTCState rtc;
-- 
2.37.3


