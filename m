Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAEB7A48
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:16:03 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAwHx-00073O-Rs
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsW-0006i8-VI
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvlm-0001J6-4H
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:42:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvll-0001I6-VP; Thu, 19 Sep 2019 08:42:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DB4C18C8900;
 Thu, 19 Sep 2019 12:42:45 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EE665D9CD;
 Thu, 19 Sep 2019 12:42:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:41:01 +0200
Message-Id: <20190919124115.11510-21-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 19 Sep 2019 12:42:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 20/34] s390x/tcg: MVCLU: Fault-safe handling
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

The last remaining bit is padding with two bytes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index abb9d4d70c58..853b9557cf26 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -919,15 +919,17 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         access_memset(env, &desta, pad, ra);
         *dest =3D wrap_address(env, *dest + len);
     } else {
+        desta =3D access_prepare(env, *dest, len, MMU_DATA_STORE, mmu_id=
x, ra);
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
2.20.1


