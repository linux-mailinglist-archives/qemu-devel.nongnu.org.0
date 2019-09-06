Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9FEAB39C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:01:11 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69B7-0005eb-Dm
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i698O-0003jC-GI
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i698N-00039M-GI
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27743)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i698N-00038D-AV; Fri, 06 Sep 2019 03:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A13BC308FC20;
 Fri,  6 Sep 2019 07:58:18 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 301021001B00;
 Fri,  6 Sep 2019 07:58:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:30 +0200
Message-Id: <20190906075750.14791-9-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 06 Sep 2019 07:58:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 08/28] s390x/tcg: MVPG: Properly wrap the
 addresses
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

We have to mask of any unused bits. While at it, document what exactly is
missing.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index a763482ae0..947a4277f0 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -680,8 +680,15 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r=
0, uint64_t r1, uint64_t r2)
         s390_program_interrupt(env, PGM_SPECIFICATION, ILEN_AUTO, GETPC(=
));
     }
=20
-    /* ??? missing r0 handling, which includes access keys, but more
-       importantly optional suppression of the exception!  */
+    r1 =3D wrap_address(env, r1 & TARGET_PAGE_MASK);
+    r2 =3D wrap_address(env, r2 & TARGET_PAGE_MASK);
+
+    /*
+     * TODO:
+     * - Access key handling
+     * - CC-option with surpression of page-translation exceptions
+     * - Store r1/r2 register identifiers at real location 162
+     */
     fast_memmove(env, r1, r2, TARGET_PAGE_SIZE, GETPC());
     return 0; /* data moved */
 }
--=20
2.21.0


