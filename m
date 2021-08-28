Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78F3FA6C6
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 18:22:10 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK15j-0005B4-IJ
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s101062801@m101.nthu.edu.tw>)
 id 1mK0Xv-0005Jn-No; Sat, 28 Aug 2021 11:47:03 -0400
Received: from smtp63-1.net.nthu.edu.tw ([140.114.63.55]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s101062801@m101.nthu.edu.tw>)
 id 1mK0Xr-0001K1-Rf; Sat, 28 Aug 2021 11:47:02 -0400
Received: from m101-mail.nthu.edu.tw (m101-mail-2.nthu.edu.tw [140.114.62.15])
 by smtp63-1.net.nthu.edu.tw (Postfix) with ESMTP id 19E7C1B27E;
 Sat, 28 Aug 2021 23:46:42 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 28 Aug 2021 23:46:42 +0800
From: s101062801 <s101062801@m101.nthu.edu.tw>
To: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/sifive_clint: Fix expiration time logic
In-Reply-To: <aa466b05545e360b9a96249a659c5d1e@m101.nthu.edu.tw>
References: mid:9 <aa466b05545e360b9a96249a659c5d1e@m101.nthu.edu.tw>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <e7340f10bfbab7bead0a045aa9ae09f7@m101.nthu.edu.tw>
X-Sender: s101062801@m101.nthu.edu.tw
Received-SPF: pass client-ip=140.114.63.55;
 envelope-from=s101062801@m101.nthu.edu.tw; helo=smtp63-1.net.nthu.edu.tw
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 28 Aug 2021 12:18:33 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After timecmp is modified, the value is converted into nanosecond,
and pass to timer_mod.  However, timer_mod perceives the value as
a signed integer.  An example that goes wrong is as follows:

OpenSBI v0.9 initializes the cold boot hart's timecmp to
0xffffffff_ffffffff.  timer_mod then interprets the product of the
following calculation as a negative value.  As a result, the clint
timer is pulled out of timerlist because it looks like it has
expired, which cause the MIP.MTIP is set before any real timer
interrupt.

Signed-off-by: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
---
  hw/intc/sifive_clint.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..78f01d17d3 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -44,6 +44,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, 
uint64_t value,
  {
      uint64_t next;
      uint64_t diff;
+    uint64_t now;

      uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);

@@ -59,9 +60,11 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, 
uint64_t value,
      riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
      diff = cpu->env.timecmp - rtc_r;
      /* back to ns (note args switched in muldiv64) */
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
-    timer_mod(cpu->env.timer, next);
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    next = next + muldiv64(diff, NANOSECONDS_PER_SECOND, 
timebase_freq);
+    timer_mod(cpu->env.timer, (next <= now) ?
+                              (int64_t)((1ULL << 63) - 1) :
+                              next);
  }

  /*
--
2.32.0

