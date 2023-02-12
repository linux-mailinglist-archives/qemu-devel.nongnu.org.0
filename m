Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2282693768
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBhe-00045D-Ro; Sun, 12 Feb 2023 07:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdD-0007bu-9N; Sun, 12 Feb 2023 07:39:00 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdA-0001MN-Qx; Sun, 12 Feb 2023 07:38:58 -0500
Received: by mail-ej1-x631.google.com with SMTP id hx15so25806710ejc.11;
 Sun, 12 Feb 2023 04:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pi/oL3wZn7dpmiCf6Vc9GoTlzQ8vQq8EcTfCMu7EBWk=;
 b=j6Jfrtz/i0nYQqxdClDGpoon7hqFvXP7qVugTd7b4G0qxBOorYl9uearvCDZrK0TU0
 wF1ePrsXbKzKl7iDvpI74wbs/Q9GTnQy+29F1dogWA4Iz2eGJbct/J/Kz6JEzAkVqG8n
 COis0NQalzFinxk7m7edkcyBNgbzpZTd8eDC8o+pFn5l/M1/qohMZ4FEuYtv4ApBjX03
 l2ZgrF25q8HJQXpXRjYaTtDNW9ESqM7PrSJ9WIwN1mf+L4x+pT9E6cqXChN22OQoubpF
 dQEHtzbRkEOlSstgwXmxD6mpTaJCs2waUEiMQq+TPsxhZSmfrq5TTNVGm5+7ZECdNXCn
 gttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pi/oL3wZn7dpmiCf6Vc9GoTlzQ8vQq8EcTfCMu7EBWk=;
 b=7bjcjc2DwEqA92wHZoAKgCo+d8haW6wPNCNKeXT3M6Y7A+z0lGESgXkkrPwXLUSy2l
 4I4CXIxPGvF0zcgAwTQkgdKJ79/WoOykuFSRLCLehumeE0S5HC51Ni1s9W+jxQUZ/DLV
 nNjFxxO87ce5cMUEDRD4nf7Uh/9IGbsb/v8RFDHdNfmck1e5SHkaK7JCfzQwLhIbXVJY
 dpdv4WIgTv2RvQ3qY1I5pctY2xsd2GqYPV4y0UaD0qX1138ObQ8q3zNv0eVGEsdbsnvU
 aDFeCigDei5/2jJ/89aGG/fDhxsOfBryPS5KcgA0kRZ5ctO3cGZsuWn/Uq0Lpq0O+sG3
 mXXg==
X-Gm-Message-State: AO0yUKVX1u7kfG4GuTQ9oYG8EfuNPU7jFk6B3MQbPT4CrvfCWnbECC0V
 eLwj93k5vcHQR6PhYtU4yzK84Tghcio=
X-Google-Smtp-Source: AK7set8ts7faLovL5suOPkIUq5MNt+xnBah9pbm8F04DHp2ntUrWaiwn/rXEskSB2EFNwzWuRh+yWA==
X-Received: by 2002:a17:907:6e1d:b0:8af:7efc:84b4 with SMTP id
 sd29-20020a1709076e1d00b008af7efc84b4mr8741951ejc.10.1676205533305; 
 Sun, 12 Feb 2023 04:38:53 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 11/23] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Sun, 12 Feb 2023 13:37:53 +0100
Message-Id: <20230212123805.30799-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-23-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index cf7daf29ab..76004a25e2 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -145,7 +145,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(DeviceState *dev)
+static void piix_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
@@ -385,7 +385,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.39.1


