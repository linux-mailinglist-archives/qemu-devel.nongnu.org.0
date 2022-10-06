Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120975F6ECA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:18:42 +0200 (CEST)
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXKK-0005Cm-7R
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9K-0002im-DV; Thu, 06 Oct 2022 16:07:18 -0400
Received: from [200.168.210.66] (port=39047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9I-0001fe-Sn; Thu, 06 Oct 2022 16:07:18 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 76BE0800640;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 2/6] target/ppc: fix msgsync insns flags
Date: Thu,  6 Oct 2022 17:06:50 -0300
Message-Id: <20221006200654.725390-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:03.0730 (UTC)
 FILETIME=[33BAF120:01D8D9BF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This instruction was added by Power ISA 3.0, using PPC2_PRCNTL makes it
available for older processors, like de e5500 and e6500.

Fixes: 7af1e7b02264 ("target/ppc: add support for hypervisor doorbells on book3s CPUs")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 37d7018d18..eaac8670b1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6906,7 +6906,7 @@ GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
 GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
                PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
-               PPC_NONE, PPC2_PRCNTL),
+               PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
 GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
 GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),
-- 
2.25.1


