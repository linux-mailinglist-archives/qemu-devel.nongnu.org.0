Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BB89D06
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 13:29:54 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx8WQ-0000H9-1m
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 07:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hx8UX-0004PZ-Dl
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:27:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hx8UW-0002XZ-Fb
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:27:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hx8UW-0002XB-AO; Mon, 12 Aug 2019 07:27:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93360C059758;
 Mon, 12 Aug 2019 11:27:55 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-110.ams2.redhat.com [10.36.117.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8BD600C4;
 Mon, 12 Aug 2019 11:27:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 13:27:34 +0200
Message-Id: <20190812112737.6652-4-david@redhat.com>
In-Reply-To: <20190812112737.6652-1-david@redhat.com>
References: <20190812112737.6652-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 12 Aug 2019 11:27:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.2 v1 3/6] s390x/tcg: Flush the TLB of all
 CPUs on SSKE and RRBE
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

Whenever we modify a storage key, we shuld flush the TLBs of all CPUs,
so the MMU fault handling code can properly consider the changed storage
key (to e.g., properly set the reference and change bit on the next
accesses).

These functions are barely used in modern Linux guests, so the performanc=
e
implications are neglectable for now.

This is a preparation for better reference and change bit handling for
TCG, which will require more MMU changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 29d9eaa5b7..ed54265e03 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1815,6 +1815,8 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, =
uint64_t r2)
=20
     key =3D (uint8_t) r1;
     skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    /* TODO: Flush only entries with this target address */
+    tlb_flush_all_cpus_synced(env_cpu(env));
 }
=20
 /* reset reference bit extended */
@@ -1843,6 +1845,8 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t =
r2)
     if (skeyclass->set_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
         return 0;
     }
+    /* TODO: Flush only entries with this target address */
+    tlb_flush_all_cpus_synced(env_cpu(env));
=20
     /*
      * cc
--=20
2.21.0


