Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C23388E66
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:54:51 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLis-0003U3-HP
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgQ-00007w-BJ; Wed, 19 May 2021 08:52:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgN-0000u7-UL; Wed, 19 May 2021 08:52:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnW42gTz9sWp; Wed, 19 May 2021 22:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428719;
 bh=hDAAK5WQgpa+UT/qXN6mJMLb7AgwL8YYjlLiuEt3d+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AAkzcV9ICBbu9Qan0zIKq6RaQ1aCasdnb4VArcuwn9JWWSc6Rfj9wvv18Ds21zagT
 PLigG/Rqym7zDj6l6i+Y5yb5RZbdrUFxcSPGJi5Zd/5rVBnEy9aVQn7UJBfjZUoba8
 apX+SlLEIcxjUxa+rHYX3ajF7Jtsfsx+fjtVMV54=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/48] hw/ppc/spapr.c: Make sure the host supports the selected
 MMU mode
Date: Wed, 19 May 2021 22:51:02 +1000
Message-Id: <20210519125148.27720-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Starting with Linux kernel v5.12 we dropped support[1] in KVM for
hosts that can't have their threads running in different MMU modes
(POWER9 < DD2.2). In these hosts, KVM will no longer report the
KVM_CAP_PPC_MMU_HASH_V3 capability[2] when the host is running Radix.

For guests that support both MMU modes, the negotiation during CAS
will make sure it selects the correct one.

For guests that only support Hash, such as P8 compat mode guests, the
following error is currently thrown:

  $ ~/qemu-system-ppc64 -machine pseries,accel=kvm,max-cpu-compat=power8 ...
  error: kvm run failed Invalid argument
  NIP 0000000000000100   LR 0000000000000000 CTR 0000000000000000 XER 0000000000000000 CPU#0
  MSR 8000000000001000 HID0 0000000000000000  HF 8000000000000000 iidx 3 didx 3
  TB 00000000 00000000 DECR 0
  GPR00 0000000000000000 0000000000000000 0000000000000000 000000007ff00000
  GPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  CR 00000000  [ -  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
   SRR0 0000000000000000  SRR1 0000000000000000    PVR 00000000004e1201 VRSAVE 0000000000000000
  SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG3 0000000000000000
  SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
  HSRR0 0000000000000000 HSRR1 0000000000000000
   CFAR 0000000000000000
   LPCR 000000000004f01f
   PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

This patch adds a verification during the writing of the platform
support vector so that we error out as soon as we determine this guest
only supports Hash and the host doesn't.

  ~/qemu-system-ppc64 -machine pseries,accel=kvm,max-cpu-compat=power8 ...
  qemu-system-ppc64: Guest requested unavailable MMU mode (hash).

1- https://git.kernel.org/torvalds/p/b1b1697ae0cc8
2- https://git.kernel.org/torvalds/p/a722076e94702

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210505001130.3999968-3-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3e51560d57..4db448d63e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -979,6 +979,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
          */
         val[1] = SPAPR_OV5_XIVE_LEGACY; /* XICS */
         val[3] = 0x00; /* Hash */
+        spapr_check_mmu_mode(false);
     } else if (kvm_enabled()) {
         if (kvmppc_has_cap_mmu_radix() && kvmppc_has_cap_mmu_hash_v3()) {
             val[3] = 0x80; /* OV5_MMU_BOTH */
-- 
2.31.1


