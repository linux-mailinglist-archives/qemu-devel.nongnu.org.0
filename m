Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5064A682F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:47:52 +0100 (CET)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1wF-00033R-Gq
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cx-6V
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::62a] (port=41506
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmY-0000fA-U7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id a8so56641389ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhmXOO/6q9XmPV09312oaXBgVpi24xyzc4IO4oCe4TQ=;
 b=FGjGSEwRA1Ne87wtvz84S0Rjl1HDNlOM+Bj29reXxtQFIJZ5npsQsG1jevq8jd+vUG
 tZWWL717PAfB3pXProq7nNg/2h4ysF7XtWV8WKq2egbUhqhUikcuePb6beaY3Cr5SJVV
 92LJxZ/2bnc0lfNN+oRqT46ZmCAXONOgVJKLt2azwQBKAnPUvLS8QwlZyooE0US6xDSV
 hK5/hZaQRAuVpiAKgUmHAGp+PnbXuMcj2y8sWEdIrTNgf3acF6wIO/De6tG3+dA/D/zV
 8oIUFLj65Y03R6ij0CVU9mAngYhIZJUxTp1nfQr2suLZsx0QJwrHFCbCCuacnZDT6NfS
 qxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhmXOO/6q9XmPV09312oaXBgVpi24xyzc4IO4oCe4TQ=;
 b=v+puPUNOtnclcyhJb0KpsCd7TZ2NkvWa5WGLFR7q2Zzyk2e3layKM7g1d8KgBI4iHr
 R50CGb3+zVptq0a42A2GnmGLPnebgC/KRfu1Y7qux0kDJTBMrKa+WPZoSIOwnKsICqaB
 c3x/0pdy1YceFNC90plT0upDOa00p8GUHS6fAHUkvl4jiOIgYSegunZSjJtPFP+oEehg
 bJQ+il9JHhgEvVrNrpjdnhIsgLOBAexYSLBV4NMp6HSr2QcAL+aaiut6z5Elkjxo1eO7
 5rUtb/TyABmVhe5H/QWrQpGWBmgqnYyy8kujsEKc6qJEPCzd4u4/V+g7XwyBYg4ZrtG1
 xqnw==
X-Gm-Message-State: AOAM533ii5Mj4eycVg4pT6Ys31PbCP8o16UXqJPtr1uDK8Ii8SOrFSXc
 RSMIFg0MrboQtg0aatICn752RQ==
X-Google-Smtp-Source: ABdhPJy9olTmBKMbnXr6s8x5GBSObLQxWr//5z/4YIrE6OKuyxN0kdyFNBU4G5TpaKBEZPIgfgm6iw==
X-Received: by 2002:a17:906:a250:: with SMTP id
 bi16mr22474672ejb.732.1643739672770; 
 Tue, 01 Feb 2022 10:21:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm19901454edy.66.2022.02.01.10.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:21:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F2121FFD0;
 Tue,  1 Feb 2022 18:20:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 25/25] plugins: move reset of plugin data to tb_start
Date: Tue,  1 Feb 2022 18:20:50 +0000
Message-Id: <20220201182050.15087-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Message-Id: <20220124201608.604599-23-alex.bennee@linaro.org>
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


