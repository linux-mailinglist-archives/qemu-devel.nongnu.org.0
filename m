Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0EC65D674
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51c-0005If-5x; Wed, 04 Jan 2023 09:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51H-0005Fi-SC
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51F-0002r7-Cv
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bn26so13737867wrb.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
 b=W9Un76kfIXX71algBT3MUyLCUiN80OFK1EUd0YbCe6wUItAP0Luda8qEceYXzOUdFw
 jY1QLBi8eG0gW8dCgOjygcJ+fp4QbyzP8Ye4eARwBnC9y0DkgijILW6lYwfh0Jwvet2r
 4qrOldpBtix87pTunJpR5Hzs+5mBOue2wekAGVrS5ABa97Ub9oHHVlIjCdGw8E/QrMWt
 uF7+vwGjO6ufN4oR16pm29afZxpgs19LCt554cFbOcBl4NTLEdn0+fh7sb0bkFYX/Qy3
 /7j2qYCvOrtcFrstpMIW3NJQlCJzKvvJDPW6GJrhHDp8NV6E0rozu/tgN7PiVc9LxJ4d
 rJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
 b=qbCiUnMpsNAVYlIYor79DvWn60tabjGWS5c+zl5z6CWcTKGteXpYjvaUpf4T/TfM10
 yFqweG5ff/RNiTTMyvkRkigtmkwj5/6u3bPMRQyIzznUJrbShqzjFlC63Qo+iwuCvkBS
 hh1vmiUrmWj8R6oaUXCeuTmLIwM5AilGgrJWQ7baIM9ERxls9Tpdiwf9o0XQle1VC6m5
 c80wTn85BRdUk35QFaJYpfEbXvww9SZs03nvq02NrjcJP28oGFuLbShbK7xEOruYMZwK
 HMBqGPaTRM6ESNMjCp94vU126SaKTNzNK4yt2LABE/Q6UqPNZ6drOa2nSnHq2PMc/XRt
 LtaQ==
X-Gm-Message-State: AFqh2koX6fLAAvYwxmyONDjpdQ9VaGwSmXXOPbAnfmiwlBp9Hlib0DaB
 gu2Nz79IieBxM0/ngn7hpAu5+KjiLimjZg==
X-Google-Smtp-Source: AMrXdXuqwFIIXGumdoGoKi2S2o1kZi2sGwiXEGMwUaQU6kBeT44weD6z/UJouVJiTGdquTAHfyXG3g==
X-Received: by 2002:a5d:640c:0:b0:2a3:1c13:2888 with SMTP id
 z12-20020a5d640c000000b002a31c132888mr2471851wru.60.1672843527498; 
 Wed, 04 Jan 2023 06:45:27 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 5/6] hw/isa/piix: Resolve redundant k->config_write
 assignments
Date: Wed,  4 Jan 2023 15:44:36 +0100
Message-Id: <20230104144437.27479-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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


