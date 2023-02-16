Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA9699A5E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:43:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKd-0005NA-Gc; Thu, 16 Feb 2023 11:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKb-0005A8-98
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:01 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKZ-0000Zg-Lx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x4-20020a17090a388400b002349a303ca5so2146753pjb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYrbvdGn2FPVZKLdulVWGubYW/YR7PjC3o7k8Oirtew=;
 b=inx0YTDfIAvXdknXG6+oARbBbrBtCgYVpRJgCexHoJvgdZPefmwmyOXvzpzFUKMNy1
 gru+8JwSzjCDP1Roa+Jh7w5OJ+LzpcmrKGYqKFHPH4Ap/0i+B+ou6qFCc5C6mMPVy4qE
 NYVFgdHidWMZrs6QN2C3jZsYgLW1PFGuz524yVKmEKhjLYvXvRs40r201m5OfmFPe+eP
 sEvLRx68rxDGKB2pAi8zL6dOjG7tKJ18chw/KSKNNkB5FkLtdBr/ZNG68z6q6cRJevTU
 eeCWmMYQF7LeW4v/wVo7vS5v4iCBHFM4hwUtQ7FlJ4EDzWBxmlozp5+x/Y+72N/zx6/a
 O31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYrbvdGn2FPVZKLdulVWGubYW/YR7PjC3o7k8Oirtew=;
 b=6Lp4+TrVHQ8jicVEZxvvtu2luyyfIbv3LLKM1QfTwx3S9KwB0mkV8C9fuzujEq/qEX
 76xNT1k02/RMgeT2EAFK00O8dsaDKFuB95WYnXYP81aoXyIqQFjaWN82DetYspIl+MSg
 xOiRkhnLmyxOgUo13+dw5TTWLrvTMRZD7VfKQr3SwQ4oK5/V3SfhE8xpiYzDqTvxL0Q5
 VIQombvSmfZ9BU54AMlc8XEC+tcUW6lEKm/ItLJSTlspEessNly4/Vs1iQfbe0zRgs65
 WjEl88i/gc8DyjjOGFEXv9WQrtZAzvby0TKyM54PHWYDPBg/NrgEQcuhhPWab7PqVR4s
 a0xQ==
X-Gm-Message-State: AO0yUKXfTXTsMfydAhVVt2U5/VSvYx7zjiJCEM4HQ9sDqQ+FxU2IKbym
 ND5f/KdKW2bhjth4K2oNTBKcKQ==
X-Google-Smtp-Source: AK7set+7jDpfJ2sbSs+br/N+xYJf97fXf69Ek9Ga/eMg8JKdYtUidUyKMG9mennWhGViLPwg8m6zCw==
X-Received: by 2002:a17:90b:3e81:b0:233:ca48:540b with SMTP id
 rj1-20020a17090b3e8100b00233ca48540bmr7981668pjb.3.1676565718039; 
 Thu, 16 Feb 2023 08:41:58 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:57 -0800 (PST)
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
Subject: [PATCH V3 8/8] MAINTAINERS: Add entry for RISC-V ACPI
Date: Thu, 16 Feb 2023 22:11:25 +0530
Message-Id: <20230216164125.1945633-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
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

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry after moving the
ARM ACPI entry under the main ACPI entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 MAINTAINERS | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 847bc7f131..fe97319fc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -997,12 +997,6 @@ S: Maintained
 F: hw/ssi/xlnx-versal-ospi.c
 F: include/hw/ssi/xlnx-versal-ospi.h
 
-ARM ACPI Subsystem
-M: Shannon Zhao <shannon.zhaosl@gmail.com>
-L: qemu-arm@nongnu.org
-S: Maintained
-F: hw/arm/virt-acpi-build.c
-
 STM32F100
 M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
@@ -1911,6 +1905,18 @@ F: hw/acpi/ghes.c
 F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
+ARM ACPI Subsystem
+M: Shannon Zhao <shannon.zhaosl@gmail.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/virt-acpi-build.c
+
+RISC-V ACPI Subsystem
+M: Sunil V L <sunilvl@ventanamicro.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/riscv/virt-acpi-build.c
+
 ppc4xx
 L: qemu-ppc@nongnu.org
 S: Orphan
-- 
2.34.1


