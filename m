Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0A5F44C9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:51:03 +0200 (CEST)
Received: from localhost ([::1]:54274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiK6-0008Ff-IY
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgR-0007YU-Od
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgP-0000AI-RV
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id c11so21255406wrp.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QGFbk8C97GoJjmbyu+s1VozFZFy9/GCuckImbZ7pktg=;
 b=ncc4d5QXJWKqOg5BL0rF7BlNr+3LkhXPKVr+TTfeKnKY2sdBicNW7PQYXCtSIqJyl6
 VX37pXfCQV+j2cpjuLsxObUurUFt57nBgM8BBnshmRWYtMyqCbv7+p28evPNHczA0W+p
 sXeeabMKDBl9+hdnNcXUeQzH8JWVx3xFiva7Qlo197DP155BrIa18ogc7kl/cH2isJQV
 d+JUVVNZLAjiVYHKQrD10tNMFNKnkn3I3w9aaeQyEJXHtsDg8C82HblBmUKq0ZWc+lt5
 OTjvrgT5Vp4kRIoRHQbXa+x6nK+mIJzze1b1wX02ZNPODkqIusBjWVLb9XjM060XyQu5
 EztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QGFbk8C97GoJjmbyu+s1VozFZFy9/GCuckImbZ7pktg=;
 b=Ohofe7uZOjKTuJ2u95vsHu8doLeFnADAw5qQNESpdQKMJGrodKnfMTRmqy7P6YOFQB
 T1p4Nnzsk/dBpwq3K/83SdDR22sgvwRwfz2JUaNvflX/3txveXQefDPvUnUsT2aHf7LE
 cnrCykrqIe+PhROtXQubFNJ2HpkR8ulyISI9kwrytWm9x2JzPJzWMcYn9Ydlmg0lcs9H
 PbxD0og71hlyK6gPi8+q3DRVdHYbgBvvf9IzRUK0ieTyWhfk0kIrDbEo8m0SiyvcM+oP
 uHdcOnS1HZ+p+hWqtuM3tJvLT9aPhppNFTNTDHUtHaYmbyobdIAUT/KWNj316ZMAU0iw
 0BSQ==
X-Gm-Message-State: ACrzQf0lV+nSmxHF6pUK3rFeJmq310fQvCFxlV9/bbbhj32EqQpF9k8f
 0L/L7kfMxXaJHlSpJzb382aBkvP5LZnmig==
X-Google-Smtp-Source: AMsMyM465zdg5aQHg8kmZEsj2rhBlGLhfRTf0jJrpuvPdtf2gHVglicEnRPwdEWOcdVgpi+pEtzuhA==
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id
 c16-20020adffb50000000b0022ae4e9a6b3mr15887355wrs.467.1664889000407; 
 Tue, 04 Oct 2022 06:10:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b00226dba960b4sm12441446wrt.3.2022.10.04.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EDAB1FFD5;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 33/54] disas: generalise plugin_printf and use for monitor_disas
Date: Tue,  4 Oct 2022 14:01:17 +0100
Message-Id: <20221004130138.2299307-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Message-Id: <20220929114231.583801-34-alex.bennee@linaro.org>

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


