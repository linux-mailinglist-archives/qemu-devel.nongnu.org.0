Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BB40B290
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:08:39 +0200 (CEST)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQA34-0003eJ-7I
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9PX-00013c-Lu
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9PO-0007rA-NC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVhUD4M4QIyfpdQHCllc9n629wx0pJ553X4xNf1WDo8=;
 b=YoAhOjpxzRXOwNGx35dauYg/XBRe6R6OOVPwYz9aOf7Q5vT9AsbnPM4wWChh5NXWtG97CT
 WYAdf74Dh0kVU49vG35YUr6h9j4hI3wkmYX5XgJ2M+3Bavuy0aYkaols96ObHwJVajYmiw
 fvEQf4AkuYQZVmRecRm5WEkKLrHBtJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-7pcFh4DxMim4vOfG1WuzTA-1; Tue, 14 Sep 2021 10:27:36 -0400
X-MC-Unique: 7pcFh4DxMim4vOfG1WuzTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF0E8800FF4;
 Tue, 14 Sep 2021 14:27:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F46A5D9CA;
 Tue, 14 Sep 2021 14:27:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/53] target/ppc: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:09 +0100
Message-Id: <20210914142042.1655100-21-berrange@redhat.com>
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
 target/ppc/cpu.h      |   2 +-
 target/ppc/cpu_init.c | 212 +++++++++++++++++++++++++-----------------
 2 files changed, 126 insertions(+), 88 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..c84ae29b98 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1256,7 +1256,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
 
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void ppc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad7abc6041..3456be465c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9043,7 +9043,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
-    cc->dump_state = ppc_cpu_dump_state;
+    cc->format_state = ppc_cpu_format_state;
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
@@ -9104,7 +9104,7 @@ static void ppc_cpu_register_types(void)
 #endif
 }
 
-void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void ppc_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
 #define RGPL  4
 #define RFPL  4
@@ -9113,39 +9113,41 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUPPCState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
-                 TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
-                 env->nip, env->lr, env->ctr, cpu_read_xer(env),
-                 cs->cpu_index);
-    qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
-                 "%08x iidx %d didx %d\n",
-                 env->msr, env->spr[SPR_HID0], env->hflags,
-                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
+    g_string_append_printf(buf,
+                           "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
+                           TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
+                           env->nip, env->lr, env->ctr, cpu_read_xer(env),
+                           cs->cpu_index);
+    g_string_append_printf(buf,
+                           "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
+                           "%08x iidx %d didx %d\n",
+                           env->msr, env->spr[SPR_HID0], env->hflags,
+                           cpu_mmu_index(env, true), cpu_mmu_index(env, false));
 #if !defined(NO_TIMER_DUMP)
-    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
+    g_string_append_printf(buf, "TB %08" PRIu32 " %08" PRIu64
 #if !defined(CONFIG_USER_ONLY)
-                 " DECR " TARGET_FMT_lu
+                           " DECR " TARGET_FMT_lu
 #endif
-                 "\n",
-                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
+                           "\n",
+                           cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
 #if !defined(CONFIG_USER_ONLY)
-                 , cpu_ppc_load_decr(env)
+                           , cpu_ppc_load_decr(env)
 #endif
         );
 #endif
     for (i = 0; i < 32; i++) {
         if ((i & (RGPL - 1)) == 0) {
-            qemu_fprintf(f, "GPR%02d", i);
+            g_string_append_printf(buf, "GPR%02d", i);
         }
-        qemu_fprintf(f, " %016" PRIx64, ppc_dump_gpr(env, i));
+        g_string_append_printf(buf, " %016" PRIx64, ppc_dump_gpr(env, i));
         if ((i & (RGPL - 1)) == (RGPL - 1)) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
-    qemu_fprintf(f, "CR ");
+    g_string_append_printf(buf, "CR ");
     for (i = 0; i < 8; i++)
-        qemu_fprintf(f, "%01x", env->crf[i]);
-    qemu_fprintf(f, "  [");
+        g_string_append_printf(buf, "%01x", env->crf[i]);
+    g_string_append_printf(buf, "  [");
     for (i = 0; i < 8; i++) {
         char a = '-';
         if (env->crf[i] & 0x08) {
@@ -9155,75 +9157,97 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         } else if (env->crf[i] & 0x02) {
             a = 'E';
         }
-        qemu_fprintf(f, " %c%c", a, env->crf[i] & 0x01 ? 'O' : ' ');
+        g_string_append_printf(buf, " %c%c", a, env->crf[i] & 0x01 ? 'O' : ' ');
     }
-    qemu_fprintf(f, " ]             RES " TARGET_FMT_lx "\n",
-                 env->reserve_addr);
+    g_string_append_printf(buf, " ]             RES " TARGET_FMT_lx "\n",
+                           env->reserve_addr);
 
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
             if ((i & (RFPL - 1)) == 0) {
-                qemu_fprintf(f, "FPR%02d", i);
+                g_string_append_printf(buf, "FPR%02d", i);
             }
-            qemu_fprintf(f, " %016" PRIx64, *cpu_fpr_ptr(env, i));
+            g_string_append_printf(buf, " %016" PRIx64, *cpu_fpr_ptr(env, i));
             if ((i & (RFPL - 1)) == (RFPL - 1)) {
-                qemu_fprintf(f, "\n");
+                g_string_append_printf(buf, "\n");
             }
         }
