Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F168435A07
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:32:25 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPke-00005t-OY
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZS-0005UR-62; Thu, 21 Oct 2021 00:20:50 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:57893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZQ-0008EO-3h; Thu, 21 Oct 2021 00:20:49 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p3vMnz4xdF; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=xTjxyXDsAhACrgB7tmQu79b8AqV1hBRQBgtQJlME33E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d2uuRdMsWtQ000n+FDRog9lfbJ+sGiHaRGreEQAhVB694BHQAi7SMruY29dM5vDmI
 w5enTTDT2iNgmj5Zhd255FcZBEDTQFTyKvkUs8bXAhP7YwybTPmFuy2su3jy0IqJs3
 rOqvrLWTg2droDZHe+ZMDqqh7bzfB8m8AbJ0cr5k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/25] hw/ppc: Fix iothread locking in the 405 code
Date: Thu, 21 Oct 2021 15:20:09 +1100
Message-Id: <20211021042027.345405-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
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
Cc: Thomas Huth <thuth@redhat.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When using u-boot as firmware with the taihu board, QEMU aborts with
this assertion:

 ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed:
  (qemu_mutex_iothread_locked())

Running QEMU with "-d in_asm" shows that the crash happens when writing
to SPR 0x3f2, so we are missing to lock the iothread in the code path
here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211006071140.565952-1-thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index a724b0bb5e..e8127599c9 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -336,6 +336,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
 
+    qemu_mutex_lock_iothread();
+
     switch ((val >> 28) & 0x3) {
     case 0x0:
         /* No action */
@@ -353,6 +355,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
         ppc40x_system_reset(cpu);
         break;
     }
+
+    qemu_mutex_unlock_iothread();
 }
 
 /* PowerPC 40x internal IRQ controller */
-- 
2.31.1


