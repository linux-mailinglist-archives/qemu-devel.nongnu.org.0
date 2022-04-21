Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A526250A730
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:33:25 +0200 (CEST)
Received: from localhost ([::1]:49480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhagG-0003qA-NL
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeO-0000Eu-E7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:28 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeM-0002vu-Jn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id bx5so5570555pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmK70uiREJ2EhU4Lvb4b2S9qA2vGg02nV1Dgbo7HTZ4=;
 b=NW1/SYwpjh52t+Nj2ETfEJo05opBXq1DI+yxhb/jC9OlLBH80QgWOXIRQaYaZO3RQp
 GE2FH0uL1L7ZlMKBNCwzWSreYwS4DC1F3zqZ0MeUjM8w81f4DziWc0RUVMiTaL+UgAE1
 OP0zJM6gEI6jCyeoZ9dUNUMzM/REJ751kmuDk/QqYTQVAn16BpNxVkNErokYxHJem2+Q
 fMqXSCh4vpkhft7bxPZvBYNWhFnxCoblYjV5/wGEjzFfiitujZrrNNGtMGzInIuhuiQu
 wmT+F50k5Qf+hGCtfxzpsarxASKJOALcBbTdK6ma3FQD50Fah7/7Yy/k6xUe2i9XriCq
 n74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmK70uiREJ2EhU4Lvb4b2S9qA2vGg02nV1Dgbo7HTZ4=;
 b=7PIwZSlf/1yMy0ktpOBOr4c6qlkAKgfMWwtpHhrXvTIsIw+Nhg9/U66+4hvQdflQCO
 r/d+AVMcYl9PVTD/vMVgB0oayMb5ytNoZY5eC4Hvidik+/uwlhqfVGnhqZwbmJqJXrl7
 s0oFDn4mQ0w0lkug5v+W7DxMJR1BQgHEiq46wehtiW2TMh9LBmwFBvNzFw1eMEvZql9O
 +zEGfHgKdZykMbbUF0C3b7FgzXdvh9mjJcRyvqIia61F+Py9QO4EWnNH8OLABf8bjNYd
 AeQWrxIBbnTC37ubFbrLjieYp03aHY+PsDQV1WTfNMJcgm3eT1u8Mc3pACaPzdEvCJy8
 xGSQ==
X-Gm-Message-State: AOAM530vfUkeX/LlW59CBiVtiaaatcsPxYJ/YfFxlJ5r9kL6jlrhPC5S
 4Iqji7wF5832sYc/+czzGQr1MKz3RQWt3i48
X-Google-Smtp-Source: ABdhPJx8P8qZSAE+RzsbyKRUK/bR3HgsDb4mwRlOy+Qt0ZWdA+3NYGm/7hi3zpyGEseK23APH/xS1A==
X-Received: by 2002:a17:903:1252:b0:154:ca85:59a0 with SMTP id
 u18-20020a170903125200b00154ca8559a0mr552890plh.169.1650562285278; 
 Thu, 21 Apr 2022 10:31:25 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] target/rx: Move DISAS_UPDATE check for write to PSW
Date: Thu, 21 Apr 2022 10:31:10 -0700
Message-Id: <20220421173114.48357-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have one check in move_to_cr instead of one in each
function that calls move_to_cr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220417165130.695085-4-richard.henderson@linaro.org>
---
 target/rx/translate.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index df7a8e5153..bd4d110e8b 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -368,6 +368,10 @@ static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
     switch (cr) {
     case 0:     /* PSW */
         gen_helper_set_psw(cpu_env, val);
+        if (is_privileged(ctx, 0)) {
+            /* PSW.{I,U} may be updated here. exit TB. */
+            ctx->base.is_jmp = DISAS_UPDATE;
+        }
         break;
     /* case 1: to PC not supported */
     case 2:     /* USP */
@@ -631,10 +635,6 @@ static bool trans_POPC(DisasContext *ctx, arg_POPC *a)
     val = tcg_temp_new();
     pop(val);
     move_to_cr(ctx, val, a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        /* PSW.I may be updated here. exit TB. */
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     tcg_temp_free(val);
     return true;
 }
@@ -2205,9 +2205,6 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 
     imm = tcg_const_i32(a->imm);
     move_to_cr(ctx, imm, a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     tcg_temp_free(imm);
     return true;
 }
@@ -2216,9 +2213,6 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 static bool trans_MVTC_r(DisasContext *ctx, arg_MVTC_r *a)
 {
     move_to_cr(ctx, cpu_regs[a->rs], a->cr);
-    if (a->cr == 0 && is_privileged(ctx, 0)) {
-        ctx->base.is_jmp = DISAS_UPDATE;
-    }
     return true;
 }
 
-- 
2.34.1


