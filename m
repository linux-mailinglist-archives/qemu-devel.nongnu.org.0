Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04EB3725BD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:18:10 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoNl-0005yE-MB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzy-0005EV-UG; Tue, 04 May 2021 01:53:36 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzu-0004gH-Lj; Tue, 04 May 2021 01:53:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK2mzGz9sWl; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=EaUDafy/8AJuydSXL0bhyrdgLP0aiUNh84eXCOph83Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/ETwZDh4AmO7IMxZqN8i0QaMbHqt+DtMsK+fsYLRU3AhIeclTVNhHgSBUR23JDn+
 ebpO/iCjsEQGvccAicEv2hWnXbvnNKBx5+uilUgm8F9CoO5IXd2FJFR4HT/Fg09H6t
 A4wuEF/9jy6ToTTIzWPKxi5UXWpREAFaMH7jFbpQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/46] hw/ppc/spapr_rtas: Update hflags after setting msr
Date: Tue,  4 May 2021 15:52:35 +1000
Message-Id: <20210504055312.306823-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-16-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c628..6ec3e71757 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -51,6 +51,7 @@
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
 #include "migration/blocker.h"
+#include "helper_regs.h"
 
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                    uint32_t token, uint32_t nargs,
@@ -163,6 +164,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     cpu_synchronize_state(CPU(newcpu));
 
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
+    hreg_compute_hflags(env);
 
     /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
     lpcr = env->spr[SPR_LPCR];
-- 
2.31.1


