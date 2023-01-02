Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1A65B76A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTF-0008HP-Sd; Mon, 02 Jan 2023 16:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTC-0008GY-VZ
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:46 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTB-0005BN-EL
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:46 -0500
Received: by mail-ej1-x632.google.com with SMTP id ud5so69273194ejc.4
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
 b=PsKszMFE/irXAQUUzyvmEIaEr0Tcpdj3qhQcGkpM6bYRneaVlCz9APN9qcxNx7XmNo
 KLZfpHfC5iyIkCg8DGZEO4juAo/rZxv4CMMbW6pgthHUkyA2C1vKwUY20xj2gWQil7Zw
 jDG7lQAM8bdmOaCwb7KbNXuVBzjg4YjJD5g65Tg0rYTlN+NbeDFcUpR6TAg1MVAEV7zN
 i481Ii117uzsakJQlHK4tV7aHWnDIjke8SIy8P0RWBgz4pEH+jNFsPpnCqeEDR3i8nak
 Dc6oZySXPxHR7v967RWJPS5SkmtQNNGpv+r2EOUT/sAmRxGlHKArDmdliBsUgWsrEfGG
 VIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
 b=oNU1R28+XR3QsIpVY21/gd8MhHMbjJoNrDyFD31H0iO//Z/g6AfeD+AdD87V8k1Wn6
 mKp0Rhg2zGM8EWuTgRM6gfuYg4XNQ1bEXsYdzYonwhu9tBy0fpjML4Is+DNoyMx5I6C0
 slTi9ew37grNtFF64kFRy9hZEYSP2OEJP4BhK4p1+M+aPYE0Fnxj/fS9anXHoLJrxeJa
 Pb1NB1Unx4bSg9YxDbVOoQvFKbpWUSAv5EgABSSU4kO+DepsrCN2JYHxA4e4/g4OzbDh
 ZUdH18J+xg59zCp+KlT5+TpAqPzhmCmC9lxHpf0lZlYOJM9hpPOlyLGpK0QnOZULqVfd
 jnag==
X-Gm-Message-State: AFqh2ko353RJPcmci1OgTrA5W6XwCUNaVyRCoxbbB6C4gDDNhNptoSAb
 pr4LIziKGxpPFSikWMMvaAOwwzk57ss=
X-Google-Smtp-Source: AMrXdXsn74EQeNcIi6oiYO0nJq/ZeXKHgJ9u+Dwmp6n2+uN/W06k2zB+iAzGi6JoudbLO8czjj/jbQ==
X-Received: by 2002:a17:906:d205:b0:7c1:51ee:a2ec with SMTP id
 w5-20020a170906d20500b007c151eea2ecmr36107634ejz.46.1672695343628; 
 Mon, 02 Jan 2023 13:35:43 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/6] hw/isa/piix: Resolve redundant k->config_write assignments
Date: Mon,  2 Jan 2023 22:35:03 +0100
Message-Id: <20230102213504.14646-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

The previous patch unified handling of piix_write_config() accross all
PIIX device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d4cdb3dadb..98e9b12661 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -396,6 +396,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix_write_config;
     dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->hotpluggable   = false;
@@ -451,7 +452,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -470,7 +470,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -519,7 +518,6 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
     dc->vmsd = &vmstate_piix4;
-- 
2.39.0


