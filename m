Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F4BAF35
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:20:23 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJa1-0003kN-MX
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJNr-00020Z-PW
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJNq-00046g-NL
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJNq-00046U-Hu; Mon, 23 Sep 2019 04:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D3005A2668A;
 Mon, 23 Sep 2019 08:07:45 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CDEC19C78;
 Mon, 23 Sep 2019 08:07:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/30] s390x/tcg: MVCS/MVCP: Properly wrap the length
Date: Mon, 23 Sep 2019 10:06:54 +0200
Message-Id: <20190923080712.23951-13-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 23 Sep 2019 08:07:45 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... and don't perform any move in case the length is zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 320e9ee65c..41d7336a1a 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1980,10 +1980,13 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_=
t l, uint64_t a1, uint64_t a2)
         s390_program_interrupt(env, PGM_SPECIAL_OP, ILEN_AUTO, ra);
     }
=20
+    l =3D wrap_length32(env, l);
     if (l > 256) {
         /* max 256 */
         l =3D 256;
         cc =3D 3;
+    } else if (!l) {
+        return cc;
     }
=20
     /* XXX replace w/ memcpy */
@@ -2009,10 +2012,13 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_=
t l, uint64_t a1, uint64_t a2)
         s390_program_interrupt(env, PGM_SPECIAL_OP, ILEN_AUTO, ra);
     }
=20
+    l =3D wrap_length32(env, l);
     if (l > 256) {
         /* max 256 */
         l =3D 256;
         cc =3D 3;
+    } else if (!l) {
+        return cc;
     }
=20
     /* XXX replace w/ memcpy */
--=20
2.21.0


