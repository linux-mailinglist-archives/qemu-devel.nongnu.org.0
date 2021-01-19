Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5A22FB1BC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:45:54 +0100 (CET)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1km0-0006Rh-TO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kRE-00025z-V7; Tue, 19 Jan 2021 01:24:25 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kRC-0000ap-CO; Tue, 19 Jan 2021 01:24:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrb2scKz9svs; Tue, 19 Jan 2021 17:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037407;
 bh=7eoo1JGQEz0AGnMffHoG0i70grShp7cTjR5JUeO8D28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d0ET/9bzT1UbArGfrDH7ISj6IH3PprXsM6JahAeYmqjKAUoNUChNAZhcfKFykNkhU
 QQ1WqhxdD8HXnOxPbU54qnQn5y1Ldf2tTld2DUy1YFttZCt6lUnyXKcmniUi75wsJG
 ZZ6TWWItZUlgMREo+shecbnBboOuYMHdyRWSrnDA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/13] spapr_hcall.c: make do_client_architecture_support static
Date: Tue, 19 Jan 2021 17:23:16 +1100
Message-Id: <20210119062318.13857-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The function is called only inside spapr_hcall.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210114180628.1675603-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c   | 1 +
 include/hw/ppc/spapr.h | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index e5dfc1ba7a..7b5cd3553c 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1632,6 +1632,7 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint32_t max_compat,
     return best_compat;
 }
 
+static
 target_ulong do_client_architecture_support(PowerPCCPU *cpu,
                                             SpaprMachineState *spapr,
                                             target_ulong vec,
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7f785409e4..c27c7ce515 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -582,11 +582,6 @@ void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
 
-target_ulong do_client_architecture_support(PowerPCCPU *cpu,
-                                            SpaprMachineState *spapr,
-                                            target_ulong addr,
-                                            target_ulong fdt_bufsize);
-
 /* Virtual Processor Area structure constants */
 #define VPA_MIN_SIZE           640
 #define VPA_SIZE_OFFSET        0x4
-- 
2.29.2


