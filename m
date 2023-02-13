Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675E069484F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa1F-0006iN-Rg; Mon, 13 Feb 2023 09:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0z-0006NT-E7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:09 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0x-0005Pt-Tj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id v23so13717454plo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgzlygJJuvY6dcow83KRw6ped9RQQR2f9ScRzTB5pLI=;
 b=TESWMqTtmWIBuD5doSsdP0OVG1VEj4lTMbyDmoQaAt+xGqwgfCugMKL0j6x+AG79Zv
 gacwIy5my4P7/rhrG4iiAYUVoesqzbtuFAtSAumkep36zvrolrsdEPuPp9CdW35mtnz3
 YCSm6XEK87LxHi+Pe1clirfodxLcyPOk02lgR+rdgHnVGPPRdjmRA/P5doJp5kKY4aAt
 m3tCaoINp1TPUdFh09spbUOTW3WL//jE3zUeZaaHW5Dceitsomt6CNmT5LKPb2LcHOhR
 jtMFoDYYSjP89qjNwz+MYyoCg77Pqu60BGffgzUuol0PuTSxMRhGFUkzZi+hCtXL8URo
 7YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgzlygJJuvY6dcow83KRw6ped9RQQR2f9ScRzTB5pLI=;
 b=UeDgUw9wjLk0iJ1gGk479YAcIxQxexpsc6lzNcPgccbfz9pkE78ERuChdXRqPO1cNp
 7G77Onr9QeGHxaexdiViMFWkH3zcatx0WRYvcSINxMTaR512SClOrn/KhlwYKDmEz3WX
 pOr0Fh47zom8Vh1ETt+v/vKhgmk9FMQnSYTHjf+5XDlkxxJkRNeC/PzgxbIkhPJ72kNV
 VGPO4OcWBxLNag914Q6f+2iD//KU7iztaygtGNnScMSIbTzF2hTat469v4YRruJJ4dLs
 a5ge/53bC6o9llh3OIrNnUqBjRq/ONPkJ7CPRy6X18xes/46PGbmUrmUnJDdm0JnDjAV
 4XRQ==
X-Gm-Message-State: AO0yUKV/MYmmrdEaSgmjPvGx3P3zHWiKV+tIwKFJrsfnNE+GJSOlyCUN
 1mJoVLAOVISN77czDYwcvYd8Pg==
X-Google-Smtp-Source: AK7set/C5vjJgsDoml0IXhtFoy1ylq5WSOdPSbfDkzx9WvRqCvG/odsH12B80XvPl8hezDYSZnMnWg==
X-Received: by 2002:a17:90b:4f90:b0:234:3d3:51b6 with SMTP id
 qe16-20020a17090b4f9000b0023403d351b6mr2963098pjb.23.1676299267282; 
 Mon, 13 Feb 2023 06:41:07 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:07 -0800 (PST)
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
Subject: [PATCH V2 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
Date: Mon, 13 Feb 2023 20:10:35 +0530
Message-Id: <20230213144038.2547584-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x634.google.com
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

ACPI functions are defined in new file virt-acpi-build.c. Enable
it to be built as part of virt machine if CONFIG_ACPI is set.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57ea..2f7ee81be3 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.34.1


