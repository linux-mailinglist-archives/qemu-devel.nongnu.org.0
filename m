Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A6E3FCBBC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:45:31 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6t6-0006rH-V4
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6qi-00064T-GW; Tue, 31 Aug 2021 12:43:01 -0400
Received: from [201.28.113.2] (port=56209 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6qc-0007Nf-3m; Tue, 31 Aug 2021 12:42:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:42:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9C8A0800930;
 Tue, 31 Aug 2021 13:42:45 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 00/19] target/ppc: DFP instructions using decodetree
Date: Tue, 31 Aug 2021 13:39:48 -0300
Message-Id: <20210831164007.297781-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:42:47.0481 (UTC)
 FILETIME=[3ACA0290:01D79E87]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
quotients), along with adjustments being made to its existing callers.
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
modify all of them to use Int128 (and introduce UInt128). But that
should be done in another patch series.

Based-on: 20210823150235.35759-1-luis.pires@eldorado.org.br
(target/ppc: fix setting of CR flags in bcdcfsq)
This series assumes bcdcfsq's fix is already in.

Changes in v2:
- Renamed abs64() to uabs64()

Patches missing review:
  target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c
  host-utils: Fix overflow detection in divu128()
  host-utils: move abs64() to host-utils as uabs64()
  host-utils: move checks out of divu128/divs128
  host-utils: add 128-bit quotient support to divu128/divs128
  host-utils: add unit tests for divu128/divs128
  libdecnumber: introduce decNumberFrom[U]Int128
  target/ppc: Implement DCFFIXQQ
  host-utils: Introduce mulu128
  libdecnumber: Introduce decNumberIntegralToInt128
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

Luis Pires (17):
  host-utils: Fix overflow detection in divu128()
  host-utils: move abs64() to host-utils as uabs64()
  host-utils: move checks out of divu128/divs128
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
 include/hw/clock.h                     |   7 +-
 include/libdecnumber/decNumber.h       |   4 +
 include/libdecnumber/decNumberLocal.h  |   2 +-
 include/qemu/host-utils.h              |  86 +++--
 libdecnumber/decContext.c              |   7 +-
 libdecnumber/decNumber.c               | 130 ++++++++
 target/ppc/dfp_helper.c                | 168 +++++++---
 target/ppc/helper.h                    | 106 ++++---
 target/ppc/insn32.decode               | 171 ++++++++++
 target/ppc/int_helper.c                |  23 +-
 target/ppc/translate.c                 |  25 +-
 target/ppc/translate/dfp-impl.c.inc    | 419 ++++++++++++-------------
 target/ppc/translate/dfp-ops.c.inc     | 165 ----------
 target/ppc/translate/vector-impl.c.inc |  10 +-
 tests/unit/meson.build                 |   1 +
 tests/unit/test-div128.c               | 185 +++++++++++
 util/host-utils.c                      | 137 +++++---
 18 files changed, 1073 insertions(+), 580 deletions(-)
 delete mode 100644 target/ppc/translate/dfp-ops.c.inc
 create mode 100644 tests/unit/test-div128.c

-- 
2.25.1


