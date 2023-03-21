Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBA6C36C2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:17:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peefJ-00077p-0j; Tue, 21 Mar 2023 12:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org>)
 id 1peef4-00073F-Oo
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:16:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org>)
 id 1peeey-00085B-TU
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:16:31 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PgxYh3DLsz4xFT;
 Wed, 22 Mar 2023 03:16:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PgxYg0vG1z4x1f;
 Wed, 22 Mar 2023 03:16:22 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-8.0 v2 3/3] target/ppc: Fix helper_pminsn() prototype
Date: Tue, 21 Mar 2023 17:16:09 +0100
Message-Id: <20230321161609.716474-4-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321161609.716474-1-clg@kaod.org>
References: <20230321161609.716474-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cédric Le Goater <clg@redhat.com>

GCC13 reports an error:

../target/ppc/excp_helper.c:2625:6: error: conflicting types for ‘helper_pminsn’ due to enum/integer mismatch; have ‘void(CPUPPCState *, powerpc_pm_insn_t)’ {aka ‘void(struct CPUArchState *, powerpc_pm_insn_t)’} [-Werror=enum-int-mismatch]
 2625 | void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
      |      ^~~~~~~~~~~~~
In file included from /home/legoater/work/qemu/qemu.git/include/qemu/osdep.h:49,
                 from ../target/ppc/excp_helper.c:19:
/home/legoater/work/qemu/qemu.git/include/exec/helper-head.h:23:27: note: previous declaration of ‘helper_pminsn’ with type ‘void(CPUArchState *, uint32_t)’ {aka ‘void(CPUArchState *, unsigned int)’}
   23 | #define HELPER(name) glue(helper_, name)
      |                           ^~~~~~~

Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Fixes: 7778a575c7 ("ppc: Add P7/P8 Power Management instructions")
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 287659c74d..199328f4b6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2622,7 +2622,7 @@ void helper_scv(CPUPPCState *env, uint32_t lev)
     }
 }
 
-void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
+void helper_pminsn(CPUPPCState *env, uint32_t insn)
 {
     CPUState *cs;
 
-- 
2.39.2


