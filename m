Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F231E825
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:55:25 +0100 (CET)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg1s-0006v5-S3
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuN-0007Bp-6x
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:32775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuJ-0007JA-P5
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so2223659wrz.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGFgZyHCr3fksW5dEZw0mEN72Dlgf8OF7X/v8VpUACc=;
 b=HQ+RDiMUEMcu+tAe8zS6ItqdlX0PXgjO9Tr8r6zH/Bvwp2ah57ltg5XECWAr0ww3Hk
 5VnpRzV4LFsS+Yr6j782Ht/9+MzgYA28dsAP3gm+VzYpevzsjg/mv2MH9PvKyAjMRoru
 T93Q+JtqF8n1mdiCgnVf9FmtidsGFLqivOr6XnhkO+xnRq+E85ClB07pHpdy9RdRyyNN
 AmmMgjBgZ8sifgfVpUTg7OVeBIZAQ7gK3Mac3tDqWrpxlOT/gqI2FgAsWnXD8MoHqYbV
 6qYuMdNOLbK30eKaFu0TaneyVpZwc14eUPkg6oOjAZ67L0Zzr8b7fi7vODDcDobnauxS
 ewbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGFgZyHCr3fksW5dEZw0mEN72Dlgf8OF7X/v8VpUACc=;
 b=VMv22M1t0rwCTyamoZnedkX5J4o12QgItf+twH9wmuYJ+3QGNMgzOlp1FXRAZesmYq
 p0iJLmK1auUYVuZEMRLE85EBDfd/XD6ZpdPt0d65lEUqm/W4Et+LV3E2G2Euy1z5h1mV
 QC8mw0sXTMiXIwF7zbcZlt1zqGaSKQ0ET046TUcPjgsNPZXdKk0JJa72bcPLyh0186+w
 NS8OGyF5KO999z3jrOksKYIGult7XFrTPETKR1lRaLzHzRwBONcHKfyV1scmno3AWD3f
 r7s2Rwe6HKnz3kS28uEIhamxbItYPnopWZXszhNC26siMpaxIjMEunfRa/inYnzsOuM0
 +Ksg==
X-Gm-Message-State: AOAM532gkx/IodUeO+Fn1iCZAUrLjtl5X7D5fSYXT009HMkQiBb28PVu
 C6tkog8wscHaYmEOIKv81eEVcg==
X-Google-Smtp-Source: ABdhPJx3CvzbyxvTy1arrDS0Dey/n0LkQNsrt6P3/xwz98519ekEopG3Q32qSmeysZC/0H+lgcpVcQ==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr3420339wru.322.1613641654194; 
 Thu, 18 Feb 2021 01:47:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm7893560wru.31.2021.02.18.01.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 186861FFAC;
 Thu, 18 Feb 2021 09:47:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/23] tests/plugin: allow memory plugin to do both inline and
 callbacks
Date: Thu, 18 Feb 2021 09:47:05 +0000
Message-Id: <20210218094706.23038-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is going to be useful for acceptance tests that check both types
are being called the same number of times, especially when icount is
enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210213130325.14781-23-alex.bennee@linaro.org>

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index 4725bd851d..afd1d27e5c 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -16,9 +16,10 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
-static uint64_t mem_count;
+static uint64_t inline_mem_count;
+static uint64_t cb_mem_count;
 static uint64_t io_count;
-static bool do_inline;
+static bool do_inline, do_callback;
 static bool do_haddr;
 static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
 
@@ -26,7 +27,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) out = g_string_new("");
 
-    g_string_printf(out, "mem accesses: %" PRIu64 "\n", mem_count);
+    if (do_inline) {
+        g_string_printf(out, "inline mem accesses: %" PRIu64 "\n", inline_mem_count);
+    }
+    if (do_callback) {
+        g_string_append_printf(out, "callback mem accesses: %" PRIu64 "\n", cb_mem_count);
+    }
     if (do_haddr) {
         g_string_append_printf(out, "io accesses: %" PRIu64 "\n", io_count);
     }
@@ -42,10 +48,10 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         if (qemu_plugin_hwaddr_is_io(hwaddr)) {
             io_count++;
         } else {
-            mem_count++;
+            cb_mem_count++;
         }
     } else {
-        mem_count++;
+        cb_mem_count++;
     }
 }
 
@@ -60,8 +66,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         if (do_inline) {
             qemu_plugin_register_vcpu_mem_inline(insn, rw,
                                                  QEMU_PLUGIN_INLINE_ADD_U64,
-                                                 &mem_count, 1);
-        } else {
+                                                 &inline_mem_count, 1);
+        }
+        if (do_callback) {
             qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
                                              QEMU_PLUGIN_CB_NO_REGS,
                                              rw, NULL);
@@ -90,6 +97,12 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
         }
         if (!strcmp(argv[0], "inline")) {
             do_inline = true;
+            do_callback = false;
+        } else if (!strcmp(argv[0], "both")) {
+            do_inline = true;
+            do_callback = true;
+        } else {
+            do_callback = true;
         }
     }
 
-- 
2.20.1


