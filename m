Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0265F5FED
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:10:31 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIDO-0006nO-Kq
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoN-0004HX-0J
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoK-0003u9-1A
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 78so718858pgb.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HK7ix9AO/8mxB8DbXZV83BhAtiM36n+x9LjSZXjhklE=;
 b=pmQtu/EQsT0LAH30DoIWITB5e5dsH3yZhQCWMMOLHoXffatsALygHWww8tLd2lckLH
 U0+Sc99lepY9sVb0v7zzWzCMMSxtO6IFOger0gbfd0zsvyPaOVesHtWu0zX/yaG6c/Ht
 2a9GvYSFq1MAlXK49hW7v2vhG8Zo2+Ui74VRYF5IK/s+7qHIlu+3JHj8RssK3IUJkNDj
 kFb0Cw2KO3ZkJUzXOVVA/5jDykbw5jMez2BHbFpODs7hesNJkVqoaL933gPBKczdrT7G
 iMnZoiGH8TpxotZMxvV/6Ii327nSotv13dij6okgm9MN4id/yzD2QlEZWBRuWAEE/sNH
 2Pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HK7ix9AO/8mxB8DbXZV83BhAtiM36n+x9LjSZXjhklE=;
 b=K4ezd+6NdEMCgzlaWFUuLIt0ZzSVcURfOF+yJ9UbQVjYB3g0LkeXAjQzbe2r7VDSJz
 7+VJRHR23sVimg1/Y3pKB727UnnMpUNuHIEavLFQNHhhat9E92unFlkgq2KRDS8Qind/
 aTZ7V+V/MW5qRiqzTVn/OOVodxZoBoJvr9NDK43PMer5QLlt7baCaQhKdN9x6AsOVFW7
 fswSEpQI05W5VgWiHTdjuy9WPSyxFU22Stlbzas7CK9PWlQoCf4ttIn2ZKvg/56K3kd6
 1TZ5pDxdeNYCzGIt4UHpMx0baZi7kWKwV/incWGi095C6BOpKMFljaYh+jyL9vwsK2Fz
 sohQ==
X-Gm-Message-State: ACrzQf1RFwjDLLlQpeGdbHZJdoIyxaeEWFyc8wvOq2ChIswqRDI14yue
 LkRb1Jj7MpukyJPXUlkd6PWrJESAOnrQsg==
X-Google-Smtp-Source: AMsMyM4S9GlQEqSY25N1MPCIS85h+wTccQJAx3s6pWF4NWaSwAB7tLTE1YGs9KvLvKVhy5AS0NciYw==
X-Received: by 2002:a63:4383:0:b0:440:3e0d:b9ec with SMTP id
 q125-20020a634383000000b004403e0db9ecmr2807221pga.54.1665027873626; 
 Wed, 05 Oct 2022 20:44:33 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 11/26] target/s390x: Use ilen instead in branches
Date: Wed,  5 Oct 2022 20:44:06 -0700
Message-Id: <20221006034421.1179141-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the remaining uses of pc_tmp, and remove the variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2ea3feb803..67c86996e9 100644
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
@@ -6247,7 +6241,6 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             g_assert_not_reached();
         }
     }
-    s->pc_tmp = s->base.pc_next + ilen;
     s->ilen = ilen;
 
     /* We can't actually determine the insn format until we've looked up
@@ -6484,7 +6477,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 out:
     /* Advance to the next instruction.  */
-    s->base.pc_next = s->pc_tmp;
+    s->base.pc_next += s->ilen;
     return ret;
 }
 
-- 
2.34.1


