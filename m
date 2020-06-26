Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D520AC72
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 08:41:52 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joi3b-00031o-Od
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 02:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1joi2O-0001Pa-9q; Fri, 26 Jun 2020 02:40:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45655 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1joi2K-0001ET-Ji; Fri, 26 Jun 2020 02:40:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49tS1m0Ctcz9sTC; Fri, 26 Jun 2020 16:40:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1593153628;
 bh=16oUjRspYdbi1tHyxvIiuNrezffZ2LhSzj1qCNaS2KI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b4XxXB+h8A7dTiUR6teQTaC7X2Y3KMEo5V0tncnJFaRQtO2lznaqX7k1jc1BcHd6+
 6rGA2NOShHTL1qVZg4RW8a4lunxFaeQpCcWtaISumuoGedMAoG8h5KxH/YpPQj6XbT
 n2RJx5SmpQupLelsPU/Ra2lAK31FZKK+nQBAPFkI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 4/4] target/ppc: Remove TIDR from POWER10 processor
Date: Fri, 26 Jun 2020 16:40:24 +1000
Message-Id: <20200626064024.383996-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626064024.383996-1-david@gibson.dropbear.id.au>
References: <20200626064024.383996-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 00:31:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

It is not part of Power ISA Version 3.1.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200623154534.266065-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate_init.inc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index a40888411c..49212bfd90 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -9086,11 +9086,6 @@ static void init_proc_POWER10(CPUPPCState *env)
     gen_spr_power8_rpr(env);
     gen_spr_power9_mmu(env);
 
-    /* POWER9 Specific registers */
-    spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
-                     spr_read_generic, spr_write_generic,
-                     KVM_REG_PPC_TIDR, 0);
-
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
                         spr_read_generic, spr_write_generic,
-- 
2.26.2


