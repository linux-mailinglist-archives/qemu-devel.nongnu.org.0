Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8812BDEB9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 15:15:11 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD78Q-0003WY-E2
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 09:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iD6mz-0006a2-67
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iD6my-0004Aq-4W
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16815)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iD6mx-0004Ah-VY; Wed, 25 Sep 2019 08:53:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2BA103C918;
 Wed, 25 Sep 2019 12:52:59 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-14.ams2.redhat.com [10.36.117.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 261306012C;
 Wed, 25 Sep 2019 12:52:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] s390x/mmu: Use TARGET_PAGE_MASK in mmu_translate_pte()
Date: Wed, 25 Sep 2019 14:52:34 +0200
Message-Id: <20190925125236.4043-6-david@redhat.com>
In-Reply-To: <20190925125236.4043-1-david@redhat.com>
References: <20190925125236.4043-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 25 Sep 2019 12:52:59 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While ASCE_ORIGIN is not wrong, it is certainly confusing. We want a
page frame address.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index c9fde78614..20e9c13202 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -126,7 +126,7 @@ static int mmu_translate_pte(CPUS390XState *env, targ=
et_ulong vaddr,
         *flags &=3D ~PAGE_WRITE;
     }
=20
-    *raddr =3D pt_entry & ASCE_ORIGIN;
+    *raddr =3D pt_entry & TARGET_PAGE_MASK;
     return 0;
 }
=20
--=20
2.21.0


