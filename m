Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA12EB1A2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:43:20 +0100 (CET)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqMZ-0006Zx-8P
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0o-0002c9-OA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:50 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0l-0006ed-NE
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:50 -0500
Received: by mail-pl1-x633.google.com with SMTP id s15so50524plr.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=sN9PEKjm7sfFYqdkyieBz4AyoczuulsT0D3HWmBnS3uPNQzMD8T9+RlPtEX//OgrZy
 /x2iRFRzAa/x5fq2MXHBf+b8YtmpyA6JscZImkgz1WClwJ5ycnT4A9nc/kNEiSwaZZem
 eDFCNF2iRWQHoLjPnA7HFk5v7FJzdfYo0lMRLebT3SoyB5o7WdKVTsf0jnClckypgcEH
 jj8lrp/5gEQq8UcyTWfFr1idRqQOgbFH78Uu4D42f+K3tAgrLFsx4x2yDh+7b3ixp3pK
 qWCVB3bhYyAX923AKRZZ77X//pH1gQKGDduybw7Eor9mCazksZjzxQujulPGBJU3qFZM
 aabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=LHACkgq+gF6W2W+YjmhiNhqOH7aawIga8RolF4r74XfgPdrztOhBVfOGeFHFrouWvn
 6Q3v9PtyEbr4imglLlJoqa8g5f1maXs82tzdIWUKTDOgwo1kRXkPYJ/cdSjcSw6m1zS1
 21/d0o5RmsbYluJEETOq/z9j/EjRtS6yQslJ0YcBUJSielYWGCRpiCAOf09FbijWll+1
 DswDusPm0yEeZlcYuSWoWGntXAJ7FUtjeU115/lMYTBZhkg7tJ88QWEhQPEK0QSC/81r
 apPUHVYd1HkOVG+ci72ZtFwVBumqpHWWf6jdcvfEbAafl+Qia4cihHZCYO1blxMKbO6N
 TcaQ==
X-Gm-Message-State: AOAM531jv7BM4HsbEG6rWUkmhzbTFVTcARDlvW5eXeKrUjx/VJr5qWdK
 9apXzcxMHHkzLt4oKO80lH/Cj+AU1qg7Pw==
X-Google-Smtp-Source: ABdhPJxvDBBnIAOc1AmV+1kjI+5Y4iypJiKFpx31e6D/2lQD6V3KSqQhXHOhIgKKcpawysuwNAIfJw==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr248495pju.89.1609867246187; 
 Tue, 05 Jan 2021 09:20:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/43] tcg/sparc: Use tcg_tbrel_diff
Date: Tue,  5 Jan 2021 07:19:37 -1000
Message-Id: <20210105171950.415486-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index d599ae27b5..8f04fdf981 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -440,7 +440,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 13-bit constant relative to the TB.  */
     if (!in_prologue && USE_REG_TB) {
-        test = arg - (uintptr_t)s->code_gen_ptr;
+        test = tcg_tbrel_diff(s, (void *)arg);
         if (check_fit_ptr(test, 13)) {
             tcg_out_arithi(s, ret, TCG_REG_TB, test, ARITH_ADD);
             return;
@@ -537,15 +537,15 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, uintptr_t arg)
+static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
 {
-    intptr_t diff = arg - (uintptr_t)s->code_gen_ptr;
+    intptr_t diff = tcg_tbrel_diff(s, arg);
     if (USE_REG_TB && check_fit_ptr(diff, 13)) {
         tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
         return;
     }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, arg & 0x3ff);
+    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
+    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
 }
 
 static inline void tcg_out_sety(TCGContext *s, TCGReg rs)
@@ -1313,7 +1313,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_movi_imm13(s, TCG_REG_O0, a0);
             break;
         } else if (USE_REG_TB) {
-            intptr_t tb_diff = a0 - (uintptr_t)s->code_gen_ptr;
+            intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
             if (check_fit_ptr(tb_diff, 13)) {
                 tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
                 /* Note that TCG_REG_TB has been unwound to O1.  */
@@ -1345,8 +1345,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             }
         } else {
             /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB,
-                           (uintptr_t)(s->tb_jmp_target_addr + a0));
+            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
             tcg_out_nop(s);
         }
-- 
2.25.1


