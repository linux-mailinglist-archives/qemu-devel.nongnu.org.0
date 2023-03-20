Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD12B6C12B1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBQ-0001Mz-4L; Mon, 20 Mar 2023 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBG-0001Js-Gw
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBD-0006LK-UT
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9flI4PdQTvDEg4fhxYyN1CJSUU2qCeiYzo+5BWJ2aFk=;
 b=d4L15GAR/jJXcJBI8AxAs3FQEQ7UhOzr+tb3fs8vNJUSJuU5pnsrGAkDL5ygAbu9LtwUct
 p8K75LD0ztgk/1O2qsvnoUogeUJn0A3+7f93keZ+E04WLOjwJoQnqLtuwji25Ly5J5n6XQ
 Rg2hX2gEQACpza2WkovzarwDKI+J5e4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-ZRZ5O-spPb6BSwaLpH_h1w-1; Mon, 20 Mar 2023 09:04:02 -0400
X-MC-Unique: ZRZ5O-spPb6BSwaLpH_h1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C356F8825FA;
 Mon, 20 Mar 2023 13:03:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9CA7C15BA0;
 Mon, 20 Mar 2023 13:03:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 03/24] target/s390x: Implement Early Exception Recognition
Date: Mon, 20 Mar 2023 14:03:09 +0100
Message-Id: <20230320130330.406378-4-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Generate a specification exception if a reserved bit is set in the PSW
mask or if the PSW address is out of bounds dictated by the addressing
mode.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230315020408.384766-3-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.h             |  1 +
 target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
 target/s390x/tcg/excp_helper.c |  3 ++-
 target/s390x/tcg/translate.c   | 16 ++++++++++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..16f6354751 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -292,6 +292,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #define PSW_MASK_32             0x0000000080000000ULL
 #define PSW_MASK_SHORT_ADDR     0x000000007fffffffULL
 #define PSW_MASK_SHORT_CTRL     0xffffffff80000000ULL
+#define PSW_MASK_RESERVED       0xb80800fe7fffffffULL
 
 #undef PSW_ASC_PRIMARY
 #undef PSW_ASC_ACCREG
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index b10a8541ff..40fdeaa905 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -41,6 +41,26 @@
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
 
+#ifndef CONFIG_USER_ONLY
+static bool is_early_exception_psw(uint64_t mask, uint64_t addr)
+{
+    if (mask & PSW_MASK_RESERVED) {
+        return true;
+    }
+
+    switch (mask & (PSW_MASK_32 | PSW_MASK_64)) {
+    case 0:
+        return addr & ~0xffffffULL;
+    case PSW_MASK_32:
+        return addr & ~0x7fffffffULL;
+    case PSW_MASK_32 | PSW_MASK_64:
+        return false;
+    default: /* PSW_MASK_64 */
+        return true;
+    }
+}
+#endif
+
 void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
 {
 #ifndef CONFIG_USER_ONLY
@@ -57,6 +77,12 @@ void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
     env->cc_op = (mask >> 44) & 3;
 
 #ifndef CONFIG_USER_ONLY
+    if (is_early_exception_psw(mask, addr)) {
+        env->int_pgm_ilen = 0;
+        trigger_pgm_exception(env, PGM_SPECIFICATION);
+        return;
+    }
+
     if ((old_mask ^ mask) & PSW_MASK_PER) {
         s390_cpu_recompute_watchpoints(env_cpu(env));
     }
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index bc767f0443..a7829b1e49 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -212,7 +212,8 @@ static void do_program_interrupt(CPUS390XState *env)
     LowCore *lowcore;
     int ilen = env->int_pgm_ilen;
 
-    assert(ilen == 2 || ilen == 4 || ilen == 6);
+    assert((env->int_pgm_code == PGM_SPECIFICATION && ilen == 0) ||
+           ilen == 2 || ilen == 4 || ilen == 6);
 
     switch (env->int_pgm_code) {
     case PGM_PER:
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2e1e7e046a..7832cf02a6 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4068,9 +4068,23 @@ static DisasJumpType op_sske(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static void gen_check_psw_mask(DisasContext *s)
+{
+    TCGv_i64 reserved = tcg_temp_new_i64();
+    TCGLabel *ok = gen_new_label();
+
+    tcg_gen_andi_i64(reserved, psw_mask, PSW_MASK_RESERVED);
+    tcg_gen_brcondi_i64(TCG_COND_EQ, reserved, 0, ok);
+    gen_program_exception(s, PGM_SPECIFICATION);
+    gen_set_label(ok);
+}
+
 static DisasJumpType op_ssm(DisasContext *s, DisasOps *o)
 {
     tcg_gen_deposit_i64(psw_mask, psw_mask, o->in2, 56, 8);
+
+    gen_check_psw_mask(s);
+
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -4331,6 +4345,8 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
         tcg_gen_ori_i64(psw_mask, psw_mask, i2 << 56);
     }
 
+    gen_check_psw_mask(s);
+
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
-- 
2.31.1


