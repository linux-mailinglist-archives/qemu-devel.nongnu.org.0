Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D026A7D6D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXezR-0003tg-6n; Thu, 02 Mar 2023 04:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezP-0003tN-P0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:39 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezO-000570-6o
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id u5so13465720plq.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=gsdiGhQat5spgo9v9tXmUzlTjp5tqAEhw6hPLwwL6B5fh87q6nyjxRxovWqleUyG2V
 T+Kqt/mvqcMIayoyUQol6nVD7HVoEh91qPjSu4K467WX6Mrqg/zA2DqAWP0mteKO1tUz
 8Ma2yREDGXI9exyXmuOYtMUvl8R2UrRINeGq9Rx5N0pf+mOEArmgH9pS4JZ10zC66AAQ
 nXWkiEbbjIgJNxcG/tPzMHCp8tRG6s7kWaHZeMnJkfygK2Wl3lyE0J16fColZZ+kW/T+
 BzlYz1v8SO9ZsHHpNnG/5qXY1y6sU/y1aSfL8U9utsiX5KS5eBl/VVoMFjQuMO2aMhu4
 7zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=niaRM2UB+PtIsyLPwhTE2e1sCnFOZDCEm/PtTpqLEpZYWnraIDwswW5inc9ec81dLw
 qHfM9P5EXb2B+T2A0iPJaNUNv7UqXEBY/HcGkakXXmqeSg1NjEIwm5+pqAdwG+caK+y/
 Zk5R0ML28F7eR7IV/PnUf6wK2Tg4qJddmf7+LJc6kn9uwE5rNAkdfXfajYzlpmyHECdK
 7UpPbFFn9ga/jYejl+zM11wB9tyazULj3824++15ucP/IGD4VCNfbbrGrZiQ+jUtrDAr
 YqOI3TfiD7+ev10FHRlTWmqWhSHfgOoXIskW3owq2Wcqtsx+6Pr900P87FlVtTf6eSx/
 ZQHg==
X-Gm-Message-State: AO0yUKWjvKXvf+q07VbeGSNrl9dZtV5d/loJ0QZi1/GEGDy6mQvPYA3n
 liI4tOx/xhw5c7TAOhpBpwwtQw==
X-Google-Smtp-Source: AK7set8C3eHW+tX4WgxvhHlguNfTEBzz516Ts2DIjQ4is3lsKDzqpJi8Iaot/qZlUxJUh6TGA+lp1g==
X-Received: by 2002:a17:902:ea04:b0:19c:c8c8:b544 with SMTP id
 s4-20020a170902ea0400b0019cc8c8b544mr12430486plg.64.1677748356873; 
 Thu, 02 Mar 2023 01:12:36 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:36 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V5 3/8] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Thu,  2 Mar 2023 14:42:07 +0530
Message-Id: <20230302091212.999767-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
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
index 8df37cf3d6..9b85d5b747 100644
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


