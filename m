Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD74E9EC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 15:51:27 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJwt-000196-5f
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 09:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1heJpa-0007H6-Ft
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1heJpZ-0003lr-HF
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:43:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1heJpX-0003gP-QJ; Fri, 21 Jun 2019 09:43:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2EDD859FC;
 Fri, 21 Jun 2019 13:43:50 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D565C543;
 Fri, 21 Jun 2019 13:43:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 15:43:36 +0200
Message-Id: <20190621134338.8425-2-david@redhat.com>
In-Reply-To: <20190621134338.8425-1-david@redhat.com>
References: <20190621134338.8425-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 21 Jun 2019 13:43:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 1/3] tests/tcg/s390x: Fix
 alignment of csst parameter list
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
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The parameter list given in general register 1 shall be aligned
on a quadword boundary.  This test currently succeeds or fails
depending on the compiler version used and the accidential layout
of the function's stack frame.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tests/tcg/s390x/csst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/s390x/csst.c b/tests/tcg/s390x/csst.c
index 1dae9071fb..084d80af49 100644
--- a/tests/tcg/s390x/csst.c
+++ b/tests/tcg/s390x/csst.c
@@ -3,7 +3,7 @@
=20
 int main(void)
 {
-    uint64_t parmlist[] =3D {
+    uint64_t parmlist[] __attribute__((aligned(16))) =3D {
         0xfedcba9876543210ull,
         0,
         0x7777777777777777ull,
--=20
2.21.0


