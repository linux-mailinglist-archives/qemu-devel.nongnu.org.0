Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80069397A28
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:45:51 +0200 (CEST)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo9Of-0005iX-W3
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lo9M7-0004n7-3K; Tue, 01 Jun 2021 14:43:11 -0400
Received: from [201.28.113.2] (port=40572 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lo9M5-0001oR-3l; Tue, 01 Jun 2021 14:43:10 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 15:43:04 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 161CF80148B;
 Tue,  1 Jun 2021 15:43:04 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/ppc: removed usage of ppc_store_sdr1 in kvm.c
Date: Tue,  1 Jun 2021 15:42:42 -0300
Message-Id: <20210601184242.122895-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 01 Jun 2021 18:43:04.0226 (UTC)
 FILETIME=[F4B6A820:01D75715]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, farosas@linux.ibm.com,
 richard.henderson@linaro.org, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only use of this function in kvm.c is right after using the KVM
ioctl to get the registers themselves, so there is no need to do the
error checks done by ppc_store_sdr1.

The probable reason this was here before is because of the hack where
KVM PR stores the hash table size along with the SDR1 information, but
since ppc_store_sdr1 would also store that information, there should be
no need to do any extra processing here.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---

This change means we won't have to compile ppc_store_sdr1 when we get
disable-tcg working, but I'm not working on that code motion just yet
since Lucas is dealing with the same file.

I'm sending this as an RFC because I'm pretty sure I'm missing
something, but from what I can see, this is all we'd need

 target/ppc/kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb..3f52a7189d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1159,7 +1159,11 @@ static int kvmppc_get_books_sregs(PowerPCCPU *cpu)
     }
 
     if (!cpu->vhyp) {
-        ppc_store_sdr1(env, sregs.u.s.sdr1);
+        /*
+         * We have just gotten the SDR1, there should be no
+         * reason to do error checking.... right?
+         */
+        env->spr[SPR_SDR1] = sregs.u.s.sdr1;
     }
 
     /* Sync SLB */
-- 
2.17.1


