Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B540B1E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:47:06 +0200 (CEST)
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9iD-0002o0-ON
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ls-0004Yr-TP
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Lr-00054M-1l
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ocCcBzbBdzil9FXe57cZVezF7Lyvm73oMJaNhuDio4=;
 b=R92HV/U91UpDUlCNLY3QmzjreDN9362QM9TuGDz2ewkNwgSwfHje7ZUah6rkDUfYGTtsdI
 Y5XoJlPYts93i93pzp9kPHop2Gi5evmJFPZ2s+TKY0D1/RFRaC/Q+YoVRyIrZCE0y0gvVB
 trp2/Ve5BZHzHabkZM/k8jdpEfwGi6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-nOwsKEuIPtGuGn2e9YWnZw-1; Tue, 14 Sep 2021 10:23:57 -0400
X-MC-Unique: nOwsKEuIPtGuGn2e9YWnZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5172C801E72;
 Tue, 14 Sep 2021 14:23:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F20AA5D9CA;
 Tue, 14 Sep 2021 14:23:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/53] target/cris: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:19:59 +0100
Message-Id: <20210914142042.1655100-11-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 target/cris/cpu.c       |  2 +-
 target/cris/cpu.h       |  2 +-
 target/cris/translate.c | 33 +++++++++++++++++----------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 70932b1f8c..5159cf6528 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -295,7 +295,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
-    cc->dump_state = cris_cpu_dump_state;
+    cc->format_state = cris_cpu_format_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b6492909..908cb051da 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -191,7 +191,7 @@ void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
-void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void cris_cpu_format_state(CPUState *cs, GString *buf, int flags);
 
 hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index a84b753349..6098693186 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3307,7 +3307,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&cris_tr_ops, &dc.base, cs, tb, max_insns);
 }
 
-void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void cris_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
     CPUCRISState *env = &cpu->env;
@@ -3326,40 +3326,41 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         regnames = regnames_v32;
     }
 
-    qemu_fprintf(f, "PC=%x CCS=%x btaken=%d btarget=%x\n"
-                 "cc_op=%d cc_src=%d cc_dest=%d cc_result=%x cc_mask=%x\n",
-                 env->pc, env->pregs[PR_CCS], env->btaken, env->btarget,
-                 env->cc_op,
-                 env->cc_src, env->cc_dest, env->cc_result, env->cc_mask);
+    g_string_append_printf(buf, "PC=%x CCS=%x btaken=%d btarget=%x\n"
+                           "cc_op=%d cc_src=%d cc_dest=%d cc_result=%x "
+                           "cc_mask=%x\n",
+                           env->pc, env->pregs[PR_CCS], env->btaken,
+                           env->btarget, env->cc_op, env->cc_src,
+                           env->cc_dest, env->cc_result, env->cc_mask);
 
 
     for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "%s=%8.8x ", regnames[i], env->regs[i]);
+        g_string_append_printf(buf, "%s=%8.8x ", regnames[i], env->regs[i]);
         if ((i + 1) % 4 == 0) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
-    qemu_fprintf(f, "\nspecial regs:\n");
+    g_string_append_printf(buf, "\nspecial regs:\n");
     for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "%s=%8.8x ", pregnames[i], env->pregs[i]);
+        g_string_append_printf(buf, "%s=%8.8x ", pregnames[i], env->pregs[i]);
         if ((i + 1) % 4 == 0) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
     if (env->pregs[PR_VR] >= 32) {
         uint32_t srs = env->pregs[PR_SRS];
-        qemu_fprintf(f, "\nsupport function regs bank %x:\n", srs);
+        g_string_append_printf(buf, "\nsupport function regs bank %x:\n", srs);
         if (srs < ARRAY_SIZE(env->sregs)) {
             for (i = 0; i < 16; i++) {
-                qemu_fprintf(f, "s%2.2d=%8.8x ",
-                             i, env->sregs[srs][i]);
+                g_string_append_printf(buf, "s%2.2d=%8.8x ",
+                                       i, env->sregs[srs][i]);
                 if ((i + 1) % 4 == 0) {
-                    qemu_fprintf(f, "\n");
+                    g_string_append_printf(buf, "\n");
                 }
             }
         }
     }
-    qemu_fprintf(f, "\n\n");
+    g_string_append_printf(buf, "\n\n");
 
 }
 
-- 
2.31.1


