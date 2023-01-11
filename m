Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28F666179
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:12:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFec1-0002hJ-N8; Wed, 11 Jan 2023 12:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFeby-0002bL-OI
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:02 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebw-00069N-A0
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:02 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 s10-20020a4aa54a000000b004f240f120b3so380664oom.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4dXSiAnits5ErKwehcEjsLRKL1HaEAOZOXpk41ZAWU=;
 b=S2SERipg15y4IXl848CDa/ZgPj93Ezd31PiqNY6UifDVOKt8+PtFjIRJ+YFbmvlfMt
 ilfO0BKD7nA9BayltTgbkk6dzEuSzUX5LhX8pRAD/PwJpXV32u1N2xxQ7K/ceuSLicY5
 pW0BDy6n1Mspx2zgytrAGJ3tUlubV/Gf3mc7VXukaD5ESQPF6pLiK/dpdq9/qS7kvZgK
 NhC4GPbl1YcjnrHWNfFtr0C4o5uyPpj+9usENog+pEGZUkMgUr0fOwxmIxLOdWqusD99
 F3Oipcy30cfKR8s+RjrIGzES/UCipiEico6+BgW6VRizC3lgu6Fk8eURLWJD65kYAnXM
 vQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4dXSiAnits5ErKwehcEjsLRKL1HaEAOZOXpk41ZAWU=;
 b=RshvM/RVbU8jdj/tI9b33jS64CKfC96c+cAWECSBlP6qRUKEk/eQYyRld5VZQXLs6g
 Yz+hOwaOsOnnYXPA5VyZTYMpKxzdrnnt/Blb8cP1DjwMvFnE9FI9omzmcHlDzStDISHe
 MLB/LtlCocwIJkDE31NHwNuLvM12eJScTaTcawCEpYsv449/eEC+XuLDVsARLj0e9FCc
 NQP1q4BIe84kJOSqf0DxmUKvCvU+1asX+AZcWui2fWOuWTd/mSXo3bGqshgJFhA2ajGK
 hogi+igX5Q2tEKibC9MLN4ITrs3gpUTTCoTKP66NxL3baiZYzV2Km3D5z6vFHfOpFDtr
 EAcw==
X-Gm-Message-State: AFqh2kqIJaldoNGjM50UDwRXY3Y4LELNF8/zAyNBRpiiar9MdKep54Yu
 GDvfOFsOpiIkzh5ymmObjndArgS6Nd0JNCmuSho=
X-Google-Smtp-Source: AMrXdXvSNJiFv6PAv/N1Lp1vE3Zk7qxb0XYZV9mpGlEv1cDhWfkN6GxK1apcwCjsKnLiU0y12CIyjA==
X-Received: by 2002:a4a:ca93:0:b0:49f:8720:d5b2 with SMTP id
 x19-20020a4aca93000000b0049f8720d5b2mr30777123ooq.8.1673456998770; 
 Wed, 11 Jan 2023 09:09:58 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:09:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 02/10] hw/riscv/virt.c: simplify create_fdt()
Date: Wed, 11 Jan 2023 14:09:40 -0300
Message-Id: <20230111170948.316276-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

'mem_size' and 'cmdline' aren't being used. Remove them.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a931ed05ab..89c99ec1af 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -999,7 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
 }
 
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+                       bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1499,8 +1499,7 @@ static void virt_machine_init(MachineState *machine)
     virt_flash_map(s, system_memory);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.39.0


