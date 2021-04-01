Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26342350D5E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:01:07 +0200 (CEST)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoW2-0001fQ-1r
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP2-0001SD-BZ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:52 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoOx-0004ri-DE
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249227; x=1648785227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hjTBkum12bC+VIvp0xfvLaDc58BtzsHwKtILOA8GoeU=;
 b=TX1MclPTgrZDspE1SLsfcIMyqgotXRVLALLZ9dRxbigHwcbUodDhVscB
 guDzVskW26IiJz+CkvUGp6636Hhn5CotLnK5rxdri1vfSu7wF3lx03FU+
 VILeFobQhyvjz+EOOT6BO/nL/jDd4XBJ3Di7HC0LMMdCshOIJ4dKpepUx E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B53DB1816; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/21] Hexagon (target/hexagon) update
Date: Wed, 31 Mar 2021 22:53:12 -0500
Message-Id: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series is a significant update for the Hexagon target
    The first 10 patches address feedback from Richard Henderson
    <richard.henderson@linaro.org>
    The next 6 patches add the remaining instructions for the Hexagon
    scalar core

The patches are logically independent but are organized as a series to
avoid potential confilcts if they are merged out of order.

Note that the new test cases require an update toolchain/container.


*** Changes in v2 ***
Address feedback from Richard Henderson <richard.henderson@linaro.org>
    Break utility function (arch.c) changes into 2 separate patches
    Change bit-reverse addressing from TCG generation to helper
    Change loadalign[bh] to use shift+deposit
    Remove fGET_TCG_tmp
        Remove unneeded ireg and tmp variables
    Remove unused one variable from gen_log_predicated_reg_write
    Rename gen_exception to gen_exception_raw
    Remove unreachable tcg_gen_exit_tb
    Remove redundant PC assignment
    Remove TARGET_HEXAGON code from parts_silence_nan
    Change roundrom to uint8_t in arch_recip_lookup and arch_invsqrt_lookup
    Rewrite fGEN_TCG_addp_c/fGEN_TCG_subp_c using tcg_gen_add2_i64
    Remove gen_carry_from_add64()
    Break "instructions with multiple definitions" into multiple patches
    Fix fINSERT_RANGE macro

Expand macros inside GET_EA_pci, GET_EA_pcr
Change fGEN_TCG_PCR to fGEN_TCG_LOAD_pcr to be consistent with other macros
Cleanup load and unpack implementation
Cleanup load into shifted register implementation
Cleanup brev.c test case
Change sfinvsqrta/sfrecipa to use a single helper
Cleanup vacsh helpers


Taylor Simpson (21):
  Hexagon (target/hexagon) TCG generation cleanup
  Hexagon (target/hexagon) remove unnecessary inline directives
  Hexagon (target/hexagon) use env_archcpu and env_cpu
  Hexagon (target/hexagon) properly generate TB end for DISAS_NORETURN
  Hexagon (target/hexagon) decide if pred has been written at TCG gen
    time
  Hexagon (target/hexagon) change variables from int to bool when
    appropriate
  Hexagon (target/hexagon) remove unused carry_from_add64 function
  Hexagon (target/hexagon) change type of softfloat_roundingmodes
  Hexagon (target/hexagon) use softfloat default NaN and tininess
  Hexagon (target/hexagon) replace float32_mul_pow2 with float32_scalbn
  Hexagon (target/hexagon) use softfloat for float-to-int conversions
  Hexagon (target/hexagon) add F2_sfrecipa instruction
  Hexagon (target/hexagon) add F2_sfinvsqrta
  Hexagon (target/hexagon) add A5_ACS (vacsh)
  Hexagon (target/hexagon) add A6_vminub_RdP
  Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
  Hexagon (target/hexagon) circular addressing
  Hexagon (target/hexagon) bit reverse (brev) addressing
  Hexagon (target/hexagon) load and unpack bytes instructions
  Hexagon (target/hexagon) load into shifted register instructions
  Hexagon (target/hexagon) CABAC decode bin

 fpu/softfloat-specialize.c.inc        |   3 +
 linux-user/hexagon/cpu_loop.c         |   2 +-
 target/hexagon/arch.c                 | 191 +++++++++++---
 target/hexagon/arch.h                 |   7 +-
 target/hexagon/conv_emu.c             | 177 -------------
 target/hexagon/conv_emu.h             |  31 ---
 target/hexagon/cpu.c                  |  14 +-
 target/hexagon/cpu.h                  |   5 -
 target/hexagon/cpu_bits.h             |   2 +-
 target/hexagon/decode.c               |  80 +++---
 target/hexagon/fma_emu.c              |  40 +--
 target/hexagon/gen_tcg.h              | 420 +++++++++++++++++++++++++++++-
 target/hexagon/gen_tcg_funcs.py       |   2 +-
 target/hexagon/genptr.c               | 182 ++++++++++++-
 target/hexagon/helper.h               |  21 +-
 target/hexagon/imported/alu.idef      |  44 ++++
 target/hexagon/imported/encode_pp.def |  30 +++
 target/hexagon/imported/float.idef    |  32 +++
 target/hexagon/imported/ldst.idef     |  68 +++++
 target/hexagon/imported/macros.def    |  47 ++++
 target/hexagon/imported/shift.idef    |  47 ++++
 target/hexagon/insn.h                 |  21 +-
 target/hexagon/macros.h               | 118 ++++++++-
 target/hexagon/meson.build            |   1 -
 target/hexagon/op_helper.c            | 342 ++++++++++++++++--------
 target/hexagon/translate.c            |  79 +++---
 target/hexagon/translate.h            |   7 +-
 tests/tcg/hexagon/Makefile.target     |   5 +
 tests/tcg/hexagon/brev.c              | 190 ++++++++++++++
 tests/tcg/hexagon/circ.c              | 391 ++++++++++++++++++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 242 +++++++++++++++++
 tests/tcg/hexagon/load_align.c        | 415 +++++++++++++++++++++++++++++
 tests/tcg/hexagon/load_unpack.c       | 474 ++++++++++++++++++++++++++++++++++
 tests/tcg/hexagon/misc.c              |  47 ++++
 tests/tcg/hexagon/multi_result.c      | 275 ++++++++++++++++++++
 35 files changed, 3560 insertions(+), 492 deletions(-)
 delete mode 100644 target/hexagon/conv_emu.c
 delete mode 100644 target/hexagon/conv_emu.h
 create mode 100644 tests/tcg/hexagon/brev.c
 create mode 100644 tests/tcg/hexagon/circ.c
 create mode 100644 tests/tcg/hexagon/load_align.c
 create mode 100644 tests/tcg/hexagon/load_unpack.c
 create mode 100644 tests/tcg/hexagon/multi_result.c

-- 
2.7.4


