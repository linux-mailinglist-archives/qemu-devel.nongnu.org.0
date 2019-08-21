Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED997604
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:32 +0200 (CEST)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Mrz-0008S4-FA
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 05:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i0MpZ-000697-KH
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 05:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i0MpY-0001AF-Kq
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 05:23:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i0MpY-0001A3-FN; Wed, 21 Aug 2019 05:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B191889F38E;
 Wed, 21 Aug 2019 09:22:59 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00D7D5C686;
 Wed, 21 Aug 2019 09:22:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 11:22:49 +0200
Message-Id: <20190821092252.26541-2-david@redhat.com>
In-Reply-To: <20190821092252.26541-1-david@redhat.com>
References: <20190821092252.26541-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 21 Aug 2019 09:22:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 1/4] s390x/tcg: Use guest_addr_valid()
 instead of h2g_valid() in probe_write_access()
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

If I'm not completely wrong, we are dealing with guest addresses here
and not with host addresses. Use the right check.

Fixes: c5a7392cfb96 ("s390x/tcg: Provide probe_write_access helper")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 91ba2e03d9..7819aca15d 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -2616,7 +2616,7 @@ void probe_write_access(CPUS390XState *env, uint64_=
t addr, uint64_t len,
                         uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    if (!h2g_valid(addr) || !h2g_valid(addr + len - 1) ||
+    if (!guest_addr_valid(addr) || !guest_addr_valid(addr + len - 1) ||
         page_check_range(addr, len, PAGE_WRITE) < 0) {
         s390_program_interrupt(env, PGM_ADDRESSING, ILEN_AUTO, ra);
     }
--=20
2.21.0


