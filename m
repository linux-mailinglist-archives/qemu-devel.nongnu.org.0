Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B94446F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:21:42 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJxF-0008VE-2c
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoF-0005N9-1f
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:23 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoD-00074T-3q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso3787876wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyRfS3iCiw1/tG9HJBOoGZjbjgeiOJQ9Q/Je/hZdaRg=;
 b=cqoV8aekGmrLmeADR2FQU9Opie4UHv44PCSmpdKoYNsOxgUL97i5txKIrHKtVhDkl8
 cAH6Bwwn3diZhcpuyiTAzLYmUpbLYK99COevWvU+wGRTWpVp4Bji6b/b3crDVpwEwf9C
 zgSp1UFNa1NpT+DgVBivGIvT64FNthZZtueQp336mTl6JwVH00S3kkjjTJ69OzjwJf64
 /uTCe22IyUjZH5NBnuv0SC3MZ35zbFyhq+yVfInjVEjTRueuMMRrROg6xj+6oTh04gJt
 auaWwXvYIRu/7D1nbmFy/E9loELlnxwpscg1dYyLBDdIquPpAm3kcUolKHtPgxvvT3Ne
 nl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yyRfS3iCiw1/tG9HJBOoGZjbjgeiOJQ9Q/Je/hZdaRg=;
 b=u+C25FuKD699DhFzSNG3FAI/FTv83dnPlSTuPdQRdej4NHLZ7u94LuFrR59kC0dZDt
 htlwN+RAF98a/iUJ6p886g/kUxcGzlKGXhKMX+Mp1wOwvOuWyAv+CCfolvbilW6y1ZB1
 3jAaF/aQF5XWC4bHsJ+1t2MBp6azc9mxP14zzmxmra1YDiDoSUy2UQs5/oDbUnMc6kQe
 K0ob5lh+XwDJqeNDmpQ2IXTGOSGmx60E+A4v/56Fes721OY1JmKBeOswpZ7FMqh3bF3I
 2mon0E4aaap0qqO+rXEOtaQW0X6msW7Xo2TQNLzRF9whF9XqjkZvV+9WHiouHIRS7RU1
 JOFw==
X-Gm-Message-State: AOAM532m/uYl0lpyxF2wYf23VE8aOFYPk/16MvBsWCCiraC/KlmKeAo+
 c6OEjUzXR+9hu/Q4W4YSln7mbQ==
X-Google-Smtp-Source: ABdhPJwtoekN3ZlK4WANVok6hcK+jn6az1lH53o4p/vOae2caJOiws0tvBjs78bFy/pgJbTPh4KVeQ==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr16849867wma.83.1635959539731; 
 Wed, 03 Nov 2021 10:12:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm2529620wrt.58.2021.11.03.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8A161FFAF;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/21] tests/plugins: extend the insn plugin to track opcode
 sizes
Date: Wed,  3 Nov 2021 17:05:53 +0000
Message-Id: <20211103170558.717981-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly a convenience feature for identifying frontends that do
multiple repeat loads so I can test changes to the instruction
tracking interface.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211026102234.3961636-20-alex.bennee@linaro.org>

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 0f6a1938c1..d229fdc001 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -18,6 +18,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 static uint64_t insn_count;
 static bool do_inline;
+static bool do_size;
+static GArray *sizes;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
@@ -49,13 +51,35 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
                 insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS,
                 GUINT_TO_POINTER(vaddr));
         }
+
+        if (do_size) {
+            size_t sz = qemu_plugin_insn_size(insn);
+            if (sz > sizes->len) {
+                g_array_set_size(sizes, sz);
+            }
+            unsigned long *cnt = &g_array_index(sizes, unsigned long, sz);
+            (*cnt)++;
+        }
     }
 }
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out = g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
-    qemu_plugin_outs(out);
+    g_autoptr(GString) out = g_string_new(NULL);
+
+    if (do_size) {
+        int i;
+        for (i = 0; i <= sizes->len; i++) {
+            unsigned long *cnt = &g_array_index(sizes, unsigned long, i);
+            if (*cnt) {
+                g_string_append_printf(out,
+                                       "len %d bytes: %ld insns\n", i, *cnt);
+            }
+        }
+    } else {
+        g_string_append_printf(out, "insns: %" PRIu64 "\n", insn_count);
+    }
+    qemu_plugin_outs(out->str);
 }
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
@@ -70,12 +94,21 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
                 return -1;
             }
+        } else if (g_strcmp0(tokens[0], "sizes") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_size)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    if (do_size) {
+        sizes = g_array_new(true, true, sizeof(unsigned long));
+    }
+
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
     return 0;
-- 
2.30.2


