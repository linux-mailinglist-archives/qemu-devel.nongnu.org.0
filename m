Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB55EF708
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:00:31 +0200 (CEST)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odu5W-00029b-Gr
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3O-0000XF-57
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3I-0002OP-Ta
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id l18so1768347wrw.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=H5kZ4c1YNKUDywETs44GyEUgqI/uwgZp+WVffoscGxk=;
 b=SNLbo+tn/S7aI+KGepavX0Y4TIsKkEasGL+Y0p1dDOkSyqYaKwk1rQHD1e4HbIsn3c
 IPpiFCIfhHkELi+N+k/c5BkLHfO/tbR8evos1c9EwlTHEPEFNTR+WbJCsWfpDbUStkQQ
 5uoCPr96O/TU0b4ONNt8TKGdo3I3S/Rplpdp5F7JJWchELg2gJvbY7KnOKz/w5WwPNin
 Ltd3tRuMIDlrEi+qKZsaDk8SAwM6cl690sP/t9enrMXC5Bohs6m9u6XE0kic0RiUH9El
 h/52GvFBTS6v+O69LPJZjp8+Qz1ejXgRXJvbHKy7zKmdNjI6Ppzzr2Zkn8pN0C3PnzS9
 IMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H5kZ4c1YNKUDywETs44GyEUgqI/uwgZp+WVffoscGxk=;
 b=WeSG8LfzKPVrUaIWwr65kMTkK0GoZELZJfIrgv/A//cV7lkGrXx4MwmHF2pjABkXZ+
 a6D7154wcgl4Qg9FTpkxsiEpUbenIk0N1g4BJX6aar0vGZcuykl/JALp5/duLXa957u2
 Zb+tZBMQxwh/oLQ0su2PUPCRm2rGlNa4ofWk5MkaFUu2jCktxiSrgDi/lnR2nvlpOJzn
 f/ciZPu9BW2nIybifxa+ayO0Hco6e24pdjZ4JLDk7L/bb9gdb0UtZ1YhEqUjgcjx2I0n
 0kCCRmJr4nmcPMB4Wxv2U0s+Ffe4fx/LVaDm4Cql/GUzqbI/gx5Uspuu0BuCum3B0JVK
 iqxA==
X-Gm-Message-State: ACrzQf1kZ79mJiE9AdOrWieMtmmVZ51vYV+mRaGrVP4A3MLG9/Dokkm2
 itbkbrNl4yYu+5/KFDMhIDrbmQ==
X-Google-Smtp-Source: AMsMyM5qPVNb2ymGbSxxxyoZAYT5z519MSjmebIuLLU770zGAThZOxxdYTuhTVeGAIt4V1gvB8UZEQ==
X-Received: by 2002:adf:ef4c:0:b0:22c:c043:174e with SMTP id
 c12-20020adfef4c000000b0022cc043174emr2099537wrp.50.1664452197189; 
 Thu, 29 Sep 2022 04:49:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x4-20020adfdcc4000000b0022b11a27e39sm6568013wrm.1.2022.09.29.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 178541FFD4;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v1 33/51] disas: generalise plugin_printf and use for
 monitor_disas
Date: Thu, 29 Sep 2022 12:42:13 +0100
Message-Id: <20220929114231.583801-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than assembling our output piecemeal lets use the same approach
as the plugin disas interface to build the disassembly string before
printing it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220921160801.1490125-3-alex.bennee@linaro.org>
---
 disas.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/disas.c b/disas.c
index e31438f349..f07b6e760b 100644
--- a/disas.c
+++ b/disas.c
@@ -239,7 +239,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 }
 
-static int plugin_printf(FILE *stream, const char *fmt, ...)
+static int gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
     GString *s = (GString *)stream;
@@ -270,7 +270,7 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
     GString *ds = g_string_new(NULL);
 
     initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = plugin_printf;
+    s.info.fprintf_func = gstring_printf;
     s.info.stream = (FILE *)ds;  /* abuse this slot */
     s.info.buffer_vma = addr;
     s.info.buffer_length = size;
@@ -358,15 +358,19 @@ void monitor_disas(Monitor *mon, CPUState *cpu,
 {
     int count, i;
     CPUDebug s;
+    g_autoptr(GString) ds = g_string_new("");
 
     initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = qemu_fprintf;
+    s.info.fprintf_func = gstring_printf;
+    s.info.stream = (FILE *)ds;  /* abuse this slot */
+
     if (is_physical) {
         s.info.read_memory_func = physical_read_memory;
     }
     s.info.buffer_vma = pc;
 
     if (s.info.cap_arch >= 0 && cap_disas_monitor(&s.info, pc, nb_insn)) {
+        monitor_puts(mon, ds->str);
         return;
     }
 
@@ -376,13 +380,16 @@ void monitor_disas(Monitor *mon, CPUState *cpu,
         return;
     }
 
-    for(i = 0; i < nb_insn; i++) {
-	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
+    for (i = 0; i < nb_insn; i++) {
+        g_string_append_printf(ds, "0x" TARGET_FMT_lx ":  ", pc);
         count = s.info.print_insn(pc, &s.info);
-	monitor_printf(mon, "\n");
-	if (count < 0)
-	    break;
+        g_string_append_c(ds, '\n');
+        if (count < 0) {
+            break;
+        }
         pc += count;
     }
+
+    monitor_puts(mon, ds->str);
 }
 #endif
-- 
2.34.1


