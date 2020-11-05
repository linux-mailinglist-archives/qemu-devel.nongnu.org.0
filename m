Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F82A763C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 04:51:58 +0100 (CET)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaWJZ-000708-4Z
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 22:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHO-0005Nr-NA; Wed, 04 Nov 2020 22:49:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33859 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHL-0003wV-Fj; Wed, 04 Nov 2020 22:49:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CRTzb1KK7z9sRR; Thu,  5 Nov 2020 14:49:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1604548171;
 bh=zUzX5zu57Y2d4gMRLtDx5hcrmHkeL5+qsA7DiyUMmzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P79qUpqq44edjnFaHGT0hSVcXqHeFz2nkQC2jhLaCTeCJ6Y/aKdQtLVZLrGI1uG1D
 93hi61qNZ7FE/kGLwn0KMQxdqQsw8xVi25UH5a0OUbgUa89mWxGTwlULmzlINJvY4s
 lC/IcbKIG5u7+rtgJ3Dh+DauZgzMK5cHKTLKwIMU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 1/3] target/ppc/excp_helper: Add a fallthrough for fix compiler
 warning
Date: Thu,  5 Nov 2020 14:49:17 +1100
Message-Id: <20201105034919.393653-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105034919.393653-1-david@gibson.dropbear.id.au>
References: <20201105034919.393653-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:49:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
../target/ppc/excp_helper.c: In function ‘powerpc_excp’:
../target/ppc/excp_helper.c:529:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
  529 |         msr |= env->error_code;
      |         ~~~~^~~~~~~~~~~~~~~~~~
../target/ppc/excp_helper.c:530:5: note: here
  530 |     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
      |     ^~~~

Add the corresponding "fall through" comment to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20201028055107.2170401-1-kuhn.chenqun@huawei.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d7411bcc81..ad0612555d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -527,6 +527,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
         msr |= env->error_code;
+        /* fall through */
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
     case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
-- 
2.28.0


