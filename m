Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168450B632
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:32:38 +0200 (CEST)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrWf-0003va-HB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAE-0005O4-K5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAC-0002u6-VB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id b19so10281824wrh.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3Z1wuSZ1tsgvZXbrivj/X+wswM16HNWMbK2oDsPm2EI=;
 b=FT+dci79aZMw7Pb8vhep+Ve4qSWTbxi2lBKxvvGah2cnVkB4YOaeIvuFmJV0Zel8Vd
 VW8x5iaHgq+ZI4g79/gxRuXbBI1/PEzezNADad2J9c2Zdud3aPY055iaIPeQpiEpMTqG
 HBLFJguw94oVAXeKYiUTg0ZmGfwMzbJHxEnOz6/13AfRCAZi6NTa2COxifrn8Fi2YP6t
 FOv6Bb+LEVg5gQVk4xgw6R38bDTIf3JvMpZ08nbjjXTIQCxXTeqvqyAHsdKs/h+9K7d2
 ImRQYWCQWee7kqtLMO/jEhVfVNlbjTIaBw/80/5tFADaJBqo8nGe+GBscgWuHi58hE0q
 bKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z1wuSZ1tsgvZXbrivj/X+wswM16HNWMbK2oDsPm2EI=;
 b=CUtInTpLD9jt//gmVBANIFqX1T435kONgrrooyf2wB+hvXJffCcqoAE/FSb94o/r8x
 aVGpsRZKneWVS22qJZ9Y567QnM0A00QsB4Zb9lCwTxfOz+THeo1Du9wv+3lxMiigVVem
 gQsvtPxyKNqRxNQz6n0Z5Wp3QLgu/EBsE6aBq1PcwLBMEJtZ9mC5JE4+6w/QFq3VJdW5
 A0neheBq8oH3Slj1zMhwuUkyB8hVHQJcVV7x5H+TY8ODQUzOWaRe+uG4KqZV8p6rPXgK
 H1Y6uDheCv/2FzHKOfoLrLUw6FBT//KU4QTS8QWh3Vgiou+L90sf9vLhnzGlbCxjA1Ee
 3Ajw==
X-Gm-Message-State: AOAM531DdYMvSaCw7un0Wal2lig3exYI5XDoj8BTdRQ1oMv2TDpa9WxJ
 O7Z+mL8SXjMqE0toto44Bymrss7YflJjrQ==
X-Google-Smtp-Source: ABdhPJy72y6xnMHnqPaYSWCGF+r1Wr09rDDUt8O4hDJioxePxSnrqrJMg0nBzhQVKh4EPGY67/xmOw==
X-Received: by 2002:a5d:6e87:0:b0:206:452:5b87 with SMTP id
 k7-20020a5d6e87000000b0020604525b87mr2989003wrz.473.1650621919445; 
 Fri, 22 Apr 2022 03:05:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/61] target/arm: Extend store_cpu_offset to take field size
Date: Fri, 22 Apr 2022 11:04:18 +0100
Message-Id: <20220422100432.2288247-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Currently we assume all fields are 32-bit.
Prepare for fields of a single byte, using sizeof_field().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: use sizeof_field() instead of raw sizeof()]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 13 +++++--------
 target/arm/translate.c     | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 5be4b9b8346..09010ad2dad 100644
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
+                     sizeof_field(CPUARMState, name))
 
 #define store_cpu_field_constant(val, name) \
-    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env, offsetof(CPUARMState, name))
+    store_cpu_field(tcg_constant_i32(val), name)
 
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6018fee2ef1..1314406b193 100644
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


