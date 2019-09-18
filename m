Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B35B67FA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 18:24:45 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAcl2-0005RM-5L
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iAbuI-0000nc-13
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iAbuG-000860-PK
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:30:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iAbuG-000855-Jw; Wed, 18 Sep 2019 11:30:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D756E7F759;
 Wed, 18 Sep 2019 15:30:11 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-119.ams2.redhat.com [10.36.117.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016535D6B2;
 Wed, 18 Sep 2019 15:30:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 17:29:04 +0200
Message-Id: <20190918152922.18949-12-david@redhat.com>
In-Reply-To: <20190918152922.18949-1-david@redhat.com>
References: <20190918152922.18949-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 18 Sep 2019 15:30:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 11/29] s390x/tcg: MVCOS: Lengths
 are 32 bit in 24/31-bit mode
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Triggered by a review comment from Richard, also MVCOS has a 32-bit
length in 24/31-bit addressing mode. Add a new helper.

Rename wrap_length() to wrap_length31().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 20e1ac0ea9..320e9ee65c 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -528,7 +528,15 @@ static inline void set_address(CPUS390XState *env, i=
nt reg, uint64_t address)
     }
 }
=20
-static inline uint64_t wrap_length(CPUS390XState *env, uint64_t length)
+static inline uint64_t wrap_length32(CPUS390XState *env, uint64_t length=
)
+{
+    if (!(env->psw.mask & PSW_MASK_64)) {
+        return (uint32_t)length;
+    }
+    return length;
+}
+
+static inline uint64_t wrap_length31(CPUS390XState *env, uint64_t length=
)
 {
     if (!(env->psw.mask & PSW_MASK_64)) {
         /* 24-Bit and 31-Bit mode */
@@ -539,7 +547,7 @@ static inline uint64_t wrap_length(CPUS390XState *env=
, uint64_t length)
=20
 static inline uint64_t get_length(CPUS390XState *env, int reg)
 {
-    return wrap_length(env, env->regs[reg]);
+    return wrap_length31(env, env->regs[reg]);
 }
=20
 static inline void set_length(CPUS390XState *env, int reg, uint64_t leng=
th)
@@ -2378,7 +2386,7 @@ uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t=
 dest, uint64_t src,
         s390_program_interrupt(env, PGM_PRIVILEGED, 6, ra);
     }
=20
-    len =3D wrap_length(env, len);
+    len =3D wrap_length32(env, len);
     if (len > 4096) {
         cc =3D 3;
         len =3D 4096;
--=20
2.21.0


