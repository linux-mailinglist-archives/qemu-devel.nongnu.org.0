Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558743C1E71
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:32:27 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iBe-0003Ok-44
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-00069o-R9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5b-0001OX-SV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id 21so7597955pfp.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/hU2uapDI+t0AiME6/idPJJwaWzQYUK8p3YV8Vnf0A=;
 b=pgeFHwzMQSByCKFQWRoBHyZ2kJuQ7l523s5pYs1hpRcPfFzSKAvgRQbrvN2FJmofVj
 OTtnck7zw+S10VI6w9p1qYDXFKPawWBffMB5do45+tIKV5bxAOwxg0Dmngch1tY2HmXr
 /y2v6yJ/9gt4aGPPD2xXMNJKm62/6GjwD96m5OoNquUehS8e8C6LOMEy58b+UCgBRFK3
 0/yvWCoJKheTL4gK3EvFM8SgE8Ej1sEJSZvjup+oKECQDgGZ/WGOF+0j2mF4eJqB7C4P
 5CMQHRo6UYvOLm24WNVB/Y+dmxYvQ3zrMPbc8KErLOwf6eMpyEFwJbndvGjDdKMo+YNz
 oKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/hU2uapDI+t0AiME6/idPJJwaWzQYUK8p3YV8Vnf0A=;
 b=MDaQVANKI2NM73sPE3HV4JJSONIMmT+38T0unLUXejfg2EsgvqvPTss0+E9h0ka9Ff
 e3vOkdI5QMeah4fSxAiu3vWmEunF/MsN5D3CbbtoFjTzFnYW8W+C1D2dPkBiucSbXYXe
 uJtphG9ERtPL2mgH9v3lfjLCKzaIzgODEPdEH2UtuLyXnEhEnC4cT+PJ7qZ9w4cAd+3L
 ABeM7zP3OHDXEfYjW+soe4EvFglncQS2qD+gXXh64Y9JI0Mron902jseiKz1WgbH9dfG
 ygIJ2xhp8KTz2laNpZFlk0EZ9JzxjJnATih9p7tYJpoVUi3LOPqCxPbbUmOLrzyN30ap
 S7Kw==
X-Gm-Message-State: AOAM533PfqT3Xd/Oe4DEQQ8dkJZ4drkVAni+bPGl+TsRQdW1PPM4KzfL
 iWI1/2hmjFps9NUYimRh0vvA8AJSHZQiNA==
X-Google-Smtp-Source: ABdhPJx78xeNCh4oMZ5Pq8T/qs3jOnpkYO+eXtvThA5xnavdrng+Vw6olApyDPsjKEVZySg1RgC2dg==
X-Received: by 2002:a65:6404:: with SMTP id a4mr36082667pgv.175.1625804769419; 
 Thu, 08 Jul 2021 21:26:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] target/riscv: Use tcg_constant_*
Date: Thu,  8 Jul 2021 21:25:51 -0700
Message-Id: <20210709042608.883256-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.

Reorg handling of $zero, with different accessors for
source and destination.

Reorg handling of csrs, passing the actual write_mask
instead of a regno.

Use more helpers for RVH expansion.


r~


Richard Henderson (17):
  target/riscv: Use tcg_constant_*
  target/riscv: Introduce gpr_src, gpr_dst
  target/riscv: Use gpr_{src,dst} in shift operations
  target/riscv: Use gpr_{src,dst} in word division operations
  target/riscv: Use gpr_{src,dst} and tcg_constant_tl in gen_grevi
  target/riscv: Use gpr_src in branches
  target/riscv: Use gpr_{src,dst} for integer load/store
  target/riscv: Use gpr_{src,dst} for word shift operations
  target/riscv: Reorg csr instructions
  target/riscv: Use gpr_{src,dst} for RVA
  target/riscv: Use gpr_{src,dst} for RVB
  target/riscv: Use gpr_{src,dst} for RVF
  target/riscv: Use gpr_{src,dst} for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Use gpr_{src,dst} for RVV
  target/riscv: Remove gen_get_gpr

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 273 +++++++++-----------
 target/riscv/insn_trans/trans_rva.c.inc |  42 ++--
 target/riscv/insn_trans/trans_rvb.c.inc |  11 +-
 target/riscv/insn_trans/trans_rvd.c.inc | 116 ++++-----
 target/riscv/insn_trans/trans_rvf.c.inc | 134 ++++------
 target/riscv/insn_trans/trans_rvh.c.inc | 264 ++++---------------
 target/riscv/insn_trans/trans_rvi.c.inc | 322 ++++++++++++++----------
 target/riscv/insn_trans/trans_rvm.c.inc |  24 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 144 ++++-------
 12 files changed, 534 insertions(+), 821 deletions(-)

-- 
2.25.1


