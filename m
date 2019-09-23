Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CEBAF1E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:16:14 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJW0-0000Nl-Cm
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJNS-0001Ut-Qy
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJNR-0003vH-OK
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJNR-0003uz-JC; Mon, 23 Sep 2019 04:07:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5F7C315C02A;
 Mon, 23 Sep 2019 08:07:20 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37BFE19C78;
 Mon, 23 Sep 2019 08:07:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/30] s390x/tcg: MVCL: Zero out unused bits of address
Date: Mon, 23 Sep 2019 10:06:44 +0200
Message-Id: <20190923080712.23951-3-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 23 Sep 2019 08:07:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have to zero out unused bits in 24 and 31-bit addressing mode.
Provide a new helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 39ee9b3175..b02ad148e5 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -469,6 +469,25 @@ static inline uint64_t get_address(CPUS390XState *en=
v, int reg)
     return wrap_address(env, env->regs[reg]);
 }
=20
+/*
+ * Store the address to the given register, zeroing out unused leftmost
+ * bits in bit positions 32-63 (24-bit and 31-bit mode only).
+ */
+static inline void set_address_zero(CPUS390XState *env, int reg,
+                                    uint64_t address)
+{
+    if (env->psw.mask & PSW_MASK_64) {
+        env->regs[reg] =3D address;
+    } else {
+        if (!(env->psw.mask & PSW_MASK_32)) {
+            address &=3D 0x00ffffff;
+        } else {
+            address &=3D 0x7fffffff;
+        }
+        env->regs[reg] =3D deposit64(env->regs[reg], 0, 32, address);
+    }
+}
+
 static inline void set_address(CPUS390XState *env, int reg, uint64_t add=
ress)
 {
     if (env->psw.mask & PSW_MASK_64) {
@@ -772,8 +791,8 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1=
, uint32_t r2)
=20
     env->regs[r1 + 1] =3D deposit64(env->regs[r1 + 1], 0, 24, destlen);
     env->regs[r2 + 1] =3D deposit64(env->regs[r2 + 1], 0, 24, srclen);
-    set_address(env, r1, dest);
-    set_address(env, r2, src);
+    set_address_zero(env, r1, dest);
+    set_address_zero(env, r2, src);
=20
     return cc;
 }
--=20
2.21.0


