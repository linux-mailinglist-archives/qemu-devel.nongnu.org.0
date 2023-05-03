Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902106F522A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6ts-0005gT-F8; Wed, 03 May 2023 03:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6th-00055y-Kz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tf-0005jy-RL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so47327785e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098850; x=1685690850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5T+y6XKoovlI/5PgO4ohU9QwOLRgrcATNcdajUNZQbc=;
 b=UhIU/m04sFmSjjX8+HviA/FjN0g6bd85kX2vIKgtGoDeVY1mueqE1OrANpoIFT4My3
 fHffSH6CMO0hqRTyZlPDF5ci66Zwv+uH0lyQNZIqLFjX7tF0WzvX9NjdkxLzX6fZ0PrG
 pBn+h9HsXhDX7PbS9qgmkj18cV69roBGGd9uo8lsIJ5XxybzTFfGoYVCRcZgWDwtT2kY
 FoMtwsx+C6ErpACdKNDzM1VROLPbHXN1fJLro+kMFDBMYv0ytvPs52157qAcY6Rmnrum
 jU1Qx6S3196VRhZ/Sh0UMwk4/62qkIflBuRZ03roihqf1okBCgivKcMlKELk5A0Jjtd1
 H8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098850; x=1685690850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5T+y6XKoovlI/5PgO4ohU9QwOLRgrcATNcdajUNZQbc=;
 b=Z3wJf671rCFnaau2BJYvrX40W6jkulzZDgjLW9DBPVdilSyG9UYvNK/1m1NCTTiroZ
 iokzHqe6tOQ19F1Z7jGtN1NcS/XnlRGV2I1wHGeGPwFMOr2wIdtH0LHZS8Jum6w8C+7U
 +HhQOqcuVGpgkDQRvYvxaCAVtv0Ki4fAIRIVwklrInBgitNJRdcpihgt7F6xsnbhKiSE
 wqwVTeWNQdibQfhvguYlb/IPSW9RVu98AHOfHvjDxVmoBHVKIVygZn7TTNBUlqtKmonp
 /RsoM5+/OMQuJRGi75C+RIdTI6LyleSDYAZRrw0uQA3CX16ZH2pvpYHWheTQrh2+WkrT
 ibBQ==
X-Gm-Message-State: AC+VfDzne1o1AaQJs90AdrCmJTdwjDIBrPzCor/zCuZzbrU1y4FX1JP6
 Avik6l6qRBV3pYvfXD8w2Fr/L6toDzVWx6x5ak9ePA==
X-Google-Smtp-Source: ACHHUZ470EK3SrQNvrW233O3m6Am1Eb5fYqutNwgmsdNlFyr/toyrp1dcsnguMnTteO5TAstCvEIYw==
X-Received: by 2002:a05:600c:2285:b0:3f0:b095:15d9 with SMTP id
 5-20020a05600c228500b003f0b09515d9mr13432232wmf.40.1683098850508; 
 Wed, 03 May 2023 00:27:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 77/84] plugins: Move plugin_insn_append to translator.c
Date: Wed,  3 May 2023 08:23:24 +0100
Message-Id: <20230503072331.1747057-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function is only used in translator.c, and uses a
target-specific typedef, abi_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h | 22 ----------------------
 accel/tcg/translator.c    | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 3af0168e65..e9a976f815 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -29,25 +29,6 @@ void plugin_gen_insn_end(void);
 void plugin_gen_disable_mem_helpers(void);
 void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info);
 
-static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
-{
-    struct qemu_plugin_insn *insn = tcg_ctx->plugin_insn;
-    abi_ptr off;
-
-    if (insn == NULL) {
-        return;
-    }
-    off = pc - insn->vaddr;
-    if (off < insn->data->len) {
-        g_byte_array_set_size(insn->data, off);
-    } else if (off > insn->data->len) {
-        /* we have an unexpected gap */
-        g_assert_not_reached();
-    }
-
-    insn->data = g_byte_array_append(insn->data, from, size);
-}
-
 #else /* !CONFIG_PLUGIN */
 
 static inline bool
@@ -72,9 +53,6 @@ static inline void plugin_gen_disable_mem_helpers(void)
 static inline void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info)
 { }
 
-static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
-{ }
-
 #endif /* CONFIG_PLUGIN */
 
 #endif /* QEMU_PLUGIN_GEN_H */
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fda4e7f637..918a455e73 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -285,6 +285,27 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
     return host + (pc - base);
 }
 
+static void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
+{
+#ifdef CONFIG_PLUGIN
+    struct qemu_plugin_insn *insn = tcg_ctx->plugin_insn;
+    abi_ptr off;
+
+    if (insn == NULL) {
+        return;
+    }
+    off = pc - insn->vaddr;
+    if (off < insn->data->len) {
+        g_byte_array_set_size(insn->data, off);
+    } else if (off > insn->data->len) {
+        /* we have an unexpected gap */
+        g_assert_not_reached();
+    }
+
+    insn->data = g_byte_array_append(insn->data, from, size);
+#endif
+}
+
 uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
 {
     uint8_t ret;
-- 
2.34.1


