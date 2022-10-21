Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA2607EC2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:11:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxNK-0003Km-DR; Fri, 21 Oct 2022 15:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvOv-0004Nr-Rk; Fri, 21 Oct 2022 13:01:41 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvOt-0002Fr-75; Fri, 21 Oct 2022 13:01:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 14:01:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D4A338001F1;
 Fri, 21 Oct 2022 14:01:32 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 0/3] Performance optimizations for PPC64
Date: Fri, 21 Oct 2022 14:01:09 -0300
Message-Id: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Oct 2022 17:01:33.0361 (UTC)
 FILETIME=[C5B5AA10:01D8E56E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
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

This patch series contains 2 performance optimizations that
target PPC64, although the first one also benefits other archs.

In the first optimization, the check for empty breakpoints' queue
is moved out of check_for_breakpoints(), into a macro, to avoid
the call overhead.

In the second optimization, the most frequently executed part of
the code that updates the PMCs is translated to inline TCG ops.
Also, new HFLAGS are introduced, to keep the inline code small and fast.

With both optimizations, a reduction of about 15% in Fedora's boot time
was measured on a POWER9 machine.

The PMU tests from kernel selftests were run and all tests that pass on
master still pass with these changes.

Leandro Lupori (3):
  accel/tcg: Add a quicker check for breakpoints
  target/ppc: Add new PMC HFLAGS
  target/ppc: Increment PMC5 with inline insns

 accel/tcg/cpu-exec.c     | 13 +++----
 target/ppc/cpu.h         |  4 ++-
 target/ppc/helper.h      |  1 +
 target/ppc/helper_regs.c |  6 ++++
 target/ppc/power8-pmu.c  | 74 +++++++++++++++++++++-------------------
 target/ppc/power8-pmu.h  |  3 ++
 target/ppc/translate.c   | 32 +++++++++++++++--
 7 files changed, 87 insertions(+), 46 deletions(-)

-- 
2.25.1


