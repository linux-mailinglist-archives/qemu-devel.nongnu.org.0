Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3760E903
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:31:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onm34-0003PG-I1; Wed, 26 Oct 2022 15:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm30-0001mV-3p; Wed, 26 Oct 2022 15:26:42 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm2w-0003oy-Uj; Wed, 26 Oct 2022 15:26:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 26 Oct 2022 16:26:32 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CDE168001F1;
 Wed, 26 Oct 2022 16:26:31 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH v2 0/5] Idea for using hardfloat in PPC
Date: Wed, 26 Oct 2022 16:25:43 -0300
Message-Id: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2022 19:26:32.0358 (UTC)
 FILETIME=[DAC80460:01D8E970]
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
this new behavior (patch 1), and also implemented some instructions
as an example on what it would be necessary to do for every instruction
to use hardfpu (patches 2, 3 and 4).

My tests with risu and other manual tests showed the behavior seems to
be correct. I tested mainly if FPSCR is the same after using softfloat
or hardfloat.

On the v1 of this RFC I reported a performance regression with the
implementation. However, the test I crafted [4] was supposed to be a
mix of many hardfloats and some softfloat fallbacks (instructions
fallback to softfloat in special cases, like e.g. negative argument
for sqrt). What actually was happening was that there was a huge amount
of fallbacks and not many hardfloats actually happening. The expected
'normal scenario' is to have a lot of valid, 'happy path' instructions
that can use hardfloat.
So, what I did for v2 is to create two tests, one that would hit 100%
hardfloat, and one that would fallback 100% to softfloat. I present
the results below. The tests are not comparable, neither the new ones
or the previous one from v1. So they are supposed to be analyzed
uniquely.

100% hardfloat (1:1 mix of fsqrt and fmadd) [6]
|                | min [s] | max [s] | avg [s] |
| before (master)| 30.731 | 31.420   | 31.186  |
| after changes  | 20.860 | 21.100   | 20.989  |
(approx. 1.5x speedup)

100% softfloat (1:1 mix of fsqrt and fmadd) [7]
|                | min [s] | max [s] | avg [s] |
| before (master)| 22.684  | 23.152   | 22.868  |
| after changes  | 25.098  | 25.397   | 25.281  |
(approx 0.9x of old performance)

This is way better than what I previously reported, and is a result
that might justify going forward with this idea. The only problem
is the performance impact when hardfloat cannot be used. I expect
that most real-life use cases will hit hardfloat almost 100% of the
time, so this might not be a big issue. Opinions on this?

You can see that I actually added a new commit to this RFC,
implementing the idea also for add, sub, mul, and div. I tested the old
test with this new commit, and the result was not better. So the new
patch was not responsible for the performance gain, the test itself
was bad.

As I did not test the code in softmmu or bsd-user (does bsd-user work
for PPC?), I added some build time checks to only enable this RFC for
linux-user. I'm pretty confident that making this work for softmmu will
need changes in other places in the code. But I'm focusing on linux-
user for now.

Thank you very much!

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20181124235553.17371-8-cota@braap.org/
[2] https://lists.nongnu.org/archive/html/qemu-ppc/2022-05/msg00246.html
[3] https://patchwork.kernel.org/project/qemu-devel/patch/20200218171702.979F074637D@zero.eik.bme.hu/
[4] https://gist.github.com/vcoracolombo/6ad884a402f1bba531e2e3da7e196656
[5] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html
[6] https://gist.github.com/vcoracolombo/f0d8b7c9f1cb63dac6ff0221209ec4ff
[7] https://gist.github.com/vcoracolombo/4b592644517c0efb3854872a4b30f6cc

Víctor Colombo (5):
  target/ppc: prepare instructions to work with caching last FP insn
  target/ppc: Implement instruction caching for fsqrt
  target/ppc: Implement instruction caching for muladd
  target/ppc: Implement instruction caching for add/sub/mul/div
  target/ppc: Enable hardfpu for Power

 fpu/softfloat.c                    |  10 +-
 target/ppc/cpu.h                   |  37 ++++++
 target/ppc/excp_helper.c           |   2 +
 target/ppc/fpu_helper.c            | 186 +++++++++++++++++++++++++++++
 target/ppc/helper.h                |   1 +
 target/ppc/translate/fp-impl.c.inc |   1 +
 6 files changed, 233 insertions(+), 4 deletions(-)

-- 
2.25.1