-        qemu_fprintf(f, "FPSCR " TARGET_FMT_lx "\n", env->fpscr);
+        g_string_append_printf(buf, "FPSCR " TARGET_FMT_lx "\n", env->fpscr);
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    qemu_fprintf(f, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_FMT_lx
-                 "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FMT_lx "\n",
-                 env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-                 env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
-
-    qemu_fprintf(f, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_FMT_lx
-                 "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FMT_lx "\n",
-                 env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
-                 env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
-
-    qemu_fprintf(f, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_FMT_lx
-                 "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FMT_lx "\n",
-                 env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
-                 env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
+    g_string_append_printf(buf, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_FMT_lx
+                           "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FMT_lx
+                           "\n",
+                           env->spr[SPR_SRR0], env->spr[SPR_SRR1],
+                           env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
+
+    g_string_append_printf(buf, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_FMT_lx
+                           "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FMT_lx
+                           "\n",
+                           env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
+                           env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
+
+    g_string_append_printf(buf, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_FMT_lx
+                           "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FMT_lx
+                           "\n",
+                           env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
+                           env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
 
 #if defined(TARGET_PPC64)
     if (env->excp_model == POWERPC_EXCP_POWER7 ||
         env->excp_model == POWERPC_EXCP_POWER8 ||
         env->excp_model == POWERPC_EXCP_POWER9 ||
         env->excp_model == POWERPC_EXCP_POWER10)  {
-        qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "\n",
-                     env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
+        g_string_append_printf(buf, "HSRR0 " TARGET_FMT_lx
+                               " HSRR1 " TARGET_FMT_lx "\n",
+                               env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
     }
 #endif
     if (env->excp_model == POWERPC_EXCP_BOOKE) {
-        qemu_fprintf(f, "CSRR0 " TARGET_FMT_lx " CSRR1 " TARGET_FMT_lx
-                     " MCSRR0 " TARGET_FMT_lx " MCSRR1 " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1],
-                     env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]);
-
-        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
-                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_TCR], env->spr[SPR_BOOKE_TSR],
-                     env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
-
-        qemu_fprintf(f, "  PIR " TARGET_FMT_lx " DECAR " TARGET_FMT_lx
-                     "   IVPR " TARGET_FMT_lx "   EPCR " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_PIR], env->spr[SPR_BOOKE_DECAR],
-                     env->spr[SPR_BOOKE_IVPR], env->spr[SPR_BOOKE_EPCR]);
-
-        qemu_fprintf(f, " MCSR " TARGET_FMT_lx " SPRG8 " TARGET_FMT_lx
-                     "    EPR " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_MCSR], env->spr[SPR_BOOKE_SPRG8],
-                     env->spr[SPR_BOOKE_EPR]);
+        g_string_append_printf(buf, "CSRR0 " TARGET_FMT_lx
+                               " CSRR1 " TARGET_FMT_lx
+                               " MCSRR0 " TARGET_FMT_lx
+                               " MCSRR1 " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_CSRR0],
+                               env->spr[SPR_BOOKE_CSRR1],
+                               env->spr[SPR_BOOKE_MCSRR0],
+                               env->spr[SPR_BOOKE_MCSRR1]);
+
+        g_string_append_printf(buf, "  TCR " TARGET_FMT_lx
+                               "   TSR " TARGET_FMT_lx
+                               "    ESR " TARGET_FMT_lx
+                               "   DEAR " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_TCR],
+                               env->spr[SPR_BOOKE_TSR],
+                               env->spr[SPR_BOOKE_ESR],
+                               env->spr[SPR_BOOKE_DEAR]);
+
+        g_string_append_printf(buf, "  PIR " TARGET_FMT_lx
+                               " DECAR " TARGET_FMT_lx
+                               "   IVPR " TARGET_FMT_lx
+                               "   EPCR " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_PIR],
+                               env->spr[SPR_BOOKE_DECAR],
+                               env->spr[SPR_BOOKE_IVPR],
+                               env->spr[SPR_BOOKE_EPCR]);
+
+        g_string_append_printf(buf, " MCSR " TARGET_FMT_lx
+                               " SPRG8 " TARGET_FMT_lx
+                               "    EPR " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_MCSR],
+                               env->spr[SPR_BOOKE_SPRG8],
+                               env->spr[SPR_BOOKE_EPR]);
 
         /* FSL-specific */
