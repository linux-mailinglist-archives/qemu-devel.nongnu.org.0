Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C66247D41
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:21:39 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7t7x-0000mx-Mr
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t63-00078m-OS; Tue, 18 Aug 2020 00:19:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33905 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t5z-0006JY-Up; Tue, 18 Aug 2020 00:19:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNY5S8Xz9sTW; Tue, 18 Aug 2020 14:19:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724365;
 bh=qVscrQXxliA1n1slJsjqZIJ0VNQ6LAsj9dXEyP+kp3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FhUptpOVKEXCgd5tt1nzkLhftoTgt3zsXEMvCKVvmSrshQXLVipB52pG73JnZgnLg
 EZlbwp+CkFBPkM4hH42uSX8AvvlyqUx2sG5JcUS7I2FqZUoxKE5duTk2GboFUA12ys
 f2F/RO1TsKjYgbuO/v0iHaeEupulnINrh+grUQ/c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/40] target/ppc: Introduce Power ISA 3.1 flag
Date: Tue, 18 Aug 2020 14:18:44 +1000
Message-Id: <20200818041922.251708-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lijun Pan <ljp@linux.ibm.com>

This flag will be used for Power10 instructions.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
Message-Id: <20200701234344.91843-2-ljp@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e7d382ac10..7bfee8211f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2191,6 +2191,8 @@ enum {
     PPC2_PM_ISA206     = 0x0000000000040000ULL,
     /* POWER ISA 3.0                                                         */
     PPC2_ISA300        = 0x0000000000080000ULL,
+    /* POWER ISA 3.1                                                         */
+    PPC2_ISA310        = 0x0000000000100000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
-- 
2.26.2


