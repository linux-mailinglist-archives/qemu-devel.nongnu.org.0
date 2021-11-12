Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4544E9D9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:18:43 +0100 (CET)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYKA-0003GF-75
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2f-00044a-T4; Fri, 12 Nov 2021 10:00:39 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:41362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2d-0005xk-2F; Fri, 12 Nov 2021 10:00:37 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 92EB741F6A;
 Fri, 12 Nov 2021 16:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1636729204;
 bh=ZbuE41I4ToKCEVROqpL73QWYIegUfvelcyR0I+2cios=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QrxDOqhIBS5cXXm8Q/Q8Qio7mvi5mQl0Uj3Dn0zGMrkf33OXS+Wu245q6K508JnRS
 mcsFtxONUwoYVLD+L4n88HBp6oEMReGU9q9oKmBXu42LpzOBwvrAYXKj41j9VMLE2d
 bBFogWOGqVbc8UayhY4K8FaFpyIaaEv88VG2lu//hTgyr8SxUOiqD0GqvgQtHcvaO0
 KwOnrfq9+LTYEm57EHqxvTRunxGiXib+9okO5nbAFiVFHRP6bSgRhdF+nGjQW+3vVp
 CFBNtoPrk3znVY8fFqmW6Bkujem/o5+6E3qY4kt8hJTDD1xNn6VwiciG7Yv63M5N5Z
 9ULxmks5SZk2A==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7D1DE60067;
 Fri, 12 Nov 2021 16:00:04 +0100 (CET)
Received: from palmier.tima.u-ga.fr (unknown [217.114.201.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 3D1FD14005C;
 Fri, 12 Nov 2021 16:00:04 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 16/18] target/riscv: helper functions to wrap calls to
 128-bit csr insns
Date: Fri, 12 Nov 2021 15:59:00 +0100
Message-Id: <20211112145902.205131-17-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given the side effects they have, the csr instructions are realized as
helpers. We extend this existing infrastructure for 128-bit sized csr.
We return 128-bit values using the same approach as for div/rem.
Theses helpers all call a unique function that is currently a fallback
on the 64-bit version.
The trans_csrxx functions supporting 128-bit are yet to be implemented.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h       |  4 ++++
 target/riscv/helper.h    |  3 +++
 target/riscv/csr.c       | 17 ++++++++++++++++
 target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 15609a5533..6828c136ad 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -483,6 +483,10 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
                                           target_ulong new_value,
                                           target_ulong write_mask);
 
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c036825723..bf2b338bfd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,9 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
 DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
+DEF_HELPER_2(csrr_i128, tl, env, int)
+DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
+DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..dca9e19a64 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1788,6 +1788,23 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                               Int128 *ret_value,
+                               Int128 new_value, Int128 write_mask)
+{
+    /* fall back to 64-bit version for now */
+    target_ulong ret_64;
+    RISCVException ret = riscv_csrrw(env, csrno, &ret_64,
+                                     int128_getlo(new_value),
+                                     int128_getlo(write_mask));
+
+    if (ret_value) {
+        *ret_value = int128_make64(ret_64);
+    }
+
+    return ret;
+}
+
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ee7c24efe7..f4cf9c4698 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -69,6 +69,50 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
     return val;
 }
 
+target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
+{
+    Int128 rv = int128_zero();
+    RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
+                                          int128_zero(),
+                                          int128_zero());
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh = int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
+void helper_csrw_i128(CPURISCVState *env, int csr,
+                      target_ulong srcl, target_ulong srch)
+{
+    RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
+                                          int128_make128(srcl, srch),
+                                          UINT128_MAX);
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+}
+
+target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
+                       target_ulong srcl, target_ulong srch,
+                       target_ulong maskl, target_ulong maskh)
+{
+    Int128 rv = int128_zero();
+    RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
+                                          int128_make128(srcl, srch),
+                                          int128_make128(maskl, maskh));
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh = int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
-- 
2.33.1


