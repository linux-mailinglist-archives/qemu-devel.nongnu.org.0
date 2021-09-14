Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D040B098
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:26:15 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9O2-0005XV-DP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9L3-0002DZ-O6
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9L1-0004T2-1C
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKnaBwFCCJX9ZX6cv7A4ifx+XIL+7QBX+qDEATc0WKY=;
 b=FvwScpkw/c6lo782uppwpfvt1NIaou0TFbcQy/Pz0tLvq1nJDIYTXO7iVULMr2tcj/yD5X
 RV4BnH1utCBW4+Ex8rIKZtI9NLsbTmYFNDKlX7SzGUwQt+iBdju4AR5dvLhQJbJSVrjO0A
 nfyAsasS/WqQJAahFLzjV5Z6DohObmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-XoKLPxexNHmDkTmH1a4ktg-1; Tue, 14 Sep 2021 10:23:04 -0400
X-MC-Unique: XoKLPxexNHmDkTmH1a4ktg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3DF1084683;
 Tue, 14 Sep 2021 14:23:00 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 588BE5D9CA;
 Tue, 14 Sep 2021 14:22:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/53] hw/core: introduce 'format_state' callback to
 replace 'dump_state'
Date: Tue, 14 Sep 2021 15:19:55 +0100
Message-Id: <20210914142042.1655100-7-berrange@redhat.com>
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

The 'dump_state' callback assumes it will be outputting to a FILE
object. This is fine for HMP, but not so useful for QMP. Introduce
a new 'format_state' callback that returns a formatted GString
instead.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/cpu-common.c  | 15 +++++++++++++++
 include/hw/core/cpu.h | 13 ++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..c2cd33a817 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -106,6 +106,21 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
     if (cc->dump_state) {
         cpu_synchronize_state(cpu);
         cc->dump_state(cpu, f, flags);
+    } else if (cc->format_state) {
+        g_autoptr(GString) buf = g_string_new("");
+        cpu_synchronize_state(cpu);
+        cc->format_state(cpu, buf, flags);
+        qemu_fprintf(f, "%s", buf->str);
+    }
+}
+
+void cpu_format_state(CPUState *cpu, GString *buf, int flags)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->format_state) {
+        cpu_synchronize_state(cpu);
+        cc->format_state(cpu, buf, flags);
     }
 }
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564ce..1599ef9df3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -91,7 +91,8 @@ struct SysemuCPUOps;
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
- * @dump_state: Callback for dumping state.
+ * @dump_state: Callback for dumping state. Deprecated, use @format_state.
+ * @format_state: Callback for formatting state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
@@ -136,6 +137,7 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
+    void (*format_state)(CPUState *cpu, GString *buf, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
@@ -537,6 +539,15 @@ enum CPUDumpFlags {
  */
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
+/**
+ * cpu_format_state:
+ * @cpu: The CPU whose state is to be formatted.
+ * @buf: buffer to format state into
+ *
+ * Formats the CPU state.
+ */
+void cpu_format_state(CPUState *cpu, GString *buf, int flags);
+
 #ifndef CONFIG_USER_ONLY
 /**
  * cpu_get_phys_page_attrs_debug:
-- 
2.31.1


