Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B66A181B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTaA-0006xk-LN; Fri, 24 Feb 2023 03:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa8-0006uE-MA
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa7-0001Dy-6x
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:32 -0500
Received: by mail-pl1-x632.google.com with SMTP id u14so12044588ple.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfZ0J0hOAA9ssEh0m4vkjugDicCJVNwpKRmCQ4HkzMY=;
 b=fuDG0b0bV+3HqWF7q4wV3CUanmECWeOjIuOO+SO4UAJLLrJAScIsFcRr5ajjv55sY2
 2QFpppjwe+2fRMcOhOjbYrtLdiNr2yPkSD5GnWIi3jixQakDbKwQawS1iYw75da72XAb
 D/N3Unz87oREVw5pcnawglHEqJ6qnLRcwa3Ubi/sHaKNFrpXvUOiBnhG+00dod1bFXEu
 4XmIwaxgBHUruklGp7iWbUyOdHrCWBdhPVZXDLC68rm5AACIPULNCdsTNbwTyeDGS459
 c5Fa05OXMKyfXWorcNes/CNvZomGhKPztRXFRStmXD/78yYM31LV3GpxdfImrWtJhAGb
 VKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfZ0J0hOAA9ssEh0m4vkjugDicCJVNwpKRmCQ4HkzMY=;
 b=wCT4FXv9pYZ73XSypyek0E8LsUo5bnN1mvElXxCk3pbhAeDbzxIQfRMXoWrsQf3RlS
 PUdqtE9bYKkiKrDt/muc9SRYFUpj5/nBhC3RimFSOJe42BBOeWY0Sf6xQRKlc78D+CE2
 vyiaRpvTxYR6uN0xH8z3F37RFLigFPQjg61AJtrxDis83MyPRILxbtvfX4S/4SAkG6u8
 ub28riJ1zV0cW/MdWC1LsZXhv+SCfL71exlrlHYPbqJbtNOS5bQ4M2XGhGFeK53So9xc
 v5CW6K7MKtw/3Jxg2KMsWM/OlGfknJWVdhNUXXv7flBrizkBIYCIHUSgwFFQKlzSIsST
 Q4gA==
X-Gm-Message-State: AO0yUKXdXsrs81oWMxeBPJMLFK3og0rfmToTiFX8C598gR5ywslbNULR
 Bl4im3UhBCIcZkoG85FuffthAw==
X-Google-Smtp-Source: AK7set+rTxYplipMgZaz2NHX6aE7WdMJSzBf3yV53WSEOsQ/T7hvFFwvAcz5vDhFOPozFKUJfBERGQ==
X-Received: by 2002:a05:6a21:32a0:b0:cc:4058:82bd with SMTP id
 yt32-20020a056a2132a000b000cc405882bdmr4609647pzb.13.1677227849961; 
 Fri, 24 Feb 2023 00:37:29 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:29 -0800 (PST)
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
Subject: [PATCH V4 7/8] hw/riscv/virt.c: Initialize the ACPI tables
Date: Fri, 24 Feb 2023 14:07:00 +0530
Message-Id: <20230224083701.2657063-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
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

Initialize the ACPI tables if the acpi option is not
disabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bcbacf4e63..126352d480 100644
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
2.34.1


