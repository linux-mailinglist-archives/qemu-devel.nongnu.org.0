Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED66AB397
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:00:33 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69AV-00053G-TU
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i6984-0003Ji-Mj
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i6983-0002av-JC
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i6983-0002aG-Cp; Fri, 06 Sep 2019 03:57:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B110F3175284;
 Fri,  6 Sep 2019 07:57:58 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC61E1001955;
 Fri,  6 Sep 2019 07:57:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:23 +0200
Message-Id: <20190906075750.14791-2-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 06 Sep 2019 07:57:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 01/28] s390x/tcg: Reset exception_index to
 -1 instead of 0
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use the marker "-1" for "no exception". s390_cpu_do_interrupt() might
get confused by that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 29fcce426e..39ee9b3175 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1747,7 +1747,7 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t=
 a1, uint64_t a2)
=20
     if (env->int_pgm_code =3D=3D PGM_PROTECTION) {
         /* retry if reading is possible */
-        cs->exception_index =3D 0;
+        cs->exception_index =3D -1;
         if (!s390_cpu_virt_mem_check_read(cpu, a1, 0, 1)) {
             /* Fetching permitted; storing not permitted */
             return 1;
@@ -1757,7 +1757,7 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t=
 a1, uint64_t a2)
     switch (env->int_pgm_code) {
     case PGM_PROTECTION:
         /* Fetching not permitted; storing not permitted */
-        cs->exception_index =3D 0;
+        cs->exception_index =3D -1;
         return 2;
     case PGM_ADDRESSING:
     case PGM_TRANS_SPEC:
@@ -1767,7 +1767,7 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t=
 a1, uint64_t a2)
     }
=20
     /* Translation not available */
-    cs->exception_index =3D 0;
+    cs->exception_index =3D -1;
     return 3;
 }
=20
--=20
2.21.0


