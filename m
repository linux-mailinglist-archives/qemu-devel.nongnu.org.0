Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E036770F1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdou-00025x-GX; Sun, 22 Jan 2023 12:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdos-000250-8O
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:50 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdoq-0005Uj-LS
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:50 -0500
Received: by mail-ej1-x629.google.com with SMTP id ss4so25036152ejb.11
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTp/1FVQ9VbeB7B8kOXkxftyXCVa8a/9MHE3WMaJPHc=;
 b=n2KujdI0uAbwEGMLjp4i665qKt5CT+qZuvrd7vXEikI4T8QJBBO+2d+29tQ6CNZlXE
 oQZyNO1HwpGv4hbCeusgWq/lDUKOrW+sRWSdVH5v8s4AG56mIjJND+/3QMWj1NKmAOJV
 pdEePQ0/ATK3DewazwiI38Uz3xxIZ2Uk3nqOc7kkl/m3XjVmpfmKokmjo7mpM0pmokuV
 OzsLYiTpQixGMfhvP7t7eXx5ptO4LcT0y/fzCRDo6VhUJvMbRJ0QilI+/SMEWomH/OOW
 ghJF5imWCg1CDPacS4d/I/jz5DJs/MEYiDdImpkxYcvb8gtQey7ik6K9T+x2So9Y5M0i
 AGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTp/1FVQ9VbeB7B8kOXkxftyXCVa8a/9MHE3WMaJPHc=;
 b=UvosXh4V2HG8viZ3ClVgplnDTeu7GdX/yliNpiWciGnxR1EWyCFHyCl+bbxuToqLMp
 /UXX0PKwMpcrD1AAogJtaNjW1jRkoR+6WKSfahAHXtflfJrPcJUY74+uJXFKkDSrn/ud
 vLmZzKehgmYq3zkfpAt80IfMU0jxuud7rFIverVDR+0n4sPyVCE7VKujZ/rCv0qGAwXJ
 w/yFNMJf3lBx5anVm9zDRvmbtSkisSIgvVvrWb9v8WcLnu3w8fwrAdCML8ojJ231Vdnt
 3adQltdXVTYK6LbekD6xAg1vuNM9O0EV8kk0H9l1AQ6oRuDGWNrd9s4sVxtGQU7fWE0Q
 RFGw==
X-Gm-Message-State: AFqh2kr4RYOCI19+u4LRJ9VAGPr3n8lf3TcFDR+wynpzIFyzQwMpDq03
 jPfALw0Ncj3soHXMJ4+9vHlx4ZFA9boQCA==
X-Google-Smtp-Source: AMrXdXukWhvVYcgJun4PclDz0IZUSXMj8PEx1xiMgS1J6ax7mb+UbLqj0DWjukMVBl0T6ryd+EBooQ==
X-Received: by 2002:a17:906:7188:b0:7c1:eb:b2a7 with SMTP id
 h8-20020a170906718800b007c100ebb2a7mr36578381ejk.13.1674407266947; 
 Sun, 22 Jan 2023 09:07:46 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/7] hw/acpi/piix4: Fix offset of GPE0 registers
Date: Sun, 22 Jan 2023 18:07:22 +0100
Message-Id: <20230122170724.21868-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The PIIX4 datasheet defines the GPSTS register to be at offset 0x0c of the
power management I/O register block. This register block is represented
in the device model by the io attribute. So make io_gpe a child memory
region of io at offset 0x0c.

Note that SeaBIOS sets the base address of the register block to 0x600,
resulting in the io_gpe block to start at 0x60c. GPE_BASE is defined as
0xafe0 which is 0xa9d4 bytes off. In order to preserve compatibilty,
create an io_gpe_qemu memory region alias at GPE_BASE.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/acpi/piix4.h | 1 +
 hw/acpi/piix4.c         | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index 62e1925a1f..4e6cad9e8c 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -40,6 +40,7 @@ struct PIIX4PMState {
 
     MemoryRegion io;
     MemoryRegion io_gpe;
+    MemoryRegion io_gpe_qemu;
     ACPIREGS ar;
 
     APMState apm;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 2e9bc63fca..836f9026b1 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -49,6 +49,7 @@
 #include "qom/object.h"
 
 #define GPE_BASE 0xafe0
+#define GPE_OFS 0xc
 #define GPE_LEN 4
 
 #define ACPI_PCIHP_ADDR_PIIX4 0xae00
@@ -429,7 +430,7 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
     object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_CMD,
                                   &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
     object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
-                                   &s->io_gpe.addr, OBJ_PROP_FLAG_READ);
+                                   &s->io_gpe_qemu.addr, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
                                   &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
     object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
@@ -558,7 +559,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
 {
     memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
                           "acpi-gpe0", GPE_LEN);
-    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
+    memory_region_add_subregion(&s->io, GPE_OFS, &s->io_gpe);
+
+    memory_region_init_alias(&s->io_gpe_qemu, OBJECT(s), "acpi-gpe0-qemu",
+                             &s->io_gpe, 0, memory_region_size(&s->io_gpe));
+    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe_qemu);
 
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-- 
2.39.1


