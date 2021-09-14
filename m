Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A640B22A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:53:51 +0200 (CEST)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9ok-0007t2-Ax
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Mg-0006Vu-AC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Mc-0005dH-RG
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoFfr8g3FSNNy3L4uDE/+m5DtUq3ewlCSsUT+QmYgig=;
 b=IHw/n3xZ+bQ2/p8YmShoiSN5Qhjfrl5QHQJMtzkRxAZj6/yJBdhZ2BeY8M1gUMHzda0tN4
 or6nCaSyRBpgPazQf0gXr6VDZKpU0xnrCp8hd+Jmyt1phEqKOS/XXYycXpI+r/yXyNx2Iw
 2ic+H+Ex+o0bkk7QSd2XTTkexJoy6hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-KzG8qg-VPpene3i-haubDA-1; Tue, 14 Sep 2021 10:24:44 -0400
X-MC-Unique: KzG8qg-VPpene3i-haubDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30EE5108468A;
 Tue, 14 Sep 2021 14:24:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D96745D9CA;
 Tue, 14 Sep 2021 14:24:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/53] target/hppa: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:02 +0100
Message-Id: <20210914142042.1655100-14-berrange@redhat.com>
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
 target/hppa/cpu.c    |  2 +-
 target/hppa/cpu.h    |  2 +-
 target/hppa/helper.c | 25 ++++++++++++++-----------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee12..f7fe7c49d6 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -164,7 +164,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
-    cc->dump_state = hppa_cpu_dump_state;
+    cc->format_state = hppa_cpu_format_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 748270bfa3..d4f1922545 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -327,7 +327,7 @@ int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
+void hppa_cpu_format_state(CPUState *cs, GString *buf, int);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index 1ccff5765a..6e30d1ea63 100644
--- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -76,7 +76,7 @@ void cpu_hppa_put_psw(CPUHPPAState *env, target_ureg psw)
     }
 }
 
-void hppa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void hppa_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -85,9 +85,10 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     char psw_c[20];
     int i;
 
-    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx "\n",
-                 hppa_form_gva_psw(psw, env->iasq_f, env->iaoq_f),
-                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b));
+    g_string_append_printf(buf,
+                           "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx "\n",
+                           hppa_form_gva_psw(psw, env->iasq_f, env->iaoq_f),
+                           hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b));
 
     psw_c[0]  = (psw & PSW_W ? 'W' : '-');
     psw_c[1]  = (psw & PSW_E ? 'E' : '-');
@@ -110,20 +111,22 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     psw_c[18] = '\0';
     psw_cb = ((env->psw_cb >> 4) & 0x01111111) | (env->psw_cb_msb << 28);
 
-    qemu_fprintf(f, "PSW  " TREG_FMT_lx " CB   " TREG_FMT_lx " %s\n",
-                 psw, psw_cb, psw_c);
+    g_string_append_printf(buf,
+                           "PSW  " TREG_FMT_lx " CB   " TREG_FMT_lx " %s\n",
+                           psw, psw_cb, psw_c);
 
     for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, "GR%02d " TREG_FMT_lx "%c", i, env->gr[i],
-                     (i & 3) == 3 ? '\n' : ' ');
+        g_string_append_printf(buf, "GR%02d " TREG_FMT_lx "%c", i, env->gr[i],
+                               (i & 3) == 3 ? '\n' : ' ');
     }
 #ifndef CONFIG_USER_ONLY
     for (i = 0; i < 8; i++) {
-        qemu_fprintf(f, "SR%02d %08x%c", i, (uint32_t)(env->sr[i] >> 32),
-                     (i & 3) == 3 ? '\n' : ' ');
+        g_string_append_printf(buf,
+                               "SR%02d %08x%c", i, (uint32_t)(env->sr[i] >> 32),
+                               (i & 3) == 3 ? '\n' : ' ');
     }
 #endif
-     qemu_fprintf(f, "\n");
+     g_string_append_printf(buf, "\n");
 
     /* ??? FR */
 }
-- 
2.31.1


