Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2C49935B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:34:43 +0100 (CET)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC630-0006qH-KS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rs-0005It-Em
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:12 -0500
Received: from [2a00:1450:4864:20::536] (port=39613
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rq-0004K5-IZ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:11 -0500
Received: by mail-ed1-x536.google.com with SMTP id u18so44385689edt.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRNIvDYLPOqN3WM8XDKQNxj/+D1kLnUW2Ll6/NI+3fM=;
 b=QRFR7hTp3ynUvvtF4cEGPxHNn3k3pueplETmOTePGSolhCEq7ksTAiZv2u/uafb+au
 0nhs+II+0tsOSMQJAsHpizqIxN91BM94p3UXH4tC+QACnIWnPNnmhK7qJyuDwDmrn+Fa
 JeO9VvimZSHnJxVODc2sTkF8LcqFkkI54jNR7pWKjp1y95rUe28QkH2eLdy7kN9g/4ym
 f8QofCdLpLgi30M3YqUINpsyzPiJstdf5dwlMQCnRMs16wVf1I5sceSkibxYv1z5jiVE
 flb2bCCF8Bkt8rsMAMcQFKfv8zBIhkGxlvjyagopBIvImc1kh+/O0rVRE9GYoR+E+4se
 XHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRNIvDYLPOqN3WM8XDKQNxj/+D1kLnUW2Ll6/NI+3fM=;
 b=OPA3vXnPVBgFphsxuEtsGrzu2zNVUA3pXRszywNIix/olBLo3dHkXSyJ4PzOxLG63p
 Mc05pRyoHEeD8s1XurTWfbEnr+JJ6jljGuAoKSwb4eUvFx4LeRCofSdvZUuG7RxX8HJU
 52tSWZbSeaDBFIDjkNUSecT/SDmEGKUAMTnuhfAEXoleBRSLFOKjrjMDx7QIUYOGTJsj
 pCd8iu3UohTuKi9rEKNnPFv+lWbTVW4Blu6YqpfTfzKAf2qR8n+k/iVgceA27WIl65g4
 syVwCbsTySzL2pzQo72DwWN55uxwvL5AxY11wyA5ehjNtHqdzsSGwD5mZGiBn2hQCI+u
 6OeQ==
X-Gm-Message-State: AOAM530x0pj7dWkPYIfUoFPdAgmf5tSeQzheG38PEtm+yp89DHLRzC7c
 gaF+nlszx807Gf0WvyUzzlc4zQ==
X-Google-Smtp-Source: ABdhPJyppBA3AU+t1rwRJbKGUAPJPiZyhlsqUdLxxHx7iWYAHC+zLQ1ifhWqQw45SgidI0YV7RTFuw==
X-Received: by 2002:a05:6402:4383:: with SMTP id
 o3mr5045113edc.353.1643055789055; 
 Mon, 24 Jan 2022 12:23:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w22sm5279874ejj.64.2022.01.24.12.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:23:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C62831FFCD;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 22/22] plugins: move reset of plugin data to tb_start
Date: Mon, 24 Jan 2022 20:16:08 +0000
Message-Id: <20220124201608.604599-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can't always guarantee we get to the end of a translator loop.
Although this can happen for a variety of reasons it does happen more
often on x86 system emulation when an instruction spans across to an
un-faulted page. This caused confusion of the instruction tracking
data resulting in apparent reverse execution (at least from the
plugins point of view).

Fix this by moving the reset code to plugin_gen_tb_start so we always
start with a clean slate.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/824
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 22d95fe1c3..ae70e4a5b0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -854,10 +854,21 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
 
 bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
 {
-    struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
     bool ret = false;
 
     if (test_bit(QEMU_PLUGIN_EV_VCPU_TB_TRANS, cpu->plugin_mask)) {
+        struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
+        int i;
+
+        /* reset callbacks */
+        for (i = 0; i < PLUGIN_N_CB_SUBTYPES; i++) {
+            if (ptb->cbs[i]) {
+                g_array_set_size(ptb->cbs[i], 0);
+            }
+        }
+        ptb->n = 0;
+        tcg_ctx->plugin_insn = NULL;
+
         ret = true;
 
         ptb->vaddr = tb->pc;
@@ -904,23 +915,19 @@ void plugin_gen_insn_end(void)
     plugin_gen_empty_callback(PLUGIN_GEN_AFTER_INSN);
 }
 
+/*
+ * There are cases where we never get to finalise a translation - for
+ * example a page fault during translation. As a result we shouldn't
+ * do any clean-up here and make sure things are reset in
+ * plugin_gen_tb_start.
+ */
 void plugin_gen_tb_end(CPUState *cpu)
 {
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
-    int i;
 
     /* collect instrumentation requests */
     qemu_plugin_tb_trans_cb(cpu, ptb);
 
     /* inject the instrumentation at the appropriate places */
     plugin_gen_inject(ptb);
-
-    /* clean up */
-    for (i = 0; i < PLUGIN_N_CB_SUBTYPES; i++) {
-        if (ptb->cbs[i]) {
-            g_array_set_size(ptb->cbs[i], 0);
-        }
-    }
-    ptb->n = 0;
-    tcg_ctx->plugin_insn = NULL;
 }
-- 
2.30.2


