Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E506A1812
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTaD-0006zy-5D; Fri, 24 Feb 2023 03:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTaB-0006z0-EN
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:35 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa9-0001BZ-Ue
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:35 -0500
Received: by mail-pg1-x530.google.com with SMTP id p6so7140997pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ml2rM4dqXo0hSiYRMEpZG/lv3Bie4vk07D+iu+suuo=;
 b=A6MyS6sUIVztOCtk1OssjeyMAEAQgaYOecOIeILg7q4k9J5B5n0J1F7n9v3TQRoXLi
 iK/z5mTXJ5S0xNCf+l4orJRkQMXPSZvwWZedpXG2xIA5lywDgXpLu2dOc1suavIOZzd0
 XK2vxSnLglDLU2TaOICH3UNuKXoboz6bIiByo+sWujHA/fjpBVPpK6bsHDl2hyYYHWpM
 +qhMLpqgnBknRVc1cPgtHMw/wJLYAgrbCHKME7HuOLPh7mV0Tu9uwEmzEBsYzEsKN9tW
 iEC7oSXoY7HgWg2jeFB2P1XFBXaM1EyBRs7+iRGNbbCqWcZ5KvmmnLC9gVEkAWR5JtYY
 y4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ml2rM4dqXo0hSiYRMEpZG/lv3Bie4vk07D+iu+suuo=;
 b=VYQeCGzq8RE4e9Bwop2Zp2plXmFMw9a2y+r6LF8RCQvYj0rPyZvP1eP1P4sGg04Vve
 aUEF1/gruVo0Of10CLFjBquAnG86JZfAyEkGtuP6MqRmvuoXv/mKc8fOjk7E7Kc/c0Fc
 nraXen4gB8eMlOc3KNMmM0d6TBu+F0NXTaiekUfVBU7FH3whvoy3YGwQIYGqHmM+M7/R
 XsWH1M/Rr4u2Vc4g9yIEkqH1FUqscHDX5amFUfABTnEipSWMoCDkXY/osU3L021Avmmv
 1/G/jigw0wy4YA6gvcoEyMoHEmOuh8FAY+u0nFHGcjeEAVbw3eQcEPPJaipoq5yz7RIe
 69uA==
X-Gm-Message-State: AO0yUKV5UUSPsfYOdN8ISijBV3V57+ztJxwISQfdLMgo8rj11dpqCXIK
 sm5b7LuhgzRSknzSwTJ1FYhIow==
X-Google-Smtp-Source: AK7set+FdO/v4nuomgvGEXlnLsWmgixmGRUt+lHujVhGr3EzhR4J6g19O7g55LMLg1qHcY1q25Yn4A==
X-Received: by 2002:aa7:98da:0:b0:5de:a3dd:bc78 with SMTP id
 e26-20020aa798da000000b005dea3ddbc78mr3538500pfm.12.1677227853242; 
 Fri, 24 Feb 2023 00:37:33 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:33 -0800 (PST)
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
Subject: [PATCH V4 8/8] MAINTAINERS: Add entry for RISC-V ACPI
Date: Fri, 24 Feb 2023 14:07:01 +0530
Message-Id: <20230224083701.2657063-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
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
index 9adb628627..7a47c2c724 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -994,12 +994,6 @@ S: Maintained
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
@@ -1907,6 +1901,18 @@ F: hw/acpi/ghes.c
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


