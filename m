Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815813B37E8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:33:45 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwW2i-0006Lm-Ia
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVx7-0007sG-SX
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:27:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVx6-000331-87
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:27:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id r3so311081wmq.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4oE4Yl+ZmW3FxHEA+QspghoRSVsp0JhrX2znpzx03E=;
 b=hFfiNFm66zskVbyDI07zrdYVDlD/qyTttHVZkZYNpiieKMxpzsHvxUhvKTm3XdX81o
 inB5ioYY45mbrVdMhTGDfkxs1puPqGW7nl43M0mow5E3DQ6XjUJzH4XGz6B94spbaW/0
 3vdS6nnrNFdk0qogxQq8JT2b1eAZtJ0BQb5JXkMTCkYYqwk2C1PLYSCNTM9M60+rWe92
 uX+JvhHA+uT7Rq+FZmMzhOSCHykjwhCoD0sVByS5W7A1Td7mt5Y//To7rOw3P5P4LD+v
 lwMeWpD0Fs+WJJTMEZAx2ie8pVjWKssFbeHhYtfrD62DgTZKU9ogYpjo3SogZhXBJDl0
 /OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h4oE4Yl+ZmW3FxHEA+QspghoRSVsp0JhrX2znpzx03E=;
 b=jnJfkRXsjtGYFPOnJqxB4F7HHbjAMriCxkLDl5k/Bkh2ydGYGeGtU3atImGgxPdfra
 pkxVbT+1/V6qO9eIqr8IHWbFX68LMaotZTXR77bUfd30knpzHXErsinxP2VU7vNbugCs
 S2O2S/bnQMoY6HMEZmyhG2PeHwRiPNWdB4jGbacEFbgiOG0geTln0hxH183Ej8tNIw5O
 eTCTjuDy6RasDLi9TmYj2edYNh6F0YOv+lD7FR4+S0KlF9I2qkWXBqHqD9wqAAHvCrpR
 Z5WJh3RGnJwI5MHh7x3+6/fXroNJkyacZ+c3ZOOtUDMWg1CtMguJoXHxe4zeNwJpUHwo
 Corw==
X-Gm-Message-State: AOAM530lzeLuGzxP8MhMZXfcMg6risJYVsKBKCM2mec/wA2n+ShJNogL
 +LC73BTepT+mP1uhS9RCEA7k2jXfhVuq/A==
X-Google-Smtp-Source: ABdhPJxH4Z0mGSZ2hOjOS6HM9Yz4r0VPW3NXPu79x7Qf38qAdeEtNEL6ndgC+uFnOhG5mnJzDsOW/w==
X-Received: by 2002:a05:600c:8a7:: with SMTP id
 l39mr6435011wmp.147.1624566474227; 
 Thu, 24 Jun 2021 13:27:54 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o203sm4402208wmo.36.2021.06.24.13.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:27:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/isa/vt82c686: Replace magic numbers by definitions
