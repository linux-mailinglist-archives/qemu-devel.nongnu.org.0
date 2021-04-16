Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8F362854
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:08:47 +0200 (CEST)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTpe-0003j1-PQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThf-0003aU-Ag
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThP-0004K4-2y
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso15127995pje.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MMkcYruCLlbuVyp3rgi2e1FgoVe00zt1vg+jkG6WDEw=;
 b=WtAMmV4l3G0pRz/bHX9xRlPZxa4CxzSjCeXCOAerdN1F4fDiPyiU66bhe434NmvhRn
 BZzr+8RhhpehBdEr6+xoyeOkDrYrlyOjbjQLo8tvXUrwjVDvfLZL4MaKBaam4/isA5Ow
 01mymTYpFrYTKZlF1phS2wqez+BMhwhYPqURsk123nHebZwNFSsNa9XhRcxBYyEbSQZP
 0TWt0adHz9ZspSWOHHKR+QohxsAz4LF+pxRKJ/XsWEk+duNWpjRUbQZglqrwrIdDCBAZ
 vrDOSihVlLwa3rTd3upwggmyL+WGO54mpwQayHwXhha1n2NuOc6iSMAp9YX/M6Q6ziAm
 jY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMkcYruCLlbuVyp3rgi2e1FgoVe00zt1vg+jkG6WDEw=;
 b=fB/eD8zMED7k7Dj7OkGyAiIL+hq/2F8zwCDq8xdlZ7aS71RKN13A8LcupGWkeZzWBm
 QabFcn/KWlYhNYlqah4iytTkVtnvwIxUMk2SxsC9KE0YrwNdmxDk7lwM1JOMQHYdIaLv
 bRuWt7xfW9EJWpyzAodjC3EoosINkxApFPBzqAJrxn796rZ3ZusbldMzjNKZJc4t4Y8U
 Lb3LmviNMRgtH98LSXGbl5WxEEPJxK6Nh5n0INfQVh66WpBg5F0yy9wixlqpnAKopF9Q
 uyaUAzNIU1uqDsyqy5g4UTyV0cCWWukZHLhuKMNKopD4yYyuQ8wtovdLQkQh8oWuWWGj
 dZgw==
X-Gm-Message-State: AOAM532C9nSrifMu+sFXjdnY7Fa/Mgj7Py4XH0L2gy8fA2oawBjOUjyN
 kUGEXy9NK5v40HrVMANteeUiHV0P3FvBdA==
X-Google-Smtp-Source: ABdhPJx/ygs0UP9hwGIZEEN9dRPr9sUJts0HdvrVUuvzyNIbVFtt6ug1G6vF+jwrqlMStG53ZfHxVw==
X-Received: by 2002:a17:90b:4384:: with SMTP id
 in4mr8258671pjb.188.1618599611076; 
 Fri, 16 Apr 2021 12:00:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/30] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Fri, 16 Apr 2021 11:59:40 -0700
Message-Id: <20210416185959.1520974-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5e6c40022f..91a19bc4f4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -975,20 +975,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4987,16 +4984,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -5056,14 +5050,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1


