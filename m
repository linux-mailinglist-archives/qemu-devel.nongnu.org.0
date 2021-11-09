Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B655544A67C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 06:57:13 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkK88-0007mZ-9E
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 00:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0004SA-GQ; Tue, 09 Nov 2021 00:52:27 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=43403
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3O-0006cs-FU; Tue, 09 Nov 2021 00:52:26 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn5kLRz4xct; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=Znqx31LMethu5o/QAgWUOUWd+O98D1+6vaWKiBugGPQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Yts/ZHzYEV3qJWPlq1Ew1Y7SrcLgVJY9srO5SIZ+Rk6QQvI2wancLcBD8IM1qK6l4
 7/LdfbcZFLQYKMvLsSm69fjAkxj7AbD47mYN7mtu43aWBCuwOKdSqkqLMrsvbQlwco
 loF7odIln8GuYKXNHc3NnnrLlz/UkN6s3+sglaYk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 00/54] ppc-for-6.2 queue 20211109
Date: Tue,  9 Nov 2021 16:51:10 +1100
Message-Id: <20211109055204.230765-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e:

  Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into staging (2021-11-08 18:50:09 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20211109

for you to fetch changes up to 71e6fae3a994ab5c69e37d6a52a30c840883fbfb:

  spapr_numa.c: FORM2 table handle nodes with no distance info (2021-11-09 10:32:53 +1100)

----------------------------------------------------------------
ppc patch queue for 2021-11-09

Here's the latest set of ppc related patches for qemu-6.2, which I
hope will squeeze in just barely before the hard freeze.

This set includes a change to MAINTAINERS moving maintainership of ppc
from myself and Greg Kurz to Cédric le Goater and Daniel Henrique
Barboza.  So, I expect this to be my last pull request as ppc
maintainer.  It's been great, but it's time I moved onto other things.

Apart from that, this patchset is mostly a lot of updates to TCG
implementations of ISA 3.1 (POWER10) instructions from the El Dorado
team.  There are also a handful of other fixes.

----------------------------------------------------------------
BALATON Zoltan (1):
      ppc/pegasos2: Suppress warning when qtest enabled

Bruno Larsen (1):
      target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c

Bruno Larsen (billionai) (6):
      target/ppc: Introduce REQUIRE_VSX macro
      target/ppc: moved XXSPLTW to using decodetree
      target/ppc: moved XXSPLTIB to using decodetree
      target/ppc: implemented XXSPLTI32DX
      target/ppc: Implemented XXSPLTIW using decodetree
      target/ppc: implemented XXSPLTIDP instruction

Cédric Le Goater (1):
      ppc/pnv: Fix check on block device before updating drive contents

David Gibson (1):
      target/ppc, hw/ppc: Change maintainers

Fernando Eckhardt Valle (4):
      target/ppc: introduce do_ea_calc
      target/ppc: move resolve_PLS_D to translate.c
      target/ppc: Move load and store floating point instructions to decodetree
      target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD instructions

Fernando Valle (1):
      target/ppc: Introduce REQUIRE_FPU

Lucas Mateus Castro (alqotel) (6):
      target/ppc: moved stxv and lxv from legacy to decodtree
      target/ppc: moved stxvx and lxvx from legacy to decodtree
      target/ppc: added the instructions LXVP and STXVP
      target/ppc: added the instructions LXVPX and STXVPX
      target/ppc: added the instructions PLXV and PSTXV
      target/ppc: added the instructions PLXVP and PSTXVP

Luis Pires (15):
      target/ppc: Implement cntlzdm
      target/ppc: Implement cnttzdm
      libdecnumber: introduce decNumberFrom[U]Int128
      target/ppc: Implement DCFFIXQQ
      host-utils: Introduce mulu128
      libdecnumber: Introduce decNumberIntegralToInt128
      target/ppc: Implement DCTFIXQQ
      target/ppc: Do not update nip on DFP instructions
      target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
      target/ppc: Move d{add,sub,mul,div,iex}[q] to decodetree
      target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree
      target/ppc: Move dquai[q], drint{x,n}[q] to decodetree
      target/ppc: Move dqua[q], drrnd[q] to decodetree
      target/ppc: Move dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to decodetree
      target/ppc: Move ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree

Matheus Ferst (17):
      target/ppc: Move LQ and STQ to decodetree
      target/ppc: Implement PLQ and PSTQ
      target/ppc: Implement pdepd instruction
      target/ppc: Implement pextd instruction
      target/ppc: Move vcfuged to vmx-impl.c.inc
      target/ppc: Implement vclzdm/vctzdm instructions
      target/ppc: Implement vpdepd/vpextd instruction
      target/ppc: Implement vsldbi/vsrdbi instructions
      target/ppc: Implement Vector Insert from GPR using GPR index insns
      target/ppc: Implement Vector Insert Word from GPR using Immediate insns
      target/ppc: Implement Vector Insert from VSR using GPR index insns
      target/ppc: Move vinsertb/vinserth/vinsertw/vinsertd to decodetree
      target/ppc: Implement Vector Extract Double to VSR using GPR index insns
      target/ppc: receive high/low as argument in get/set_cpu_vsr
      target/ppc: Implement xxblendvb/xxblendvh/xxblendvw/xxblendvd instructions
      target/ppc: Implement lxvkq instruction
      target/ppc: cntlzdm/cnttzdm implementation without brcond

Nicholas Piggin (1):
      spapr_numa.c: FORM2 table handle nodes with no distance info

 MAINTAINERS                                |  20 +-
 hw/ppc/pegasos2.c                          |   3 +-
 hw/ppc/pnv_pnor.c                          |   2 +-
 hw/ppc/spapr_numa.c                        |  22 +-
 include/libdecnumber/decNumber.h           |   4 +
 include/libdecnumber/decNumberLocal.h      |   2 +-
 include/qemu/host-utils.h                  |  36 ++
 libdecnumber/decContext.c                  |   7 +-
 libdecnumber/decNumber.c                   | 131 ++++++
 target/ppc/dfp_helper.c                    | 168 ++++---
 target/ppc/helper.h                        | 126 +++---
 target/ppc/insn32.decode                   | 303 +++++++++++++
 target/ppc/insn64.decode                   |  72 +++
 target/ppc/int_helper.c                    | 135 +++++-
 target/ppc/translate.c                     | 238 +++-------
 target/ppc/translate/dfp-impl.c.inc        | 419 +++++++++--------
 target/ppc/translate/dfp-ops.c.inc         | 165 -------
 target/ppc/translate/fixedpoint-impl.c.inc | 219 +++++++--
 target/ppc/translate/fp-impl.c.inc         | 261 ++++-------
 target/ppc/translate/fp-ops.c.inc          |  29 --
 target/ppc/translate/vector-impl.c.inc     |  56 ---
 target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++++++-
 target/ppc/translate/vmx-ops.c.inc         |  10 +-
 target/ppc/translate/vsx-impl.c.inc        | 702 +++++++++++++++++------------
 target/ppc/translate/vsx-ops.c.inc         |   4 -
 25 files changed, 2171 insertions(+), 1297 deletions(-)
 delete mode 100644 target/ppc/translate/dfp-ops.c.inc
 delete mode 100644 target/ppc/translate/vector-impl.c.inc

