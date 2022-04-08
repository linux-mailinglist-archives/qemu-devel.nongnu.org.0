Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0ED4F9B15
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:51:37 +0200 (CEST)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrpg-00014r-TF
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmK-000786-R0
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmI-00032I-HT
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id i20so685344wrb.13
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2K0RiSpFnjP2SPW78zxgqkyT920bbP6nlXCBG7skz0=;
 b=d9gzI9h7ehjTtg2PFriyt9B/IYiBeK+7Lk5iR7wL72W/dIIHtBilq1P+rMN99nnjGB
 SssKFzQux2hDyy3xvLe7Rm78Q/Ox4Y4KCsWk6ratUJ9Sx9NPzP8EGjQVsVrBiuawsDCT
 0BNjJXcCOn/JhYbEie9UvWTD9Lqq0aSeJ0XDqsaytrOyIAukFvLi+L4GVCfkb+ADgpia
 vl7kAHNviudIU5MESkfGNnmUetIQ9jD70z5vWNKRrIUoencOylNcuz8XQovq3WjMQaT8
 h/z04U9xWV8SI2Ji7BuKjPniucgkvMaABUh1hPc7XNLuuN8iwBOF4X15l5QsCyIa7gbh
 kOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2K0RiSpFnjP2SPW78zxgqkyT920bbP6nlXCBG7skz0=;
 b=F0Jt6Y6qTEb4sMCXkFBMNaCHhTgl+NnX2Me8LihrtLnQ9cBVMdvcwgKGJF1fXHh/sD
 y5A3ny1T7IHQrDwcx2SdZq+9oIh071SaIWrHAxtziMaG7oXLFn1W4vr+h40LL3oGuEAb
 /zcwGC7SPJsyHXujZXvavpYvMachtS7WqlSlJy6usPC/06joF5OPwoZy/12TvtOVPlnt
 8NmHNBmESfNTTfWf4kJAwrKSZvLy+y6u9XxxirjKsFMhV+8HTDnqnaFN24VZYnK3ENsk
 77aFb5XoJmvhUW4qcoiDLYilcBuu114+c/IsayTtfF3glSkBVmWoQRHbWAE7vE+957Uz
 V7Kw==
X-Gm-Message-State: AOAM531vXVTpp45b9kd33bIdsFdK7Ne9JSpcVwAZwOVKQUf9EUWxGPqN
 1+yabnU8Fo/dpXO+n3OFxngizA==
X-Google-Smtp-Source: ABdhPJwcW4E7Ohens5k6nTxWjbFH0uy1MO2SWiW95IMFv4F7kUs2vFfCNAxIAh5eYulaNe8tdJZdwg==
X-Received: by 2002:a5d:64a7:0:b0:205:fb7a:50ee with SMTP id
 m7-20020a5d64a7000000b00205fb7a50eemr15306727wrp.185.1649436476505; 
 Fri, 08 Apr 2022 09:47:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm19694439wru.78.2022.04.08.09.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30B501FFBF;
 Fri,  8 Apr 2022 17:47:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/15] disas: generalise plugin_printf and use for
 monitor_disas
Date: Fri,  8 Apr 2022 17:47:34 +0100
Message-Id: <20220408164742.2844631-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than assembling our output piecemeal lets use the same approach
as the plugin disas interface to build the disassembly string before
printing it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/disas.c b/disas.c
index 3dab4482d1..9b52b2fa93 100644
--- a/disas.c
+++ b/disas.c
@@ -248,7 +248,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 }
 
-static int plugin_printf(FILE *stream, const char *fmt, ...)
+static int gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
     GString *s = (GString *)stream;
@@ -279,7 +279,7 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
     GString *ds = g_string_new(NULL);
 
     initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = plugin_printf;
+    s.info.fprintf_func = gstring_printf;
     s.info.stream = (FILE *)ds;  /* abuse this slot */
     s.info.buffer_vma = addr;
     s.info.buffer_length = size;
@@ -367,15 +367,19 @@ void monitor_disas(Monitor *mon, CPUState *cpu,
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
 
@@ -385,13 +389,16 @@ void monitor_disas(Monitor *mon, CPUState *cpu,
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
2.30.2


