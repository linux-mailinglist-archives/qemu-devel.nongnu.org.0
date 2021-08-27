Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044AF3F953F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:40:27 +0200 (CEST)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWTH-00050a-EY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0U-0001Xk-MR; Fri, 27 Aug 2021 03:10:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44133 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0S-0007Yp-TV; Fri, 27 Aug 2021 03:10:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ6tssz9t0p; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=NPzF9dR+Ne0EN3AVW3Gugr5uyLZL0QnOMa6+I6bCoBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lxmqXWiZv8cyUqwssfG247HB+lNUkOj/iKCirgm+QVC+G5XqNXNRoQLSX7HN23PA0
 ipsIGvCt99OZ2sRc/joRhb4mEK5uH1NIk5gryukuhn9EciAubVuHyrUKmL2Jic8iAc
 TAxMKt/7tLUI3yDBCfC9SvnpfIe7ZotSIkF7CB+Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/18] target/ppc: fix vector registers access in gdbstub for
 little-endian
Date: Fri, 27 Aug 2021 17:09:46 +1000
Message-Id: <20210827070946.219970-19-david@gibson.dropbear.id.au>
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

As vector registers are stored in host endianness, we shouldn't swap its
64-bit elements in user mode. Add a 16-byte case in
ppc_maybe_bswap_register to handle the reordering of elements in softmmu
and remove avr_need_swap which is now unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210826145656.2507213-3-matheus.ferst@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


