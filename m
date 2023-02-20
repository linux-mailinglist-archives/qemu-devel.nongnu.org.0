Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607EC69D305
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:46:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB85-0005Cp-1c; Mon, 20 Feb 2023 13:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Q-0004XG-3c
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:31 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6L-00047q-0R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:28 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so2549637pjc.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfaFG09oDD2o28vcTR7j+acmldxB7/SXD7I4ujzpsng=;
 b=uyxjU2PEf1rD5fC+O9IqEZvQI9imn1omarm+XufI7y/ITy+QTDgAizDiz1bNlrOzNg
 blXl008pUqowlSRAqVkBiP6+Kf+LD8hglYBpqmweIgOfN72LGq9taRUi5zmYhjtl3J9e
 3RTmNu4kqfNjxA+pzAqjPaETYoxr1eXLH0uyZnE1xxqoZFN+dmLs/Uoxi+CySO8eN/5v
 A/a/GTz8aHL/kT9xwq0LhtgEwT2S/qzTdymYeyZBBFXtjaE/8Ng2eAOq6H+LfFccjvHn
 Ckb4WrkCPwj7WXys2JpQeIEzhxk8FC0StzhhxIZh3PSMYutCCRUsrZuQZonsbeMNoddB
 Sbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfaFG09oDD2o28vcTR7j+acmldxB7/SXD7I4ujzpsng=;
 b=Or4MTXJDpK10LpeFgShf/OkOf/K2lF4Ps5wTRhjc3ZQt4oBOqOByDkzPQ6eEJgSukf
 iJPL9XK+utg/eufGDHbuAMtmziu2oPd1AQGKdjr/bv7WlFjaC3VcrGvc4xywnVExXBbP
 oPOST+TfR+RFWqUT1vFjXygR/Kt/AiSiXBuh5FodAUgPOf8U6VBqeoh8ykRLIYd26yJL
 SRLfnd2yzMo156hX18EIPR6kpwWxKL6z3WawyTIIbKfn6VFS+ENTdByspfzR7jfRB1KB
 NrnNGCvdjzHBOnHn0DfFdBdFHcqpI4XrSm5/4X8fMAdoB6o1TQZbIuDCrXpCNBlwpzs1
 BQdw==
X-Gm-Message-State: AO0yUKVoSRBLD/j++6JVw8+LCn0Gx85UGDMSuPBx+R8cZ5vsNAh9YcVS
 kgNK0hCZvrZqAKOedBb8pYkS0NU8SXCecsWPiAc=
X-Google-Smtp-Source: AK7set/6rFFXBNk2CnvHe43sysH+/rNjPXEzjrIRwNlIX9Ucs40WvXZLSwWqDRUKNFk5TKwE9nB84Q==
X-Received: by 2002:a17:903:234b:b0:19a:7f4b:3ef6 with SMTP id
 c11-20020a170903234b00b0019a7f4b3ef6mr3240074plh.3.1676918480225; 
 Mon, 20 Feb 2023 10:41:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 13/27] target/s390x: Use ilen instead in branches
Date: Mon, 20 Feb 2023 08:40:38 -1000
Message-Id: <20230220184052.163465-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
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

Remove the remaining uses of pc_tmp, and remove the variable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 506bde2c3f..3a61491222 100644
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
@@ -1214,7 +1208,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (dest == s->pc_tmp) {
+        if (disp == s->ilen) {
             /* Branch to next.  */
             per_branch(s, true);
             ret = DISAS_NEXT;
@@ -1238,7 +1232,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         }
     }
 
-    if (use_goto_tb(s, s->pc_tmp)) {
+    if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
         if (is_imm && use_goto_tb(s, dest)) {
             /* Both exits can use goto_tb.  */
             update_cc_op(s);
@@ -6317,7 +6311,6 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             g_assert_not_reached();
         }
     }
-    s->pc_tmp = s->base.pc_next + ilen;
     s->ilen = ilen;
 
     /* We can't actually determine the insn format until we've looked up
@@ -6562,7 +6555,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 out:
     /* Advance to the next instruction.  */
-    s->base.pc_next = s->pc_tmp;
+    s->base.pc_next += s->ilen;
     return ret;
 }
 
-- 
2.34.1


