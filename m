Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B463369F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOHv-0007WL-3e; Tue, 22 Nov 2022 03:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oxOHr-0007Uo-FL
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:05:47 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oxOHp-00070c-4i
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:05:47 -0500
Received: by mail-pl1-x632.google.com with SMTP id j12so12899110plj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 00:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vIgcbekmaHm7cXwIMhYx9ryD0Z5px0U7+QwrTy4E9hQ=;
 b=IdkadNlwlSJXJq5KbCgPMdnwoyBpkQCi+zz7nMRBKtst1SnEDcWhtO4kHrUrBsMs30
 Y1x8zykJsar6wsJBe6cbYHOzja2miX3fzOeC/t0carKCWAhxf47HS2VBuvXyV7rBP70B
 NbotaqR6mGEsSzTv05IEwLKKJQDBgm1ExPLfCRLzNUyEp8idYzLbyuo07YzVLTa978ph
 N++mA+ckLGquggmRxt30StRtJh9YEE/liY4tsz+mrDPNCE7e6HBW2tvQal0mGSvAqKwC
 meluQY8jxSFGIYgnLSVh7mq+yzhDt3s31R6viGF3C1plUdbqTX+HEY6B3Joujgjb/vlW
 /Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vIgcbekmaHm7cXwIMhYx9ryD0Z5px0U7+QwrTy4E9hQ=;
 b=Hppr6KvWlZxHeuFC1L0mBl6zuyLqFozYnTT/2j7wvQKL6ogocfRXA3C1Bsu4bFgZzC
 ZjS6Fl4oZhX1WXjDW5f6w4e4k/ouekOv+FYjx+uY50Acz4cMbftUFeLUiH0c+vce1Diw
 6QEWde4tsTaHJQ0BdfOUGb5jh1a6HTAE0VCcFiTv+b04HIklKG+Zm/WNNCQlGBjvXCNq
 tC9krtjri8rC6wH9qt9snV5w7a++yUbNqE6mh0/6m7jDhNw9kwIfOeG3uHNXiIdMYhBq
 EljGSKU7+M9M/25YCM8nNAWGKjCxSenL1Kiu8c7mdq+Pnb6Sho12WnTqEahGm0UeDVFw
 PJ0g==
X-Gm-Message-State: ANoB5plVFK4hs8YP1+9u+uVuU+Xa37NYMtrFS/EzrLIVgpZstKOI+Ls+
 fy2m6741FhyL6ZIidwnrU8BGjpyPNsItJw==
X-Google-Smtp-Source: AA0mqf5X8lAA3CBh45M8SPpZ7jNV/dTOC7J25YCytlGYfmYqa47P/gqupbY8RONiiR+iSie6KpjZOw==
X-Received: by 2002:a17:903:258b:b0:189:1b50:f9e with SMTP id
 jb11-20020a170903258b00b001891b500f9emr3718217plb.74.1669104342146; 
 Tue, 22 Nov 2022 00:05:42 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090311c400b001865c298588sm11177247plh.258.2022.11.22.00.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 00:05:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3] hw/riscv: virt: Remove the redundant ipi-id property
Date: Tue, 22 Nov 2022 00:05:29 -0800
Message-Id: <20221122080529.1692533-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The imsic DT binding[1] has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

[1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes from v2->v3:
1. Fix the compilation issue by removing the other usage of
VIRT_IRQCHIP_IPI_MSI

---
---
 hw/riscv/virt.c         | 4 ----
 include/hw/riscv/virt.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b412..6cf9355b99b6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
@@ -597,8 +595,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
             imsic_guest_bits);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f71..62513e075c47 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
-- 
2.25.1


