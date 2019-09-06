Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D34AB3C1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:13:18 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69Mq-00042F-Rm
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i698m-0004FS-Rg
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i698l-0003Wq-F0
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i698l-0003W6-4M; Fri, 06 Sep 2019 03:58:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64E228372F2;
 Fri,  6 Sep 2019 07:58:42 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9B091001955;
 Fri,  6 Sep 2019 07:58:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:41 +0200
Message-Id: <20190906075750.14791-20-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 06 Sep 2019 07:58:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 19/28] s390x/tcg: MVCLU: Fault-safe handling
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

The last remaining bit is padding with two bytes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index f636f3a011..0366cbc753 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -900,15 +900,17 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         access_memset(env, *dest, pad, len, ra);
         *dest =3D wrap_address(env, *dest + len);
     } else {
+        S390Access desta =3D access_prepare(env, *dest, len, MMU_DATA_ST=
ORE, ra);
+
         /* The remaining length selects the padding byte. */
         for (i =3D 0; i < len; (*destlen)--, i++) {
             if (*destlen & 1) {
-                cpu_stb_data_ra(env, *dest, pad, ra);
+                access_set_byte(env, &desta, i, pad, ra);
             } else {
-                cpu_stb_data_ra(env, *dest, pad >> 8, ra);
+                access_set_byte(env, &desta, i, pad >> 8, ra);
             }
-            *dest =3D wrap_address(env, *dest + 1);
         }
+        *dest =3D wrap_address(env, *dest + len);
     }
=20
     return *destlen ? 3 : cc;
--=20
2.21.0


