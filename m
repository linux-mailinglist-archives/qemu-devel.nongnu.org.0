Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BC1F8318
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 13:22:20 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jk4Es-0005f7-S4
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jk4Dx-00051P-V7
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 07:21:21 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:38382 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jk4Dv-0005LZ-Q2
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 07:21:21 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 851D14C83C;
 Sat, 13 Jun 2020 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1592047275; x=
 1593861676; bh=alsXcJxWknvFuPc/oEcJ3hyIN36XcRR6QP0Aas7G7Cs=; b=s
 AksLQWofu2EMdvsmWBztHW7XAAWHgSIs6d6AHFWTIsRKb6vKibmov397Xfl2NG1S
 sTSiZl7OzZL2r24NPd1CrVnlvXS6QaJGr8JNfjdic/rwPL0X/1S0LaGwHtCTEO1A
 xGP0oLUMTZb46rvP0iUAPE+kIMKPNM0dBh5ofy0GDw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aMpPov6ypGO; Sat, 13 Jun 2020 14:21:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8C29F47D0B;
 Sat, 13 Jun 2020 14:21:14 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 13
 Jun 2020 14:21:14 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <seabios@seabios.org>
Subject: [PATCH] timer: Handle decrements of PIT counter
Date: Sat, 13 Jun 2020 14:19:12 +0300
Message-ID: <20200613111911.65497-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 07:21:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Kevin O'Connor <kevin@koconnor.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a fallback to PIT if TSC is not present but it doesn't work
properly. It prevents boot from floppy on isapc and 486 cpu [1][2].

SeaBIOS configures PIT in Mode 2. PIT counter is decremented in the mode
but timer_adjust_bits() thinks that the counter overflows and increases
32-bit tick counter on each detected "overflow". Invalid overflow
detection results in 55ms time advance (1 / 18.2Hz) on each read from
PIT counter. So all timers expire much faster and 5-second floppy
timeout expires in 83 real microseconds (or just a bit longer).

Provide counter direction to timer_adjust_bits() and normalize the
counter to advance ticks in monotonically increasing TimerLast.

1. https://bugs.launchpad.net/seabios/+bug/1840719
2. https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg03924.html

Fixes: eac11944019 ("Unify pmtimer_read() and pittimer_read() code.")
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Kevin O'Connor <kevin@koconnor.net>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 src/hw/timer.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/src/hw/timer.c b/src/hw/timer.c
index 56bb289..2441402 100644
--- a/src/hw/timer.c
+++ b/src/hw/timer.c
@@ -156,10 +156,15 @@ u32 TimerLast VARLOW;
 
 // Add extra high bits to timers that have less than 32bits of precision.
 static u32
-timer_adjust_bits(u32 value, u32 validbits)
+timer_adjust_bits(u32 value, u32 validbits, u8 countup)
 {
     u32 last = GET_LOW(TimerLast);
-    value = (last & ~validbits) | (value & validbits);
+    u32 validvalue;
+    if (countup)
+        validvalue = value & validbits;
+    else
+        validvalue = validbits - (value & validbits);
+    value = (last & ~validbits) | validvalue;
     if (value < last)
         value += validbits + 1;
     SET_LOW(TimerLast, value);
@@ -176,11 +181,11 @@ timer_read(void)
         return rdtscll() >> GET_GLOBAL(ShiftTSC);
     if (CONFIG_PMTIMER && port != PORT_PIT_COUNTER0)
         // Read from PMTIMER
-        return timer_adjust_bits(inl(port), 0xffffff);
+        return timer_adjust_bits(inl(port), 0xffffff, 1);
     // Read from PIT.
     outb(PM_SEL_READBACK | PM_READ_VALUE | PM_READ_COUNTER0, PORT_PIT_MODE);
     u16 v = inb(PORT_PIT_COUNTER0) | (inb(PORT_PIT_COUNTER0) << 8);
-    return timer_adjust_bits(v, 0xffff);
+    return timer_adjust_bits(v, 0xffff, 0);
 }
 
 // Return the TSC value that is 'msecs' time in the future.
-- 
2.26.1


