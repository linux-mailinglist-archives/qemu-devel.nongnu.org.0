Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA266312E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRm-00033r-JB; Mon, 09 Jan 2023 15:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRj-00030n-H1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:39 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRh-0007Qd-V6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:39 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso10941589pjd.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YAEntzWlG5+v74Y9jfKjHpqon5dqwdjfhEi1TOWUto=;
 b=Hc8QJAl0XuY1kmL0UhytuX31XJZkWQDjTvPB1O8s5e2E5H8Hmnx/W7a/xKMU4mr7kn
 k7jnHi3SLB4OKHlVJQJF1T1ILN5OcJB1o+uiuptwiUBDKIXtn3IcRqLsEPE3MqYHOF30
 eDlCACbY6fiTfqqki4IMJWM2cd5NjBVGXANWWos2WBelzl1dC8+xtNjC8BuYuEgfQFfp
 1CFFkm2VpIAeCHw+3z0fBaJAmMntgW6Ko5KzCCYvkRYr1aXdVGemDXDGjSWl06tflo1c
 bbtvv8QanM9nwRa4cnJVR4P9tQKmLxJqFX8l8jZXHVAQd5yDng6awodeMhEUUTvDf+lo
 Mw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YAEntzWlG5+v74Y9jfKjHpqon5dqwdjfhEi1TOWUto=;
 b=VV7Y+i4uV88HVEN7maOSKq5qKh7m8nnRe9gUvRfF4dqMycBNsoFS56YEmZVER0KwLK
 D4BvAsmAS55fEaEFk57cpqRq7L3eFsaahKkOkBLlzKW0y5DAUqS1w+Tv4r6UqmniQUAf
 lEbG/JBc7org1agQDlAmTJBKWLDx8n3AVmxU3g98ARPv8cclaAdDlLidC0wG7Z+t33q+
 R3D1XagF8tmn2MnKSl0A3OVUnOWu5JOHmXyK0A1avY3GiwDZ00OsF2GOZ/jy+Ow6fBdD
 1+L2v6nKIC7OuHTUcTKta/ZiBT0TXSb2baojsVUFUlczpeTmtz1Uq/4hbnxuvU++kuRW
 0Xzw==
X-Gm-Message-State: AFqh2kodGJ5DKOAl/SYdDy+sKfNM3Z2Psvse+rO/spgmbs0s+o4VLYgn
 vuy+HTEbWD6QgcenHwWRYEWP96yqI7eVhAyg
X-Google-Smtp-Source: AMrXdXsSzpP/+p4+vOmiQWaZ1MOmbap7JOOrBAYACdp+dYdtvbsm3wUGmB939Ms9eVbt5gHKcElQew==
X-Received: by 2002:a17:90a:9c15:b0:227:94f:9036 with SMTP id
 h21-20020a17090a9c1500b00227094f9036mr5756808pjp.22.1673294916600; 
 Mon, 09 Jan 2023 12:08:36 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 13/27] target/s390x: Use ilen instead in branches
Date: Mon,  9 Jan 2023 12:08:05 -0800
Message-Id: <20230109200819.3916395-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index 624bd18735..449e854c82 100644
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
@@ -6255,7 +6249,6 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             g_assert_not_reached();
         }
     }
-    s->pc_tmp = s->base.pc_next + ilen;
     s->ilen = ilen;
 
     /* We can't actually determine the insn format until we've looked up
@@ -6492,7 +6485,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 out:
     /* Advance to the next instruction.  */
-    s->base.pc_next = s->pc_tmp;
+    s->base.pc_next += s->ilen;
     return ret;
 }
 
-- 
2.34.1


