Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD5B7A4B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:17:11 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAwJ3-00088w-HM
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvse-0006je-Ey
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvl0-00007T-4v
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:41:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2624)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvky-0008TU-6M; Thu, 19 Sep 2019 08:41:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1275AC053B32;
 Thu, 19 Sep 2019 12:41:54 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5A855C21E;
 Thu, 19 Sep 2019 12:41:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:40:49 +0200
Message-Id: <20190919124115.11510-9-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 19 Sep 2019 12:41:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/34] s390x/tcg: MVPG: Properly wrap the
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We have to mask of any unused bits. While at it, document what exactly is
missing.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 7dfa848744a6..746f64730302 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -679,8 +679,15 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r=
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
2.20.1


