Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1C131EBC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 05:59:50 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iogy2-0000Wy-Fu
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 23:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iognI-0005K4-F8
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iognG-0004bT-NS
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34365 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iognG-0004Vq-30; Mon, 06 Jan 2020 23:48:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sKdX0QB4z9sRG; Tue,  7 Jan 2020 15:48:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578372512;
 bh=hKHBL40fvquvop2W00XL2m4WOhOqI+ZG7iI5VyXxM7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=crhWWj776waB4cRfVhWnKO6O/GXfdyo36re9dP4K8bJDvimHKEbFw/mNuvhu3qu17
 mwD7K5qqPPAzMob87rWVKi/3w/rGj3fWw0NAy7koNkbk85kh/Vrb2LeLhkO2Qv61V1
 uuyy2taKkTRcsqh9eoMoXp8pykFhfrbmQi4xYNH0=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	groug@kaod.org,
	philmd@redhat.com,
	clg@kaod.org
Subject: [PATCH v2 02/10] ppc: Remove stub of PPC970 HID4 implementation
Date: Tue,  7 Jan 2020 15:48:19 +1100
Message-Id: <20200107044827.471355-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107044827.471355-1-david@gibson.dropbear.id.au>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 paulus@samba.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerPC 970 CPU was a cut-down POWER4, which had hypervisor capabilit=
y.
However, it can be (and often was) strapped into "Apple mode", where the
hypervisor capabilities were disabled (essentially putting it always in
hypervisor mode).

That's actually the only mode of the 970 we support in qemu, and we're
unlikely to change that any time soon.  However, we do have a partial
implementation of the 970's HID4 register which affects things only
relevant for hypervisor mode.

That stub is also really ugly, since it attempts to duplicate the effects
of HID4 by re-encoding it into the LPCR register used in newer CPUs, but
in a really confusing way.

Just get rid of it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash64.c         | 28 +---------------------------
 target/ppc/translate_init.inc.c | 17 ++++++-----------
 2 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index da8966ccf5..a881876647 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1091,33 +1091,6 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong =
val)
=20
     /* Filter out bits */
     switch (env->mmu_model) {
-    case POWERPC_MMU_64B: /* 970 */
-        if (val & 0x40) {
-            lpcr |=3D LPCR_LPES0;
-        }
-        if (val & 0x8000000000000000ull) {
-            lpcr |=3D LPCR_LPES1;
-        }
-        if (val & 0x20) {
-            lpcr |=3D (0x4ull << LPCR_RMLS_SHIFT);
-        }
-        if (val & 0x4000000000000000ull) {
-            lpcr |=3D (0x2ull << LPCR_RMLS_SHIFT);
-        }
-        if (val & 0x2000000000000000ull) {
-            lpcr |=3D (0x1ull << LPCR_RMLS_SHIFT);
-        }
-        env->spr[SPR_RMOR] =3D ((lpcr >> 41) & 0xffffull) << 26;
-
-        /*
-         * XXX We could also write LPID from HID4 here
-         * but since we don't tag any translation on it
-         * it doesn't actually matter
-         *
-         * XXX For proper emulation of 970 we also need
-         * to dig HRMOR out of HID5
-         */
-        break;
     case POWERPC_MMU_2_03: /* P5p */
         lpcr =3D val & (LPCR_RMLS | LPCR_ILE |
                       LPCR_LPES0 | LPCR_LPES1 |
@@ -1154,6 +1127,7 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong v=
al)
         }
         break;
     default:
+        g_assert_not_reached();
         ;
     }
     env->spr[SPR_LPCR] =3D lpcr;
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
index d33d65dff7..436d0d5a51 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -7884,25 +7884,20 @@ static void spr_write_lpcr(DisasContext *ctx, int=
 sprn, int gprn)
 {
     gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
 }
-
-static void spr_write_970_hid4(DisasContext *ctx, int sprn, int gprn)
-{
-#if defined(TARGET_PPC64)
-    spr_write_generic(ctx, sprn, gprn);
-    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
-#endif
-}
-
 #endif /* !defined(CONFIG_USER_ONLY) */
=20
 static void gen_spr_970_lpar(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Logical partitionning */
-    /* PPC970: HID4 is effectively the LPCR */
+    /* PPC970: HID4 covers things later controlled by the LPCR and
+     * RMOR in later CPUs, but with a different encoding.  We only
+     * support the 970 in "Apple mode" which has all hypervisor
+     * facilities disabled by strapping, so we can basically just
+     * ignore it */
     spr_register(env, SPR_970_HID4, "HID4",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_970_hid4,
+                 &spr_read_generic, &spr_write_generic,
                  0x00000000);
 #endif
 }
--=20
2.24.1


