Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0F199759
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 15:23:51 +0200 (CEST)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJGru-0001Xh-0e
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 09:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jJGq6-0000Dn-9y
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jJGq4-0005f2-Ov
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:21:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51286
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jJGq4-0005eT-L5
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585660915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBpdFRO5rJLxNzdJEGO4mRvZn0CjlnODLs22OFn9v5M=;
 b=euU3SIy9NL2CebxGz8cIibVkjNe3SjBS8xxYXBJIvcib+Rrr4u5xpSF37SVDGy61yGJzzk
 1mRT12iP3CqP6UUz2cpBDf3uvEFuKWXCLBqfd2T+MrPKKTYFGulHwFfWLySp/TjhrGBN66
 2fqJIpQ5+PEIrrhs2SluxrHkge8Uqw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-zA7sR0JSPBy_C_IDipAI3g-1; Tue, 31 Mar 2020 09:21:53 -0400
X-MC-Unique: zA7sR0JSPBy_C_IDipAI3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9531F18FE861;
 Tue, 31 Mar 2020 13:21:52 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-118.pek2.redhat.com
 [10.72.12.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE37D10002BC;
 Tue, 31 Mar 2020 13:21:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 01/14] hw/net/i82596: Correct command bitmask (CID 1419392)
Date: Tue, 31 Mar 2020 21:21:26 +0800
Message-Id: <1585660899-11228-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1585660899-11228-1-git-send-email-jasowang@redhat.com>
References: <1585660899-11228-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The command is 32-bit, but we are loading the 16 upper bits with
the 'get_uint16(s->scb + 2)' call.

Once shifted by 16, the command bits match the status bits:

- Command
  Bit 31 ACK-CX   Acknowledges that the CU completed an Action Command.
  Bit 30 ACK-FR   Acknowledges that the RU received a frame.
  Bit 29 ACK-CNA  Acknowledges that the Command Unit became not active.
  Bit 28 ACK-RNR  Acknowledges that the Receive Unit became not ready.

- Status
  Bit 15 CX       The CU finished executing a command with its I(interrupt)=
 bit set.
  Bit 14 FR       The RU finished receiving a frame.
  Bit 13 CNA      The Command Unit left the Active state.
  Bit 12 RNR      The Receive Unit left the Ready state.

Add the SCB_COMMAND_ACK_MASK definition to simplify the code.

This fixes Coverity 1419392 (CONSTANT_EXPRESSION_RESULT):

  /hw/net/i82596.c: 352 in examine_scb()
  346         cuc =3D (command >> 8) & 0x7;
  347         ruc =3D (command >> 4) & 0x7;
  348         DBG(printf("MAIN COMMAND %04x  cuc %02x ruc %02x\n", command,=
 cuc, ruc));
  349         /* and clear the scb command word */
  350         set_uint16(s->scb + 2, 0);
  351
  >>>     CID 1419392:    (CONSTANT_EXPRESSION_RESULT)
  >>>     "command & (2147483648UL /* 1UL << 31 */)" is always 0 regardless=
 of the values of its operands. This occurs as the logical operand of "if".
  352         if (command & BIT(31))      /* ACK-CX */
  353             s->scb_status &=3D ~SCB_STATUS_CX;
  >>>     CID 1419392:    (CONSTANT_EXPRESSION_RESULT)
  >>>     "command & (1073741824UL /* 1UL << 30 */)" is always 0 regardless=
 of the values of its operands. This occurs as the logical operand of "if".
  354         if (command & BIT(30))      /*ACK-FR */
  355             s->scb_status &=3D ~SCB_STATUS_FR;
  >>>     CID 1419392:    (CONSTANT_EXPRESSION_RESULT)
  >>>     "command & (536870912UL /* 1UL << 29 */)" is always 0 regardless =
of the values of its operands. This occurs as the logical operand of "if".
  356         if (command & BIT(29))      /*ACK-CNA */
  357             s->scb_status &=3D ~SCB_STATUS_CNA;
  >>>     CID 1419392:    (CONSTANT_EXPRESSION_RESULT)
  >>>     "command & (268435456UL /* 1UL << 28 */)" is always 0 regardless =
of the values of its operands. This occurs as the logical operand of "if".
  358         if (command & BIT(28))      /*ACK-RNR */
  359             s->scb_status &=3D ~SCB_STATUS_RNR;

Fixes: Covertiy CID 1419392 (commit 376b851909)
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/i82596.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index fe9f239..ecdb9aa 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -43,6 +43,9 @@
 #define SCB_STATUS_CNA  0x2000 /* CU left active state */
 #define SCB_STATUS_RNR  0x1000 /* RU left active state */
=20
+#define SCB_COMMAND_ACK_MASK \
+        (SCB_STATUS_CX | SCB_STATUS_FR | SCB_STATUS_CNA | SCB_STATUS_RNR)
+
 #define CU_IDLE         0
 #define CU_SUSPENDED    1
 #define CU_ACTIVE       2
@@ -348,14 +351,7 @@ static void examine_scb(I82596State *s)
     /* and clear the scb command word */
     set_uint16(s->scb + 2, 0);
=20
-    if (command & BIT(31))      /* ACK-CX */
-        s->scb_status &=3D ~SCB_STATUS_CX;
-    if (command & BIT(30))      /*ACK-FR */
-        s->scb_status &=3D ~SCB_STATUS_FR;
-    if (command & BIT(29))      /*ACK-CNA */
-        s->scb_status &=3D ~SCB_STATUS_CNA;
-    if (command & BIT(28))      /*ACK-RNR */
-        s->scb_status &=3D ~SCB_STATUS_RNR;
+    s->scb_status &=3D ~(command & SCB_COMMAND_ACK_MASK);
=20
     switch (cuc) {
     case 0:     /* no change */
--=20
2.5.0


