Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B6DABE0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 14:21:30 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL4mX-0006oi-F4
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 08:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iL4kh-0005eI-Kv
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iL4ke-0006hi-35
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:19:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iL4kd-0006gn-U7; Thu, 17 Oct 2019 08:19:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1B2051EF6;
 Thu, 17 Oct 2019 12:19:27 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-42.ams2.redhat.com [10.36.117.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2393A5D9CA;
 Thu, 17 Oct 2019 12:19:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] s390x/mmu: Remove duplicate check for MMU_DATA_STORE
Date: Thu, 17 Oct 2019 14:19:22 +0200
Message-Id: <20191017121922.18840-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 17 Oct 2019 12:19:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to double-check if we have a write.

Found by Coverity (CID: 1381016).

Fixes: 31b59419069e ("target/s390x: Return exception from mmu_translate_r=
eal")
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 90b81335f9..c9f3f34750 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -556,9 +556,7 @@ int mmu_translate_real(CPUS390XState *env, target_ulo=
ng raddr, int rw,
         *flags |=3D PAGE_WRITE_INV;
         if (is_low_address(raddr) && rw =3D=3D MMU_DATA_STORE) {
             /* LAP sets bit 56 */
-            *tec =3D (raddr & TARGET_PAGE_MASK)
-                 | (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ)
-                 | 0x80;
+            *tec =3D (raddr & TARGET_PAGE_MASK) | FS_WRITE | 0x80;
             return PGM_PROTECTION;
         }
     }
--=20
2.21.0


