Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC46874B1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRan-0004f2-IK; Wed, 01 Feb 2023 23:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRak-0004aI-KP
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:58 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRai-0001E1-IZ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:58 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so91165pjp.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+msI053tZobQNVJtzCxF6v86dIC0lUYPfhn8cOFSkx0=;
 b=aMGVUNhvHN7KngElz7SWuGceTACHtKGOeI/S7XTrctzSBt78dJisV7Ex93WhL5VfRH
 /nJK2QHpvU3ppSC/e9kYXU87kjksDXXO1bAp8T8MuxcWbAvJ+ZVgOOXixfu3lVYkuuqI
 a0PrBlGqPfZYCHi90JCehyrE+DSgFPnsT9nrkl+1p9IXK44WF++LPWwqW92lC7kL/5sn
 vnbWnwJKMpKFXI3Q4UWzN5I320AaJkiRj2r/ssPcPIssRXtiFWoyxJG87zzn+2MvVd4d
 i0P8tQcZU8pvKkDiHpmxGgXGRDEWHdpYFsb/iGgmKgWlvuPTnIW9cbLiwWiXPNh+9JKP
 Nwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+msI053tZobQNVJtzCxF6v86dIC0lUYPfhn8cOFSkx0=;
 b=kGF3QJATSgKd//bIMPwo+yXOb/BDLxNcGVkFC1+J5Y0LZYeDCuMf0sH4IDUC/fiawI
 uEt+T0JIfi35uIIKWMSpM1aMIrrd1QjGhYHXBvi8NMdrxqOh7KDqXUN450ex1ImggYac
 V40ZE9uI0xlMgPxigYmqyejS2Un3b3m69uFyzJkTPQTChPq1waHYXanh1R8/T6XiuIFl
 Qjz7QbwlkLZccgEHn6ag4PEbcXt/HtOgAuTn8WnzLODm5VP/CL66X2gnKeQQezld0sVR
 hSU1yjDHJQFWIOGjwUVUPdFaIakaarGz44M3SwdP1x9l8gyRl9GDhvBMSIPdaQreqdaP
 TaMw==
X-Gm-Message-State: AO0yUKWJTXVh9Of6lTI71OuEiFWEtKcZP7EobrL8akaF0tBTDi6U8NVx
 k38VWZfr+N81p3ZFDdeENyz/Fw==
X-Google-Smtp-Source: AK7set+sEjsPSf8KuXVWCIFZkdBrnSZhUlRKblyI19isDMOlKTG8Av2gctlDgw58d7Lwm3Dj72oa9Q==
X-Received: by 2002:a17:902:e385:b0:194:6c1b:e5cc with SMTP id
 g5-20020a170902e38500b001946c1be5ccmr4284126ple.38.1675313575882; 
 Wed, 01 Feb 2023 20:52:55 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:55 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 09/10] hw/riscv/virt.c: Initialize the ACPI tables
Date: Thu,  2 Feb 2023 10:22:22 +0530
Message-Id: <20230202045223.2594627-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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

When the "acpi=on", ACPI tables need to be added. Detect the option
and initialize the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 26caea59ff..f1f5612c69 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1324,6 +1324,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
     if (kvm_enabled()) {
         riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
     }
+
+    if (virt_is_acpi_enabled(s)) {
+        virt_acpi_setup(s);
+    }
 }
 
 static void virt_machine_init(MachineState *machine)
-- 
2.38.0


