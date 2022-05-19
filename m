Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B152DE51
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 22:24:07 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrmgo-0006z3-Eu
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 16:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmdM-0003qT-2w; Thu, 19 May 2022 16:20:32 -0400
Received: from [187.72.171.209] (port=43855 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmdC-00074v-AE; Thu, 19 May 2022 16:20:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 19 May 2022 17:18:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8B97B800150;
 Thu, 19 May 2022 17:18:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2 00/12] Change helper declarations to use call flags
Date: Thu, 19 May 2022 17:18:10 -0300
Message-Id: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 May 2022 20:18:45.0840 (UTC)
 FILETIME=[A4636D00:01D86BBD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

In our "PowerISA Vector/VSX instruction batch" patch series, rth noted[1]
that helpers that only access vector registers should be declared with
DEF_HELPER_FLAGS_* and TCG_CALL_NO_RWG. We fixed helpers in that series,
but there are older helpers that could use the same optimization.

Guided by the presence of env as the first argument, in patches 1~4 we
change helpers that do not have access to the cpu_env pointer to modify
any globals. Then, we change other helpers that receive cpu_env but do
not use it and apply the same fix, taking the opportunity to move them
to decodetree.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00568.html

Patches without review: 06.

v2:
 - darn32/darn64 helpers declared with TCG_CALL_NO_RWG_SE;
 - xscvspdpn implemented with helper_todouble, dropped helper_XSCVSPDPN;
 - vmsumuhs and vmsumshs helpers declared with TCG_CALL_NO_RWG;
 - Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-05/msg00287.html

Matheus Ferst (12):
  target/ppc: declare darn32/darn64 helpers with TCG_CALL_NO_RWG_SE
  target/ppc: use TCG_CALL_NO_RWG in vector helpers without env
  target/ppc: use TCG_CALL_NO_RWG in BCD helpers
  target/ppc: use TCG_CALL_NO_RWG in VSX helpers without env
  target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
  target/ppc: implement xscvspdpn with helper_todouble
  target/ppc: declare xvxsigsp helper with call flags
  target/ppc: declare xxextractuw and xxinsertw helpers with call flags
  target/ppc: introduce do_va_helper
  target/ppc: declare vmsum[um]bm helpers with call flags
  target/ppc: declare vmsumuh[ms] helper with call flags
  target/ppc: declare vmsumsh[ms] helper with call flags

 target/ppc/fpu_helper.c             |  22 +--
 target/ppc/helper.h                 | 225 ++++++++++++++--------------
 target/ppc/insn32.decode            |  28 +++-
 target/ppc/int_helper.c             |  22 +--
 target/ppc/translate/fp-impl.c.inc  |  30 +++-
 target/ppc/translate/fp-ops.c.inc   |   1 -
 target/ppc/translate/vmx-impl.c.inc |  62 ++++----
 target/ppc/translate/vmx-ops.c.inc  |   4 -
 target/ppc/translate/vsx-impl.c.inc | 107 ++++++++-----
 target/ppc/translate/vsx-ops.c.inc  |   4 -
 10 files changed, 284 insertions(+), 221 deletions(-)

-- 
2.25.1


