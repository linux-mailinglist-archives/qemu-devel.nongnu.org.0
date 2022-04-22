Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2150BDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:03:17 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwge-0007gC-KD
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWr-0000tY-KT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWq-0007Fw-0d
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n8so12125556plh.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LG2ggGa5J5Lu4I1wse39Ww5a8efRD9iZexWoAzkdh0=;
 b=F3UQuPkY2JbZ1Ca4oT9tQ20ddOA3oFnx0tiB4QEb0rzE7iRC3+3KW5RKGjdiwmCgJO
 JX+JrvNsxkLpYKJHphMS5gxTfVmxu/XeDP/Isl4tUMnt+C0XddQTcfiC5xGOcJIVi2HU
 KCDKUtVGV82s7sWVhQdbYZpIl8JshhsmMTmuAEb1UQzkRM9MYJIxPUcnXZFIWpcLviXX
 42c3skR8mn0mEA9kUFibWlrFkaPNhcm9w4st2yLAyBII+blpVLzRcaCOr7XbEa6n91m1
 tLvdaV1ffwab7u65jpxWYZ9UEmAaFz7d/34EOfOeEToxPnGlC1xwR45FcI7db850xnEF
 R73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LG2ggGa5J5Lu4I1wse39Ww5a8efRD9iZexWoAzkdh0=;
 b=agSmjemrnQQZbX5aZfJlm2AEaCcsCkRI34yDsjoe56hrmKg/4f5ojZfcckXEBsclSl
 xP+rHrZqZ5TIL/9v7Cq2Me6jCH8v1A7f0J6v+HoOtKQpI3V3CxWx+kARxHx4+2CUfSj4
 CRBzGM2pisZmLjA7EKIEjMNETBbimKzh6WemhMXCzxrQgLfN1RAWb6oGg5Eljfe301eq
 VR8cKlbT3DyJwpELWqDyMU0iNYTDuUd39ntrpoEfbKpqxQ6nFTPK4/NZNA9c7JAg9kE0
 JIhcJYJDWptjP3OXrqrExut6rFDPOs6XDzAj9rfFq8LDETh6mo+/A2GmvpJvLx+ZmLjk
 LUWw==
X-Gm-Message-State: AOAM532PjtrZwrBK2EOVr0t4yBVkPoyBBJMDbH8snsPnpazEnpDyqC/c
 J3hHkjWDd5ZbmnKU1qvYnUgkwOp6wgasuMlu
X-Google-Smtp-Source: ABdhPJx6EPNDwP3eeE4cNJZvbyrAv7iW60q3PTCoD+r97Q+ASnVj/ER+O9tO+7o3FDncodCMDptErQ==
X-Received: by 2002:a17:902:ce86:b0:159:90f:c5de with SMTP id
 f6-20020a170902ce8600b00159090fc5demr5421714plg.52.1650646385854; 
 Fri, 22 Apr 2022 09:53:05 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/68] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Fri, 22 Apr 2022 09:51:44 -0700
Message-Id: <20220422165238.1971496-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-15-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index eb97e13feb..d61e349207 100644
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
2.34.1


