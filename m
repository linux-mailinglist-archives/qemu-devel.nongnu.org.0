Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD4682BE4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDF-0006ni-P3; Tue, 31 Jan 2023 06:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDC-0006l9-P3; Tue, 31 Jan 2023 06:54:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDB-0002Kh-32; Tue, 31 Jan 2023 06:54:06 -0500
Received: by mail-ed1-x530.google.com with SMTP id q19so4196853edd.2;
 Tue, 31 Jan 2023 03:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYP8QNgLvA7AK+0xhZ1WbcXqy12AF56ZzSpPZ3vA+gE=;
 b=p9cIwVbY6n1TYYueXO0wjPpk1DMJrE9JdHyTU7REWvm0qpiG3av3hmkBEh3X4Ose6N
 0MxaWJbrYVbwMp9kgP1Chz96LFcGyR2cYXfL5p+nxyI45tiDxI0JrYZ5IBMha7ZdWZqC
 QAjJUJRbP5laxSg79llx6AG8lGEMlkC/6rffrsZgTVpvOLbK3PAeQ3l+loH5kwXKNup0
 yD4fmRdjimGud2bJFm8soLx8ynMXruzY1jb6l3bXfwYKghJjoCUireM9oKnClhk6h56L
 I01pYIzsSKGEEN1faKwXO1R4qycXeT9WmY4i3ZXBpUWTPHnWo3mV+oxTOJecSXpqfuVZ
 PRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYP8QNgLvA7AK+0xhZ1WbcXqy12AF56ZzSpPZ3vA+gE=;
 b=Czi/pXBO5NdRYt8Mfo5ngC7+SHh3jo674+X0Xy+YoGubLPxkTpfl7goNGZFH7oASb7
 A41RkAm7bdL88/bN+GDw0FZQhadcij7ZI8NblY1E0kFDZ3WHmNSM74IDbbJbu41E24cD
 UR5+OnvgdOcdXANKeji/ujS3KCO0e076NWnRuipudQ3YRVszc0TStaUt6kIY0CO7QWjn
 LhiBPf354YPxkODSlBmLRo09PlB71FxYHav/QjHSXLjWZolzB37U/dBWEwzsOMYUM0ii
 ZhH2icemy0i5YDqH+KC9Ecc8/cEUU8A0g5d/tElYBt4PdTw7lJEz/vvbDbv65rBI+end
 +63g==
X-Gm-Message-State: AFqh2kr2FCmrZ2dCOyLtvNx8nG6HmUOnzw9XO9G9lnCl3y06OB1/OeFb
 XMdowyhu/tnP6THah8Fkzu2ioEIzGKQ=
X-Google-Smtp-Source: AMrXdXsyRKpckzTh0SBR5xiE5MPgkceurtB/HfggJJ7sl308LBypZpKsb+2nKLE06kHDCu6LjWl32w==
X-Received: by 2002:a05:6402:1394:b0:49e:a107:268e with SMTP id
 b20-20020a056402139400b0049ea107268emr46859525edv.3.1675166043795; 
 Tue, 31 Jan 2023 03:54:03 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 13/20] hw/i2c/smbus_ich9: Inline ich9_smb_init() and remove
 it
Date: Tue, 31 Jan 2023 12:53:19 +0100
Message-Id: <20230131115326.12454-14-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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
index 06d97ac942..c7fdf32db0 100644
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
@@ -140,16 +143,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
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
index a4d5c89409..fab8e57913 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -312,10 +312,15 @@ static void pc_q35_init(MachineState *machine)
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


