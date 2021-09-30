Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A441D2F5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:59:23 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp6H-00079z-LB
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosb-0001hy-1Z; Thu, 30 Sep 2021 01:45:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosZ-0003bV-1q; Thu, 30 Sep 2021 01:45:12 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2Qq6z4xbr; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=DQLD13lUsjPdo3EnlgwwNNNC+9Zl9Dh80UlyQ11KVEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nn3+PMisXhQ4aBaPKKG4cq3U1+MbC2Qtr3O5RW5XlwP9XQdzUgI/oxHxBa2NPPFPI
 L6G1NtkcBGvVwuJ/XCUVVp5fi49fdU/d13A8rwiVRv6KR1UvYb/ekDwRh37RplYW+E
 oEjfTiPhKPvmp/9KxzyE+OmaqvgLovkszGVDVdvY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/44] target/ppc: Replace debug messages by asserts for
 unknown IRQ pins
Date: Thu, 30 Sep 2021 15:44:04 +1000
Message-Id: <20210930054426.357344-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

If an unknown pin of the IRQ controller is raised, something is very
wrong in the QEMU model. It is better to abort.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210920061203.989563-3-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 7375bf4fa9..a327206a0a 100644
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