-        qemu_fprintf(f, " MCAR " TARGET_FMT_lx "  PID1 " TARGET_FMT_lx
-                     "   PID2 " TARGET_FMT_lx "    SVR " TARGET_FMT_lx "\n",
-                     env->spr[SPR_Exxx_MCAR], env->spr[SPR_BOOKE_PID1],
-                     env->spr[SPR_BOOKE_PID2], env->spr[SPR_E500_SVR]);
+        g_string_append_printf(buf, " MCAR " TARGET_FMT_lx
+                               "  PID1 " TARGET_FMT_lx
+                               "   PID2 " TARGET_FMT_lx
+                               "    SVR " TARGET_FMT_lx "\n",
+                               env->spr[SPR_Exxx_MCAR],
+                               env->spr[SPR_BOOKE_PID1],
+                               env->spr[SPR_BOOKE_PID2],
+                               env->spr[SPR_E500_SVR]);
 
         /*
          * IVORs are left out as they are large and do not change often --
@@ -9233,12 +9257,13 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #if defined(TARGET_PPC64)
     if (env->flags & POWERPC_FLAG_CFAR) {
-        qemu_fprintf(f, " CFAR " TARGET_FMT_lx"\n", env->cfar);
+        g_string_append_printf(buf, " CFAR " TARGET_FMT_lx"\n", env->cfar);
     }
 #endif
 
     if (env->spr_cb[SPR_LPCR].name) {
-        qemu_fprintf(f, " LPCR " TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
+        g_string_append_printf(buf,
+                               " LPCR " TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
     }
 
     switch (env->mmu_model) {
@@ -9254,29 +9279,42 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     case POWERPC_MMU_3_00:
 #endif
         if (env->spr_cb[SPR_SDR1].name) { /* SDR1 Exists */
-            qemu_fprintf(f, " SDR1 " TARGET_FMT_lx " ", env->spr[SPR_SDR1]);
+            g_string_append_printf(buf, " SDR1 " TARGET_FMT_lx " ",
+                                   env->spr[SPR_SDR1]);
         }
         if (env->spr_cb[SPR_PTCR].name) { /* PTCR Exists */
-            qemu_fprintf(f, " PTCR " TARGET_FMT_lx " ", env->spr[SPR_PTCR]);
+            g_string_append_printf(buf, " PTCR " TARGET_FMT_lx " ",
+                                   env->spr[SPR_PTCR]);
         }
-        qemu_fprintf(f, "  DAR " TARGET_FMT_lx "  DSISR " TARGET_FMT_lx "\n",
-                     env->spr[SPR_DAR], env->spr[SPR_DSISR]);
+        g_string_append_printf(buf, "  DAR " TARGET_FMT_lx "  DSISR "
+                               TARGET_FMT_lx "\n",
+                               env->spr[SPR_DAR], env->spr[SPR_DSISR]);
         break;
     case POWERPC_MMU_BOOKE206:
-        qemu_fprintf(f, " MAS0 " TARGET_FMT_lx "  MAS1 " TARGET_FMT_lx
-                     "   MAS2 " TARGET_FMT_lx "   MAS3 " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_MAS0], env->spr[SPR_BOOKE_MAS1],
-                     env->spr[SPR_BOOKE_MAS2], env->spr[SPR_BOOKE_MAS3]);
-
-        qemu_fprintf(f, " MAS4 " TARGET_FMT_lx "  MAS6 " TARGET_FMT_lx
-                     "   MAS7 " TARGET_FMT_lx "    PID " TARGET_FMT_lx "\n",
-                     env->spr[SPR_BOOKE_MAS4], env->spr[SPR_BOOKE_MAS6],
-                     env->spr[SPR_BOOKE_MAS7], env->spr[SPR_BOOKE_PID]);
-
-        qemu_fprintf(f, "MMUCFG " TARGET_FMT_lx " TLB0CFG " TARGET_FMT_lx
-                     " TLB1CFG " TARGET_FMT_lx "\n",
-                     env->spr[SPR_MMUCFG], env->spr[SPR_BOOKE_TLB0CFG],
-                     env->spr[SPR_BOOKE_TLB1CFG]);
+        g_string_append_printf(buf, " MAS0 " TARGET_FMT_lx
+                               "  MAS1 " TARGET_FMT_lx
+                               "   MAS2 " TARGET_FMT_lx
+                               "   MAS3 " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_MAS0],
+                               env->spr[SPR_BOOKE_MAS1],
+                               env->spr[SPR_BOOKE_MAS2],
+                               env->spr[SPR_BOOKE_MAS3]);
+
+        g_string_append_printf(buf, " MAS4 " TARGET_FMT_lx
+                               "  MAS6 " TARGET_FMT_lx
+                               "   MAS7 " TARGET_FMT_lx
+                               "    PID " TARGET_FMT_lx "\n",
+                               env->spr[SPR_BOOKE_MAS4],
+                               env->spr[SPR_BOOKE_MAS6],
+                               env->spr[SPR_BOOKE_MAS7],
+                               env->spr[SPR_BOOKE_PID]);
+
+        g_string_append_printf(buf, "MMUCFG " TARGET_FMT_lx
+                               " TLB0CFG " TARGET_FMT_lx
+                               " TLB1CFG " TARGET_FMT_lx "\n",
+                               env->spr[SPR_MMUCFG],
+                               env->spr[SPR_BOOKE_TLB0CFG],
+                               env->spr[SPR_BOOKE_TLB1CFG]);
         break;
     default:
         break;
-- 
2.31.1


