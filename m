Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B136966312F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:16:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRs-0003FE-2u; Mon, 09 Jan 2023 15:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRp-0003B9-FV
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:45 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRn-0007Nu-RI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o13so6437785pjg.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOafY3nfVG5SzehtqB5mgOADFoO+3I8xljC1PBVfEGM=;
 b=X/WHElWW0z5JUcfQA9eS+iXba3b/lEZyjEvW2KxB5jH5WewlaSR9vQEif3ppXktJSQ
 YNvcEL+annpH5TqL50XO5zvGekbpljq96T2NKvkWLaMTmOUFWMThVfU/clBEEt2oFc1D
 LddLAiUWCCuuTPq8lXTpBpXpsNGYcVn0+lV/DUGtmkRl9I6l3UbYAsbKyXK0U8CGFxNh
 ck5FGpc1MVySH4fNdJTKattMMBPi7m7p6xSVTr7DreE5N/cnReRLp/CNNi9ptywHaNBC
 gn76+/BwQFq+4rwupCowP49JcYu1Jn1ltwIfPx6XOzv52WkepVwmCmB4JHPvqDgWPI77
 /vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOafY3nfVG5SzehtqB5mgOADFoO+3I8xljC1PBVfEGM=;
 b=sINPn6wrNiA8nSfIaxfIlEAUeNqUH5O7vzLwcgqPRHATOdBw4ojEmsSGkwMl2mAblk
 HaQG1r+CFt2pUK/jtdWU91E2udvHblEieW7VVDbDldZBOMcqTYmQc3csuzttWiLw48cN
 JujbWasyjacB7RsXy4cSpu6kH4IDVvFPDjHZG17uUVcs00U+h9nS4oDBv44iFjh3XRSP
 3AoWQaXQX0MiGHcZCFApGtvHWY71q0wImLAiP+PLkfM7a2ut7EyDw4g1U8N49Nl8alHy
 XZWdG04ZfyTJKey0+ho1pe3321oZzxZ0Ayb2wX6EXaRywH5hePs2yDiTp6X8rUJ9yDFN
 AUbA==
X-Gm-Message-State: AFqh2kogwNiZ5g48SCKXr6A1S6NTPGpDQZFAREhPFEgnI3GZUnaIV82R
 KcwvYKbpz2MSfGjpJJ2FM2UVDrTSl5jGD6x/
X-Google-Smtp-Source: AMrXdXtWZpLmZOVYfU2Hk78+D1PwQ6FbfuSi60lTXC9fSzitXHzc65JuGaZdp/XfVIob5NgZFrkcKQ==
X-Received: by 2002:a17:90a:2e17:b0:227:7f5:9fdb with SMTP id
 q23-20020a17090a2e1700b0022707f59fdbmr5987951pjd.23.1673294922962; 
 Mon, 09 Jan 2023 12:08:42 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 19/27] target/s390x: Introduce help_goto_indirect
Date: Mon,  9 Jan 2023 12:08:11 -0800
Message-Id: <20230109200819.3916395-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a small helper to handle unconditional indirect jumps.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index bbe39dd083..dd3bd9531b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1189,6 +1189,13 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
     }
 }
 
+static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
+{
+    tcg_gen_mov_i64(psw_addr, dest);
+    per_branch(s, false);
+    return DISAS_PC_UPDATED;
+}
+
 static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
@@ -1219,9 +1226,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            tcg_gen_mov_i64(psw_addr, cdest);
-            per_branch(s, false);
-            ret = DISAS_PC_UPDATED;
+            ret = help_goto_indirect(s, cdest);
             goto egress;
         }
     }
@@ -1545,9 +1550,7 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
@@ -1580,9 +1583,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 {
     save_link_info(s, o);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
-- 
2.34.1


