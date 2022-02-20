Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E924BCD67
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 09:59:52 +0100 (CET)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLi4N-0007QY-0d
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 03:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi0f-0004vO-4J
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 03:56:01 -0500
Received: from [2607:f8b0:4864:20::529] (port=40627
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nLi0c-0002P2-8I
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 03:56:00 -0500
Received: by mail-pg1-x529.google.com with SMTP id w37so5265557pga.7
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0xu7VwLHGvAVYIIcR2PYfMgf5aBKKE8vEoHO22TGAQ=;
 b=meyel16VCPfldq8kXz0Tk81JOy2ZIX8NSoE3WkEZy7aTw4HDqpfYoXmv8Na+Dsi6w+
 1tTLxHBg5+CAI5TSM56aS2dCLCy+D5o0106gbV0UWY6SUBR6Qskq6tBc+GFwO1319EcO
 lnZULrYmpKc/Ucpig+K5P5uOILP4QsXUM2KRePmKRna2ZR8rO2YiqdiWqi0dR/E+VyrP
 RFTSCPLN+nYKafd8DB7l4lXn8j5MVnhHg/6DPPGNtHo8svQmu6UTMtkN759fcKzZ5xGu
 kFK3NzPDA3WYajKtzzpoUnDLAaCD5xYxoSSd0on3HS62EhXFbViwDi3cK2vGYhbrSkgv
 ySpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0xu7VwLHGvAVYIIcR2PYfMgf5aBKKE8vEoHO22TGAQ=;
 b=kh+nYNm8NBi5ToIE+nvrOY2hG8wM6zyxYBmQvG0aSnJbamMRP1ZdoKzk+WFvOUf8GV
 lqCEkBTTZkw4EoMOLo2ujEB4WSNXa5YU3HNwcBRXv5Xk7jw9uWu/nRFvDlech9TrsCJU
 82Me5QaeK+uzgL+K+QX/u9F4WwpxVJ7E0Xql/JnN0lUGnkUtDSRrsiN9VO3vUvNuNb/T
 su9P9Hh56klouy5FUOlWULyuPoiu/7T+V3vkxj8TEA9+XYf3nIRPurpOZm1W86keAgnU
 UUQExjJ3+5eJcDc+sCYyXTjdlrpIXbPYhJcD+KYjTIaRWH9QzJjOLgc5PAWhpN5szrmx
 HQqA==
X-Gm-Message-State: AOAM532KpW+cT9/DA63z3Sqm8pO8lud+KKtAEeN14lLkbzj02hTCdJXv
 qDnu7mRn1TVUE/sn2Sr55kbWUA==
X-Google-Smtp-Source: ABdhPJwRllbLtyxxv5Yf67wS3/DqWH0yVKsdRu2nTbbOO0KuzDQoUFvJ2BqXbreJ8F+agPXyAkrPOA==
X-Received: by 2002:a63:2786:0:b0:365:8a2d:327b with SMTP id
 n128-20020a632786000000b003658a2d327bmr12152138pgn.16.1645347353878; 
 Sun, 20 Feb 2022 00:55:53 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id q13sm9317220pfl.210.2022.02.20.00.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 00:55:52 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v10 0/5] QEMU RISC-V AIA support
Date: Sun, 20 Feb 2022 14:25:21 +0530
Message-Id: <20220220085526.808674-1-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf

This series adds RISC-V AIA support in QEMU which includes emulating all
AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
not implemented because we don't have any local interrupt greater than 12.

To enable AIA in QEMU, use one of the following:
1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
   in the QEMU command-line
2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
   in the QEMU command-line
3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
   machine parameter in the QEMU command-line
4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
   "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
   command-line

To test series, we require Linux with AIA support which can be found in:
riscv_aia_v1 branch at https://github.com/avpatel/linux.git

This series can be found riscv_aia_v10 branch at:
https://github.com/avpatel/qemu.git

Changes since v9:
 - Rebased on latest riscv-to-apply.next branch of Alistair's repo
 - Removed first 18 PATCHs since these are already merged
 - Fixed 32-bit system compile error in PATCH3

Changes since v8:
 - Use error_setg() in riscv_imsic_realize() added by PATCH20

Changes since v7:
 - Rebased on latest riscv-to-apply.next branch of Alistair's repo
 - Improved default priority assignment in PATCH9

Changes since v6:
 - Fixed priority comparison in riscv_cpu_pending_to_irq() of PATCH9
 - Fixed typos in comments added by PATCH11
 - Added "pend = true;" for CSR_MSETEIPNUM case of rmw_xsetclreinum()
   in PATCH15
 - Handle ithreshold == 0 case in riscv_aplic_idc_topi() of PATCH18
 - Allow setting pending bit for Level0 or Level1 interrupts in
   riscv_aplic_set_pending() of PATCH18
 - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of PATCH18
 - For APLIC direct mode, set target.iprio to 1 when zero is writtern
   in PATCH18
 - Handle eithreshold == 0 case in riscv_imsic_topei() of PATCH20

Changes since v5:
 - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
 - Fixed typo in PATCH16

Changes since v4:
 - Changed IRQ_LOCAL_MAX to 16 in PATCH2
 - Fixed typo in PATCH10
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH11
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH14
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH15
 - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in PATCH20
 - Retrict maximum IMSIC guest files per-HART of virt machine to 7 in
   PATCH21.
 - Added separate PATCH23 to increase maximum number of allowed CPUs
   for virt machine

Changes since v3:
 - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
   DT properties because "aplic" and "imsic" are not valid vendor names
   required by Linux DT schema checker.

Changes since v2:
 - Update PATCH4 to check and inject interrupt after V=1 when
   transitioning from V=0 to V=1

Changes since v1:
 - Revamped whole series and created more granular patches
 - Added HGEIE and HGEIP CSR emulation for H-extension
 - Added APLIC emulation
 - Added IMSIC emulation

Anup Patel (5):
  hw/riscv: virt: Add optional AIA APLIC support to virt machine
  hw/intc: Add RISC-V AIA IMSIC device emulation
  hw/riscv: virt: Add optional AIA IMSIC support to virt machine
  docs/system: riscv: Document AIA options for virt machine
  hw/riscv: virt: Increase maximum number of allowed CPUs

 docs/system/riscv/virt.rst    |  16 +
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 hw/intc/riscv_imsic.c         | 448 ++++++++++++++++++++++
 hw/riscv/Kconfig              |   2 +
 hw/riscv/virt.c               | 698 ++++++++++++++++++++++++++++------
 include/hw/intc/riscv_imsic.h |  68 ++++
 include/hw/riscv/virt.h       |  41 +-
 8 files changed, 1156 insertions(+), 121 deletions(-)
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1


