Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27442CC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:53:25 +0200 (CEST)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malFb-0001gn-GW
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDT-0007Mb-E2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDQ-00081P-Lp
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:10 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso5340184pjb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FODvjefSNBFscPUyN2SwQ93usEbfFVf6iJsmSDn2qww=;
 b=qYMEp7glPHMcbH+cO5RN4Y0F1ubmh1CpUZsHgTzt4pqYL/zstydUi7T/baT3cpEszt
 1jrC0kj6sfxWh/4A/KG7220TkamrqVzLiO9RHg+B6yW8Rn/DxBBjgCNfqqVsn0ghegG4
 RDGntfPootgDydYmTRZdjJC3nG2Ov/vpyInBZBD1C3vjVgCxFFR9a5dw4bmpgfx8UZG1
 686AWnzQIGkM8IdeoJ3shjl+9vZH8ChCT7ez3darOx2fnJjLVliLgC2Dop7iH3YNGoIE
 Vgi4hP7QeciirZPHWnJLv7wr+VZvgBpaWvXcNBoL66dSbYrTF+/8aazaEneyrZM0gZZ9
 6iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FODvjefSNBFscPUyN2SwQ93usEbfFVf6iJsmSDn2qww=;
 b=OI8c5O7lyXeA40GI3tDEX4k4+mljxGmdzG1IX8k/vNyGnvNmGZTr8IhYLIuK0+r+wN
 oKrtJ91pCQSwxW/RC9SoaB6p8Or4jHMyxZHgGzEDPE7s5ulxqSXKCLTjE2kpeuapTw1F
 vDw3+C3PClDa43IvjPm0CbiZDHHBp+H76NstP95y2YZ318RLjBcniVlFga/LUfQGSTUo
 OrWHnac/iSUdfu6CDgNeGBAowunPWYag9+JEawcCutSaRjjHO9xe8VfpkY+Ue+O7OWOk
 jJSmHmTtQKwVQu89czESG08WMve9QTwfmWT0fIX+xWtrOr2/c0W8p4FUsPEIykyMbZwo
 WVVg==
X-Gm-Message-State: AOAM532qvZPLjqrc2jyJM//qKOKIdlYQY3xdG7JXPvdbQi7wgdzQ8ZbK
 7HevK0kM2bDZjMmpFEASklh/ikiFwOVcRg==
X-Google-Smtp-Source: ABdhPJwxivyNXff+mz/LqQTmDWekLIx44bHzD9/xljVXfbY3hyx8lx7k5guXNDenBwxXgOrk7K8o4A==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr1718022pjb.172.1634158266397; 
 Wed, 13 Oct 2021 13:51:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] target/riscv: Rationalize XLEN and operand length
Date: Wed, 13 Oct 2021 13:50:51 -0700
Message-Id: <20211013205104.1031679-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.

Changes for v2:
  * Set mxl/sxl/uxl at reset.
  * Set sxl/uxl in write_mstatus.


r~


Richard Henderson (13):
  target/riscv: Move cpu_get_tb_cpu_state out of line
  target/riscv: Create RISCVMXL enumeration
  target/riscv: Split misa.mxl and misa.ext
  target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
  target/riscv: Add MXL/SXL/UXL to TB_FLAGS
  target/riscv: Use REQUIRE_64BIT in amo_check64
  target/riscv: Properly check SEW in amo_op
  target/riscv: Replace is_32bit with get_xl/get_xlen
  target/riscv: Replace DisasContext.w with DisasContext.ol
  target/riscv: Use gen_arith_per_ol for RVM
  target/riscv: Adjust trans_rev8_32 for riscv64
  target/riscv: Use gen_unary_per_ol for RVB
  target/riscv: Use gen_shift*_per_ol for RVB, RVI

 target/riscv/cpu.h                      |  73 +++-------
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 108 +++++++++------
 target/riscv/cpu_helper.c               |  91 ++++++++++++-
 target/riscv/csr.c                      |  71 ++++++----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 170 ++++++++++++++++++------
 target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++++---------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 510 insertions(+), 292 deletions(-)

-- 
2.25.1


