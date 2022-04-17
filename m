Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67BD5048A4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:50:42 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng92o-0005r8-17
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wx-0000fK-Kg
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wv-0003Gs-2H
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u5-20020a17090a6a8500b001d0b95031ebso5272257pjj.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFtB/E7djXDPURXg40lhRvaf5WnkYYoUZ27VyitKWXw=;
 b=BiNO/Tsd5nN/K0y5UIKpidCYPek4TbeIB8m1MQZe9XMma39xFN2au6Vu3xS3MgjYiA
 aFuhzEWNFoh+jH501BEzLj+moRqLSG21PZAmpaItbrEWLbHORUsf5jJx9fRCObdtCvq8
 AOGwC1pQEzRVFsS7fyDQXPRBcqqOCqQP7mvXiqgztW+1I4UuZl0mfWm6fdZwZH54N1wZ
 YY1UdaD55HP9sIbvwugNJUX5hfYXic/YFjGCIE1aEispWSD0d288zMo6am70kIzVcBI5
 X/hLQZAufGsxDf4+XY9up7PVuUeyupHHRFdgK+pH8fd9yk2KJOHbWuy+1z5FK+3FoNrs
 4gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFtB/E7djXDPURXg40lhRvaf5WnkYYoUZ27VyitKWXw=;
 b=ORd/gmMWNFvjA59/PSRBmA9bZbW4qpibNhu/rBGfAgp7Ak/VnC3lPVKGsGtjva6zA6
 xnUKHyg2vGOHUDPFOojqz25Iv5y2FOo9Xiz8qeiyvHmEBfmV8tR1MwsjoCTJ3DnXwkgg
 a+n3F61QIEMeFS2T+TgWJytToPFaoQRT11mMA5ndRX2MtFWCQewL5X7JFv9rFeoLtvfZ
 ZexJ4+bulwypBIWWG5wmAUH+SPYipQpsfPCPtITqF9199MqWkM3PwKBsSmbWlZRNxzD1
 8wJjt9JNCUeMLKNV2KcHAN3z7qn4d2XOEq0Ga0dyUgWTsICSqV/kOw7NyH7GLVu46H7u
 CboA==
X-Gm-Message-State: AOAM530/Gh4+q6rO2xk0lZESNk1M0x1sW6K0kBaCxxcoujSr8LQ+XzNF
 nFdAsLVhvw0F3peUa1lrP8RO1UiAiRxGLg==
X-Google-Smtp-Source: ABdhPJwviKhxBqWh8q83DmT9sI4b6YBl+zVaAVLaFlzhKplJuNlwiNzhkC2rsMxdpf5oFqo0xd8TQg==
X-Received: by 2002:a17:90b:218d:b0:1d0:90f5:4064 with SMTP id
 ku13-20020a17090b218d00b001d090f54064mr9222138pjb.95.1650217475781; 
 Sun, 17 Apr 2022 10:44:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/60] target/arm: Extend store_cpu_offset to take field
 size
Date: Sun, 17 Apr 2022 10:43:33 -0700
Message-Id: <20220417174426.711829-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we assume all fields are 32-bit.
Prepare for fields of a single byte, using sizeof.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h | 13 +++++--------
 target/arm/translate.c     | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 5be4b9b834..f593740a88 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,17 +61,14 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
-{
-    tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
-}
+void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
-#define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
+#define store_cpu_field(var, name)                              \
+    store_cpu_offset(var, offsetof(CPUARMState, name),          \
+                     sizeof(((CPUARMState *)NULL)->name))
 
 #define store_cpu_field_constant(val, name) \
-    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env, offsetof(CPUARMState, name))
+    store_cpu_field(tcg_constant_i32(val), name)
 
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 480e58f49e..c745b7fc91 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -180,6 +180,25 @@ typedef enum ISSInfo {
     ISSIs16Bit = (1 << 8),
 } ISSInfo;
 
+/*
+ * Store var into env + offset to a member with size bytes.
+ * Free var after use.
+ */
+void store_cpu_offset(TCGv_i32 var, int offset, int size)
+{
+    switch (size) {
+    case 1:
+        tcg_gen_st8_i32(var, cpu_env, offset);
+        break;
+    case 4:
+        tcg_gen_st_i32(var, cpu_env, offset);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_temp_free_i32(var);
+}
+
 /* Save the syndrome information for a Data Abort */
 static void disas_set_da_iss(DisasContext *s, MemOp memop, ISSInfo issinfo)
 {
@@ -4852,7 +4871,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                     tcg_temp_free_i32(tmp);
                 } else {
                     TCGv_i32 tmp = load_reg(s, rt);
-                    store_cpu_offset(tmp, ri->fieldoffset);
+                    store_cpu_offset(tmp, ri->fieldoffset, 4);
                 }
             }
         }
-- 
2.25.1


