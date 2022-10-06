Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA25F5FCF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:58:20 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI1b-00049H-QE
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoG-000479-IF
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:32 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoD-0003sB-Eq
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id r18so722587pgr.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/5fBWGcV8KP0yYWYzeZW+deZNVZGvo9JuykELaazvaY=;
 b=kCCBVhY4u60tCjWzPJfBi/qatrJHdcQBfBNK5eEd7XZ24yJf45rMoD7/6Jb6rg4Bry
 cYMg1ctfNz3EL0RC5lek/2o4iGMrr/Y2uuFtPCz8gBpQ4fgG6szNX188xUDwj8u9qljh
 bj0QcKGZbRlkrI30fiVJFRPTM9w1FEsHksTCw+ByV05LZXQorunqjA3NZScofNvLdqcw
 bGwFv7z/q6Y9ie+Rr4NWdFD2j//8alMHT8sYJsuSQEKI/8WKQclUh/Pc/hc6u/M5+4to
 C8e0kTfoyNT/PS59hck04UK/8wVvnmZ9j9w+5pjF2hkNRn5FER3CVcqzqpsVVTMaLhXh
 FPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/5fBWGcV8KP0yYWYzeZW+deZNVZGvo9JuykELaazvaY=;
 b=rU32ToT7U1zQcNz0aeD70WoqthtCSFHUn4mEgXe+vbYcoRiwiJclyLAKWOBB/AdjJX
 RCC0nVUst6UPF+LocPPonck1o915hO5oCTZYoEyKW+iItSM59VH+7LeZxsMowk4AvFHX
 CjUAtEloDOmLTogdCQp2nyrJ+oPks72QjRyqy7OpYj/IC4b445tGS9bd3RbbaXWZhsqo
 KPhM2AKVugSVg5yw0k36V1kEcg6D55YMtnEKZVigFKLuPrAHjm7rO62hF71XU9iFrDo6
 I0RtJG7jPC7FCnUBxdYSN4JG0IQ9b9Dp+fmUOSRk5v+wGMhE/x9mwH2Rtd2Zer+D+2EH
 9rww==
X-Gm-Message-State: ACrzQf1WR42gH9G3NZ7K4z0lY31RaH+d9P9Up/Lcimgx3Rb5wxFRd/R4
 gc2GqxI488t3ZC0+goQryJznxXLj0kcRRA==
X-Google-Smtp-Source: AMsMyM4j1N+FOunJ+KWGG6IQuoDxyTk4l4cx9c64QEjeKfP9aHiGKMN02jqUtLrDEruyLPLj4UBY2Q==
X-Received: by 2002:a63:e14c:0:b0:439:2e24:e014 with SMTP id
 h12-20020a63e14c000000b004392e24e014mr2588822pgk.173.1665027867956; 
 Wed, 05 Oct 2022 20:44:27 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 05/26] target/s390x: Change help_goto_direct to work on
 displacements
Date: Wed,  5 Oct 2022 20:44:00 -0700
Message-Id: <20221006034421.1179141-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f8cfddc181..b6e4005670 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1145,8 +1145,10 @@ struct DisasInsn {
 /* ====================================================================== */
 /* Miscellaneous helpers, used by several operations.  */
 
-static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
+static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    uint64_t dest = s->base.pc_next + disp;
+
     if (dest == s->pc_tmp) {
         per_branch(s, true);
         return DISAS_NEXT;
@@ -1169,7 +1171,8 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
     DisasJumpType ret;
-    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
+    int64_t disp = (int64_t)imm * 2;
+    uint64_t dest = s->base.pc_next + disp;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1185,7 +1188,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            ret = help_goto_direct(s, dest);
+            ret = help_goto_direct(s, disp);
             goto egress;
         }
     } else {
@@ -1558,7 +1561,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.34.1


