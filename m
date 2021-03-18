Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00968340869
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:07:18 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuF3-0000tf-23
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8o-0005Z1-T2
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8l-0005bZ-Gc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616079645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlKHFHC0Q0JoUnvY6Xg/B0UUnONgzKq6R19/MfSXZJg=;
 b=blqtNE7CFaL+x5mFH3Yuze6I7+GbJxPdoIW8vhCRlsdOAk6YQUcsDm0Ma/BHY/KxHKzS8f
 DWKxgKix6NoVBe5tbvtk/HwFjUbWt2o9SV8Jn4+emQcqMzEazp/lhHNZC1FJGwq2JrrYTJ
 YEqBOhBA8NBqepbWsEQKX/2Q0pQ8Jhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-v16nf2eiNC-I8tB4kvN7iA-1; Thu, 18 Mar 2021 11:00:43 -0400
X-MC-Unique: v16nf2eiNC-I8tB4kvN7iA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DCA8107BA67
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE86667879
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/i386: svm: do not discard high 32 bits of EXITINFO1
Date: Thu, 18 Mar 2021 11:00:22 -0400
Message-Id: <20210318150022.1824646-4-pbonzini@redhat.com>
In-Reply-To: <20210318150022.1824646-1-pbonzini@redhat.com>
References: <20210318150022.1824646-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

env->error_code is only 32-bits wide, so the high 32 bits of EXITINFO1
are being lost.  However, even though saving guest state and restoring
host state must be delayed to do_vmexit, because they might take tb_lock,
it is always possible to write to the VMCB.  So do this for the exit
code and EXITINFO1, just like it is already being done for EXITINFO2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/helper-tcg.h |  2 +-
 target/i386/tcg/seg_helper.c |  4 ++--
 target/i386/tcg/svm_helper.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index ef60e2e04b..bcdfca06f6 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -80,7 +80,7 @@ void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 /* svm_helper.c */
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
                               uint64_t exit_info_1, uintptr_t retaddr);
-void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1);
+void do_vmexit(CPUX86State *env);
 
 /* seg_helper.c */
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 180d47f0e9..d180a381d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1305,9 +1305,9 @@ void x86_cpu_do_interrupt(CPUState *cs)
     /* successfully delivered */
     env->old_exception = -1;
 #else
-    if (cs->exception_index >= EXCP_VMEXIT) {
+    if (cs->exception_index == EXCP_VMEXIT) {
         assert(env->old_exception == -1);
-        do_vmexit(env, cs->exception_index - EXCP_VMEXIT, env->error_code);
+        do_vmexit(env);
     } else {
         do_interrupt_all(cpu, cs->exception_index,
                          env->exception_is_int,
diff --git a/target/i386/tcg/svm_helper.c b/target/i386/tcg/svm_helper.c
index 097bb9b83d..0145afceae 100644
--- a/target/i386/tcg/svm_helper.c
+++ b/target/i386/tcg/svm_helper.c
@@ -621,15 +621,19 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1,
                                                    control.exit_info_2)),
                   env->eip);
 
-    cs->exception_index = EXCP_VMEXIT + exit_code;
-    env->error_code = exit_info_1;
+    cs->exception_index = EXCP_VMEXIT;
+    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_code),
+             exit_code);
+
+    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
+                                             control.exit_info_1), exit_info_1),
 
     /* remove any pending exception */
     env->old_exception = -1;
     cpu_loop_exit(cs);
 }
 
-void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1)
+void do_vmexit(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
     uint32_t int_ctl;
@@ -762,11 +766,6 @@ void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1)
                           env->vm_hsave + offsetof(struct vmcb, save.dr7));
 
     /* other setups */
-    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_code),
-             exit_code);
-    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_1),
-             exit_info_1);
-
     x86_stl_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, control.exit_int_info),
              x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-- 
2.26.2


