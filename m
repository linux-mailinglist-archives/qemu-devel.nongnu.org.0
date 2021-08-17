Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB33EF4CB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:20:20 +0200 (CEST)
Received: from localhost ([::1]:43444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG6VP-0003TA-6a
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TK-0000mW-KM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TJ-0000yx-27
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so998987pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA6k+Siqe4PTuWQVvM21cqfP5nhWaVKrW++pzPhUcCM=;
 b=h02ApSMEQmxbS+z45oT+HmbF3VSzSB2Nq9yctXPCbFdQaa+Ln1MUnafcvfEBfR3izm
 ikY00kj0oJGC70j8A5FBCBTCq2sKClZb6aU25/cOL8jpGS1IsX/EzU3ovjrI99nW06XJ
 T7AF0d/uW3s9OqqjN8lXwUyL3LdEast0U5WDoCz9FxwUB4jXW3Ga42+QLMztBo40qLOB
 PTOoFf7lgFK6IyE+kReavJiXKYzAY8ommYJq5IKXBTZBPRPKklm51K8AYwaOthNn43rP
 AcTJZx3Hq5lyKjCKqXOp52KGT2gJ9e8p18lJBdCgz0QGP3ULszxccS89LNO9h/F/ILm1
 LuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA6k+Siqe4PTuWQVvM21cqfP5nhWaVKrW++pzPhUcCM=;
 b=aHvPkP+VF+7bXeUrHmcMXm20ewuPobWwPUcJ/5hRZGLuMdQsPHG4zm/n/3d68j8ReK
 PKPjoKMaiU4VxtpGsVEKt6fqyP+z7+7eKEFvRGbG9NJmdRL62AVuUOQzjDQIKNH83jYy
 6rKu+ey55akePdtFHMnLzRrq/1Fejyf5Tu2yX9RQ5KlZuz4TROpaYPS522q/Yk91+j7j
 SHOGkEBsW5fWv8qvCtWZVgz26sT+raSrc52HDEmagOWFiBkFgL6tlMMoysTH19QSJFyJ
 wQRNLeNtdpkGWRd8RQ1XTSs7cwBldITPf0A58j6gOw9y0m2WfUVcb4v0H+DUWEixIpLo
 3mzA==
X-Gm-Message-State: AOAM530oQntjYe9lHtmk0Nbmu1E+v3Lc0DEJRTzI7q9T50WD2/E+sd8c
 XAcq2zw+VMqgESABR9bPB/RoguLDBLdC7g==
X-Google-Smtp-Source: ABdhPJwRVYbyk7W5eQucFiaQFizY82garSNgGnXbTFv+QNarfg0UDtD6ChMZmVi7ag0WbF+33RZhEw==
X-Received: by 2002:a17:90b:3802:: with SMTP id
 mq2mr5605671pjb.19.1629235087327; 
 Tue, 17 Aug 2021 14:18:07 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/21] target/riscv: Use tcg_constant_*
Date: Tue, 17 Aug 2021 11:17:42 -1000
Message-Id: <20210817211803.283639-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.

Reorg handling of $zero, with different accessors for
source and destination.

Reorg handling of csrs, passing the actual write_mask
instead of a regno.

Use more helpers for RVH expansion.

Changes for v2:
  * Retain the requirement to call gen_set_gpr.

  * Add DisasExtend as an argument to get_gpr, and ctx->w as a member
    of DisasContext.  This should help in implementing UXL, where we
    should be able to set ctx->w for all insns, but there is certainly
    more required for that.

    Because of this, I've dropped most of the r-b from v1.


r~


Richard Henderson (21):
  target/riscv: Use tcg_constant_*
  target/riscv: Clean up division helpers
  target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
  target/riscv: Introduce DisasExtend and new helpers
  target/riscv: Add DisasExtend to gen_arith*
  target/riscv: Remove gen_arith_div*
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Move gen_* helpers for RVM
  target/riscv: Move gen_* helpers for RVB
  target/riscv: Add DisasExtend to gen_unary
  target/riscv: Use DisasExtend in shift operations
  target/riscv: Add gen_greviw
  target/riscv: Use get_gpr in branches
  target/riscv: Use {get,dest}_gpr for integer load/store
  target/riscv: Reorg csr instructions
  target/riscv: Use {get,dest}_gpr for RVA
  target/riscv: Use gen_shift_imm_fn for slli_uw
  target/riscv: Use {get,dest}_gpr for RVF
  target/riscv: Use {get,dest}_gpr for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use {get,dest}_gpr for RVV

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 702 +++++-------------------
 target/riscv/insn_trans/trans_rva.c.inc |  51 +-
 target/riscv/insn_trans/trans_rvb.c.inc | 382 ++++++++++---
 target/riscv/insn_trans/trans_rvd.c.inc | 127 ++---
 target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
 target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
 target/riscv/insn_trans/trans_rvi.c.inc | 360 ++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 176 ++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
 12 files changed, 1058 insertions(+), 1331 deletions(-)

-- 
2.25.1


