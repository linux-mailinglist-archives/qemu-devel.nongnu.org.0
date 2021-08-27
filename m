Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB73F9513
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:26:25 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWFr-0004PQ-Q8
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0000wa-KU; Fri, 27 Aug 2021 03:10:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39481 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW01-0007QW-2S; Fri, 27 Aug 2021 03:10:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ2f6xz9sWc; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=3HAnMry8QrGfAtdyPyBFYVzTe6YycbOf8WcqDPtwUDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UGElfXuIZ6SCtEvFsWtLU3CaYpvIpZu3rOc/AeuahwCjggxuAoWnPObyys05cZbB/
 oBjnq3PcxylFolv45xt7y4W1rZI6W7rcmgfCIsDO+HefQOsOWA5sWkiVhdFDrtgwSo
 CRkUvfWJZ/iGe1ldJk9lZLnz/YQMKT5VsokDcgxo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/18] ppc/pnv: powerpc_excp: Do not discard HDECR exception
 when entering power-saving mode
Date: Fri, 27 Aug 2021 17:09:37 +1000
Message-Id: <20210827070946.219970-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The Hypervisor Decrementer exception should not be generated while the
CPU is in power-saving mode (see cpu_ppc_hdecr_excp()). However,
discarding the exception before entering the power-saving mode is
wrong since we would loose a previously generated HDEC.

Fixes: 4b236b621bf0 ("ppc: Initial HDEC support")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-4-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a79a0ed465..7b6ac16eef 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1211,12 +1211,6 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
     cs = env_cpu(env);
     cs->halted = 1;
 
-    /*
-     * The architecture specifies that HDEC interrupts are discarded
-     * in PM states
-     */
-    env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
-
     /* Condition for waking up at 0x100 */
     env->resume_as_sreset = (insn != PPC_PM_STOP) ||
         (env->spr[SPR_PSSCR] & PSSCR_EC);
-- 
2.31.1


