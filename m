Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142346631B4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyyo-0006po-01; Mon, 09 Jan 2023 15:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyb-0006ln-M8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:37 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyya-0002ug-5v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:37 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i9so14441604edj.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vQGjzzE/CoQGB/cMKXGEyC0JB45XYFEg3Frz9/9KeA=;
 b=LxeU3+VlURFV7LhvgwXwPleDT7kC1hnyGde0ho2Z+FISDz1m2eqBSx4LUlorGhjd4e
 6QUDY3J+h8GX/k2V7oX0XJlUHXNSceTZqF4fi801tsjA7LO/Bme05XgiO/gtXK91/DPp
 d3GNcSYbYGPBx05zKUpnDWLkTmooMO0VrMiC9Lk0kh8EWOWROkbXfsUjCIfSuPq0idx5
 L2RYZp5XD3neb4oG3AUBkG7z1H9Qu/sNmtBO5WwUwIGb0yQDR0Pmn1rqDF5LcJN3VVnr
 VRTgDi1ymeE4A62gCtFAud0uXoeFKuSZKEV4pYUw6qC0xbN+UG1vV4EBIiYtCtSFVC85
 XATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vQGjzzE/CoQGB/cMKXGEyC0JB45XYFEg3Frz9/9KeA=;
 b=tSIZffPapEv33EpTOfY1ToWu+p9EbNXuXkEZUIKgX1tO5rc2e+vCeN3xa8VDVdcMwJ
 agWjyhvhkOd/kb0P24XMCAWWAkYAjsM8SU2ORiLXpWYL+/yGbklRYnzx5vvmxnFy5JJG
 b3S+PhufF6KcfkYnHOlSKVyjfwvGInSnS9vUYa7a3IClWPxd7e9KEJMDF+kwa3ww7XVk
 DfbXP7sJ7TOp71AbT5PA6CF54uZe5v7lXaS1p1R91vCnbhxLhUKa6LTB15EyqSiVi70U
 6xFECQGwRfAYIp+AlNVl8MttIhlgmjKKrw9SgfCgwYyBhkjMIMgGbmqkXmHjJ6P3lldA
 tdDQ==
X-Gm-Message-State: AFqh2kr98I25Xuu8jvsPK0nREULbgFF8iIa9fQOaUDRfm10SPqHWgJp6
 YRjoMZdMec9QpP+ymntZF5dDKXgwiJQ=
X-Google-Smtp-Source: AMrXdXtk7os9d0BXMP0hedZaugN96cSMRUXw3tiT3jDANDi+cVoen78ZsEEEiK7EKSp/O0kqaTKHJw==
X-Received: by 2002:aa7:d61a:0:b0:499:376e:6b2d with SMTP id
 c26-20020aa7d61a000000b00499376e6b2dmr7889372edr.0.1673296954653; 
 Mon, 09 Jan 2023 12:42:34 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ca20-20020aa7cd74000000b0046267f8150csm4078018edb.19.2023.01.09.12.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:42:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/4] hw/mips/Kconfig: Move device selections to respective
 boards
Date: Mon,  9 Jan 2023 21:41:24 +0100
Message-Id: <20230109204124.102592-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109204124.102592-1-shentey@gmail.com>
References: <20230109204124.102592-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

Allows to see more easily which board has which devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips-softmmu/common.mak      |  7 -------
 configs/devices/mips64el-softmmu/default.mak |  3 ---
 hw/mips/Kconfig                              | 12 ++++++++++++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index d1cfe16b81..4e535e2246 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -7,17 +7,10 @@ CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
 CONFIG_VGA_ISA=y
-CONFIG_VGA_MMIO=y
 CONFIG_VGA_CIRRUS=y
 CONFIG_VMWARE_VGA=y
-CONFIG_SERIAL=y
-CONFIG_PFLASH_CFI01=y
-CONFIG_I8259=y
-CONFIG_EMPTY_SLOT=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
 CONFIG_MALTA=y
-CONFIG_PCNET_PCI=y
 CONFIG_MIPSSIM=y
-CONFIG_SMBUS_EEPROM=y
 CONFIG_TEST_DEVICES=y
diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index d5188f7ea5..88a37cf27f 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -3,8 +3,5 @@
 include ../mips-softmmu/common.mak
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
-CONFIG_ATI_VGA=y
-CONFIG_RTL8139_PCI=y
 CONFIG_JAZZ=y
-CONFIG_VT82C686=y
 CONFIG_MIPS_BOSTON=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 78400f8c23..67d2859be4 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,8 +1,14 @@
 config MALTA
     bool
+    select EMPTY_SLOT
     select I8259
     select ISA_SUPERIO
+    select MIPS_CPS
+    select PCNET_PCI
+    select PFLASH_CFI01
     select PIIX
+    select SERIAL
+    select SMBUS_EEPROM
 
 config MIPSSIM
     bool
@@ -28,10 +34,15 @@ config JAZZ
     select PARALLEL
     select DS1225Y
     select JAZZ_LED
+    select VGA_MMIO
 
 config FULOONG
     bool
+    select ATI_VGA
     select PCI_BONITO
+    select RTL8139_PCI
+    select SMBUS_EEPROM
+    select VT82C686
 
 config LOONGSON3V
     bool
@@ -39,6 +50,7 @@ config LOONGSON3V
     imply QXL if SPICE
     select SERIAL
     select GOLDFISH_RTC
+    select I8259
     select LOONGSON_LIOINTC
     select PCI_DEVICES
     select PCI_EXPRESS_GENERIC_BRIDGE
-- 
2.39.0


