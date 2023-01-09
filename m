Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096E662CEC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:36:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtr-0002tk-T7; Mon, 09 Jan 2023 12:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvth-0002k9-Ck; Mon, 09 Jan 2023 12:25:21 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvte-00011P-Ni; Mon, 09 Jan 2023 12:25:20 -0500
Received: by mail-ej1-x62a.google.com with SMTP id az20so2854306ejc.1;
 Mon, 09 Jan 2023 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNVX7gPoz1BSpxO3xGWjfBNYIjlgV62/Ccs00KSMxZU=;
 b=F5aSgXNN0oOJKV/MVixZWxW+C4IYabRCb3346L3M4RydAHJ9wTFaWJxRd7ehJwlbXh
 XeOA+4tI3n69Dw+N4f3A7GA9VUkVp0gYnYo6z5anWVSl5HJQqZOs+3tXwbqitr9ZDC78
 qUbYYff8BjppJhR+JlT7yqUKMHJgpfqPa0ZsoCbKvxmbN5EfRIwmYFnSfEQO1VtNc8VJ
 Fb+ORvqd2LVNHRMh2NqTjb1EN3Yi3P07HX3uvjvRFe49doSeXw72LVK8xA/TZHBwli7v
 6JEV/hZhrRDY/m9Aqp0/e/EsWH/ib2Dv1O+21w3+w9K2h1oQqABYvtgKJpImke0SSfCC
 1LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNVX7gPoz1BSpxO3xGWjfBNYIjlgV62/Ccs00KSMxZU=;
 b=SQNVlkSNtDmI8NFpWB5sAh5BKDDEE/D9ZyJIx/coHcGvlqL+KFd9nt6e4Ql/H6gPQZ
 laQWCOdi9YeVHpJUEce5fYOZGq2OF0x/lGbGw+F31gF9FdnHkKZUqwSZFCgmIePDQjMS
 JWMS7c12tGzpoiSFwd/gp6W4KPvhKBNKmeg3pG/U0HIKOwkJxGG8ZK7MRw0ejE8Ivios
 4kCl+qM4DkRuUb/qULJDKv7kU9WyiyrbHGrgXHqUvoVSH9qM1daIMvonOnzrQHe8KlpO
 c0NJ+HVwTV3TN0GnlNy6DaG5DG6u+9CvjZe3UfWAOtRNiNzyqyNxU+BO/Gwp8YyJRzXN
 uIcw==
X-Gm-Message-State: AFqh2ko4Tp7XXHKz7MDh9Hx4rPhSnXJs+cvaqKEeaqiH/gS6W5eT98WR
 1JtR7ZQ4cG6e/udWQQV6nrCv41L3PE1Ayg==
X-Google-Smtp-Source: AMrXdXsrhwz/Lhuqex+/saHNSuT0/XGsUp/1rP8+H7rPzmOosomuHDqvZ00siHwekSw22N12hAxA5w==
X-Received: by 2002:a17:907:a585:b0:7b4:edca:739 with SMTP id
 vs5-20020a170907a58500b007b4edca0739mr50904502ejc.5.1673285116630; 
 Mon, 09 Jan 2023 09:25:16 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:16 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 21/33] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Mon,  9 Jan 2023 18:23:34 +0100
Message-Id: <20230109172347.1830-22-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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


