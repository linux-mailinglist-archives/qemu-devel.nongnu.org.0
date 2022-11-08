Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF062119D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOB1-0006QG-Ny; Tue, 08 Nov 2022 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOAw-0006P6-K2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:57:58 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOAu-0005Ye-SD
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:57:58 -0500
Received: by mail-oi1-x235.google.com with SMTP id n83so15393779oif.11
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 04:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZJuefdkHFMfM9ZKDCdjlLp3sNHSVdT0o3wtmYfN8HM=;
 b=e5T5igTGU2gDQreoUAMqoVeK2RbDNj+dSlMTpZ3r0DBERY7BOfHpHwLiHKnAk5lzaB
 QMHYJtLHlp+JyIBPG800TNtfTVy3huZuVpHL3mOZcANyzqKyHrqJJbl8xVA8dVnFFDS4
 SE2BQFCoBNgYYtT8C/0e2OHRrnTpr0z2FRBvsW1APfmP+mXrdpS+CDWDzHldu3agebFR
 gJ271P1Q2O0ZTX/bIpHVuPCzgHdhmp3OEJ18/adPyAhWW7EJpV1PVEFId4YfYfm6vM7D
 mE4u+zCBQPRc9QDlLfpC/cT6c9Z1sY4G1rXfRxPEpYLDZ3Tk2MLZ//Y9UTy0+xmdHdKm
 FTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ZJuefdkHFMfM9ZKDCdjlLp3sNHSVdT0o3wtmYfN8HM=;
 b=g5h9DVTsfsI3Rk0dEydO1WKDOM84cqrqoi0L3KQEF/zEltngFzLEioOb44Pl9qUSBp
 1EMaL54+sfCdSwa2qVtLTmGS3y2sdv/9O1hB1Lqz37QIlSL1MLuL11Zp7K8gqiSBo7S+
 pWG9IjLhGm9h+P6QNCOqQ4a52djK18/QUkQxFKyvHoFhF7xJ/CilMNPhrRfVVMWc1+BD
 Lfm/hl/xWZ39keEs7piKHrexxp3vuZd9umua8MKJM7FSMxgKZgVmFdkXDS2GvaUBphS6
 Z+LuBBHFGzclBOoe9GDGHrjhhE+rDGv+OScKfpQy6+jxUXeAtwQ2RRRBxAyISRJfV4/E
 vN5A==
X-Gm-Message-State: ANoB5pkOtNi8rdcjJ4Y1wE/4uFQIMWFVyg3d/xFqXbYa4oaG1y/8Y2gs
 PVd6oTFnUwdfFERaabbe2XgDhw==
X-Google-Smtp-Source: AA0mqf6Ef1jDM0P8KYvJBUiwh40PrXl6YNHhLeyPBEq9C9fLUSP8S6zHc0DqPhvzprpIBkC2PoPiWg==
X-Received: by 2002:a05:6808:1691:b0:35a:8d30:8218 with SMTP id
 bb17-20020a056808169100b0035a8d308218mr4993200oib.2.1667912275204; 
 Tue, 08 Nov 2022 04:57:55 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:57:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/5] Nested virtualization fixes for QEMU
Date: Tue,  8 Nov 2022 18:26:58 +0530
Message-Id: <20221108125703.1463577-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=apatel@ventanamicro.com; helo=mail-oi1-x235.google.com
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

This series mainly includes fixes discovered while developing nested
virtualization running on QEMU.

These patches can also be found in the riscv_nested_fixes_v2 branch at:
https://github.com/avpatel/qemu.git

Changes since v1:
 - Added Alistair's Reviewed-by tags to appropriate patches
 - Added detailed comment block in PATCH4

Anup Patel (5):
  target/riscv: Typo fix in sstc() predicate
  target/riscv: Update VS timer whenever htimedelta changes
  target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
  target/riscv: No need to re-start QEMU timer when timecmp ==
    UINT64_MAX
  target/riscv: Ensure opcode is saved for all relevant instructions

 target/riscv/cpu_helper.c                   |  2 --
 target/riscv/csr.c                          | 18 ++++++++++-
 target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
 target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
 10 files changed, 70 insertions(+), 10 deletions(-)

-- 
2.34.1


