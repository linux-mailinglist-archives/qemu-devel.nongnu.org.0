Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AF40B21A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:52:58 +0200 (CEST)
Received: from localhost ([::1]:33796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9nt-00054d-CO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9RT-0005CF-Sg
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9RS-0000tF-68
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ox0yxENRArnSajwWt6R0ATTJtvgUIn+1CN57BaiibE=;
 b=EbCupnzaSYKQq/1KG1fGUCCY73KfyINhdqvifPQ8uNz42srM4iA0OD4yOTw05c86J5aiz7
 jqIH81D57wSz3y0yFNxmTwblErKyVkKHPbU1WadjGBltaq7R/W/RvyFpIiFiPF/yp4KpHL
 a0hEDIWq5yDUZ04/UYtEgi9jmds1xdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-_ngq6vkNMNSEfIs-Yi7oXA-1; Tue, 14 Sep 2021 10:29:43 -0400
X-MC-Unique: _ngq6vkNMNSEfIs-Yi7oXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E74AA10247AB;
 Tue, 14 Sep 2021 14:29:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 635F35D9CA;
 Tue, 14 Sep 2021 14:29:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/53] target/tricore: convert to use format_state instead
 of dump_state
Date: Tue, 14 Sep 2021 15:20:15 +0100
Message-Id: <20210914142042.1655100-27-berrange@redhat.com>
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
 target/tricore/cpu.c       |  2 +-
 target/tricore/cpu.h       |  2 +-
 target/tricore/translate.c | 24 ++++++++++++------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f0..11f1a79247 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -174,7 +174,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_num_core_regs = 44;
     cc->gdb_arch_name = tricore_gdb_arch_name;
 
-    cc->dump_state = tricore_cpu_dump_state;
+    cc->format_state = tricore_cpu_format_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 4b61a2c03f..572bda55e7 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -208,7 +208,7 @@ struct TriCoreCPU {
 
 
 hwaddr tricore_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void tricore_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void tricore_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 
 
 #define MASK_PCXI_PCPN 0xff000000
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0cc0f1cb3..a1e56fba32 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -86,7 +86,7 @@ enum {
     MODE_UU = 3,
 };
 
-void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void tricore_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
@@ -95,26 +95,26 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
     psw = psw_read(env);
 
-    qemu_fprintf(f, "PC: " TARGET_FMT_lx, env->PC);
-    qemu_fprintf(f, " PSW: " TARGET_FMT_lx, psw);
-    qemu_fprintf(f, " ICR: " TARGET_FMT_lx, env->ICR);
-    qemu_fprintf(f, "\nPCXI: " TARGET_FMT_lx, env->PCXI);
-    qemu_fprintf(f, " FCX: " TARGET_FMT_lx, env->FCX);
-    qemu_fprintf(f, " LCX: " TARGET_FMT_lx, env->LCX);
+    g_string_append_printf(buf, "PC: " TARGET_FMT_lx, env->PC);
+    g_string_append_printf(buf, " PSW: " TARGET_FMT_lx, psw);
+    g_string_append_printf(buf, " ICR: " TARGET_FMT_lx, env->ICR);
+    g_string_append_printf(buf, "\nPCXI: " TARGET_FMT_lx, env->PCXI);
+    g_string_append_printf(buf, " FCX: " TARGET_FMT_lx, env->FCX);
+    g_string_append_printf(buf, " LCX: " TARGET_FMT_lx, env->LCX);
 
     for (i = 0; i < 16; ++i) {
         if ((i & 3) == 0) {
-            qemu_fprintf(f, "\nGPR A%02d:", i);
+            g_string_append_printf(buf, "\nGPR A%02d:", i);
         }
-        qemu_fprintf(f, " " TARGET_FMT_lx, env->gpr_a[i]);
+        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gpr_a[i]);
     }
     for (i = 0; i < 16; ++i) {
         if ((i & 3) == 0) {
-            qemu_fprintf(f, "\nGPR D%02d:", i);
+            g_string_append_printf(buf, "\nGPR D%02d:", i);
         }
-        qemu_fprintf(f, " " TARGET_FMT_lx, env->gpr_d[i]);
+        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gpr_d[i]);
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 /*
-- 
2.31.1


