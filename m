Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F624259DB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:49:52 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXWg-0006dG-OZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUN-0003xf-HG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUL-0006no-PC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:27 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g2so5961478pfc.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coQUhGH9KXdwtpAnvMUg39Xtlfm35AEkrkZTiUd9UEw=;
 b=h1d+btJpVqmdUqYWAqb1kzvpWWqePO7Guj6URqzjHXTkB6jVBqjys1zRZ7soBRqjuz
 T4ZVU2l6snFk92GQxybk8ckAnYruKV63x0soVeKFSg20g3cxaPIr4PCkrniijsvxDcsj
 mkcMxLwvgDVDeePRet0X37cJ5S4l0FieiWrg+GWBTetQLaEHdLvDuzG8Xj3gMSVrQSnF
 00qZRTihJRhHkCfMxpFY0jjM1KsEiCPtYkgqmUkDx801yQGI9jqPbLZSjUJ08pJbKnag
 DV4Bvyi7HqlZ6Fitl8FbwCV5neH7ur7FY5y/gdB0ei7e3ex0DsGAt2cn1HgF/apsEhBr
 Omrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coQUhGH9KXdwtpAnvMUg39Xtlfm35AEkrkZTiUd9UEw=;
 b=Hrx9DQOKimgAdPU4Z9EM2HkW+uXrGRu/J37I5KdWxhWHYrsgthM2NSi2ZcR9/shen8
 V3s8BZaFy9yNiigXpDx4q0Fv3hccC+La/bFVYoGylk1kCtRc01xsI3e/oapwD+qO+aA8
 1Ma/Y6iXv0tEvKuxpiq3AP2nju79xP/Qpva3GXU2PPE0b9YeXNPq3iOsiu6J9RcYNYYG
 FC3/hvpP2pF9MLbwiqEPCaxks46gA5ytW8tH7YJJnzgXIUyEhgeWU3d/iGPbM6wOrwXD
 uAbojrRYurBXy5IMkENw9+H+vpVVh+4ppGwNCwtpM6rAofZzBJHVtDKSm2Tenp+Cg6gy
 NwyA==
X-Gm-Message-State: AOAM531Dv71pObhy4NqtOREqjQBcglxs7CD8E4GFX1pqoVix/yKBQZbF
 OrBnPFFU6/ndmkbq90XbzIcn8r3TWrKsig==
X-Google-Smtp-Source: ABdhPJziLVNRyyF5Kn8fKgrJ7WYwITpC7iGH8V8QvKaqp5/QAMrGtWpqPYXFgD9kEk8KX9GxI/3GiQ==
X-Received: by 2002:aa7:82d0:0:b0:413:5e93:2f7a with SMTP id
 f16-20020aa782d0000000b004135e932f7amr5693123pfn.16.1633628843962; 
 Thu, 07 Oct 2021 10:47:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/13] target/riscv: Rationalize XLEN and operand length
Date: Thu,  7 Oct 2021 10:47:09 -0700
Message-Id: <20211007174722.929993-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.

On of the things that struck me while reading the RV128 patches
is the proliferation of riscv_cpu_is_<size>bits functions.  These
should be all combined into a single function returning an enum.

Further, that the current set of tests for misa.mxl is frought
with peril, because the location of the field within misa varies,
and that the RV128 patch set gets some of it wrong.  It is much
easier to split out that field for use within QEMU, and only
reassemble the full MISA csr upon read.

There are a few changes at the end for pointing the correct
direction for how it might be best to extend expanders for
different operand lengths.  I believe the form used in RV128,

static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
                             void (*fn32)(TCGv, TCGv, target_long),
                             void (*fn64)(TCGv, TCGv, target_long),
                             void (*fn128)(TCGv, TCGv, TCGv, TCGv, target_long))

is incorrect, because it assumes that is easy to select the
fn32 and fn64 functions.  But so long as TARGET_RISCV32 is
still around, and target_long may be 32, that is not the case.
Instead, pass f_tl and f_32, where f_32 will only ever be used
when sizeof(target_ulong) > 4.


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
 target/riscv/cpu.c                      |  99 ++++++++------
 target/riscv/cpu_helper.c               |  91 ++++++++++++-
 target/riscv/csr.c                      |  68 ++++++----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 170 ++++++++++++++++++------
 target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++++---------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 498 insertions(+), 292 deletions(-)

-- 
2.25.1


