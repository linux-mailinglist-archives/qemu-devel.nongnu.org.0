Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E539E4B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:03:13 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIee-0002mf-SG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa4-0006vb-Nr
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa2-0007pH-5U
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a20so18490511wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJBWtf2dptBFGcJLE65OD9AhMJPoRLlsLZOH1JzSaZs=;
 b=TBJbKw5tG6RQpollMFlGJewPTSqqbjy8zsqpKQ1oEYc5eAhwCYzIbxJCtux9ZXbMLw
 HZuMKv8d/4SU6wK9AH1wWPVqh0ka9WZpDEOs1lFbNZ77v6yXX+QL5Ri3JC4bmjFL5Vjy
 iG/XAH4mPDbQ5KOtyhWYOwF2jz+2vEGixkXIFLnvH2KxtZOnrle7nJ35VZkiHUy4hRVi
 2nQdh0L/3TxPijBZlAzHUuDQyh0568wOtVbTuBXJ36Lj13OIYXXUle2FO+nb79934+pC
 hg0+98C34YMPK7F5SMvwhRPHgrjZFTrXzBwITEIbTwjmTVi29atU6M8PyBZjAh7XvnJA
 VprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJBWtf2dptBFGcJLE65OD9AhMJPoRLlsLZOH1JzSaZs=;
 b=R8q8qW+iW3LuPjwoUVYwppHPXmNaEcxJwKqZwU017UMRTFxk2+JyW6+X0Na8zM8Ab7
 oJpOiggqs0ecqhLK8r4uYd4PzVeKVE5HuDRepvhpyqtBz3owxWayT85rhax2t3KuR1di
 StanpRqM5oJcX3U7xN8MFhdveoaAxLL3JdAxyEg9NRHcOZEYiFy3gGMVIWUWw2JYjQIN
 KP32DaJseN7t5mUmXSiibgbhgFf5d/IO2Td287lkBLA8GAXqpFWbKjVE7MP26Juou/gA
 FF/83iowcke2Cspea0bBcgGVBWEeYIDh7ZktCsO3BYM3lwZ7FuvschaCLRzxu278UtM8
 OAFQ==
X-Gm-Message-State: AOAM533/SoLq1ZlecFcKmtDsoBglvlobo9ouy6qp3bhY853taOCmacmx
 y9ArDtTXJVbNQSEc4ECvmj+Yug==
X-Google-Smtp-Source: ABdhPJwxs30yqRw4yuw/WvIIK2qHNESf6KzDo73mtp8aKqNX/cZOoKlMmiNx1amK0ZmFz0XLRXD+CQ==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr17767518wrf.420.1623085104152; 
 Mon, 07 Jun 2021 09:58:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/55] target/arm: First slice of MVE implementation
Date: Mon,  7 Jun 2021 17:57:26 +0100
Message-Id: <20210607165821.9892-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries provides an initial slice of the MVE
implementation. (MVE is "vector instructions for M-profile", also
known as Helium).

This is not complete support by a long way -- it covers only about 35%
of the decode patterns for MVE, and it implements only the slow-path
"we need predication, drop out to a helper function" versions of
insns. I send it out for two reasons:

 * if there's something I need to change about the general structure
   or the way I'm implementing insns, I want to know now rather than
   after I've implemented the other two thirds of the ISA

 * if I hold onto the whole patchset until I've got a complete MVE
   implementation it'll be 150+ patches, 10000 lines of code, and
   a nightmare to code review

The series covers:
 * framework for MVE decode, including infrastructure for
   handling predication, PSR.ECI, etc
 * tail-predication forms of low-overhead-loop insns (LCTP, WLSTP, LETP)
 * basic (non-gather) loads and stores
 * pretty much all the integer 2-operand vector and scalar insns
 * most of the integer 1-operand insns
 * a handful of other insns

(Unfortunately the v8M Arm ARM does not provide a nice neatly
separated list of encodings the way the SVE2 XML does.  I ended up
just pulling all the decode patterns out of the Arm ARM insn
descriptions and then hand-sorting them into what looked like common
formats. So the insns implemented aren't following a 100% logical
order.)

As noted above, the implementation here is purely the slow-path
fully-generic "call helpers that can handle predication". I do
want to implement a fast-path for "we know we have no predication,
so we can generate inline vector code", but I'd like to do that
as a series of followup patches once the main MVE code has landed.
That will (a) make it easier to review, I hope (b) mean we get to
"at least functional" MVE quicker and (c) allow people to bisect
any regressions to the "add fastpath" patch.

