Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF444E578
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:18:38 +0100 (CET)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUZo-0008Lw-Lh
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:18:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXJ-0005dm-DC
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:16:05 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:57481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXF-00078T-Fp
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:16:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6C91721576;
 Fri, 12 Nov 2021 11:15:47 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 12:15:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046697492a-843d-4a8f-89e1-0fe2812e93b7,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: [PULL 3/3] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Date: Fri, 12 Nov 2021 12:15:43 +0100
Message-ID: <20211112111543.2556837-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112111543.2556837-1-clg@kaod.org>
References: <20211112111543.2556837-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3f865683-ca67-4686-8d06-842c93b0c604
X-Ovh-Tracer-Id: 5540271967615093609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevieejtedujeehtefgfeelffehveefudegjeejvdegtefgieetheffffeiheelfeenucffohhmrghinhepghhithhlrggsrdgtohhmpdhrrghpthhorhgtshdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

'tlbivax' is implemented by gen_tlbivax_booke206() via
gen_helper_booke206_tlbivax(). In case the TLB needs to be flushed,
booke206_invalidate_ea_tlb() is called. All these functions, but
booke206_invalidate_ea_tlb(), uses a 64-bit effective address 'ea'.

booke206_invalidate_ea_tlb() uses an uint32_t 'ea' argument that
truncates the original 'ea' value for apparently no particular reason.
This function retrieves the tlb pointer by calling booke206_get_tlbm(),
which also uses a target_ulong address as parameter - in this case, a
truncated 'ea' address. All the surrounding logic considers the
effective TLB address as a 64 bit value, aside from the signature of
booke206_invalidate_ea_tlb().

Last but not the least, PowerISA 2.07B section 6.11.4.9 [2] makes it
clear that the effective address "EA" is a 64 bit value.

Commit 01662f3e5133 introduced this code and no changes were made ever
since. An user detected a problem with tlbivax [1] stating that this
address truncation was the cause. This same behavior might be the source
of several subtle bugs that were never caught.

For all these reasons, this patch assumes that this address truncation
is the result of a mistake/oversight of the original commit, and changes
booke206_invalidate_ea_tlb() 'ea' argument to 'vaddr'.

[1] https://gitlab.com/qemu-project/qemu/-/issues/52
[2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf

Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2cb98c516987..e0c4950dda53 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
 }
 
 static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
-                                              uint32_t ea)
+                                              vaddr ea)
 {
     int i;
     int ways = booke206_tlb_ways(env, tlbn);
-- 
2.31.1


