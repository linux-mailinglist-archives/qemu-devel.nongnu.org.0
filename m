Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9E6874AE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRab-0004Qv-PT; Wed, 01 Feb 2023 23:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaT-0004PL-DF
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:41 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaR-0001DG-Ne
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so4427874pjn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OK5MGUXpJ5dOBb1EDkd0/AV6RjPH0TTmkyNQ2mOQJc=;
 b=B+xjeku/YqMxE+yptWNKXY8r8cmeAzXoTTbQJV7acmbHdNZWM6IvigDzGKlUnKTY2I
 4dZZvILiYtbOAtC+epEf1jK9w9FEdoiILwRMHOA+Wec/ep9vL+wxTOuJaOq0mHVsA591
 lKRbuDiV5jOERzYbhvqNaYL5BI85ASoysAmVgN5loXp+lZJ9/WZyyRXi4Eyq0Ts2u66Z
 eGhThikcvUsfmcZSRb/g1whyXTf9X2PSO6lBQURSBxM9o6UE2k6+fv6wMCmHxnrc+iDf
 Ogs4YmZfG8pD6LmUSyMrkwjJKqFgqMDzA17DYqakiYU+4jj7vFumMoeD8sOIl2/mZMxr
 YVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OK5MGUXpJ5dOBb1EDkd0/AV6RjPH0TTmkyNQ2mOQJc=;
 b=GaxdBy/Qr8h/hxU6l0fQTd5hyZ1WSoNPMZIKud9isqxjPKWt6Y6AnDrXqoHk2zbFIE
 2gsZ/sxT2dVI4ez5ZngsWQ2o3+7at+W33PbH8JI+xVzNtnlbzh67KpZnVodZSUDZ8DVj
 2iXbL7hFhA5Lq7GIqeXDUAHdIkQLm4xNQsq+CQB9WnEm8Cec8kZGfm1NlJ7SAFKhyAKb
 /+SFDoFXJwCsPLkVK8bchOREhchPobDKdJ7HwFD6BsBBmAUUpPGHE+pobMUSbsYTDq+G
 g8upwwxC7c5bDCzi4o9AjgEQYBD82IHd0xfKRfZM9XKrcIw81pKg3QKpHChGHGKiddIq
 KziA==
X-Gm-Message-State: AO0yUKXhKR8+UxCPbB5cKXpiewJdBH8oDQUMB639XXZz29iWoCN1yBuI
 2tYIu9889FWd4Yb3KBv/rsS/rg==
X-Google-Smtp-Source: AK7set9F4HIcfMVzailtXxZNiDgapKPjYwbZriRoksG5Qr+wNiihM04E4DXl7IIPD/XtFazciSAA/Q==
X-Received: by 2002:a17:902:cf49:b0:192:b2d3:4fc8 with SMTP id
 e9-20020a170902cf4900b00192b2d34fc8mr3818150plg.1.1675313558487; 
 Wed, 01 Feb 2023 20:52:38 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:38 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 03/10] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Thu,  2 Feb 2023 10:22:16 +0530
Message-Id: <20230202045223.2594627-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102e.google.com
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
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 84962962ff..26caea59ff 100644
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
2.38.0


