Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F853DA1F1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:18:20 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m943P-0003T5-0f
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940U-0008OU-Lx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940S-0000so-Jt
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id d8so6455037wrm.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtDYgvBEq5EqQ2Fjyt4QJHmL5eTW+pDDkgFsDDg2i6I=;
 b=rrYIgLMJfyBEf5PzqjC0rfndd1JR1y96Sj9zDFEKtw7KKv4k5ZkdKHNYkeZqYsjq5Y
 Cr2H2Yjo9FZ0i/JOJAOfY2Tm06zckLt7mCy7xktUleI0ALz+ttII64yZupHSMDTAYgHF
 NbPenccsDU4Z0QBvTibaDVrAn7BSVjp1RBCyNgEVxA2LNhC0ZabxVe1DfdEQzoSP60zN
 KFgmbEQH5v7g7RoGlf5mJGZTiQOaiP3/j4Jf0p7axjspNsTuQezHWUs4OAnsBOu2JJLd
 7svp/12NajqdYZP2q+BlrLJoWI0+iE/VX2LPztxlOmq+V7+D0VhdSM4eU0wUpfh7HHzm
 /L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtDYgvBEq5EqQ2Fjyt4QJHmL5eTW+pDDkgFsDDg2i6I=;
 b=uK3Z/eHBZDO0c7jeeUDPgHCtB90HtH0+2fehUuNcq6q1oRz7PSi0ucxumazqu8yXWB
 rh9WAkauY0tpDy8EwAHaii/Ric0hM+ND8XQOeVZ2EeW/c+fcySzBkDhjpX6QbaL3VGZW
 1/NtX1+TA4BvetaZMASCOs7oc06tcA+/FBENpkahiLxP8vfBvEzf9ueWMJI7477vMi85
 F9LLRqvvnKbLuuZe5x+i7JzLV+9m1Q3L6fCr+ZGhjOJg+7H4s7imIeqjvoqCdH9Do90L
 yFEOWYArp0QznJDEHLDJG9yrLgLG5N9bh/+OUYyQFYgdKtw04YNcCnJteHdL2+zLFJH8
 SmJw==
X-Gm-Message-State: AOAM533p6VK+hFzXdI18Mcf+TgY3s77BZ3DcAAGUMk5OjvWbMbGbfl9w
 8SCAfz8DL/M9PLaAMcARc7iGVRKaEjrJ5w==
X-Google-Smtp-Source: ABdhPJzLfv23fGKMkAdX3WmccGr9Us5jsFA+0+jOPJm3AjjGE+iDsNFZP+fNAbLspjB1HNM3D7NkRg==
X-Received: by 2002:adf:f202:: with SMTP id p2mr4259002wro.240.1627557314965; 
 Thu, 29 Jul 2021 04:15:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/53] target/arm: MVE slices 3 and 4
Date: Thu, 29 Jul 2021 12:14:19 +0100
Message-Id: <20210729111512.16541-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries provides the third and fourth slices of the MVE
implementation, which gives us complete coverage of all instructions
and brings us to the point where we can actually enable it.

In this series:
 * fixes for minor bugs in a couple of the insns already upstream
 * all the remaining integer instructions
 * the remaining loads and stores (scatter-gather and interleaving)
 * the floating point instructions
 * patch enabling MVE for the Cortex-M55

Things still to do:
 * MVE loads/stores should check alignment (this will depend on
   the patchset that RTH just sent out, and I didn't want to
   entangle the two features unnecessarily)
 * gdbstub support (blocked on the gdb folks nailing down what
   the XML for it should be)
 * optimization: many of the insns should have inline versions
   to use when we know we aren't doing any predication

But none of those are blockers for this landing upstream once
we reopen for 6.2.

Still to review:
 03, 07, 10, 21, 26, and the new patches 36-53

thanks
-- PMM

