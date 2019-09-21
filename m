Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644EB9D63
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 12:18:20 +0200 (CEST)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBcT4-0004TN-Eq
	for lists+qemu-devel@lfdr.de; Sat, 21 Sep 2019 06:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBcS2-0003wb-44
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 06:17:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBcS0-0006J0-Fv
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 06:17:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55782)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iBcS0-0006Ib-Ah; Sat, 21 Sep 2019 06:17:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4401B18C4275;
 Sat, 21 Sep 2019 10:17:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-61.brq.redhat.com [10.40.204.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9DB5C1B5;
 Sat, 21 Sep 2019 10:17:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/ptimer: Assert next_event is newer than last_event
Date: Sat, 21 Sep 2019 12:17:03 +0200
Message-Id: <20190921101703.17935-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Sat, 21 Sep 2019 10:17:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the period is too big, the 'delta * period' product result
might overflow, resulting in a negative number, then the
next_event ends before the last_event. This is buggy, as there
is no forward progress. Assert this can not happen.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/ptimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index d58e2dfdb0..88085d4c81 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -125,6 +125,9 @@ static void ptimer_reload(ptimer_state *s, int delta_=
adjust)
=20
     s->last_event =3D s->next_event;
     s->next_event =3D s->last_event + delta * period;
+    /* Verify forward progress */
+    g_assert(s->next_event > s->last_event);
+
     if (period_frac) {
         s->next_event +=3D ((int64_t)period_frac * delta) >> 32;
     }
--=20
2.20.1


