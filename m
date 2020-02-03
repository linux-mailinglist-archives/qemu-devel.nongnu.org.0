Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8E1501B5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:25:49 +0100 (CET)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyVB6-0004dC-Ic
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxr-0003fz-1M
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxp-0003Uc-Ib
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:12:06 -0500
Received: from ozlabs.org ([203.11.71.1]:33413)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxp-0003RR-6c; Mon, 03 Feb 2020 01:12:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBt4Gpfz9sT9; Mon,  3 Feb 2020 17:11:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710294;
 bh=1yWoeBrTfY8fxl3oZ9HWzpgPtT2+m2k9YK8vcQscFig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P2BE1xTol8CkmTM1Lxy5VPkM/ZU4KqUo2XFTKYHDCj+9tHjHSwZJwU2g7OASkBqqQ
 X7vhg3r58m8ppAKmeI3VaTcaVIs4tvlK9O2KL6X/t0tmZ+Y8VIE8l1kDZhxPk2eFin
 Ae44azfB5GDWdwCSxGzr1p7QnUryX5qtIuWfZz6k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 32/35] target/ppc: Use probe_access for LMW, STMW
Date: Mon,  3 Feb 2020 17:11:20 +1100
Message-Id: <20200203061123.59150-33-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use a minimum number of mmu lookups for the contiguous bytes
that are accessed.  If the lookup succeeds, we can finish the
operation with host addresses only.

Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200129235040.24022-3-richard.henderson@linaro.org>
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mem_helper.c | 45 +++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 508d472a2f..e7d3a79d96 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -84,26 +84,45 @@ static void *probe_contiguous(CPUPPCState *env, targe=
t_ulong addr, uint32_t nb,
=20
 void helper_lmw(CPUPPCState *env, target_ulong addr, uint32_t reg)
 {
-    for (; reg < 32; reg++) {
-        if (needs_byteswap(env)) {
-            env->gpr[reg] =3D bswap32(cpu_ldl_data_ra(env, addr, GETPC()=
));
-        } else {
-            env->gpr[reg] =3D cpu_ldl_data_ra(env, addr, GETPC());
+    uintptr_t raddr =3D GETPC();
+    int mmu_idx =3D cpu_mmu_index(env, false);
+    void *host =3D probe_contiguous(env, addr, (32 - reg) * 4,
+                                  MMU_DATA_LOAD, mmu_idx, raddr);
+
+    if (likely(host)) {
+        /* Fast path -- the entire operation is in RAM at host.  */
+        for (; reg < 32; reg++) {
+            env->gpr[reg] =3D (uint32_t)ldl_be_p(host);
+            host +=3D 4;
+        }
+    } else {
+        /* Slow path -- at least some of the operation requires i/o.  */
+        for (; reg < 32; reg++) {
+            env->gpr[reg] =3D cpu_ldl_mmuidx_ra(env, addr, mmu_idx, radd=
r);
+            addr =3D addr_add(env, addr, 4);
         }
-        addr =3D addr_add(env, addr, 4);
     }
 }
=20
 void helper_stmw(CPUPPCState *env, target_ulong addr, uint32_t reg)
 {
-    for (; reg < 32; reg++) {
-        if (needs_byteswap(env)) {
-            cpu_stl_data_ra(env, addr, bswap32((uint32_t)env->gpr[reg]),
-                                                   GETPC());
-        } else {
-            cpu_stl_data_ra(env, addr, (uint32_t)env->gpr[reg], GETPC())=
;
+    uintptr_t raddr =3D GETPC();
+    int mmu_idx =3D cpu_mmu_index(env, false);
+    void *host =3D probe_contiguous(env, addr, (32 - reg) * 4,
+                                  MMU_DATA_STORE, mmu_idx, raddr);
+
+    if (likely(host)) {
+        /* Fast path -- the entire operation is in RAM at host.  */
+        for (; reg < 32; reg++) {
+            stl_be_p(host, env->gpr[reg]);
+            host +=3D 4;
+        }
+    } else {
+        /* Slow path -- at least some of the operation requires i/o.  */
+        for (; reg < 32; reg++) {
+            cpu_stl_mmuidx_ra(env, addr, env->gpr[reg], mmu_idx, raddr);
+            addr =3D addr_add(env, addr, 4);
         }
-        addr =3D addr_add(env, addr, 4);
     }
 }
=20
--=20
2.24.1


