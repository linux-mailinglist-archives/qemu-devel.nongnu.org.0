Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC828EE188
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 14:51:35 +0100 (CET)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRcla-0006zu-AK
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 08:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=204c4f724=graf@amazon.de>) id 1iRaua-0006d2-1T
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 06:52:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=204c4f724=graf@amazon.de>) id 1iRauZ-00049A-2m
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 06:52:43 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:28429)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=204c4f724=graf@amazon.de>)
 id 1iRauW-00046h-QM; Mon, 04 Nov 2019 06:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1572868361; x=1604404361;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=GCPYjmUDKPjzEsKoGBxiddFyuLgCMT/rxM1sQVxsGs8=;
 b=mqJq1Hsa4jO7kWoV7nQceGLujLq5M5TuNhA146AKE9m4wFw/PnJvX7tv
 c/K/3z1HSMTBC68NwolpyBqqYWybaGkNmk+kc6WBRvFtVIhRclD7Bz+HL
 MMT3hRABNzoFJVw/57O765Q7S6nmxboS94q0euvCXHjS/NGWShARldTZr Q=;
IronPort-SDR: 7Kz8+dXMdacXqmT+trIiQ7tchKOg6F86qoR6nzDnu2/97AoMFPEeCXbXS0VZLddgfPreTAi8IZ
 r298VJLYe0eQ==
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Nov 2019 11:52:39 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 14615A2872; Mon,  4 Nov 2019 11:52:38 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 11:52:37 +0000
Received: from u79c5a0a55de558.ant.amazon.com (10.43.161.77) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 11:52:36 +0000
From: Alexander Graf <graf@amazon.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Hendrik Borghorst
 <hborghor@amazon.de>
Subject: [PATCH] pl031: Expose RTCICR as proper WC register
Date: Mon, 4 Nov 2019 12:52:28 +0100
Message-ID: <20191104115228.30745-1-graf@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.77]
X-ClientProxiedBy: EX13D06UWC002.ant.amazon.com (10.43.162.205) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.49.90
X-Mailman-Approved-At: Mon, 04 Nov 2019 08:49:53 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The current pl031 RTCICR register implementation always clears the IRQ
pending status on a register write, regardless of the value it writes.

To justify that behavior, it references the arm926e documentation
(DDI0287B) and indicates that said document states that any write clears
the internal IRQ state. I could however not find any text in that document
backing the statement. In fact, it explicitly says:

  "Writing 1 to bit 0 of RTCICR clears the RTCINTR flag."

which describes it as much as a write-to-clear register as the PL031 spec
(DDI0224) does:

  "Writing 1 to bit position 0 clears the corresponding interrupt.
   Writing 0 has no effect."

Let's remove the bogus comment and instead follow both specs to what they
say.

Reported-by: Hendrik Borghorst <hborghor@amazon.de>
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 hw/rtc/pl031.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 3a982752a2..c57cf83165 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -149,11 +149,7 @@ static void pl031_write(void * opaque, hwaddr offset,
         pl031_update(s);
         break;
     case RTC_ICR:
-        /* The PL031 documentation (DDI0224B) states that the interrupt is
-           cleared when bit 0 of the written value is set.  However the
-           arm926e documentation (DDI0287B) states that the interrupt is
-           cleared when any value is written.  */
-        s->is = 0;
+        s->is &= ~value;
         pl031_update(s);
         break;
     case RTC_CR:
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




