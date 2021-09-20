Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A9410F77
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:21:49 +0200 (CEST)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSCgU-0001Le-GL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSCXO-0000rD-39; Mon, 20 Sep 2021 02:12:22 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSCXK-00055V-58; Mon, 20 Sep 2021 02:12:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9E344BEDCC5B;
 Mon, 20 Sep 2021 08:12:07 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 08:12:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e7b73adc-1751-492e-9b40-d2392d752e0e,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v4 4/4] target/ppc: Fix 64-bit decrementer
Date: Mon, 20 Sep 2021 08:12:03 +0200
Message-ID: <20210920061203.989563-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920061203.989563-1-clg@kaod.org>
References: <20210920061203.989563-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f4e2d7d-c524-433d-ba33-de3af00b2929
X-Ovh-Tracer-Id: 2753669699695774502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiuddguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current way the mask is built can overflow with a 64-bit decrementer.
Use sextract64() to extract the signed values and remove the logic to
handle negative values which has become useless.

Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for TCG")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index b813ef732ec1..f5d012f860af 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -821,14 +821,12 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
     CPUPPCState *env = &cpu->env;
     ppc_tb_t *tb_env = env->tb_env;
     uint64_t now, next;
-    bool negative;
+    int64_t signed_value;
+    int64_t signed_decr;
 
     /* Truncate value to decr_width and sign extend for simplicity */
-    value &= ((1ULL << nr_bits) - 1);
-    negative = !!(value & (1ULL << (nr_bits - 1)));
-    if (negative) {
-        value |= (0xFFFFFFFFULL << nr_bits);
-    }
+    signed_value = sextract64(value, 0, nr_bits);
+    signed_decr = sextract64(decr, 0, nr_bits);
 
     trace_ppc_decr_store(nr_bits, decr, value);
 
@@ -850,16 +848,16 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
      * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
      * an edge interrupt, so raise it here too.
      */
-    if ((value < 3) ||
-        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
-        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
-          && !(decr & (1ULL << (nr_bits - 1))))) {
+    if ((signed_value < 3) ||
+        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
+        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
+          && signed_decr >= 0)) {
         (*raise_excp)(cpu);
         return;
     }
 
     /* On MSB level based systems a 0 for the MSB stops interrupt delivery */
-    if (!negative && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
+    if (signed_value >= 0 && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
         (*lower_excp)(cpu);
     }
 
-- 
2.31.1


