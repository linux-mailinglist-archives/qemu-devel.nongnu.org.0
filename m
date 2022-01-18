Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F384924A7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:21:29 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mYK-00040N-A5
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:21:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mV0-0001UX-V7
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:02 -0500
Received: from [2a00:1450:4864:20::32f] (port=51018
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mUy-00079J-H9
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w26so26878965wmi.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHHhRvqhMoS9M7tdur2lIhRR3Zu8vmsJW9kqVPLlT6A=;
 b=FXmUpipu/oMxuIRHq2zpxk+Qcax3C+g7b9G2hPbzwz2sxYrJc6+4/2E4PwPy5u9NYZ
 OiJHurOIL7RpT5LQTP+uY6HtjEsmrk2ZLWe3cudDcREgh6H+VxDFTtR15j0R3vhXL4UL
 afgLJgBLX1xqp1UuPM8wFsywlL0wupQjnu+NkBNHEZamRMsl/XTNZT7opLWri3Z/dBM8
 r6E8R5duj9ppvObAAfg814sbnGBZOzhCX4qhsIRktNGAeMiROcCDzzDJl4qo+1Rt6Cma
 5ZxWkhG96MohQINBcAhy5wAIukOnTbp2C1fLMGbhjZ03/8sAA1wUJ/Yyv9kS8EvSw6Qd
 LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHHhRvqhMoS9M7tdur2lIhRR3Zu8vmsJW9kqVPLlT6A=;
 b=a+3KXopSxh6eTEX8TpBxIPGaOqg0E26elxLA7WHvhTtJXiCiJJghoTPMbqBp8yZBzH
 sgMKFoYj+JBqZDQo7V7EUuMZYLVbprmkJJN1iL8u6KvlccWgNFdyL8VOjZ3nrEnFKoTt
 2pdAMhkFIberL5po2ysQb3Z6fvwYOMERV0RVH8Bnle4w5IXWbTP6yOL0XXecAg+q5kZF
 NJ6VkD5eeFuLrZlX2IN5VhmtdR2ei9TFA0qRDhL0K+zNnS4kuhcK7sEJkjigT3p8YCC8
 BBgmOiNqww6z8UFUIebd1ijIdjp4qMdJi5QtXiTERd0dvAfAyDt8tHTdCPQnRy/Mt2cI
 9U4g==
X-Gm-Message-State: AOAM533CV9R9b4jGhApJ9F69zALgH/JemLDUexO+D15yhzUacL8diC5X
 dUOPsR1rD0NcZ5U17NfAc9nwyw==
X-Google-Smtp-Source: ABdhPJzLXgsl44NVrT1dThnyrMNF8Z7rqn6cQfuP7opVS6u1j8/vPHwUMJ85BhRJawOR25ULzfMZtQ==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr28963105wme.89.1642504677015; 
 Tue, 18 Jan 2022 03:17:57 -0800 (PST)
Received: from localhost.localdomain ([122.167.36.211])
 by smtp.gmail.com with ESMTPSA id p4sm2156939wmq.40.2022.01.18.03.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:17:56 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v2 0/3] Improve RISC-V spike machine bios support
Date: Tue, 18 Jan 2022 16:47:33 +0530
Message-Id: <20220118111736.454150-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=apatel@ventanamicro.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims at improving RISC-V spike machine BIOS support by allowing
use of binary firmware as bios. Further, this also allows us to totally
remove the ELF bios images shipped with QEMU RISC-V.

These patches can also be found in riscv_spike_imp_v2 branch at:
https://github.com/avpatel/qemu.git

Changes since v1:
 - Use htif_uses_elf_symbols() in htif_mm_init() for PATCH1
 - Added PATCH2 and PATCH3 to remove ELF bios images

Anup Patel (3):
  hw/riscv: spike: Allow using binary firmware as bios
  hw/riscv: Remove macros for ELF BIOS image names
  roms/opensbi: Remove ELF images

 hw/char/riscv_htif.c                          |  33 ++++++++-----
 hw/riscv/spike.c                              |  45 +++++++++++-------
 include/hw/char/riscv_htif.h                  |   5 +-
 include/hw/riscv/boot.h                       |   2 -
 include/hw/riscv/spike.h                      |   1 +
 pc-bios/meson.build                           |   2 -
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 838904 -> 0 bytes
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 934696 -> 0 bytes
 roms/Makefile                                 |   2 -
 9 files changed, 54 insertions(+), 36 deletions(-)
 delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

-- 
2.25.1


