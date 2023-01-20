Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB6675529
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:01:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIr0J-0007NK-VE; Fri, 20 Jan 2023 08:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr06-0007L8-7O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:11 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr03-0006FE-DT
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d9so5232105pll.9
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a3DHMQ6hzTLjlt39P1qRoArzmXvZXOpc2fIYrcZ1leU=;
 b=ecJSeHZTsl0ncMlkCpTbc69ElJ4W75LR+gU2idRc42qZlVWFbS9y9AkTm0kURJNrRo
 aERj1SZ0O//FzSU5M8k1LnwQK7j/UH0ajqe2Y1ZvdB5tyv8uYS5mJgmg8SwBoOs91ohH
 0ro3modS1X17QGD//5H10pWDRnRRmetmjYA5z8/o1YTVSHHM+njQV3w1+Q5ew8BgPZaD
 0+PYtcbxWI49ZbNe1OWa7j3lmpz8FJ8ufEMrB1dqjI8smDxjiTieATsgePlxv7wFC5sU
 YQ6c3VcLpd6eOqRYvYHZUQjBAJXmj4XgadNfrBOuA0SGoURCbn2vrVtEBzsE6uieqTP2
 FLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a3DHMQ6hzTLjlt39P1qRoArzmXvZXOpc2fIYrcZ1leU=;
 b=eOMGOKFpb3Us8bJ0FgE1iOExp/IUpx3cIKPlzLhjMLR6uuqN90JZLQ8pbWqE2EIsLe
 81t9HpRxptbh/pkVr8/4fFOyZYimV+zPnSx9Z/q0ER4L35U0DFE8L5TFbmO30QSfZRGP
 QunxGskSvZ+tj4sXyCowE1OxywyAUs6hxAipTS5ZPnvCuCap37vczxnD+5AmZm4dCyX/
 dOHqUHupuOg0JkBgV3AZbmJNhS7FKzp9HHtbDeW9o2loYZeRDWpNkOd3zlc7SILDYcm4
 jCNyYGaYP5WoHMBdI6IHKNbItIeO4L3VCaJ8Xkg7I7+pBYcYG1G+NRYab4jcIOjorSvz
 NMDQ==
X-Gm-Message-State: AFqh2kqSoo9F+iB6fgOjaINKsQwOQE0eCS7zx/9x8dOMTiOS24KWfUh/
 +aFdmeSWX296WuKWzNmOZh07MA==
X-Google-Smtp-Source: AMrXdXvlTy8T+lSISiRXS+xvGooOLpQjzzuim2By6MhwcbbjhTYU9tryrrdfYRtT2jJkOXd5D+vZ3Q==
X-Received: by 2002:a17:903:32c8:b0:194:de51:9af with SMTP id
 i8-20020a17090332c800b00194de5109afmr4206405plr.22.1674219604474; 
 Fri, 20 Jan 2023 05:00:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm7279610plf.71.2023.01.20.05.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:00:03 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/4] Nested virtualization fixes for QEMU
Date: Fri, 20 Jan 2023 18:29:46 +0530
Message-Id: <20230120125950.2246378-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

This series mainly includes fixes discovered while developing nested
virtualization running on QEMU.

These patches can also be found in the riscv_nested_fixes_v3 branch at:
https://github.com/avpatel/qemu.git

Changes since v2:
 - Dropped PATCH1 since it is already merged
 - Rebased on latest riscv-to-apply.next branch of Alistair

Changes since v1:
 - Added Alistair's Reviewed-by tags to appropriate patches
 - Added detailed comment block in PATCH4

Anup Patel (4):
  target/riscv: Update VS timer whenever htimedelta changes
  target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
  target/riscv: No need to re-start QEMU timer when timecmp ==
    UINT64_MAX
  target/riscv: Ensure opcode is saved for all relevant instructions

 target/riscv/cpu_helper.c                   |  2 --
 target/riscv/csr.c                          | 16 +++++++++
 target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
 target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
 10 files changed, 69 insertions(+), 9 deletions(-)

-- 
2.34.1


