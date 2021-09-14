Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CE40B27C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:05:57 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQA0S-0005Hc-RO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9R3-0003gY-11
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Qo-0000RL-Rm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x065cSLMcIxjIsC6dZCKtLmVC91lemlf3ABAXb8msuA=;
 b=Pyb60yDb1+EfUKPxl3x+0xHcdN3cgzuovieB/A1D8kRaXloXHuIrjrHyUkde5EiN/ouOt1
 62G0C10WmXa3p0pVy3Nlg0feo8lnVbMyLhyRxHYRN7r77KgXT8DDMWW81tUF0aRNCE5BSP
 lyd63Po4EPUPqny+fYY6tl0BhZwo5YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-I2ieP_RGMkWjPpCx5-6cVg-1; Tue, 14 Sep 2021 10:29:04 -0400
X-MC-Unique: I2ieP_RGMkWjPpCx5-6cVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 348FD19200C1;
 Tue, 14 Sep 2021 14:29:01 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E11ED5D9CA;
 Tue, 14 Sep 2021 14:28:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/53] target/s390x: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:12 +0100
Message-Id: <20210914142042.1655100-24-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/s390x/cpu-dump.c       | 43 ++++++++++++++++++-----------------
 target/s390x/cpu.c            |  2 +-
 target/s390x/s390x-internal.h |  2 +-
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
index 0f5c062994..9c6eaa9938 100644
--- a/target/s390x/cpu-dump.c
+++ b/target/s390x/cpu-dump.c
@@ -25,66 +25,67 @@
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
 
-void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void s390_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
-                 s390_cpu_get_psw_mask(env), env->psw.addr);
+    g_string_append_printf(buf, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
+                           s390_cpu_get_psw_mask(env), env->psw.addr);
     if (!tcg_enabled()) {
-        qemu_fprintf(f, "\n");
+        g_string_append_printf(buf, "\n");
     } else if (env->cc_op > 3) {
-        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
+        g_string_append_printf(buf, " cc %15s\n", cc_name(env->cc_op));
     } else {
-        qemu_fprintf(f, " cc %02x\n", env->cc_op);
+        g_string_append_printf(buf, " cc %02x\n", env->cc_op);
     }
 
     for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%016" PRIx64, i, env->regs[i]);
+        g_string_append_printf(buf, "R%02d=%016" PRIx64, i, env->regs[i]);
         if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         } else {
-            qemu_fprintf(f, " ");
+            g_string_append_printf(buf, " ");
         }
     }
 
     if (flags & CPU_DUMP_FPU) {
         if (s390_has_feat(S390_FEAT_VECTOR)) {
             for (i = 0; i < 32; i++) {
-                qemu_fprintf(f, "V%02d=%016" PRIx64 "%016" PRIx64 "%c",
-                             i, env->vregs[i][0], env->vregs[i][1],
-                             i % 2 ? '\n' : ' ');
+                g_string_append_printf(buf,
+                                       "V%02d=%016" PRIx64 "%016" PRIx64 "%c",
+                                       i, env->vregs[i][0], env->vregs[i][1],
+                                       i % 2 ? '\n' : ' ');
             }
         } else {
             for (i = 0; i < 16; i++) {
-                qemu_fprintf(f, "F%02d=%016" PRIx64 "%c",
-                             i, *get_freg(env, i),
-                             (i % 4) == 3 ? '\n' : ' ');
+                g_string_append_printf(buf, "F%02d=%016" PRIx64 "%c",
+                                       i, *get_freg(env, i),
+                                       (i % 4) == 3 ? '\n' : ' ');
             }
         }
     }
 
 #ifndef CONFIG_USER_ONLY
     for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "C%02d=%016" PRIx64, i, env->cregs[i]);
+        g_string_append_printf(buf, "C%02d=%016" PRIx64, i, env->cregs[i]);
         if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         } else {
-            qemu_fprintf(f, " ");
+            g_string_append_printf(buf, " ");
         }
     }
 #endif
 
 #ifdef DEBUG_INLINE_BRANCHES
     for (i = 0; i < CC_OP_MAX; i++) {
-        qemu_fprintf(f, "  %15s = %10ld\t%10ld\n", cc_name(i),
-                     inline_branch_miss[i], inline_branch_hit[i]);
+        g_string_append_printf(buf, "  %15s = %10ld\t%10ld\n", cc_name(i),
+                               inline_branch_miss[i], inline_branch_hit[i]);
     }
 #endif
 
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 const char *cc_name(enum cc_op cc_op)
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..b6bf628074 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -293,7 +293,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
-    cc->dump_state = s390_cpu_dump_state;
+    cc->format_state = s390_cpu_format_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 7a6aa4dacc..0ee99b8b1e 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -313,7 +313,7 @@ void s390_cpu_gdb_init(CPUState *cs);
 
 
 /* helper.c */
-void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void s390_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 void do_restart_interrupt(CPUS390XState *env);
 #ifndef CONFIG_USER_ONLY
 void s390_cpu_recompute_watchpoints(CPUState *cs);
-- 
2.31.1


