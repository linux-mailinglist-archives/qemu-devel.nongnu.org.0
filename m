Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8A2D481E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:41:55 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3TO-0001HL-6W
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NS-0004c6-WF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:58671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NR-000534-Au
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:46 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-3Sh8PAUJNwuWfW_ux1pucg-1; Wed, 09 Dec 2020 12:35:41 -0500
X-MC-Unique: 3Sh8PAUJNwuWfW_ux1pucg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47067107ACE6;
 Wed,  9 Dec 2020 17:35:40 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 028816EF41;
 Wed,  9 Dec 2020 17:35:38 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ppc/translate: Use POWERPC_MMU_64 to detect 64-bit MMU
 models
Date: Wed,  9 Dec 2020 18:35:35 +0100
Message-Id: <20201209173536.1437351-2-groug@kaod.org>
In-Reply-To: <20201209173536.1437351-1-groug@kaod.org>
References: <20201209173536.1437351-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Stephane Duverger <stephane.duverger@free.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephane Duverger <stephane.duverger@free.fr>

The ppc_tr_init_disas_context() function currently checks whether the
MMU is 64-bit by ANDing its model type with POWERPC_MMU_64B. This is
wrong : POWERPC_MMU_64B isn't a mask, it is the generic MMU model for
pre-PowerISA-2.03 64-bit CPUs (ie. PowerPC 970 in QEMU).

Use POWERPC_MMU_64 instead of POWERPC_MMU_64B. This should fix a
potential bug with some 32-bit CPUs for which 'need_access_type'
was mis-computed because (POWERPC_MMU_32B & POWERPC_MMU_64B)
happens to be equal to 1. The end result being a crash in
ppc_hash32_direct_store() because the access type isn't set:

        cpu_abort(cs, "ERROR: instruction should not need "
                 "address translation\n");

This doesn't change anything for 'lazy_tlb_flush' since POWERPC_MMU_32B
is checked first.

Fixes: 5f2a6254522b ("ppc: Don't set access_type on all load/stores on hash=
64")
Signed-off-by: Stephane Duverger <stephane.duverger@free.fr>
[groug: - extended patch to address another misuse of POWERPC_MMU_64B
        - updated title and changelog accordingly]
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 54cac0e6a779..e68dd65ad3e1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->insns_flags =3D env->insns_flags;
     ctx->insns_flags2 =3D env->insns_flags2;
     ctx->access_type =3D -1;
-    ctx->need_access_type =3D !(env->mmu_model & POWERPC_MMU_64B);
+    ctx->need_access_type =3D !(env->mmu_model & POWERPC_MMU_64);
     ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
     ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags =3D env->flags;
@@ -7902,7 +7902,7 @@ static void ppc_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
 #endif
     ctx->lazy_tlb_flush =3D env->mmu_model =3D=3D POWERPC_MMU_32B
         || env->mmu_model =3D=3D POWERPC_MMU_601
-        || (env->mmu_model & POWERPC_MMU_64B);
+        || env->mmu_model & POWERPC_MMU_64;
=20
     ctx->fpu_enabled =3D !!msr_fp;
     if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
--=20
2.26.2


