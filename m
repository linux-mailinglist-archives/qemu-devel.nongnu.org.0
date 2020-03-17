Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF1187E5D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:32:17 +0100 (CET)
Received: from localhost ([::1]:56127 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9WC-0006N9-Ak
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96P-0002Bz-Ai
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96O-0007ct-34
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:37 -0400
Received: from ozlabs.org ([203.11.71.1]:46565)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE96N-0003xE-Me; Tue, 17 Mar 2020 06:05:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTL039dLz9sTS; Tue, 17 Mar 2020 21:04:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439480;
 bh=SAXwkEjbnnAeuIlPrPLqPBmFdg7DXOMyP1ESLVuY0oE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UQ+mM4JUpVvLAwBbWygdDmgo69WCA/RGQIxlzAiPh9k8Mo9aWpOI/fuiNOF2kWvFq
 dkW7CXbrDrNNOpzgKDu/2VOfwXZMm6XL1v3JZUpRomINbNW/+XiUzLPHZ51YAmL/YW
 aUFP9FAH8NUao5jZD06RSKIeWa5v5OQHP204hPWo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 30/45] target/ppc: Fix rlwinm on ppc64
Date: Tue, 17 Mar 2020 21:04:08 +1100
Message-Id: <20200317100423.622643-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-stable@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, Vitaly Chikunov <vt@altlinux.org>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Chikunov <vt@altlinux.org>

rlwinm cannot just AND with Mask if shift value is zero on ppc64 when
Mask Begin is greater than Mask End and high bits are set to 1.

Note that PowerISA 3.0B says that for `rlwinm' ROTL32 is used, and
ROTL32 is defined (in 3.3.14) so that rotated value should have two
copies of lower word of the source value.

This seems to be another incarnation of the fix from 820724d170
("target-ppc: Fix rlwimi, rlwinm, rlwnm again"), except I leave
optimization when Mask value is less than 32 bits.

Fixes: 7b4d326f47 ("target-ppc: Use the new deposit and extract ops")
Cc: qemu-stable@nongnu.org
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
Message-Id: <20200309204557.14836-1-vt@altlinux.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 36fa27367c..127c82a24e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1938,15 +1938,17 @@ static void gen_rlwinm(DisasContext *ctx)
         me +=3D 32;
 #endif
         mask =3D MASK(mb, me);
-        if (sh =3D=3D 0) {
-            tcg_gen_andi_tl(t_ra, t_rs, mask);
-        } else if (mask <=3D 0xffffffffu) {
-            TCGv_i32 t0 =3D tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t0, t_rs);
-            tcg_gen_rotli_i32(t0, t0, sh);
-            tcg_gen_andi_i32(t0, t0, mask);
-            tcg_gen_extu_i32_tl(t_ra, t0);
-            tcg_temp_free_i32(t0);
+        if (mask <=3D 0xffffffffu) {
+            if (sh =3D=3D 0) {
+                tcg_gen_andi_tl(t_ra, t_rs, mask);
+            } else {
+                TCGv_i32 t0 =3D tcg_temp_new_i32();
+                tcg_gen_trunc_tl_i32(t0, t_rs);
+                tcg_gen_rotli_i32(t0, t0, sh);
+                tcg_gen_andi_i32(t0, t0, mask);
+                tcg_gen_extu_i32_tl(t_ra, t0);
+                tcg_temp_free_i32(t0);
+            }
         } else {
 #if defined(TARGET_PPC64)
             tcg_gen_deposit_i64(t_ra, t_rs, t_rs, 32, 32);
--=20
2.24.1


