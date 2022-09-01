Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB75A9DD2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:11:24 +0200 (CEST)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnit-00050f-HW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0002Nf-Md
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:30 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001We-BJ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:27 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w2so7796923edc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AyzV5+oLK828lQ0tXbH+s83c1HZh2XUSLLI+XyRKY2o=;
 b=M+/5efZ4T2qnLCA54gN66acaSr4vrAXLs+WqIIy5ambl4uW8X4NOwxy5ms4v37OB85
 QSLgWi5udw8qYryme9VeFkZEeoASY1r9VQI22EdKkZEbCPOmTWzyOJFxifJ21kim1OUQ
 UojBMpgKyPNqkvwdVYHETULBTdap6WJtYJoAFn3WCtL7DN3zZP1Ak3clDFkD2scWP4Va
 BWVNF3utKNywopgFIb3HCnO8Y4bK18C2uCWHOe+wXk2imhSXzGA49796EGjJrpGuQ3H2
 Udfj1j979SWQ2V2M1pP4qFty6Bq17AlC/ajWDoCVYHLlvIJKIn/B656EWsrKMzb0UIjF
 qPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AyzV5+oLK828lQ0tXbH+s83c1HZh2XUSLLI+XyRKY2o=;
 b=jQ3ZVRgY2Y5GAc34ObfO79/7bfU0YrEpkqfUjQ8PFwzDQxBTaeWjvd7u1B0KRzgM8G
 mOf2NC8KHYbB6RXJU9egkapEB6hzm3jj8W4LdkwxMFqq4IGLuIO8e+eFjmLbUgYiU2k3
 ZB2IbPodlneqoJMZn59jFNBH3BM+uUoK5doKa+johARAeXK7ZdS/JJLujpT0NI7uuZ+Q
 PEw2iTn7lVV0Vczkd/0Sd+Gmh8CnC85vroQZey0YaF+gEp3fvU8e4glOhZR6Vq+MSJBv
 WZQXVlqPqme+kGdrtH9TgXXFOtNomCTCK5hHWWwCnt8WEvnPNlaIWeCSPj/GAQURskq2
 D++Q==
X-Gm-Message-State: ACgBeo0xV5gT7mkLhXPKdgp0eKo+RGFfTImRYxYc+V/OA7wOoGIiNDjH
 MezIE7Q1awBo/G7BkF7k8wovyUvPRLc=
X-Google-Smtp-Source: AA6agR64zjEo0sZg4K8Wg6mDUG3019uqGrETWm7sMLCQ5oW5nod12Mn6acUnvyEr2w1A8TUbexukYg==
X-Received: by 2002:a05:6402:5193:b0:43e:1d52:fd70 with SMTP id
 q19-20020a056402519300b0043e1d52fd70mr29346513edd.150.1662049628550; 
 Thu, 01 Sep 2022 09:27:08 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:08 -0700 (PDT)
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
Subject: [PATCH 22/42] hw/mips/malta: Reuse dev variable
Date: Thu,  1 Sep 2022 18:25:53 +0200
Message-Id: <20220901162613.6939-23-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

While at it, move the assignments closer to where they are used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/malta.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..0ec2ac2eaf 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1239,7 +1239,6 @@ void mips_malta_init(MachineState *machine)
     MaltaState *s;
     PCIDevice *piix4;
     DeviceState *dev;
-    DeviceState *pm_dev;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1405,13 +1404,13 @@ void mips_malta_init(MachineState *machine)
                                             TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
-    smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
 
     /* generate SPD EEPROM data */
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
     generate_eeprom_serial(&smbus_eeprom_buf[6 * 256]);
     smbus_eeprom_init(smbus, 8, smbus_eeprom_buf, smbus_eeprom_size);
-- 
2.37.3


