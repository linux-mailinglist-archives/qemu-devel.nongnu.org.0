Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9866874B2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRaq-0004jZ-GZ; Wed, 01 Feb 2023 23:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRan-0004g3-GU
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:53:01 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRam-0001Em-4S
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:53:01 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 ha3-20020a17090af3c300b00230222051a6so712015pjb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrl2m89lEAGIfGV2TcX0lvKgQ/GFCS1PkOc8cAsKOcc=;
 b=ENJfSqyiOs/xHzNdrpDyYW9VuaECJ7Uja1X/i4u3UmwN6392J4ofxvJGBK3Q2Bc1TQ
 xAVpMI0qFu6HeVbFNSSiGgJ/JuvbsQ16Q8+p9/h0E3AsgdQX2pk7RI++y6oYG5gi46XK
 OV2NVEJckBOl70YtsBLV9Qeyi20tYlHR43KXIT05rydsFe7s3XYBlCW5B7NV2PTNVIP8
 rnKXFQCsH6rRI6WWN5oa7hHrUfDuH+hm4ISz10KJDm9hnao5SZPzK97tEbraeewmi2eP
 xdAHhWi3mK7DO5WVxKHklu7jKfJS0pnv0IiNvdBT7QRQRIPYhaoF4bj2E7Xtyu8qcVri
 ElsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrl2m89lEAGIfGV2TcX0lvKgQ/GFCS1PkOc8cAsKOcc=;
 b=8DHIK36pf7WjjvDCkwlTPkPE97F/NE3lphv9ffOqDe4nOoNp+j+ZnKJ3guTxC71/dp
 pbC1WCQ8h6p15xoY0fr808ch0wYig6zbV8NsGtuolugWswfJhQQd3zpPiWWzmilBQzL0
 04a27EsN2rFmEkyMyS5wq2WZuHsFbheX657wLMH5znTrqSRuFhG8SgYSctGlmJHnCwe5
 ZV/GviT8eheWd0WqqubGyK3Hu0giqCuRR2uYaWyOduBcCWVBhrt0xEhsnopU6pECOfME
 /DP70X6SCjcZEYFK6e5fgFWAVTOTk10oOBj3hfFSMTwSIAnlIWNKRyx/nC4mSlheDcHC
 iLzg==
X-Gm-Message-State: AO0yUKWMJdDb7eI5qnR/gcHZblQzpjnWUbSQ0zTNWC8W2E8xx7iqp7MQ
 IbtqoMBHx+NEx8Un0Iv7s9fOmQ==
X-Google-Smtp-Source: AK7set/SKWOrh0KM5OPBb1hZHg3TX3DeVNCwuDrZZWJzw5ilP0TO+0tBrPd0Wn0mmbumPwt4BkTUfw==
X-Received: by 2002:a17:902:e192:b0:196:4e0d:7eb5 with SMTP id
 y18-20020a170902e19200b001964e0d7eb5mr4038272pla.35.1675313578860; 
 Wed, 01 Feb 2023 20:52:58 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:58 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Date: Thu,  2 Feb 2023 10:22:23 +0530
Message-Id: <20230202045223.2594627-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
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

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..23fcaaf54a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -995,6 +995,12 @@ L: qemu-arm@nongnu.org
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
2.38.0


