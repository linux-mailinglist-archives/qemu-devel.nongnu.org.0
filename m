Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC43F8AA3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:03:08 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGuJ-0001Sy-2n
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGon-0005gR-Tf; Thu, 26 Aug 2021 10:57:25 -0400
Received: from [201.28.113.2] (port=34533 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGom-00062m-FD; Thu, 26 Aug 2021 10:57:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 26 Aug 2021 11:57:21 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 67550800930;
 Thu, 26 Aug 2021 11:57:21 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/2] target/ppc: fix vector registers access in gdbstub for
 little-endian
Date: Thu, 26 Aug 2021 11:56:56 -0300
Message-Id: <20210826145656.2507213-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
References: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 14:57:21.0807 (UTC)
 FILETIME=[AC5401F0:01D79A8A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, richard.henderson@linaro.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

As vector registers are stored in host endianness, we shouldn't swap its
64-bit elements in user mode. Add a 16-byte case in
ppc_maybe_bswap_register to handle the reordering of elements in softmmu
and remove avr_need_swap which is now unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
The fix of the order of Int128 fields is in the based-on patchset.
---
 target/ppc/gdbstub.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 09ff1328d4..1808a150e4 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -101,6 +101,8 @@ void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
         bswap32s((uint32_t *)mem_buf);
     } else if (len == 8) {
         bswap64s((uint64_t *)mem_buf);
+    } else if (len == 16) {
+        bswap128s((Int128 *)mem_buf);
     } else {
         g_assert_not_reached();
     }
@@ -389,15 +391,6 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
 }
 #endif
 
-static bool avr_need_swap(CPUPPCState *env)
-{
-#ifdef HOST_WORDS_BIGENDIAN
-    return msr_le;
-#else
-    return !msr_le;
-#endif
-}
-
 #if !defined(CONFIG_USER_ONLY)
 static int gdb_find_spr_idx(CPUPPCState *env, int n)
 {
@@ -486,14 +479,9 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
 
     if (n < 32) {
         ppc_avr_t *avr = cpu_avr_ptr(env, n);
-        if (!avr_need_swap(env)) {
-            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
-        } else {
-            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
-        }
+        gdb_get_reg128(buf, avr->VsrD(0), avr->VsrD(1));
         mem_buf = gdb_get_reg_ptr(buf, 16);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
+        ppc_maybe_bswap_register(env, mem_buf, 16);
         return 16;
     }
     if (n == 32) {
@@ -515,15 +503,9 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
         ppc_avr_t *avr = cpu_avr_ptr(env, n);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
-        if (!avr_need_swap(env)) {
-            avr->u64[0] = ldq_p(mem_buf);
-            avr->u64[1] = ldq_p(mem_buf + 8);
-        } else {
-            avr->u64[1] = ldq_p(mem_buf);
-            avr->u64[0] = ldq_p(mem_buf + 8);
-        }
+        ppc_maybe_bswap_register(env, mem_buf, 16);
+        avr->VsrD(0) = ldq_p(mem_buf);
+        avr->VsrD(1) = ldq_p(mem_buf + 8);
         return 16;
     }
     if (n == 32) {
-- 
2.25.1


