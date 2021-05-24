Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008B38E843
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:05:04 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBCZ-00089y-Fv
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llB7A-0003FY-PX; Mon, 24 May 2021 09:59:28 -0400
Received: from [201.28.113.2] (port=6892 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llB79-000159-9C; Mon, 24 May 2021 09:59:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 24 May 2021 10:59:18 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 0E4A1801360;
 Mon, 24 May 2021 10:59:18 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] target/ppc: used ternary operator when registering MAS
Date: Mon, 24 May 2021 10:59:05 -0300
Message-Id: <20210524135908.47505-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 24 May 2021 13:59:18.0200 (UTC)
 FILETIME=[FD1B4380:01D750A4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The write calback decision when registering the MAS SPR has been turned
into a ternary operation, rather than an if-then-else block.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b696469d1a..40719f6480 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1205,15 +1205,12 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i = 0; i < 8; i++) {
-        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
-            &spr_write_generic32;
-        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
-            uea_write = &spr_write_generic;
-        }
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, uea_write,
+                         &spr_read_generic,
+                         (i == 2 && (env->insns_flags & PPC_64B))
+                         ? &spr_write_generic : &spr_write_generic32,
                          0x00000000);
         }
     }
-- 
2.17.1


