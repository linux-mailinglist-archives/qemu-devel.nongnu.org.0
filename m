Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049B6A181F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:40:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTZx-0006p5-9v; Fri, 24 Feb 2023 03:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZv-0006oa-RY
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:19 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZu-0001AF-Bs
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:19 -0500
Received: by mail-pg1-x536.google.com with SMTP id d10so3581504pgt.12
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTXYUBdKE1rpTGFbupOnVoVgRHPMqyNCBkNUTQhDIAY=;
 b=G3Mv+foVG4abl+kYx/FC9ihCuVXwhdn8d8gDGxYibPfdLar12MvPhq3ZSfsAfbZ4Ar
 zdOgqMPOiTsOBDMSEAcnY9EeVw6pSWU/ZZKh6oOMNAGbblvqt6UDYfWEeEZZnGJfdbtA
 ELiGCftn/dv02q50oA/extlDqQjLD93GK/HG9475O8RSSOJCXnnQLzNo5rGWLvsVYhPV
 gLmHpI3xVlOtrRSLzyUQ3ZE3I2PgDwlnbDrenEfGo22hVWH0mpfxkmajJ2hH/r1W4tan
 lq4lykohI0m84DhaWfXvlWLwX16NyEHElw/wdPyF80Lt6ihdIfWswC6aesGZrRh+Wg/9
 xLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTXYUBdKE1rpTGFbupOnVoVgRHPMqyNCBkNUTQhDIAY=;
 b=pgIxSrv5Q797f+kWrpLqFhWHLjw9IAsnbnNsJeHONyCHuBs/xAg0GV+ijXwwou7s6c
 H6pv5kdhZfP08K1dYGGRvimN1u+5XJ68leZT90K4in1jFHZx+ZQP9DaqGTadwjhdM7/E
 m9BaspTGnYxhVxB5hJwo/0tDf/MysE1WKl5Pj+iHtBCkgXFiLdr/bMuw8Gh6B84+9Aij
 66qZ9Bnl/u9X9HhKDioTYMZUgXVoUcsGUZje7W56pf9dpqaoY4a7Wmp50WwFA2TA84zd
 rMhxPdN3sj9D/WyMM6qmubWYYIjAJDCty12cehuK8Uh3VoWdwtCUzzPXu4F9XSG4feoM
 /uOw==
X-Gm-Message-State: AO0yUKUxNxHnNHx+azaBTt4UOJpxo21LkGP4WLHUIhBbDcr8XQph9aAW
 XYc4KTrsjbL18AA/n2MWnp4jtTnMsDGLj5i6
X-Google-Smtp-Source: AK7set9KX8ySXKwJ70N9Hi6dygKTBZgcsIxewIXADGJiNclN3amWTKsFzZPPU8d4QBWYf6YxAKU55w==
X-Received: by 2002:a62:1d4e:0:b0:5a8:cec9:6ab6 with SMTP id
 d75-20020a621d4e000000b005a8cec96ab6mr14129911pfd.31.1677227837146; 
 Fri, 24 Feb 2023 00:37:17 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:16 -0800 (PST)
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
Subject: [PATCH V4 3/8] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Fri, 24 Feb 2023 14:06:56 +0530
Message-Id: <20230224083701.2657063-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
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

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 89d5b9d8aa..bcbacf4e63 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1459,6 +1459,8 @@ static void virt_machine_init(MachineState *machine)
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


