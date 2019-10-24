Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C6E335E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 15:04:12 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNcmg-0006ZY-8x
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 09:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNcAZ-0005sP-C0
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNcAY-0007LC-7Y
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:24:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60228
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNcAX-0007I5-0h
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2utYbP8AC9yOvhW0OqipUpdPxpmjRzyro5emZo5Syk=;
 b=Qfpyh/jb/KyxWiUPQOfl/OZ6LMRnoRGyh92jgydFpTVtr1lcNf3KQSmwzxxGLpn/nYqmOp
 iDuepPiHCbRq22duTMHJQS4WOOC1pY8fjQAvCkAu3zNqdpKy35p1JeeHXqOF0rCcy/J105
 XG9oQwAquHjzVCN5ZQ0P+FPVUCPynEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-ywoUXk6xObmkhkStwZv-zA-1; Thu, 24 Oct 2019 08:24:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CF0C1005500;
 Thu, 24 Oct 2019 12:24:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-184.brq.redhat.com [10.40.204.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED4B60BAC;
 Thu, 24 Oct 2019 12:24:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] mc146818rtc: Simplify by reordering if() statement
Date: Thu, 24 Oct 2019 14:24:23 +0200
Message-Id: <20191024122425.2483-2-philmd@redhat.com>
In-Reply-To: <20191024122425.2483-1-philmd@redhat.com>
References: <20191024122425.2483-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ywoUXk6xObmkhkStwZv-zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Xiao Guangrong <guangrong.xiao@gmail.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the if() statement, so further changes in this function
will be easier to read.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/mc146818rtc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 6cb378751b..2b6371faac 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -203,7 +203,12 @@ periodic_timer_update(RTCState *s, int64_t current_tim=
e, uint32_t old_period)
=20
     period =3D rtc_periodic_clock_ticks(s);
=20
-    if (period) {
+    if (!period) {
+        s->irq_coalesced =3D 0;
+        timer_del(s->periodic_timer);
+        return;
+    }
+
         /* compute 32 khz clock */
         cur_clock =3D
             muldiv64(current_time, RTC_CLOCK_RATE, NANOSECONDS_PER_SECOND)=
;
@@ -263,10 +268,6 @@ periodic_timer_update(RTCState *s, int64_t current_tim=
e, uint32_t old_period)
         next_irq_clock =3D cur_clock + period - lost_clock;
         s->next_periodic_time =3D periodic_clock_to_ns(next_irq_clock) + 1=
;
         timer_mod(s->periodic_timer, s->next_periodic_time);
-    } else {
-        s->irq_coalesced =3D 0;
-        timer_del(s->periodic_timer);
-    }
 }
=20
 static void rtc_periodic_timer(void *opaque)
--=20
2.21.0


