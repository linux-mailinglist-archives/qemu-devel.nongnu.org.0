Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB615694852
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa0q-000692-Kb; Mon, 13 Feb 2023 09:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0o-00068Y-E0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:40:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0m-0005Se-2F
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:40:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so12425945pjp.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5ZHbzn8UznmI/HA0ZrfnP4iDQsCNTxYGyI26FNASvs=;
 b=BSo33pDSSADN9+f5he6nwOJZPK1c5IhwrUeKYv7eOcEoJe0GDmkS2z07qRvPZ89plv
 iZ6+hLWfCr58I073C4ph9wiAeUBD0EZTQ9FvOye/dYPTre+X79OuGIk5oumBS8ttFs3I
 6bWwEA3PMrDwij6VBOG81IsytfBaLvO1uHrBIcFRulQ0sVpLXxC3gzambf1aDEm7rjlK
 zJMLCtjbV4CV60j0QxtIHyRxveVorx2Q1SPEXrqXXc5NXXWw6r4BK0vshUXYC20Mxbn+
 k75F/nIPQmrQnojmr1RFnRoaRlWyUOBl5PoNZ47pSJaTfaBWociGpxVGzbvao+Dc0Mk8
 l6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5ZHbzn8UznmI/HA0ZrfnP4iDQsCNTxYGyI26FNASvs=;
 b=kLSIz4CmZwPkdFH3By0pzCHFK9XdDh3wu0hVRFrHGUT6ugceWFnl8PkQCt2p6rMQlP
 r9ZtV3Pe7PJ5Z2zuxDyZz9XhgeZ0d902u0g0hi/952zdyHlkHjEGHzfzeHYt4M0AtvKP
 LhNSBZMfbT5t95q7aMPOsQ1nrq610Fl15x9lLdamE2n086JavixGnxht2e1R7rh78HkV
 5ups1IMq3kO1y+MJwqO8xkawRc5Tgtrjx5SHAEkNvX47p0Fx3lB7tKSiZ9ymozvJ7LPH
 HrC4WblVRDZL7QxFc3HSDj3yFkHZeA4BFwi+BA8XonDLM7vwEGqZKJroKwSI4zve+ytH
 iZTA==
X-Gm-Message-State: AO0yUKUEsq7B8NundpIOnIj77wvap5gP8EUT3EHX7ZmrZSJw453i22zy
 ng5+C/rhxVTDsmsD1uHKbQGdug==
X-Google-Smtp-Source: AK7set9H5LwsLISspf9wX4l555IjcfE7kx0OLQg9coYrZQsEZCH5qLfTopJuK9oNmvsYol0sVFXzbg==
X-Received: by 2002:a05:6a20:a026:b0:c3:3ea7:e318 with SMTP id
 p38-20020a056a20a02600b000c33ea7e318mr20379538pzj.42.1676299254786; 
 Mon, 13 Feb 2023 06:40:54 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:54 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V2 03/10] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Mon, 13 Feb 2023 20:10:31 +0530
Message-Id: <20230213144038.2547584-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 58d3765b6d..5017ba62ec 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1451,6 +1451,8 @@ static void virt_machine_init(MachineState *machine)
             ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
+    s->memmap = virt_memmap;
+
     /* register system main memory (actual RAM) */
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
         machine->ram);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 62efebaa32..379501edcc 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,6 +59,7 @@ struct RISCVVirtState {
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
+    const MemMapEntry *memmap;
 };
 
 enum {
-- 
2.34.1


