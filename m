Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D4348747
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:03:11 +0100 (CET)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGH8-0000h3-2m
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4g-00036c-TM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:18 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:1689)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4e-0002bH-5n
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640616; x=1648176616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMqHgaSBvpC6RS583q89TuzCf/NH7GzFkAWc6R0h7Y4=;
 b=Xns+Yzizi8HDARy4epVsv473hLWp73sMVyvhzp/aaF0LwTT2QtipCiIf
 n/rdK694kWToPATEC7MDF75k+A4yUQrGE7PGuO4noy8z1sFOj3RGWO9cb
 0Hiiq1FUPrcf7svt5FLwCr7Jfm4geZeeoSbFX3Rxu9b8nmNcMCrtHY37u 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BAE937F7; Wed, 24 Mar 2021 21:50:11 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] Hexagon (target/hexagon) update
Date: Wed, 24 Mar 2021 21:49:55 -0500
Message-Id: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
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
    The first 9 patches address feedback from Richard Henderson <richard.henderson@linaro.org>
    The next 6 patches add the remaining instructions for the Hexagon scalar core

The patches are logically independent but are organized as a series to avoid potential
confilcts if they are merged out of order.

Taylor Simpson (15):
  Hexagon (target/hexagon) TCG generation cleanup
  Hexagon (target/hexagon) remove unnecessary inline directives
  Hexagon (target/hexagon) properly generate TB end for DISAS_NORETURN
  Hexagon (target/hexagon) decide if pred has been written at TCG gen time
  Hexagon (target/hexagon) change variables from int to bool when appropriate
  Hexagon (target/hexagon) utility function changes
  Hexagon (target/hexagon) use softfloat default NaN and tininess
  Hexagon (target/hexagon) replace float32_mul_pow2 with float32_scalbn
  Hexagon (target/hexagon) use softfloat for float-to-int conversions
  Hexagon (target/hexagon) instructions with multiple definitions
  Hexagon (target/hexagon) circular addressing
  Hexagon (target/hexagon) bit reverse (brev) addressing
  Hexagon (target/hexagon) load and unpack bytes instructions
  Hexagon (target/hexagon) load into shifted register instructions
  Hexagon (target/hexagon) CABAC decode bin

 fpu/softfloat-specialize.c.inc        |   5 +
 linux-user/hexagon/cpu_loop.c         |   2 +-
 target/hexagon/arch.c                 | 191 +++++++++++---
 target/hexagon/arch.h                 |   7 +-
 target/hexagon/conv_emu.c             | 177 -------------
 target/hexagon/conv_emu.h             |  31 ---
 target/hexagon/cpu.c                  |  14 +-
 target/hexagon/cpu.h                  |   6 +-
 target/hexagon/cpu_bits.h             |   2 +-
 target/hexagon/decode.c               |  80 +++---
 target/hexagon/fma_emu.c              |  40 +--
 target/hexagon/gen_tcg.h              | 458 ++++++++++++++++++++++++++++++++
 target/hexagon/gen_tcg_funcs.py       |   2 +-
 target/hexagon/genptr.c               | 243 ++++++++++++++++-
 target/hexagon/helper.h               |  22 +-
 target/hexagon/imported/alu.idef      |  44 ++++
 target/hexagon/imported/encode_pp.def |  30 +++
 target/hexagon/imported/float.idef    |  32 +++
 target/hexagon/imported/ldst.idef     |  68 +++++
 target/hexagon/imported/macros.def    |  47 ++++
 target/hexagon/imported/shift.idef    |  47 ++++
 target/hexagon/insn.h                 |  21 +-
 target/hexagon/macros.h               | 174 ++++++++++++-
 target/hexagon/meson.build            |   1 -
 target/hexagon/op_helper.c            | 373 ++++++++++++++++++--------
 target/hexagon/translate.c            |  79 +++---
 target/hexagon/translate.h            |   7 +-
 tests/tcg/hexagon/Makefile.target     |   5 +
 tests/tcg/hexagon/brev.c              | 185 +++++++++++++
 tests/tcg/hexagon/circ.c              | 393 ++++++++++++++++++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 242 +++++++++++++++++
 tests/tcg/hexagon/load_align.c        | 415 +++++++++++++++++++++++++++++
 tests/tcg/hexagon/load_unpack.c       | 474 ++++++++++++++++++++++++++++++++++
 tests/tcg/hexagon/misc.c              |  47 ++++
 tests/tcg/hexagon/multi_result.c      | 249 ++++++++++++++++++
 35 files changed, 3726 insertions(+), 487 deletions(-)
 delete mode 100644 target/hexagon/conv_emu.c
 delete mode 100644 target/hexagon/conv_emu.h
 create mode 100644 tests/tcg/hexagon/brev.c
 create mode 100644 tests/tcg/hexagon/circ.c
 create mode 100644 tests/tcg/hexagon/load_align.c
 create mode 100644 tests/tcg/hexagon/load_unpack.c
 create mode 100644 tests/tcg/hexagon/multi_result.c

-- 
2.7.4


