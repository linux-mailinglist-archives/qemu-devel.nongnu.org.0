Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FA5E8527
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:54:13 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqcd-000386-U3
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqWj-0005Xs-Tp; Fri, 23 Sep 2022 17:48:17 -0400
Received: from [200.168.210.66] (port=10149 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqWg-0006TY-3M; Fri, 23 Sep 2022 17:48:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 23 Sep 2022 18:47:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 792308000B4;
 Fri, 23 Sep 2022 18:47:56 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PATCH 00/12] VMX/VSX instructions with gvec
Date: Fri, 23 Sep 2022 18:47:42 -0300
Message-Id: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Sep 2022 21:47:56.0718 (UTC)
 FILETIME=[2438DCE0:01D8CF96]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch series moves some instructions from decode legacy to
decodetree and translate said instructions with gvec. Some cases using
gvec ended up with a bigger, more complex and slower so those
instructions were only moved to decodetree.

In each patch there's a comparison of the execution time before the
patch being applied and after. Said result is the sum of 10 executions.

The program used to time the execution worked like this:

clock_t start = clock();
for (int i = 0; i < LOOP; i++) {
    asm (
         load values in registers, between 2 and 3 instructions
         ".rept REPT\n\t"
         "INSTRUCTION registers\n\t"
         ".endr\n\t"
         save result from register, 1 instruction
    );
}
clock_t end = clock();
printf("INSTRUCTION rept=REPT loop=LOOP, time taken: %.12lf\n",
       ((double)(end - start))/ CLOCKS_PER_SEC);

Where the column rept in the value used in .rept in the inline assembly
and loop column is the value used for the for loop. All of those tests
were executed on a Power9. When comparing the TCGop the data used was
gathered using '-d op' and '-d op_opt'.

Lucas Mateus Castro (alqotel) (12):
  target/ppc: Moved VMLADDUHM to decodetree and use gvec
  target/ppc: Move VMH[R]ADDSHS instruction to decodetree
  target/ppc: Move V(ADD|SUB)CUW to decodetree and use gvec
  target/ppc: Move VNEG[WD] to decodtree and use gvec
  target/ppc: Move VPRTYB[WDQ] to decodetree and use gvec
  target/ppc: Move VAVG to decodetree and use gvec
  target/ppc: Move VABSDU to decodetree and use gvec
  target/ppc: Use gvec to decode XV[N]ABS[DS]P/XVNEG[DS]P
  target/ppc: Use gvec to decode XVCPSNG[SD]P
  target/ppc: Moved XVTSTDC[DS]P to decodetree
  target/ppc: Moved XSTSTDC[QDS]P to decodetree
  target/ppc: Use gvec to decode XVTSTDC[DS]P

 target/ppc/fpu_helper.c             | 137 ++++++------
 target/ppc/helper.h                 |  46 ++--
 target/ppc/insn32.decode            |  50 +++++
 target/ppc/int_helper.c             |  74 +++----
 target/ppc/translate.c              |   1 -
 target/ppc/translate/vmx-impl.c.inc | 333 ++++++++++++++++++++++++----
 target/ppc/translate/vmx-ops.c.inc  |  15 +-
 target/ppc/translate/vsx-impl.c.inc | 305 +++++++++++++++++++------
 target/ppc/translate/vsx-ops.c.inc  |  21 --
 9 files changed, 693 insertions(+), 289 deletions(-)

-- 
2.31.1


