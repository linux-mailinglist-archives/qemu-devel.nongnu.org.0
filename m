Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FDA5634B0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:50:48 +0200 (CEST)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7H2k-0005J2-Vs
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7Gou-00034S-CL; Fri, 01 Jul 2022 09:36:29 -0400
Received: from [200.168.210.66] (port=50439 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7Gos-0006Vs-4n; Fri, 01 Jul 2022 09:36:27 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 1 Jul 2022 10:35:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 09D1080023A;
 Fri,  1 Jul 2022 10:35:12 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH RESEND 00/11] target/ppc: Implement slbiag move slb* to
 decodetree
Date: Fri,  1 Jul 2022 10:34:56 -0300
Message-Id: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jul 2022 13:35:12.0440 (UTC)
 FILETIME=[63D70B80:01D88D4F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.coutinho@eldorado.org.br; helo=outlook.eldorado.org.br
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

Resent after rebasing and fixing conflicts with master.
Add Leandro Lupori as reviewer.

Based-on: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>

Implement the following PowerISA v3.0 instuction:
slbiag: SLB Invalidate All Global X-form

Move the following PowerISA v3.0 instuction to decodetree:
slbie: SLB Invalidate Entry X-form
slbieg: SLB Invalidate Entry Global X-form
slbia: SLB Invalidate All X-form
slbmte: SLB Move To Entry X-form
slbmfev: SLB Move From Entry VSID X-form
slbmfee: SLB Move From Entry ESID X-form
slbfee: SLB Find Entry ESID
slbsync: SLB Synchronize

Lucas Coutinho (9):
  target/ppc: Move slbie to decodetree
  target/ppc: Move slbieg to decodetree
  target/ppc: Move slbia to decodetree
  target/ppc: Move slbmte to decodetree
  target/ppc: Move slbmfev to decodetree
  target/ppc: Move slbmfee to decodetree
  target/ppc: Move slbfee to decodetree
  target/ppc: Move slbsync to decodetree
  target/ppc: Implement slbiag

Matheus Ferst (2):
  target/ppc: receive DisasContext explicitly in GEN_PRIV
  target/ppc: add macros to check privilege level

 target/ppc/helper.h                          |  15 +-
 target/ppc/insn32.decode                     |  26 ++
 target/ppc/mmu-hash64.c                      |  41 +-
 target/ppc/translate.c                       | 417 +++++++------------
 target/ppc/translate/fixedpoint-impl.c.inc   |   7 +-
 target/ppc/translate/fp-impl.c.inc           |   4 +-
 target/ppc/translate/storage-ctrl-impl.c.inc | 146 +++++++
 7 files changed, 377 insertions(+), 279 deletions(-)

-- 
2.25.1