Almost nothing in this patchseries is "live code", because no CPU sets
the ID register bits to turn on MVE.  The exception is the handling of
PSR.ECI/ICI, which is enabled at least as far as the ICI bits go for
M-profile CPUs (thus fixing the missing corner-case requirement that
trying to execute a non-continuable insn with non-zero ICI should
fault).

My view is that if these patches get through code review we're better
off with them in upstream git rather than outside it; open to
arguments to the contrary.

Patch 1 is RTH's recently posted tcg_remove_ops_after() patch,
which we need for the PSR.ECI handling (which indeed is the
justification for having that new function in the first place).

You can also get this patchset here:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git mve-drop-1

thanks
-- PMM

Peter Maydell (54):
  target/arm: Enable FPSCR.QC bit for MVE
  target/arm: Handle VPR semantics in existing code
  target/arm: Add handling for PSR.ECI/ICI
  target/arm: Let vfp_access_check() handle late NOCP checks
  target/arm: Implement MVE LCTP
  target/arm: Implement MVE WLSTP insn
  target/arm: Implement MVE DLSTP
  target/arm: Implement MVE LETP insn
  target/arm: Add framework for MVE decode
  target/arm: Implement MVE VLDR/VSTR (non-widening forms)
  target/arm: Implement widening/narrowing MVE VLDR/VSTR insns
  target/arm: Implement MVE VCLZ
  target/arm: Implement MVE VCLS
  bitops.h: Provide hswap32(), hswap64(), wswap64() swapping operations
  target/arm: Implement MVE VREV16, VREV32, VREV64
  target/arm: Implement MVE VMVN (register)
  target/arm: Implement MVE VABS
  target/arm: Implement MVE VNEG
  target/arm: Implement MVE VDUP
  target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
  target/arm: Implement MVE VADD, VSUB, VMUL
  target/arm: Implement MVE VMULH
  target/arm: Implement MVE VRMULH
  target/arm: Implement MVE VMAX, VMIN
  target/arm: Implement MVE VABD
  target/arm: Implement MVE VHADD, VHSUB
  target/arm: Implement MVE VMULL
  target/arm: Implement MVE VMLALDAV
  target/arm: Implement MVE VMLSLDAV
  include/qemu/int128.h: Add function to create Int128 from int64_t
  target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
  target/arm: Implement MVE VADD (scalar)
  target/arm: Implement MVE VSUB, VMUL (scalar)
  target/arm: Implement MVE VHADD, VHSUB (scalar)
  target/arm: Implement MVE VBRSR
  target/arm: Implement MVE VPST
  target/arm: Implement MVE VQADD and VQSUB
  target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
  target/arm: Implement MVE VQDMULL scalar
  target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
  target/arm: Implement MVE VQADD, VQSUB (vector)
  target/arm: Implement MVE VQSHL (vector)
  target/arm: Implement MVE VQRSHL
  target/arm: Implement MVE VSHL insn
  target/arm: Implement MVE VRSHL
  target/arm: Implement MVE VQDMLADH and VQRDMLADH
  target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
  target/arm: Implement MVE VQDMULL (vector)
  target/arm: Implement MVE VRHADD
  target/arm: Implement MVE VADC, VSBC
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VHCADD
  target/arm: Implement MVE VADDV
  target/arm: Make VMOV scalar <-> gpreg beatwise for MVE

Richard Henderson (1):
  tcg: Introduce tcg_remove_ops_after

 include/qemu/bitops.h         |   29 +
 include/qemu/int128.h         |   10 +
 include/tcg/tcg.h             |    1 +
 target/arm/helper-mve.h       |  357 +++++++++
 target/arm/helper.h           |    2 +
 target/arm/internals.h        |   11 +
 target/arm/translate-a32.h    |    4 +
 target/arm/translate.h        |   19 +
 target/arm/mve.decode         |  261 +++++++
 target/arm/t32.decode         |   15 +-
 target/arm/m_helper.c         |   54 +-
 target/arm/mve_helper.c       | 1343 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c       |   20 -
 target/arm/translate-m-nocp.c |   16 +-
 target/arm/translate-mve.c    |  865 +++++++++++++++++++++
 target/arm/translate-vfp.c    |  152 +++-
 target/arm/translate.c        |  301 +++++++-
 target/arm/vfp_helper.c       |    3 +-
 tcg/tcg.c                     |   13 +
 target/arm/meson.build        |    3 +
 20 files changed, 3408 insertions(+), 71 deletions(-)
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/mve.decode
 create mode 100644 target/arm/mve_helper.c
 create mode 100644 target/arm/translate-mve.c

-- 
2.20.1


