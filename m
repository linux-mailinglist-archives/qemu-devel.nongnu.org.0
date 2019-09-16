Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18347B3C0B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:01:54 +0200 (CEST)
Received: from localhost ([::1]:34517 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9rZf-0004QG-UJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i9rWU-0002iE-R1
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i9rWT-00006J-Qp
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:58:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43373)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i9rWT-00004u-LX; Mon, 16 Sep 2019 09:58:33 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBD3A10F2E89;
 Mon, 16 Sep 2019 13:58:32 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-103.ams2.redhat.com [10.36.117.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A971017E3B;
 Mon, 16 Sep 2019 13:58:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 15:57:38 +0200
Message-Id: <20190916135806.1269-2-david@redhat.com>
In-Reply-To: <20190916135806.1269-1-david@redhat.com>
References: <20190916135806.1269-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 16 Sep 2019 13:58:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 01/29] s390x/tcg: Reset exception_index to
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
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Cole Robinson <crobinso@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use the marker "-1" for "no exception". s390_cpu_do_interrupt() might
get confused by that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


