Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5040DCFF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:40:17 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsYi-0007BZ-9U
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQsVt-00053z-R8
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:37:25 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:57393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQsVq-0007zg-Mr
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:37:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C99BE2139C;
 Thu, 16 Sep 2021 14:37:14 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 16 Sep
 2021 16:37:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057a029df9-6256-4e37-bab7-61dd4db912ae,
 902CC554B2B666CF336F93082A9AEA4058B2700C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3] target/ppc: Fix 64-bit decrementer
Date: Thu, 16 Sep 2021 16:37:10 +0200
Message-ID: <20210916143710.236489-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 79084e6c-1616-4d48-a185-4de6b59b0c7d
X-Ovh-Tracer-Id: 6240300237243714412
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
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

 Tested on pSeries, PowerNV, MAC and MicroWatt (64bit dec) platforms.
 
 hw/ppc/ppc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 7375bf4fa910..777e5756edfa 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -873,17 +873,15 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
     CPUPPCState *env = &cpu->env;
     ppc_tb_t *tb_env = env->tb_env;
     uint64_t now, next;
-    bool negative;
+    target_long signed_value;
+    target_long signed_decr;
 
     /* Truncate value to decr_width and sign extend for simplicity */
-    value &= ((1ULL << nr_bits) - 1);
-    negative = !!(value & (1ULL << (nr_bits - 1)));
-    if (negative) {
-        value |= (0xFFFFFFFFULL << nr_bits);
-    }
+    signed_value = sextract64(value, 0, nr_bits);
+    signed_decr = sextract64(decr, 0, nr_bits);
 
     LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
-                decr, value);
+                decr, signed_value);
 
     if (kvm_enabled()) {
         /* KVM handles decrementer exceptions, we don't need our own timer */
@@ -903,16 +901,16 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
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