Date: Thu, 24 Jun 2021 22:27:43 +0200
Message-Id: <20210624202747.1433023-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
References: <20210624202747.1433023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace magic values of the Power Management / SMBus function (#4)
by definitions from the datasheet. The result is less compact, and
we can follow what the code does without having to recur to the
datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 50 +++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f57f3e70679..4ddcf2d398c 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/registerfields.h"
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
@@ -38,6 +39,16 @@
 #define TYPE_VIA_PM "via-pm"
 OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
 
+REG8(PM_GEN_CFG0,                   0x40)
+REG8(PM_GEN_CFG1,                   0x41)
+FIELD(PM_GEN_CFG1, ACPI_IO_ENABLE,  7, 1)
+REG32(PM_IO_BASE,                   0x48)
+FIELD(PM_IO_BASE, ADDR,             7, 9)
+REG32(SMBUS_IO_BASE,                0x90)
+FIELD(SMBUS_IO_BASE, ADDR,          4, 12)
+REG8(SMBUS_HOST_CONFIG,             0xd2)
+FIELD(SMBUS_HOST_CONFIG, ENABLE,    0, 1)
+
 struct ViaPMState {
     PCIDevice dev;
     MemoryRegion io;
@@ -48,21 +59,24 @@ struct ViaPMState {
 
 static void pm_io_space_update(ViaPMState *s)
 {
-    uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
+    uint32_t pmbase = pci_get_long(s->dev.config + A_PM_IO_BASE);
 
     memory_region_transaction_begin();
-    memory_region_set_address(&s->io, pmbase);
-    memory_region_set_enabled(&s->io, s->dev.config[0x41] & BIT(7));
+    memory_region_set_address(&s->io, pmbase & R_PM_IO_BASE_ADDR_MASK);
+    memory_region_set_enabled(&s->io, FIELD_EX32(s->dev.config[A_PM_GEN_CFG1],
+                                      PM_GEN_CFG1, ACPI_IO_ENABLE));
     memory_region_transaction_commit();
 }
 
 static void smb_io_space_update(ViaPMState *s)
 {
-    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
+    uint32_t smbase = pci_get_long(s->dev.config + A_SMBUS_IO_BASE);
 
     memory_region_transaction_begin();
-    memory_region_set_address(&s->smb.io, smbase);
-    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
+    memory_region_set_address(&s->smb.io, smbase & R_SMBUS_IO_BASE_ADDR_MASK);
+    memory_region_set_enabled(&s->smb.io,
+                              FIELD_EX32(s->dev.config[A_SMBUS_HOST_CONFIG],
+                                         SMBUS_HOST_CONFIG, ENABLE));
     memory_region_transaction_commit();
 }
 
@@ -98,19 +112,21 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 
     trace_via_pm_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
-    if (ranges_overlap(addr, len, 0x48, 4)) {
-        uint32_t v = pci_get_long(s->dev.config + 0x48);
-        pci_set_long(s->dev.config + 0x48, (v & 0xff80UL) | 1);
+    if (ranges_overlap(addr, len, A_PM_IO_BASE, 4)) {
+        uint32_t v = pci_get_long(s->dev.config + A_PM_IO_BASE);
+        pci_set_long(s->dev.config + A_PM_IO_BASE,
+                     (v & R_PM_IO_BASE_ADDR_MASK) | 1);
     }
-    if (range_covers_byte(addr, len, 0x41)) {
+    if (range_covers_byte(addr, len, A_PM_GEN_CFG1)) {
         pm_io_space_update(s);
     }
-    if (ranges_overlap(addr, len, 0x90, 4)) {
-        uint32_t v = pci_get_long(s->dev.config + 0x90);
-        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
+    if (ranges_overlap(addr, len, A_SMBUS_IO_BASE, 4)) {
+        uint32_t v = pci_get_long(s->dev.config + A_SMBUS_IO_BASE);
+        pci_set_long(s->dev.config + A_SMBUS_IO_BASE,
+                     (v & R_SMBUS_IO_BASE_ADDR_MASK) | 1);
     }
-    if (range_covers_byte(addr, len, 0xd2)) {
-        s->dev.config[0xd2] &= 0xf;
+    if (range_covers_byte(addr, len, A_SMBUS_HOST_CONFIG)) {
+        s->dev.config[A_SMBUS_HOST_CONFIG] &= 0xf;
         smb_io_space_update(s);
     }
 }
@@ -176,9 +192,9 @@ static void via_pm_reset(DeviceState *d)
     memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
            PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
     /* Power Management IO base */
-    pci_set_long(s->dev.config + 0x48, 1);
+    pci_set_long(s->dev.config + A_PM_IO_BASE, 1);
     /* SMBus IO base */
-    pci_set_long(s->dev.config + 0x90, 1);
+    pci_set_long(s->dev.config + A_SMBUS_IO_BASE, 1);
 
     acpi_pm1_evt_reset(&s->ar);
     acpi_pm1_cnt_reset(&s->ar);
-- 
2.31.1


