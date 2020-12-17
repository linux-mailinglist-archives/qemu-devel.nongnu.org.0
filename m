Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04192DD8EC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:57:45 +0100 (CET)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyTA-0002rJ-UW
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIY-0006Ru-F5
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIW-0001zR-7A
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRybjbzGcAU8YxqDmZX9bVl6w98FTTSZhrTDjcgMLTU=;
 b=bZGK0vtSXyJSWCzg0dOvo1f1UcVOT26um/aSaM5rsU3LN2TMUa8P54PHYCebcP75csrEIJ
 1RMir4X6k2lnXn7alsJO3hN3iag8p4qBvbM1pj96sX6wCNsfFWsCokXAxycfod5sXxP1bL
 20jYQzmwPigLw1nt2tseLs6ZF6WvNo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-dhZCFGoSOMOudb_CVRJDuQ-1; Thu, 17 Dec 2020 13:46:41 -0500
X-MC-Unique: dhZCFGoSOMOudb_CVRJDuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289B6107ACE8;
 Thu, 17 Dec 2020 18:46:40 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFFCA1B473;
 Thu, 17 Dec 2020 18:46:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 14/17] tcg: cpu_exec_{enter,exit} helpers
Date: Thu, 17 Dec 2020 13:46:17 -0500
Message-Id: <20201217184620.3945917-15-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move invocation of CPUClass.cpu_exec_*() to separate helpers,
to make it easier to refactor that code later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201212155530.23098-10-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 accel/tcg/cpu-exec.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c2c26489c7..58117f175a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -236,9 +236,22 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
 }
 #endif
 
-void cpu_exec_step_atomic(CPUState *cpu)
+static void cpu_exec_enter(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    cc->cpu_exec_enter(cpu);
+}
+
+static void cpu_exec_exit(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    cc->cpu_exec_exit(cpu);
+}
+
+void cpu_exec_step_atomic(CPUState *cpu)
+{
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
@@ -257,11 +270,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
 
         /* Since we got here, we know that parallel_cpus must be true.  */
         parallel_cpus = false;
-        cc->cpu_exec_enter(cpu);
+        cpu_exec_enter(cpu);
         /* execute the generated code */
         trace_exec_tb(tb, pc);
         cpu_tb_exec(cpu, tb);
-        cc->cpu_exec_exit(cpu);
+        cpu_exec_exit(cpu);
     } else {
         /*
          * The mmap_lock is dropped by tb_gen_code if it runs out of
@@ -713,7 +726,7 @@ int cpu_exec(CPUState *cpu)
 
     rcu_read_lock();
 
-    cc->cpu_exec_enter(cpu);
+    cpu_exec_enter(cpu);
 
     /* Calculate difference between guest clock and host clock.
      * This delay includes the delay of the last cycle, so
@@ -775,7 +788,7 @@ int cpu_exec(CPUState *cpu)
         }
     }
 
-    cc->cpu_exec_exit(cpu);
+    cpu_exec_exit(cpu);
     rcu_read_unlock();
 
     return ret;
-- 
2.28.0


