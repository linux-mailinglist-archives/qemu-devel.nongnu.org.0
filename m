Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C75F576A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:27:40 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6J6-0003Mj-LX
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xa-0005of-PX; Wed, 05 Oct 2022 10:38:30 -0400
Received: from [200.168.210.66] (port=55228 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5XY-0004bx-Sv; Wed, 05 Oct 2022 10:38:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 5 Oct 2022 11:37:22 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 776E98002A8;
 Wed,  5 Oct 2022 11:37:21 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH 0/4] Idea for using hardfloat in PPC
Date: Wed,  5 Oct 2022 11:37:15 -0300
Message-Id: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Oct 2022 14:37:22.0218 (UTC)
 FILETIME=[FA9E00A0:01D8D8C7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

As can be seem in the mailing thread that added hardfloat support in
QEMU [1], a requirement for it to work is to have float_flag_inexact
set when entering the API in softfloat.c. However, in the same thread,
it was explained that PPC target would not work by default with this
implementation.
The problem is that PPC has a non-sticky inexact bit (there is a
discussion about it in [2]), meaning that we can't just set the flag
and call the API in softfloat.c, as it would return the same flag set
to 1, and we wouldn't know if it is supposed to be updated on FPSCR or
not.
Over the last couple years, there were attempts to enable hardfpu
for Power, like [3]. But nothing got to master.
[5] shows a suggestion by Yonggang Luo and commentaries by Richard and
Zoltan, about caching the last FP instruction and reexecuting it when
necessary.

This patch set is a proposition on the idea to cache the last FP insn,
to be reexecuted later when the value of FPSCR is to be read by a
program. When executed in hardfloat, the instruction "context" is saved
inside `env`, and is expected to be reexecuted later, in softfloat,
to calculate the correct value of the inexact flag in FPSCR.
The instruction to be cached is the last instruction that changes FI.
If the instructions does not change FI, it keeps the cache intact.
If it changes FI, it caches itself and tries to execute in hardfpu.
It might or might not use hardfloat, but as the inexact flag was
artificially set, it will require to be reexecuted later. 'Later'
means when FPSCR is to be read, like during a call to MFFS, or when
a signal occurs. There are probably other places, e.g. other mffs-like
instructions, but this RFC only addresses these two scenarios.
This is supposed to be more efficient because programs very seldomly
read FPSCR, meaning the amount of reexecutions will be low.

For now, this was implemented and tested for linux-user, no softmmu
work or analysis was done.
I implemented the base code to keep all instructions working with
this new behavior (patch 1), and also implemented two instructions
as an example on what it would be necessary to do for every instruction
to use hardfpu (patches 1 and 2).

My tests with risu and other manual tests showed the behavior seems to
be correct. I tested mainly if FPSCR is the same after using softfloat
or hardfloat.

However, the impact in performance was not the expected. In x86_64 I
had a small 3% improvement, while in a Power9 machine there was a small
performance loss, as can be seem below (100 executions).

|        | min [s] | max [s] | avg [s] |
| before | 122.309 | 123.459 | 122.747 |
| after  | 123.906 | 125.016 | 124.373 |

The test code can be found in [4].

The issue is most likely all the overhead with the caching, which is
negating the improvement from hardfpu execution.

With all that said, could you kindly take a look at my implementation
and see if it can be improved to result in better performance? Is there
any chance to save this idea?

Thank you very much!

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20181124235553.17371-8-cota@braap.org/
[2] https://lists.nongnu.org/archive/html/qemu-ppc/2022-05/msg00246.html
[3] https://patchwork.kernel.org/project/qemu-devel/patch/20200218171702.979F074637D@zero.eik.bme.hu/
[4] https://gist.github.com/vcoracolombo/6ad884a402f1bba531e2e3da7e196656
[5] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html

Víctor Colombo (4):
  target/ppc: prepare instructions to work with caching last FP insn
  target/ppc: Implement instruction caching for fsqrt
  target/ppc: Implement instruction caching for muladd
  fpu/softfloat: Enable hardfpu for ppc target

 fpu/softfloat.c                    |   6 +-
 target/ppc/cpu.h                   |  28 ++++++
 target/ppc/excp_helper.c           |   2 +
 target/ppc/fpu_helper.c            | 132 +++++++++++++++++++++++++++++
 target/ppc/helper.h                |   1 +
 target/ppc/translate/fp-impl.c.inc |   1 +
 6 files changed, 166 insertions(+), 4 deletions(-)

-- 
2.25.1


