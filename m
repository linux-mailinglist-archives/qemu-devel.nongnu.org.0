Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93460694E0E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfj-00088W-OB; Mon, 13 Feb 2023 12:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfb-00084t-Ij
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005PI-B2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: by mail-ej1-x62d.google.com with SMTP id rp23so33691096ejb.7
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ES3rZ+wS/sLzeljvEM8y7WcbeHN4SQhGHmzgHvaetII=;
 b=dtiXkthQUr7lYAlW+t9NTvWCTES1kHou+P4kptKsqtxl5eVQ0adjI9LIqFzFRg4qyS
 qMwtUzZd9IvG715eQPQvIU7l5x+TwWE3Szy0dgH6/tICC+iKEb5Cwke7zx9UjWdzqesO
 xeBtAeBnIWKxYIzatEu64NXNzAo1/LxmpWi/RyiNX4k9/bDGyKBOwIpPpstutNIeHORD
 H37rw8RDAZPhVRCo8BdzVOqCk9wuOMK5HxHk0Aq7J+Y4THhWHHm7vOume0AoOC/ROvj4
 WyRt0yye4WcOPDHZzkjU3AerC/KF5YQZSBGY+8REBhustYae1Q7uJCYLfcAQofIMexSH
 FCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ES3rZ+wS/sLzeljvEM8y7WcbeHN4SQhGHmzgHvaetII=;
 b=R8XMSZIqyDJcJW88tSQp3yzx8+8EGFb3ruSh82igTZpfojbApxH/eX4LFVlA419pvG
 mtwpRHWkWAawKn7SxoZS61jj0PKvhoT94e3bPzNeRCzj14RYrCTRPusbVOiYKXfv0deV
 Sh9cS+A2kOHIaYkYpBIgL5Mf8e2Febb4lJkOXlk6jTfLtGKlQfY28t52yTlMxey/9dza
 E8+Y7G0OjavBl/LUI8Y+RHkwvyoNDBim3N5+dfiIQqErNZM/rHC/nGJU59/05fX5hBvA
 GSNYCjTiaa5pzLwRDaKNysNv7LEhX2pkwYi9mI5T6jb+LjK2teXa5bePijeQQJNUl9HD
 PSJg==
X-Gm-Message-State: AO0yUKUejMwMPbgLNudGwvA9ShzE7jNU0MX1ZpPkcSfluJmdFSHnwMZI
 B8DGMUtOzYOXWtwzWOGZRbxtIUzY0To=
X-Google-Smtp-Source: AK7set8vFm+YAXG94jhN2BZR8XrWBezC/25PgENnIH5gperkXScpwHoF5qaLQlSR2Ctkh1/AXdyw+A==
X-Received: by 2002:a17:906:b807:b0:889:5861:ad1e with SMTP id
 dv7-20020a170906b80700b008895861ad1emr28269678ejb.72.1676309465512; 
 Mon, 13 Feb 2023 09:31:05 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 05/12] hw/i2c/smbus_ich9: Inline ich9_smb_init() and remove it
Date: Mon, 13 Feb 2023 18:30:26 +0100
Message-Id: <20230213173033.98762-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

ich9_smb_init() is a legacy init function, so modernize the code.

Note that the smb_io_base parameter was unused.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h |  1 -
 hw/i2c/smbus_ich9.c    | 13 +++----------
 hw/i386/pc_q35.c       | 11 ++++++++---
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 05464f6965..52ea116f44 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -9,7 +9,6 @@
 #include "qom/object.h"
 
 void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
-I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
 void ich9_generate_smi(void);
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index d29c0f6ffa..f0dd3cb147 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
     pm_smbus_init(&d->qdev, &s->smb, false);
     pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
                      &s->smb.io);
+
+    s->smb.set_irq = ich9_smb_set_irq;
+    s->smb.opaque = s;
 }
 
 static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -137,16 +140,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_ich9_smb_aml;
 }
 
-I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base)
-{
-    PCIDevice *d =
-        pci_create_simple_multifunction(bus, devfn, true, TYPE_ICH9_SMB_DEVICE);
-    ICH9SMBState *s = ICH9_SMB_DEVICE(d);
-    s->smb.set_irq = ich9_smb_set_irq;
-    s->smb.opaque = s;
-    return s->smb.smbus;
-}
-
 static const TypeInfo ich9_smb_info = {
     .name   = TYPE_ICH9_SMB_DEVICE,
     .parent = TYPE_PCI_DEVICE,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4af8474f31..85ba8ed951 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -316,10 +316,15 @@ static void pc_q35_init(MachineState *machine)
     }
 
     if (pcms->smbus_enabled) {
+        PCIDevice *smb;
+
         /* TODO: Populate SPD eeprom data.  */
-        pcms->smbus = ich9_smb_init(host_bus,
-                                    PCI_DEVFN(ICH9_SMB_DEV, ICH9_SMB_FUNC),
-                                    0xb100);
+        smb = pci_create_simple_multifunction(host_bus,
+                                              PCI_DEVFN(ICH9_SMB_DEV,
+                                                        ICH9_SMB_FUNC),
+                                              true, TYPE_ICH9_SMB_DEVICE);
+        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(smb), "i2c"));
+
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
     }
 
-- 
2.39.1


