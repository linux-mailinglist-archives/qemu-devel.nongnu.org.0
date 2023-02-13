Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36D694855
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa1H-0006xm-AB; Mon, 13 Feb 2023 09:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa1A-0006bf-U5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa18-0005W6-90
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id m2so13704311plg.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGmMRSpWYKk+0FgEIzjc2vNeSjRQeNBhuoCePce7D9U=;
 b=NfEuSaOBRNvI+pFdEP6tJRyPCwkboPixT9HOGFVCiQnhI+mLDoIXQJ0KDRXeeq9QbM
 QqjwHY8hdfDiqRO98fufqeV7WnW0vX6hcYbCVBniKnsGlQ9MupD/SvlcEyUM1EQF1vAL
 EBQRh+TkD6V2aHsxtQBWKGvtnxX3BpNGRljYH0vSiSSZEOwNQElYmiJ3a7XoC06jqxQk
 GRMMngt7MKWmmCnmUA/0u2KxoJCwOz0b+KOHTF8N0pNH2EAsl2MvbRA3ecYkKftTXmw9
 mL2iBMSnNHZD/JPLKsztUrwZ7RciHmOIl98InIGMNhgoCeCLW9+dPZS/+pyL4JkPpQsJ
 UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGmMRSpWYKk+0FgEIzjc2vNeSjRQeNBhuoCePce7D9U=;
 b=LEQF/z8pTSuN+IWpw9+cuXqovr8eyAD9U4q0cLva0vr6moV0MXIIzoNEnct4gKkrrK
 5351rLpnbXMuSnjnSL7ES2ksMz2Zns//PHZtslL8r+jpu88U/DMIU6q2fevJkdObxOg/
 S7Gabsqu4ZO6qeyf/oH9vmXUjX+L0NnlvLcgV+aDp45SB7EGGE2B69FxxTfm8hiiPAqu
 4qxm+n11PZiwFaSpTeCgXHxezjxq9hUVYaIF6XMJHduIQg+vaLQ8VhylcVZ+OHwgh/or
 r+6/1n8pFv/x+BmdBnLaVhKS70MsZyV6doGeFe5/OXdXKDpkmkDIjrDPF1mqaAen4SaC
 Dexw==
X-Gm-Message-State: AO0yUKW+MNNlf0Fnn4H6mF5naBKgszcPXJMTJZmBZimkUNiUYFqQ65NS
 Gsj21vJ/0M3yfB1O+TQ0xNqN/5E3H+bTcS7b
X-Google-Smtp-Source: AK7set/ief8OMQtIH8lSuS7i2PN/jG71h15gobFZJYOWsMfeKG4R6ZEOXvHxoeLE0qrR7F2G7dRJCg==
X-Received: by 2002:a05:6a20:158f:b0:be:9fff:48d8 with SMTP id
 h15-20020a056a20158f00b000be9fff48d8mr28502482pzj.49.1676299276813; 
 Mon, 13 Feb 2023 06:41:16 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:16 -0800 (PST)
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
Subject: [PATCH V2 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Date: Mon, 13 Feb 2023 20:10:38 +0530
Message-Id: <20230213144038.2547584-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
virt-acpi-build.c. Add the maintainer entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 847bc7f131..7fb0f1052d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1003,6 +1003,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt-acpi-build.c
 
+RISC-V ACPI Subsystem
+M: Sunil V L <sunilvl@ventanamicro.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/riscv/virt-acpi-build.c
+
 STM32F100
 M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
-- 
2.34.1


