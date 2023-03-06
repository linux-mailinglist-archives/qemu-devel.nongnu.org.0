Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9D6AD116
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIww-00072e-B1; Mon, 06 Mar 2023 17:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwr-0006ys-9m
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:49 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwn-0006ty-EE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:48 -0500
Received: by mail-pj1-x1030.google.com with SMTP id oj5so11277564pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140284;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLQ2d4Q8lyM8hisZupM0/ijO56IIsMafYWr8dV9IEZc=;
 b=SCMIv8yrxOcgdbbdMlgfulCsT9iWvkz0XJ59JSgKHH70FEmnXDlyKVbTWNrbnYQ+xx
 qzXBrbmzDSvnvb2i2YSYoa+lilbruqjWFBeTCE6C4VP1BRvz8lazBh13O+Ko6e7xM8kG
 i8mMLNK7Mgzb23hxPSOxPoqsgVNgLXXCSjae0Y4x1L//mKR9Xi37mry+bx2umdN1CTTn
 xOqh8Edt+YTXd4PbuWfqlXPxtcSLw6ZhhpdWJD8gZsmR3MK5HWL/sXVCF7KGC/8SfkfU
 ST5QvoERCOrKAfb9KPwT+Dzdrrh1+CAx+L5gxM1bUn4rHuNuqE8tXjoLCplsrOMwXii4
 guPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140284;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLQ2d4Q8lyM8hisZupM0/ijO56IIsMafYWr8dV9IEZc=;
 b=ndp+Y1oRqw3FrneswWWSKCVDLoiXLgURMsMW48+Ng4ezT2ujiIgd4J72bcEZmj0rVT
 K9+FsF1gohStFS/OviXsi3MBvcPhRnwyIZFi5EvbxcI4cA/LPNo2JKGPvzKFsNwZf796
 2U5OL5J9S2sv/rRO3A5s70AYBn6mc1ekK6kYgJ9dhDQdmDngL72DJ6fmbnocXytMTDB1
 lfEt5I4SNN/LrRDknEbK3xWzhoZXDu/xzYoJTPKmu+Bemf0cmcVuFjbZGOpnyvpKfRaD
 osS5ZjFHVJmvuyWmCgWMQCZXZ1tmcUUEuJKUmdmTeOjLqtpdINDMGydF0DtY9QSDU6Bq
 Wr/w==
X-Gm-Message-State: AO0yUKWyFzExnSY66OGBhU+ZJ97W9u51iw/dZ2VzmmNyWmqNc5vqCiim
 Q0h7+ttwR2D8+jjxMS0f4xlr2A==
X-Google-Smtp-Source: AK7set9YgpGYg8Y0wrNGnw3I8xqhrvhr/JQmv9HHCDJxy3MCb9KJqtgbjtqOzOCX4DnT8bpAgqprrQ==
X-Received: by 2002:a17:90b:1b4e:b0:233:ee67:8eb3 with SMTP id
 nv14-20020a17090b1b4e00b00233ee678eb3mr12883633pjb.24.1678140284122; 
 Mon, 06 Mar 2023 14:04:44 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c3-20020a17090abf0300b002376d85844dsm6344251pjs.51.2023.03.06.14.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:43 -0800 (PST)
Subject: [PULL 17/22] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Mon,  6 Mar 2023 14:02:54 -0800
Message-Id: <20230306220259.7748-18-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1030.google.com
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

From: Sunil V L <sunilvl@ventanamicro.com>

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-4-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 90579a4c0e..aed303e1e6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1458,6 +1458,8 @@ static void virt_machine_init(MachineState *machine)
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
2.39.2


