Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A35A9D6C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:47:28 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnLj-0006D3-AP
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0002Jz-RE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001X1-BO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:26 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z2so23324684edc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=w1+K+s/MczORRfIOj0MFMH5LjQUgVU6GNRFZSSqTThs=;
 b=EO/IGZOoPg02rN40u7h4BdPr5j76MGXG593bbalRlrFgn9TYQflYhw1oGakpCOenaO
 MqDSSVBHBrDQG/xOkoXKkQJXhLSBl1HmrhFEi0mtUJmXcIPCWEOvB3oysGIsicEoXlhd
 RS97ERnjaF321TQc6gcJ4FKswBKPFBEsug0AdEE3GqR6avgkUA2ym/wbyxL4qTfnPYH9
 YzaqIP8BVL89O+xaA0Xdc4w1BVJTbnB4nU+8p2dpE/c1HnaL0ST+4inBgzuFSZG4qNCG
 bUlFCYgW1UvqPK+RW2SPc1SEZSCFVlSNP9Y5EtBkxki5+dnQNoxI9xgQj1SgFDSTy0fu
 YF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=w1+K+s/MczORRfIOj0MFMH5LjQUgVU6GNRFZSSqTThs=;
 b=54+2L6obu/EE2PbsQbPx9zOx6Ehj9ko7YBvK2eCHe2y34nEw0thP6lsRPhC+qb9aQr
 O4vC/bFfltxn3ZblS5sdNiQFC+sK9pDoivb7xUaw3/7/kbfMlu38SO1fr95pRmfFls8G
 Kv5CL+RiCgxEeujMleLLMWUvqcoQRC5N0XAL5WIHO8LRdnAryF7vtGIhDcUI16CnjKhV
 NL78KRaTMmw3MxG+gxZ6LyCORuOBxcAN4K0O9S/6cH82aHFKUMPEgpdhriJsd5es9sxr
 f3Hd2nZg2ByuueliBVnhy9oKJ1UDCQfllQ5244vGAGI3dCsTajqmXSrCcfJ60man2D06
 7I1w==
X-Gm-Message-State: ACgBeo3UOwkK7IVAoRldaSvuR1AvECKXKIKdAg8UiSwCjl4j2BwOZhSt
 aoMFT7mruAc/7ryGuAfFXM7PPB/FPqU=
X-Google-Smtp-Source: AA6agR4h6Ho/y9yfXSPsdZFHdbnJM+5CLNQinlX+PhTkQ4HO5XaVoSMM3GBH59lF7lHxQnNX25zALw==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id
 ew8-20020a056402538800b00435071b5d44mr28720284edb.364.1662049633386; 
 Thu, 01 Sep 2022 09:27:13 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:13 -0700 (PDT)
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
Subject: [PATCH 27/42] hw/isa/piix4: Allow board to provide PCI interrupt
 routes
Date: Thu,  1 Sep 2022 18:25:58 +0200
Message-Id: <20220901162613.6939-28-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 hw/isa/piix4.c  | 14 ++++++++++----
 hw/mips/malta.c |  4 ++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index ed9eca715f..763c98b565 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -57,6 +57,8 @@ struct PIIX4State {
     MemoryRegion rcr_mem;
     uint8_t rcr;
 
+    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
+
     bool has_acpi;
     bool has_usb;
     bool smm_enabled;
@@ -122,10 +124,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
+    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
+    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
+    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
@@ -299,6 +301,10 @@ static void piix4_init(Object *obj)
 
 static Property piix4_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIX4State, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIX4State, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIX4State, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIX4State, pci_irq_reset_mappings[3], 0x80),
     DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
     DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 6339b0d66c..44b6b14f3d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1403,6 +1403,10 @@ void mips_malta_init(MachineState *machine)
     piix4 = pci_new_multifunction(PCI_DEVFN(10, 0), true,
                                   TYPE_PIIX4_PCI_DEVICE);
     qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqa", 10);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqb", 10);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqc", 11);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqd", 11);
     pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.37.3


