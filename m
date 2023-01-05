Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83865EECE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJM-0002wi-U7; Thu, 05 Jan 2023 09:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJB-0002nX-JP; Thu, 05 Jan 2023 09:33:30 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJA-0006vC-0l; Thu, 05 Jan 2023 09:33:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so24198367wrt.8;
 Thu, 05 Jan 2023 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNVX7gPoz1BSpxO3xGWjfBNYIjlgV62/Ccs00KSMxZU=;
 b=hHNfnG1nk7CSCSUhXiR5l737YelJiVBFnzpCr+KqJ3VdQYPpYL0pojEFE0CDVJINh7
 v8XblEF0S4NnZGieU53BaETECNBulE8lLLYZZLoe0hcy1ZPU1vnUzTsB+BLQfTV0qGcR
 ka7fAC1QXSlgDTsfPqKw9+rBjhVoowT4zIpjNsle+NsqTQidBMHLfWHF96PP0mRv175D
 t+lXlAk5Xnw6Ov32EUJ+XKpzFQRsz7+47nLotxvFK9EGq8FyinPue/3TgmMehzl8pqME
 6XszRHsAyit4mZtDjhLQ38LiRL3MBeAFTjO/uujpI1Y4ti0IEhkpqByQBtUVdGeha5ps
 6iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNVX7gPoz1BSpxO3xGWjfBNYIjlgV62/Ccs00KSMxZU=;
 b=nM9IEQ8/XQ8L79XNkgcjYYzLzkhGKoU/cs/JTXXOGIDr75+CLapplHR/UW1AFwcrut
 5bAHQSkRZvUK7d2qhzPbsmPxh4ojXgPxzl+1s7Xynd+fehU/Fng9p3IQkKi+BXcqy22L
 1vFhAAv1FYrTPi6ElcWl6Qvj//XqhkEVBwAk/qSNXDnjU2LCjXK7ZOYIT1p1nmZzAg1H
 Wt7QspG5tWqLuu58QPWAns44fN8VMPFB2bqK9VS3B52aGe/SmbP8ta/i3h9hiaC5Byh6
 nYP5uQMp+ko7xgWHzD9k4KagbLieoPK++cAtFj0U17WFI88zCSTD+HBbacRNW5Iu1RZR
 ziWA==
X-Gm-Message-State: AFqh2kqu2dNks3uQYFd6N/YeXCsVh/G9/FMzZeaq0/nAug2zoyN/xXPH
 nuh8hv2s1MpiYdd3aZigaWmyudKT1uprLA==
X-Google-Smtp-Source: AMrXdXu3UVc4JqU7h15aBaRue4qJOaTMUI5JFgx3lCR44Su2iU/Q5/oHUeRBMA8MJMiTa0QRPoMfDw==
X-Received: by 2002:adf:e8c3:0:b0:28f:29b3:1a85 with SMTP id
 k3-20020adfe8c3000000b0028f29b31a85mr14808335wrn.2.1672929206766; 
 Thu, 05 Jan 2023 06:33:26 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:26 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 19/31] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Thu,  5 Jan 2023 15:32:16 +0100
Message-Id: <20230105143228.244965-20-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
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
index c6659bbfda..d674130fc9 100644
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
@@ -395,7 +395,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.39.0


