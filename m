Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDE406AB4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:30:08 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOejO-0004zJ-GM
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeg4-0001yr-E5; Fri, 10 Sep 2021 07:26:41 -0400
Received: from [201.28.113.2] (port=62238 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeg2-0001e6-B2; Fri, 10 Sep 2021 07:26:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 3FB7B800C19;
 Fri, 10 Sep 2021 08:26:31 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Date: Fri, 10 Sep 2021 08:26:02 -0300
Message-Id: <20210910112624.72748-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:31.0450 (UTC)
 FILETIME=[B452F7A0:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

NOTE 1: The previous, non-decodetree code, was updating ctx->nip for all the
DFP instructions. I've removed that, but it would be great if someone could
confirm that updating nip really wasn't necessary.

NOTE 2: Some arithmetic function support for 128-bit integers was added,
for now, still using 64-bit pairs. In the near future, I think we should
modify all of them to use Int128 (and introduce UInt128). But I'll send
out an RFC to discuss how to do that in another patch series.

NOTE 3: The helper names are in uppercase, to match the instruction
names and to simplify the macros that define trans* functions.
Previously, this wasn't the case, as we were using lowercase instruction
names in the pre-decodetree code. Another standalone patch will be sent
later on, changing to uppercase the other new (decodetree) helpers whose
names are directly related to instruction names, eventually making PPC
helper names consistent.

Based-on: 20210823150235.35759-1-luis.pires@eldorado.org.br
(target/ppc: fix setting of CR flags in bcdcfsq)
This series assumes bcdcfsq's fix is already in.

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

Patches missing review:
  host-utils: fix missing zero-extension in divs128
  host-utils: move checks out of divu128/divs128
  host-utils: move udiv_qrnnd() to host-utils
  host-utils: add 128-bit quotient support to divu128/divs128
  host-utils: add unit tests for divu128/divs128
  target/ppc: Implement DCFFIXQQ
  target/ppc: Implement DCTFIXQQ
  target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

Bruno Larsen (1):
  target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c

Fernando Valle (1):
  target/ppc: Introduce REQUIRE_FPU

Luis Pires (20):
  host-utils: Fix overflow detection in divu128()
  host-utils: fix missing zero-extension in divs128
  host-utils: introduce uabs64()
  i386/kvm: Replace abs64() with uabs64() from host-utils
  host-utils: move checks out of divu128/divs128
  host-utils: move udiv_qrnnd() to host-utils
  host-utils: add 128-bit quotient support to divu128/divs128
  host-utils: add unit tests for divu128/divs128
  libdecnumber: introduce decNumberFrom[U]Int128
  target/ppc: Implement DCFFIXQQ
  host-utils: Introduce mulu128
  libdecnumber: Introduce decNumberIntegralToInt128
  target/ppc: Implement DCTFIXQQ
  target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
  target/ppc: Move d{add,sub,mul,div,iex}[q] to decodetree
  target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree
  target/ppc: Move dquai[q], drint{x,n}[q] to decodetree
  target/ppc: Move dqua[q], drrnd[q] to decodetree
  target/ppc: Move dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to
    decodetree
  target/ppc: Move ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree

 hw/i386/kvm/i8254.c                    |   7 +-
 include/fpu/softfloat-macros.h         |  82 -----
 include/hw/clock.h                     |   7 +-
 include/libdecnumber/decNumber.h       |   4 +
 include/libdecnumber/decNumberLocal.h  |   2 +-
 include/qemu/host-utils.h              | 163 ++++++++--
 libdecnumber/decContext.c              |   7 +-
 libdecnumber/decNumber.c               | 131 ++++++++
 target/ppc/dfp_helper.c                | 168 +++++++---
 target/ppc/helper.h                    | 106 ++++---
 target/ppc/insn32.decode               | 171 ++++++++++
 target/ppc/int_helper.c                |  23 +-
 target/ppc/translate.c                 |  23 +-
 target/ppc/translate/dfp-impl.c.inc    | 419 ++++++++++++-------------
 target/ppc/translate/dfp-ops.c.inc     | 165 ----------
 target/ppc/translate/vector-impl.c.inc |  10 +-
 tests/unit/meson.build                 |   1 +
 tests/unit/test-div128.c               | 197 ++++++++++++
 util/host-utils.c                      | 142 ++++++---
 19 files changed, 1163 insertions(+), 665 deletions(-)
 delete mode 100644 target/ppc/translate/dfp-ops.c.inc
 create mode 100644 tests/unit/test-div128.c

-- 
2.25.1


