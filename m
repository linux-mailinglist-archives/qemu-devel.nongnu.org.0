Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6138CF06
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 22:25:11 +0200 (CEST)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkBhm-0005cn-A6
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 16:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbM-0005up-F5; Fri, 21 May 2021 16:18:32 -0400
Received: from [201.28.113.2] (port=1319 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbL-0001Nf-51; Fri, 21 May 2021 16:18:32 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 17:18:19 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 282EF8013E6;
 Fri, 21 May 2021 17:18:19 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/9] target/ppc: cleaned error_report from ppc_store_sdr1
Date: Fri, 21 May 2021 17:17:51 -0300
Message-Id: <20210521201759.85475-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 May 2021 20:18:19.0307 (UTC)
 FILETIME=[709F8FB0:01D74E7E]
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

Changed how the function ppc_store_sdr1, from error_report(...) to
qemu_log_mask(LOG_GUEST_ERROR, ...).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index d957d1a687..9cf3288b7a 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -77,13 +77,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
         target_ulong htabsize = value & SDR_64_HTABSIZE;
 
         if (value & ~sdr_mask) {
-            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
-                         value & ~sdr_mask);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
+                     " set in SDR1", value & ~sdr_mask);
             value &= sdr_mask;
         }
         if (htabsize > 28) {
-            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in SDR1",
-                         htabsize);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
+                     " stored in SDR1", htabsize);
             return;
         }
     }
-- 
2.17.1