Peter Maydell (53):
  target/arm: Note that we handle VMOVL as a special case of VSHLL
  target/arm: Print MVE VPR in CPU dumps
  target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
  target/arm: Fix signed VADDV
  target/arm: Fix mask handling for MVE narrowing operations
  target/arm: Fix 48-bit saturating shifts
  target/arm: Fix MVE 48-bit SQRSHRL for small right shifts
  target/arm: Fix calculation of LTP mask when LR is 0
  target/arm: Factor out mve_eci_mask()
  target/arm: Fix VPT advance when ECI is non-zero
  target/arm: Fix VLDRB/H/W for predicated elements
  target/arm: Implement MVE VMULL (polynomial)
  target/arm: Implement MVE incrementing/decrementing dup insns
  target/arm: Factor out gen_vpst()
  target/arm: Implement MVE integer vector comparisons
  target/arm: Implement MVE integer vector-vs-scalar comparisons
  target/arm: Implement MVE VPSEL
  target/arm: Implement MVE VMLAS
  target/arm: Implement MVE shift-by-scalar
  target/arm: Move 'x' and 'a' bit definitions into vmlaldav formats
  target/arm: Implement MVE integer min/max across vector
  target/arm: Implement MVE VABAV
  target/arm: Implement MVE narrowing moves
  target/arm: Rename MVEGenDualAccOpFn to MVEGenLongDualAccOpFn
  target/arm: Implement MVE VMLADAV and VMLSLDAV
  target/arm: Implement MVE VMLA
  target/arm: Implement MVE saturating doubling multiply accumulates
  target/arm: Implement MVE VQABS, VQNEG
  target/arm: Implement MVE VMAXA, VMINA
  target/arm: Implement MVE VMOV to/from 2 general-purpose registers
  target/arm: Implement MVE VPNOT
  target/arm: Implement MVE VCTP
  target/arm: Implement MVE scatter-gather insns
  target/arm: Implement MVE scatter-gather immediate forms
  target/arm: Implement MVE interleaving loads/stores
  target/arm: Implement MVE VADD (floating-point)
  target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM, VMINNM
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VFMA and VFMS
  target/arm: Implement MVE VCMUL and VCMLA
  target/arm: Implement MVE VMAXNMA and VMINNMA
  target/arm: Implement MVE scalar fp insns
  target/arm: Implement MVE fp-with-scalar VFMA, VFMAS
  softfloat: Remove assertion preventing silencing of NaN in default-NaN
    mode
  target/arm: Implement MVE FP max/min across vector
  target/arm: Implement MVE fp vector comparisons
  target/arm: Implement MVE fp scalar comparisons
  target/arm: Implement MVE VCVT between floating and fixed point
  target/arm: Implement MVE VCVT between fp and integer
  target/arm: Implement MVE VCVT with specified rounding mode
  target/arm: Implement MVE VCVT between single and half precision
  target/arm: Implement MVE VRINT insns
  target/arm: Enable MVE in Cortex-M55

 docs/system/arm/emulation.rst  |    1 +
 target/arm/helper-mve.h        |  425 +++++++
 target/arm/translate-a32.h     |    2 +
 target/arm/translate.h         |    6 +
 target/arm/vec_internal.h      |   11 +
 target/arm/mve.decode          |  463 +++++++-
 target/arm/t32.decode          |    1 +
 target/arm/cpu.c               |    3 +
 target/arm/cpu_tcg.c           |    7 +-
 target/arm/mve_helper.c        | 1899 +++++++++++++++++++++++++++++++-
 target/arm/translate-mve.c     | 1154 ++++++++++++++++++-
 target/arm/translate-neon.c    |    6 -
 target/arm/translate-vfp.c     |    2 +-
 target/arm/translate.c         |   33 +
 target/arm/vec_helper.c        |   14 +-
 fpu/softfloat-specialize.c.inc |    1 -
 16 files changed, 3911 insertions(+), 117 deletions(-)

-- 
2.20.1


