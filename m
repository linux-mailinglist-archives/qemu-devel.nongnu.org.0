Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3E55BA8B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:37:50 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ps5-0001m8-1M
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjC-0000HK-Kp; Mon, 27 Jun 2022 10:28:38 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjA-0002K1-5q; Mon, 27 Jun 2022 10:28:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2F4198001D4;
 Mon, 27 Jun 2022 11:11:12 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 4/6] target/ppc: fix exception error code in helper_{load,
 store}_dcr
Date: Mon, 27 Jun 2022 11:11:02 -0300
Message-Id: <20220627141104.669152-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:12.0505 (UTC)
 FILETIME=[C1AFCE90:01D88A2F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWERPC_EXCP_INVAL should only be or-ed with other constants prefixed
with POWERPC_EXCP_INVAL_. Also, take the opportunity to move both
helpers under #if !defined(CONFIG_USER_ONLY) as the instructions that
use them are privileged.

No functional change is intended, the lower 4 bits of the error code are
ignored by all powerpc_excp_* methods on POWERPC_EXCP_INVAL exceptions.

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h          | 2 +-
 target/ppc/timebase_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6233e28d85..c6895f2f99 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -684,10 +684,10 @@ DEF_HELPER_2(book3s_msgclr, void, env, tl)
 DEF_HELPER_4(dlmzb, tl, env, tl, tl, i32)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(rac, tl, env, tl)
-#endif
 
 DEF_HELPER_2(load_dcr, tl, env, tl)
 DEF_HELPER_3(store_dcr, void, env, tl, tl)
+#endif
 
 DEF_HELPER_2(load_dump_spr, void, env, i32)
 DEF_HELPER_2(store_dump_spr, void, env, i32)
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index 86d01d6e4e..b80f56af7e 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -143,7 +143,6 @@ void helper_store_booke_tsr(CPUPPCState *env, target_ulong val)
 {
     store_booke_tsr(env, val);
 }
-#endif
 
 /*****************************************************************************/
 /* Embedded PowerPC specific helpers */
@@ -169,7 +168,7 @@ target_ulong helper_load_dcr(CPUPPCState *env, target_ulong dcrn)
                           (uint32_t)dcrn, (uint32_t)dcrn);
             raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
                                    POWERPC_EXCP_INVAL |
-                                   POWERPC_EXCP_PRIV_REG, GETPC());
+                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
         }
     }
     return val;
@@ -192,7 +191,8 @@ void helper_store_dcr(CPUPPCState *env, target_ulong dcrn, target_ulong val)
                           (uint32_t)dcrn, (uint32_t)dcrn);
             raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
                                    POWERPC_EXCP_INVAL |
-                                   POWERPC_EXCP_PRIV_REG, GETPC());
+                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
         }
     }
 }
+#endif
-- 
2.25.1


