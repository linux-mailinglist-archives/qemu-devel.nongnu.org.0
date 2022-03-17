Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C930C4DBE03
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:15:13 +0100 (CET)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiTg-0006Va-RC
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:15:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKX-0000K5-Ul
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:45 -0400
Received: from [2607:f8b0:4864:20::629] (port=35606
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKW-0002CA-F1
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:45 -0400
Received: by mail-pl1-x629.google.com with SMTP id n15so3573187plh.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bz8zlZqp+XNpUuV3WS3uKIWPzFVnLucU6nOyII1L55M=;
 b=BHf8zlCwCgR3BgKLndonE1HLKnPfGWzrvrCDDjBn/42kR5/1y2TiySGOw4Bk8qcibh
 QTQ2Kz9YH9lHvNy3SofonXilLnN560QeaZHCWpFh3qmKArIUro22Rq6q3T2iHiVvc62E
 jE3c+gEl1rKnPL9ufHj2mV/164xRQa0Fvn3/xaWvGubGw5SsuTJWJmXq/CJfyzE0Pilq
 cb449LpRwP1fvXaHkPowFIL2v6FXRcIb19y5VS1yUbH5Bj/R8A9wn9IhZDRSWnW4Ab1B
 Hxd5qiMwps3gAXDVLy1g9peaZ+YyduSbCSts1V74t3HfHeZLKblrOuHnzHdIaamzz+2+
 MfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bz8zlZqp+XNpUuV3WS3uKIWPzFVnLucU6nOyII1L55M=;
 b=qNyRpKTD86wsg3YiPsC+5Bl/wA2vmXWEiz7dwTmP9dDvqVFOVUocqSnhsl6HS5f+sW
 nuoyElXenAm2sf/sIMV7jjQqdfnOsYJDPmjV5RYM6a/nI4nnAQSgNftuOpwF2L083AvK
 YlFZ7kaTVbxQCcR5nvt8jfPcaRL9e47HsQRd5g04JCmk6bLUdjslSQldm0wPgcyIBMVT
 Fkps4MpXwwxQiv9WAqFRyqqQ4OBrbucQTTih0C6vbdBYvosyVbZjOT/zRr4DakVwDZGW
 4HAvhF6NUvkITuUfWowbxxAF1M2UxnGCkx5tbf+OcmlISLf0rQ2Qr4+ldVxco8RcbDmx
 K5pg==
X-Gm-Message-State: AOAM533wX/n91CmRyNqTVj6H9ffzpH3XOVlHYkwCkfGXRHgZhVVND/nE
 5j2l1RZHQI9SA6PK87meZeC2+VstTw+iVg==
X-Google-Smtp-Source: ABdhPJz1stlSrEYjvRRTDG0g+DcHm55Ou17bRQBtPsPc4TQ7FaF/JWBysyktCisr8sR63eSE4URVTw==
X-Received: by 2002:a17:90b:3b89:b0:1c6:56a2:1397 with SMTP id
 pc9-20020a17090b3b8900b001c656a21397mr3333431pjb.239.1647493543033; 
 Wed, 16 Mar 2022 22:05:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 03/51] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Wed, 16 Mar 2022 22:04:50 -0700
Message-Id: <20220317050538.924111-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 341f3a8273..1e0ab686dc 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -169,12 +169,14 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, flags);
 }
 
-static void gen_check_supervisor(DisasContext *dc)
+static bool gen_check_supervisor(DisasContext *dc)
 {
     if (dc->base.tb->flags & CR_STATUS_U) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
+        return false;
     }
+    return true;
 }
 
 /*
@@ -384,7 +386,9 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
@@ -447,7 +451,9 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     if (unlikely(instr.c == R_ZERO)) {
         return;
@@ -474,9 +480,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
 
-- 
2.25.1


