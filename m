Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14064F1752
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 16:43:28 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbNvT-0005BC-Sb
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 10:43:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbNqb-0005n4-S5
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:38:29 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbNqX-0006cj-9Z
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:38:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7B07CF31DA6B;
 Mon,  4 Apr 2022 16:38:18 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 16:38:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010e4ae6bf-80aa-44c8-9fe6-440a7b07eb7a,
 193BEDB8EED17CFBFC1316EE01F9191BF107EB6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 1/3] hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
Date: Mon, 4 Apr 2022 16:38:11 +0200
Message-ID: <20220404143813.673262-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404143813.673262-1-clg@kaod.org>
References: <20220404143813.673262-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c68e4569-2a36-49d2-a73d-06d4fb8a06b1
X-Ovh-Tracer-Id: 205476736331057958
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The timebase is allocated during spapr_realize_vcpu() and it's not
freed. This results in memory leaks when doing vcpu unplugs:

==636935==
==636935== 144 (96 direct, 48 indirect) bytes in 1 blocks are definitely lost in loss record 6
,461 of 8,135
==636935==    at 0x4897468: calloc (vg_replace_malloc.c:760)
==636935==    by 0x5077213: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x507757F: g_malloc0_n (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x93C3FB: cpu_ppc_tb_init (ppc.c:1066)
==636935==    by 0x97BC2B: spapr_realize_vcpu (spapr_cpu_core.c:268)
==636935==    by 0x97C01F: spapr_cpu_core_realize (spapr_cpu_core.c:337)
==636935==    by 0xD4626F: device_set_realized (qdev.c:531)
==636935==    by 0xD55273: property_set_bool (object.c:2273)
==636935==    by 0xD523DF: object_property_set (object.c:1408)
==636935==    by 0xD588B7: object_property_set_qobject (qom-qobject.c:28)
==636935==    by 0xD52897: object_property_set_bool (object.c:1477)
==636935==    by 0xD4579B: qdev_realize (qdev.c:333)
==636935==

This patch adds a cpu_ppc_tb_free() helper in hw/ppc/ppc.c to allow us
to free the timebase. This leak is then solved by calling
cpu_ppc_tb_free() in spapr_unrealize_vcpu().

Fixes: 6f4b5c3ec590 ("spapr: CPU hot unplug support")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220329124545.529145-2-danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/ppc.h    | 1 +
 hw/ppc/ppc.c            | 7 +++++++
 hw/ppc/spapr_cpu_core.c | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index b0ba4bd6b978..364f165b4b56 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,7 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_tb_free(CPUPPCState *env);
 void cpu_ppc_hdecr_init(CPUPPCState *env);
 void cpu_ppc_hdecr_exit(CPUPPCState *env);
 
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index faa02d6710c9..fea70df45e69 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,13 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+void cpu_ppc_tb_free(CPUPPCState *env)
+{
+    timer_free(env->tb_env->decr_timer);
+    timer_free(env->tb_env->hdecr_timer);
+    g_free(env->tb_env);
+}
+
 /* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emulation */
 void cpu_ppc_hdecr_init(CPUPPCState *env)
 {
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index ed847139602f..8a4861f45a2a 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -189,10 +189,13 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
 
 static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
 {
+    CPUPPCState *env = &cpu->env;
+
     if (!sc->pre_3_0_migration) {
         vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
     }
     spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
+    cpu_ppc_tb_free(env);
     qdev_unrealize(DEVICE(cpu));
 }
 
-- 
2.34.1


