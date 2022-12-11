Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D46494EC
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFn-0006Pl-6M; Sun, 11 Dec 2022 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFk-0006Lk-CU
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007Zb-Q7
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:31 -0500
Received: by mail-oi1-x22c.google.com with SMTP id c129so9114650oia.0
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0KchuaBzJWkMTjJsrbnSjZVRKRaS7lDJ8+obmeMmkCQ=;
 b=g+LqkYsgUDtCAlBppJgT4y4Gconq2Lt0FEREdxDXBCwmfQry6Zz0p+ge4Z5Pmdy3Kh
 dmg0cAxIFxAxV/d7HkMml4uz3dSIfZOMcGX64hhKlPyWj2N5u/cYCBfJV6pmimZe5Enc
 YaO7LvsRTAtXz/O46KUDigz7zcMxASLjh7/qBW58R7fm+dUNWhtqR4ZZWEFwQre8VdEB
 AFqt6Eov0v/oDGSTm+z1fv3A+iIO0DfATp0/Obj0R5n9n9gk5zJr0yuA70u2VVuSoo3y
 aaJoUFB9EQQVycRuD3lksJ9wIE8sxho3T7PF1HkQGW4xtVwCtf9xSQ2D7XqWWj7ZyAOR
 6vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0KchuaBzJWkMTjJsrbnSjZVRKRaS7lDJ8+obmeMmkCQ=;
 b=5tKaR5UaxVTE8DHlHL4AJB9YtQ2t7mxY9hpSuluJ3RyCFcwZyxTW24dzlU4hqaoNBp
 7fuPcbYyJ6y+5wqNpeyAmJCSAEHy1TuEV8LXzEPTJQCNHne4ItdmdAc7E6kcQLE/dmbY
 qxtqLLmM97EnLWCrntKQ84pO6wuoBhtysz4jUIZ/3zQ9D3bqLVrVynaDUihCU+hX53/b
 j00MwYcF7PtEjNeDbjKpIbth3bk2VYsOvC7ZcnrdVhy7Q+uNWVsVS64ZfQZlcWMwr5Nt
 PsZjKiLjEsT0llinIyvJf8NnvGiAFv0cuFU7wmvFQEy7hdz4Kki59PJQARpaa03TzQTJ
 p0mQ==
X-Gm-Message-State: ANoB5pkcv5adTHxGNMyACV1ZQ6LrZK9/avygZA9JzDHINrfBnbpkNzkG
 TVt2XypPsW3ztcjEl9bzf81Am5Nl0oOxaNFgbMw=
X-Google-Smtp-Source: AA0mqf70ywEtqjVNcK6tkxkEv5c7AvwLi8vLwAYyYcHCYoYEH777c6WFWDhZSrLtJIW29DEhhVfyUQ==
X-Received: by 2002:a05:6808:13c1:b0:355:1de8:bc79 with SMTP id
 d1-20020a05680813c100b003551de8bc79mr7336829oiw.27.1670772500292; 
 Sun, 11 Dec 2022 07:28:20 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 13/27] target/s390x: Use ilen instead in branches
Date: Sun, 11 Dec 2022 09:27:48 -0600
Message-Id: <20221211152802.923900-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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

Remove the remaining uses of pc_tmp, and remove the variable.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 96bd37426f..c9afa28c60 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -141,12 +141,6 @@ struct DisasContext {
     TCGOp *insn_start;
     DisasFields fields;
     uint64_t ex_value;
-    /*
-     * During translate_one(), pc_tmp is used to determine the instruction
-     * to be executed after base.pc_next - e.g. next sequential instruction
-     * or a branch target.
-     */
-    uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
     bool exit_to_mainloop;
@@ -1198,7 +1192,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (dest == s->pc_tmp) {
+        if (disp == s->ilen) {
             /* Branch to next.  */
             per_branch(s, true);
             ret = DISAS_NEXT;
@@ -1222,7 +1216,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         }
     }
 
-    if (use_goto_tb(s, s->pc_tmp)) {
+    if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
         if (is_imm && use_goto_tb(s, dest)) {
             /* Both exits can use goto_tb.  */
             update_cc_op(s);
@@ -6253,7 +6247,6 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             g_assert_not_reached();
         }
     }
-    s->pc_tmp = s->base.pc_next + ilen;
     s->ilen = ilen;
 
     /* We can't actually determine the insn format until we've looked up
@@ -6490,7 +6483,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 out:
     /* Advance to the next instruction.  */
-    s->base.pc_next = s->pc_tmp;
+    s->base.pc_next += s->ilen;
     return ret;
 }
 
-- 
2.34.1


