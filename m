Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F88E440364
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:40:50 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXk9-0004xz-I9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXUp-0005mI-Ne; Fri, 29 Oct 2021 15:24:59 -0400
Received: from [201.28.113.2] (port=13933 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXUj-0008Cv-W5; Fri, 29 Oct 2021 15:24:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 16:24:19 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 7A527800B36;
 Fri, 29 Oct 2021 16:24:19 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 00/15] target/ppc: DFP instructions using decodetree
Date: Fri, 29 Oct 2021 16:24:02 -0300
Message-Id: <20211029192417.400707-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 19:24:19.0795 (UTC)
 FILETIME=[923B0230:01D7CCFA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series moves all existing DFP instructions to decodetree and
implements the 2 new instructions (dcffixqq and dctfixqq) from
Power ISA 3.1.

In order to implement dcffixqq, divu128/divs128 were modified to
support 128-bit quotients (previously, they were limited to 64-bit
quotients), along with adjustments being made to their existing callers.
libdecnumber was also expanded to allow creating decimal numbers from
128-bit integers.

Similarly, for dctfixqq, mulu128 (host-utils) and decNumberIntegralToInt128
(libdecnumber) were introduced to support 128-bit integers.

The remaining patches of this series move all of the already existing
DFP instructions to decodetree, and end up removing dfp-ops.c.inc, which
is no longer needed.

---

I'm resending this series because I missed adding a R-b tag on one
of the commits in v4. I also dropped patches that were already applied and
rebased against master.

All of these patches are reviewed and ready to be applied.

Changes in v5:
- Rebased against master
- Skipped patches that were already applied (v4 1-4)

Changes in v4:
- Rebased against dgibson/ppc-for-6.2
- Skipped patches that were already applied (v3 1-4)
- Changed divu128/divs128 to return the remainder (rth)
- Moved changes that drop nip updates to a separate patch (rth)

Changes in v3:
- Split the uabs64 patch in 2
- Included patch to fix missing zero-extension in divs128
- Folded divisor == 0 into the dhi == 0 case in divu128
- Moved udiv_qrnnd from softfloat-macros.h to host-utils.h
- Used udiv_qrnnd in divu128
- Replaced int with bool in divs128
- Added unit test to check the divisor normalization in divu128
- Removed 'inline' from times_* functions in ppc/translate.c
- Used uadd64_overflow in mulu128
- Removed unnecessary 'else' from decNumberIntegralToInt128

Changes in v2:
- Renamed abs64() to uabs64()

Bruno Larsen (1):
  target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c

Fernando Valle (1):
  target/ppc: Introduce REQUIRE_FPU

Luis Pires (13):
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
  target/ppc: Move dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to
    decodetree
  target/ppc: Move ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree

 include/libdecnumber/decNumber.h       |   4 +
 include/libdecnumber/decNumberLocal.h  |   2 +-
 include/qemu/host-utils.h              |  36 +++
 libdecnumber/decContext.c              |   7 +-
 libdecnumber/decNumber.c               | 131 ++++++++
 target/ppc/dfp_helper.c                | 168 +++++++---
 target/ppc/helper.h                    | 106 ++++---
 target/ppc/insn32.decode               | 171 ++++++++++
 target/ppc/translate.c                 |  23 +-
 target/ppc/translate/dfp-impl.c.inc    | 419 ++++++++++++-------------
 target/ppc/translate/dfp-ops.c.inc     | 165 ----------
 target/ppc/translate/vector-impl.c.inc |  10 +-
 12 files changed, 747 insertions(+), 495 deletions(-)
 delete mode 100644 target/ppc/translate/dfp-ops.c.inc

-- 
2.25.1


