Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658237A19F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:21:33 +0200 (CEST)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNe0-0006Ko-8Z
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWm-0001bO-NF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWi-0000j2-5s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Q40wmbqBAMVqecV8VMuWM2pj+vJUZbaBPje2e4px8Q=;
 b=ErbTSUDQQM2a+ASVizoJbqpu/mxsjmiuN2qk4yoY/5wjEuuYyMxgYQ2sX6RcWZ3WtF/PkY
 2E0dhJxDN8cL8WvqWjlJwDfBSw6+b4xTfHqG14bs3AMNomhntJXr2dXsB2fhsUjibSB3kt
 Yu7yclmgn0qtxpOweyI94fb2X1a1gT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-iqHxlBGaMvekmdGiD6zerw-1; Tue, 11 May 2021 04:13:57 -0400
X-MC-Unique: iqHxlBGaMvekmdGiD6zerw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40EFD801817;
 Tue, 11 May 2021 08:13:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C240C5D9E3;
 Tue, 11 May 2021 08:13:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] i386: split smm helper (sysemu)
Date: Tue, 11 May 2021 04:13:26 -0400
Message-Id: <20210511081350.419428-10-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

smm is only really useful for sysemu, split in two modules
around the CONFIG_USER_ONLY, in order to remove the ifdef
and use the build system instead.

add cpu_abort() when detecting attempts to enter SMM mode via
SMI interrupt in user-mode, and assert that the cpu is not
in SMM mode while translating RSM instructions.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-12-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h                      |  4 ++++
 target/i386/tcg/meson.build               |  1 -
 target/i386/tcg/seg_helper.c              |  4 ++++
 target/i386/tcg/sysemu/meson.build        |  1 +
 target/i386/tcg/{ => sysemu}/smm_helper.c | 19 ++-----------------
 target/i386/tcg/translate.c               |  5 +++++
 6 files changed, 16 insertions(+), 18 deletions(-)
 rename target/i386/tcg/{ => sysemu}/smm_helper.c (98%)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index c2ae2f7e61..8ffda4cdc6 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -70,7 +70,11 @@ DEF_HELPER_1(clac, void, env)
 DEF_HELPER_1(stac, void, env)
 DEF_HELPER_3(boundw, void, env, tl, int)
 DEF_HELPER_3(boundl, void, env, tl, int)
+
+#ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(rsm, void, env)
+#endif /* !CONFIG_USER_ONLY */
+
 DEF_HELPER_2(into, void, env, int)
 DEF_HELPER_2(cmpxchg8b_unlocked, void, env, tl)
 DEF_HELPER_2(cmpxchg8b, void, env, tl)
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 320bcd1e46..449d9719ef 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'mpx_helper.c',
   'seg_helper.c',
-  'smm_helper.c',
   'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index d180a381d1..b6230ebdf4 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1351,7 +1351,11 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     case CPU_INTERRUPT_SMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
         cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
+#ifdef CONFIG_USER_ONLY
+        cpu_abort(CPU(cpu), "SMI interrupt: cannot enter SMM in user-mode");
+#else
         do_smm_enter(cpu);
+#endif /* CONFIG_USER_ONLY */
         break;
     case CPU_INTERRUPT_NMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 4ab30cc32e..35ba16dc3d 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,3 +1,4 @@
 i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu.c',
+  'smm_helper.c',
 ))
diff --git a/target/i386/tcg/smm_helper.c b/target/i386/tcg/sysemu/smm_helper.c
similarity index 98%
rename from target/i386/tcg/smm_helper.c
rename to target/i386/tcg/sysemu/smm_helper.c
index 62d027abd3..a45b5651c3 100644
--- a/target/i386/tcg/smm_helper.c
+++ b/target/i386/tcg/sysemu/smm_helper.c
@@ -1,5 +1,5 @@
 /*
- *  x86 SMM helpers
+ *  x86 SMM helpers (sysemu-only)
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
@@ -18,27 +18,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
-#include "helper-tcg.h"
+#include "tcg/helper-tcg.h"
 
 
 /* SMM support */
 
-#if defined(CONFIG_USER_ONLY)
-
-void do_smm_enter(X86CPU *cpu)
-{
-}
-
-void helper_rsm(CPUX86State *env)
-{
-}
-
-#else
-
 #ifdef TARGET_X86_64
 #define SMM_REVISION_ID 0x00020064
 #else
@@ -330,5 +317,3 @@ void helper_rsm(CPUX86State *env)
     qemu_log_mask(CPU_LOG_INT, "SMM: after RSM\n");
     log_cpu_state_mask(CPU_LOG_INT, CPU(cpu), CPU_DUMP_CCOP);
 }
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 880bc45561..b02bdf5ea2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8325,9 +8325,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_RSM);
         if (!(s->flags & HF_SMM_MASK))
             goto illegal_op;
+#ifdef CONFIG_USER_ONLY
+        /* we should not be in SMM mode */
+        g_assert_not_reached();
+#else
         gen_update_cc_op(s);
         gen_jmp_im(s, s->pc - s->cs_base);
         gen_helper_rsm(cpu_env);
+#endif /* CONFIG_USER_ONLY */
         gen_eob(s);
         break;
     case 0x1b8: /* SSE4.2 popcnt */
-- 
2.26.2



