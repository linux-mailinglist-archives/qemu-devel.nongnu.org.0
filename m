Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E82D6F1B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:24:54 +0100 (CET)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZzA-0006e0-V1
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq9-0005dQ-7w; Thu, 10 Dec 2020 23:15:33 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:49135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq6-0000k6-Ov; Thu, 10 Dec 2020 23:15:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrb34p1z9sWp; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660111;
 bh=ZKoVALWI63OBSDQ9zFowxkeqhZA/IacSRGnHPYTa1UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GxSd5cP3b97UOeG7tssNpk9Ak3Dcu6oB0CffL+qNel82kFfRJx7GolQqVfYGMIQPJ
 o3CP0VG5xYJf+OCEsAg4wG9O26HxfYoIs3NhDCHImXnaqLJoHYhx3s0B86+kJ5fkj1
 kz9rFz8c/ud4ABkS0Iq5IkrRDpX1a4gZbtboNYsk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/30] ppc: Add a missing break for PPC6xx_INPUT_TBEN
Date: Fri, 11 Dec 2020 15:14:46 +1100
Message-Id: <20201211041507.425378-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
hw/ppc/ppc.c: In function ‘ppc6xx_set_irq’:
hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
  118 |             if (level) {
      |                ^
hw/ppc/ppc.c:123:9: note: here
  123 |         case PPC6xx_INPUT_INT:
      |         ^~~~

According to the discussion, a break statement needs to be added here.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 4a11fb1640..1b98272076 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
             } else {
                 cpu_ppc_tb_stop(env);
             }
+            break;
         case PPC6xx_INPUT_INT:
             /* Level sensitive - active high */
             LOG_IRQ("%s: set the external IRQ state to %d\n",
-- 
2.29.2


