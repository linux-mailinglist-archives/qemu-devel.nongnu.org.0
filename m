Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35644E579
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:18:39 +0100 (CET)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUZq-0008Jz-4l
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mlUXI-0005dk-IJ; Fri, 12 Nov 2021 06:16:05 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:51599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mlUXD-00078L-D8; Fri, 12 Nov 2021 06:15:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4E08920D05;
 Fri, 12 Nov 2021 11:15:46 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 12:15:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004877ebd69-2a42-4fe9-84af-ccb1c3fc694b,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: [PULL 1/3] target/ppc: Fix register update on lf[sd]u[x]/stf[sd]u[x]
Date: Fri, 12 Nov 2021 12:15:41 +0100
Message-ID: <20211112111543.2556837-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112111543.2556837-1-clg@kaod.org>
References: <20211112111543.2556837-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4f6430af-5a54-4e21-8923-220d4b4580c3
X-Ovh-Tracer-Id: 5539990494889347948
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

These instructions should update the GPR indicated by the field RA
instead of RT. This error caused a regression on Mac OS 9 boot and some
graphical glitches in OS X.

Fixes: a39a106634a9 ("target/ppc: Move load and store floating point instructions to decodetree")
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/translate/fp-impl.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d1dbb1b96b16..c9e05201d9e7 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -1328,7 +1328,7 @@ static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
         set_fpr(rt, t0);
     }
     if (update) {
-        tcg_gen_mov_tl(cpu_gpr[rt], ea);
+        tcg_gen_mov_tl(cpu_gpr[ra], ea);
     }
     tcg_temp_free_i64(t0);
     tcg_temp_free(ea);
-- 
2.31.1


