Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FAF5C041F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:28:39 +0200 (CEST)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2aV-0002d0-0I
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gp-0003TG-0n
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gk-0000eD-K0
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t7so10621980wrm.10
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uLb+n5aqjLubd88rD9ajb7yNM+TT8WZpmI3dXPveZoM=;
 b=INOypRfRLiTojSFOGytSUFur61A0S8m5Z+PxDd36JjHbRHR2wJZAhBwYm6xfVODfd6
 fKFWan8RTcrFzNN+Us7qy/OdFD7jD0RCrZAyTMTnxrJmQSl4JlF8vC/BQSKQziN0kpJL
 zz9xOp0c5buIq6+ppstWkpNDLoUX4JGJ3faCtesSEgzTLlZfXSvHnylUQs05XuZI5ugV
 UAoPBqTir9OiYkMJ5GTKiu4qM9jkNj8s6wRNL6wpObSxKRxiIjVdf07JKMhCwqki3wk0
 T2HeKhaJ8SLRVEX1sJtnp0cUQ4AevrnsBqZ2F5hhOUjRKKflixRYvspyBhRdAFhzpxaB
 gQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uLb+n5aqjLubd88rD9ajb7yNM+TT8WZpmI3dXPveZoM=;
 b=pQ0r1rScXGXGj5/61/bIhJq9SV61nFHLOfipidC27rMqhwAyElFk78utxSTru9hAsc
 eseQoBTKIFNWASLDFN2ihZihcQLnKX+J5+vLGb+8udDsPp0ECjplb/EU9hTesAieLChJ
 V/E6mfuplEv7m2I6xHmFy0qydUtjSyzVDAmEGDhX+LptwxqsDRsbgDwHh0EJHRX/AW5n
 8faE6SS6MfPG3oFNMWbzOQ1GrWQEj3zV1dlE1DOMvpqECvCoOnqKoR+O3N5DlBh60M3N
 fqW/TNejkXk/tXtqn3eqVszoZyJXqf4fGYzls48Sn9FfdELS8/Q/DLu25/s7Uy7ZuqxR
 /yTA==
X-Gm-Message-State: ACrzQf1YLBqBfj/QMLqFiN/4XAxl73pvsjkIKboJyy+WUAdMN/Xw3W4b
 awnsCOJdeMt99tgQnxfi7HPOLg==
X-Google-Smtp-Source: AMsMyM7voFfqxh2rMirm21Qu4P95LJFWf3qJZL3cP7HwcLulmiZBUV7/SgS0dqwHRE4OIFzPxVX81Q==
X-Received: by 2002:a5d:4e88:0:b0:228:c8ed:2af8 with SMTP id
 e8-20020a5d4e88000000b00228c8ed2af8mr17988175wru.412.1663776493176; 
 Wed, 21 Sep 2022 09:08:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0022b0214cfa6sm3716222wrb.45.2022.09.21.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5842E1FFBA;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v1 02/10] disas: generalise plugin_printf and use for
 monitor_disas
Date: Wed, 21 Sep 2022 17:07:53 +0100
Message-Id: <20220921160801.1490125-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


