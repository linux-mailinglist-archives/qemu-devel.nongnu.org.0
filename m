Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F114E8BE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:21:55 +0100 (CET)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPgg-00028j-IH
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVJ-0007mo-Jm
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVI-00014X-GP
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:09 -0500
Received: from ozlabs.org ([203.11.71.1]:45347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVI-00010k-41; Fri, 31 Jan 2020 01:10:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hy15WRz9sT1; Fri, 31 Jan 2020 17:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450974;
 bh=5sM9Lz2RmC8JDBadeQkrCEvJ50g3Y0oRMAd6UT8RVTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k5TfFhKUgaIS93lgA7Ib+Wr/6limRqgYkH7lLxAw6Gq+PKQDaXOy/jmWWn92E3A1V
 fK31o486Hc+6sMh9TnDya7yDtqthOypQdglu79xkFRo9K0DDIuS4lOIVXKKhidqYrP
 qjdl8DACfMDEI/lgCRWLWgDsKd4MAZ37DgBgH5sI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 34/34] target/ppc: Use probe_write for DCBZ
Date: Fri, 31 Jan 2020 17:09:24 +1100
Message-Id: <20200131060924.147449-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
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

Using probe_write instead of tlb_vaddr_to_host means that we
process watchpoints and notdirty pages more efficiently.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200129235040.24022-5-richard.henderson@linaro.org>
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 0cb78777e7..98f589552b 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -298,7 +298,7 @@ static void dcbz_common(CPUPPCState *env, target_ulon=
g addr,
     }
=20
     /* Try fast path translate */
-    haddr =3D tlb_vaddr_to_host(env, addr, MMU_DATA_STORE, mmu_idx);
+    haddr =3D probe_write(env, addr, dcbz_size, mmu_idx, retaddr);
     if (haddr) {
         memset(haddr, 0, dcbz_size);
     } else {
--=20
2.24.1


