Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9C410F73
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:14:45 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSCZg-0002um-Hl
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSCXN-0000o2-2z; Mon, 20 Sep 2021 02:12:21 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSCXJ-00054o-1N; Mon, 20 Sep 2021 02:12:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 44311BEDCC59;
 Mon, 20 Sep 2021 08:12:06 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 08:12:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0027ec82f8e-c88e-4185-9b32-ab8290fce8d4,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v4 2/4] target/ppc: Replace debug messages by asserts for
 unknown IRQ pins
Date: Mon, 20 Sep 2021 08:12:01 +0200
Message-ID: <20210920061203.989563-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920061203.989563-1-clg@kaod.org>
References: <20210920061203.989563-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3c1e77f-e382-49b3-9de4-549adca389e7
X-Ovh-Tracer-Id: 2753388224491260835
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an unknown pin of the IRQ controller is raised, something is very
wrong in the QEMU model. It is better to abort.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 7375bf4fa910..a327206a0a1e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -165,9 +165,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
             ppc_set_irq(cpu, PPC_INTERRUPT_RESET, level);
             break;
         default:
-            /* Unknown pin - do nothing */
-            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-            return;
+            g_assert_not_reached();
         }
         if (level)
             env->irq_input_state |= 1 << pin;
@@ -252,9 +250,7 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
             /* XXX: TODO */
             break;
         default:
-            /* Unknown pin - do nothing */
-            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-            return;
+            g_assert_not_reached();
         }
         if (level)
             env->irq_input_state |= 1 << pin;
@@ -287,9 +283,7 @@ static void power7_set_irq(void *opaque, int pin, int level)
         ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
         break;
     default:
-        /* Unknown pin - do nothing */
-        LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-        return;
+        g_assert_not_reached();
     }
 }
 
@@ -323,9 +317,7 @@ static void power9_set_irq(void *opaque, int pin, int level)
         ppc_set_irq(cpu, PPC_INTERRUPT_HVIRT, level);
         break;
     default:
-        /* Unknown pin - do nothing */
-        LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-        return;
+        g_assert_not_reached();
     }
 }
 
@@ -459,9 +451,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
             ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
             break;
         default:
-            /* Unknown pin - do nothing */
-            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-            return;
+            g_assert_not_reached();
         }
         if (level)
             env->irq_input_state |= 1 << pin;
@@ -523,9 +513,7 @@ static void ppce500_set_irq(void *opaque, int pin, int level)
             ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
             break;
         default:
-            /* Unknown pin - do nothing */
-            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
-            return;
+            g_assert_not_reached();
         }
         if (level)
             env->irq_input_state |= 1 << pin;
-- 
2.31.1


