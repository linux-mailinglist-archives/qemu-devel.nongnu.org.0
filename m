Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE56770EF
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdow-00026E-7S; Sun, 22 Jan 2023 12:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdou-00025y-7i
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:52 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdos-0005V5-Mc
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:52 -0500
Received: by mail-ej1-x633.google.com with SMTP id qx13so25025203ejb.13
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55nP5nNHv1CqBBrsvggBWBrAdo4oEubQ3LLGbVvXnaI=;
 b=Zq2A7M6RXabHrttR39XiFU3gWSLZNFH2yydlttFAzWFdvdFEsZt7QBmkKgCCqazxIL
 zy+7Sf8wDBUXw74kP+M+aBcfN+6w8knjihsQjIoJIjJucZ4IA6/Mop/CuYnVZ7Q7ESR/
 EQFJsdSG/h/KZPdMByU4vEaKwqTSaT+b0aGyB/sS/uoPPLhbDXMElX4f4k6kpgYy4pqW
 0Xs7DW4x9XygNDpow42jHJ9vWV8q70Ze57Y+7s5eQ2GZ6oivwXaiXfqzEqa0+2QBOwG/
 IaYYaU7e+zEGjgBkTmxCqx5vA2uhrKVZPUfWg2nMKstrMoDpfx9ztLqhjViO9ro5leja
 1CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55nP5nNHv1CqBBrsvggBWBrAdo4oEubQ3LLGbVvXnaI=;
 b=hA2qmbhF9MWebYMZ1bhMcItbWgP70ISUdsPv/UfhAKRbvdsMu6srUo7s8GebjXGt3d
 H4nyG9duLhLe8rI4R4ZeGVvX78lxRTMwq6IQJNFDOH7gANceTB0dy5qUNeyUwejIy2Nv
 FzTOf2PBdDY6OGtk/83Zco0yiWck36jPfhauvQUxPLzRaG5zCRDygZ+AA7qilUyWePFp
 W9yVkpsjIdJaQyMcFGhPwIXi8CrST8pyO8ucVG/CPH/JaPmvb56630GuhTVvBLqXH/qe
 NYZCV9kVGMy313nRawlSgJUrC/6gVaZO3wipc47ltEqn+jfFbHtr08UOnAZ2KU2LVDIR
 XLWQ==
X-Gm-Message-State: AFqh2kr9bNSOg4khaMuPOehU+KZJbHgmiDd0LurVJhjDBuYprGZEAJfQ
 fXh+gVTWLnjVIuxhzfScvMylfpixLYHLDg==
X-Google-Smtp-Source: AMrXdXskVSqK1IHroQcrP0p6vic9KS4gJ7VHSMHkLoJe5d/yYzuAElhSiU7oPUlnwFvknZ5G76SG/g==
X-Received: by 2002:a17:906:df49:b0:84c:f9b0:b54a with SMTP id
 if9-20020a170906df4900b0084cf9b0b54amr18957784ejc.58.1674407268982; 
 Sun, 22 Jan 2023 09:07:48 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 7/7] hw/acpi/core: Trace enable and status registers of GPE
 separately
Date: Sun, 22 Jan 2023 18:07:24 +0100
Message-Id: <20230122170724.21868-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

The bit positions of both registers are related. Tracing the registers
independently results in the same offsets across these registers which
eases debugging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/core.c       | 10 +++++++---
 hw/acpi/trace-events |  6 ++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index a33e410e69..cc33605d61 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -687,13 +687,13 @@ void acpi_gpe_ioport_writeb(ACPIREGS *ar, uint32_t addr, uint32_t val)
 {
     uint8_t *cur;
 
-    trace_acpi_gpe_ioport_writeb(addr, val);
-
     cur = acpi_gpe_ioport_get_ptr(ar, addr);
     if (addr < ar->gpe.len / 2) {
+        trace_acpi_gpe_sts_ioport_writeb(addr, val);
         /* GPE_STS */
         *cur = (*cur) & ~val;
     } else if (addr < ar->gpe.len) {
+        trace_acpi_gpe_en_ioport_writeb(addr - (ar->gpe.len / 2), val);
         /* GPE_EN */
         *cur = val;
     } else {
@@ -712,7 +712,11 @@ uint32_t acpi_gpe_ioport_readb(ACPIREGS *ar, uint32_t addr)
         val = *cur;
     }
 
-    trace_acpi_gpe_ioport_readb(addr, val);
+    if (addr < ar->gpe.len / 2) {
+        trace_acpi_gpe_sts_ioport_readb(addr, val);
+    } else {
+        trace_acpi_gpe_en_ioport_readb(addr - (ar->gpe.len / 2), val);
+    }
 
     return val;
 }
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 159937ddb9..d387adfb0b 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -18,8 +18,10 @@ mhp_acpi_pc_dimm_deleted(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm deleted"
 mhp_acpi_pc_dimm_delete_failed(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm delete failed"
 
 # core.c
-acpi_gpe_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
-acpi_gpe_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
+acpi_gpe_sts_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
+acpi_gpe_en_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
+acpi_gpe_sts_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
+acpi_gpe_en_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
 
 # cpu.c
 cpuhp_acpi_invalid_idx_selected(uint32_t idx) "0x%"PRIx32
-- 
2.39.1


