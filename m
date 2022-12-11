Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAB86494DE
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG6-0006ZY-J2; Sun, 11 Dec 2022 10:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFn-0006Qi-Ag
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:35 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007WJ-Uk
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:34 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso5835720otb.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oqz5leAJw9u6Pyeo/01GA+MzzGo02lOxdG/HYsszSs4=;
 b=m3LRO9QuPFT3YvRefJCeEPNzFHFlQ4z4Kz42wYyjziGZjY4QMUI2khFa+d75o9i/KH
 TK3keZXarVC23UsjHs84uuISXqMOP4oI1aG+G0eHuvbrkr5mvGk3r+nu0OvmrcCjjW7R
 MINq6JkKFVV0ZRNWYBUeoaXgbE1rhS60DBIDo6DXPmutHvpr9grI2jUMtFz6De1WguCW
 a3E9CPQwG7ZmwyquSwXYNUms9QSpEJo5FHeuvuG5dgy5y2+a+7bqik6z+pPPtpbMhCRr
 s9jRB6RlwEdvVk6v/qDX9Pk8LVOqu5iG5KJ0GHkHBGfg7HD6VbgAm8R3nR8OM/2NgMJ7
 LRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oqz5leAJw9u6Pyeo/01GA+MzzGo02lOxdG/HYsszSs4=;
 b=3QIVUPOtvmopbrB6z9whkaoa9a/sUrHSBUJVqRltoIjlk5P7wMq5YklrLHVnlz+00S
 pmMSC759wNtk0DtsPw0c2Mj2wEcISS3EuBMLptZB/2LdrsDd+D5XOCj3rx/rhhKD+SQN
 A08966N0NU8FLjsKAAeWds0Kgs/g6pNYTKxclBA12Usp04npjTnTkOSN8ePHOYfjuXvV
 45ARxYfRrt1N5mLs/NElT1QXm8H5DCU3hkjIWk0jCrcMhfogQ2mZoD76CKpKPh527Zym
 Aq5J4D9fvUoN3Jl9kxdx/6ZW5DJKux46uZfxeSSS+Jseo88u0hJJAmmqdB9peUYaRfAQ
 O2pw==
X-Gm-Message-State: ANoB5pmPoySSk7SXKLwSxUGRTPwi5n7l/SU3nJwOa4mZB5NdlLYLp1QV
 P2pbLNNY8sLCYms5iKyZJL6GVqAPGGJFEs8efBg=
X-Google-Smtp-Source: AA0mqf6y7OmlnKmHBAQMSErjUmucVBGNZIrnFYV1PMnXmGBRer1N5GVyQx6GXKKL1stb/AC49vmF+Q==
X-Received: by 2002:a9d:17e8:0:b0:661:dfeb:f88d with SMTP id
 j95-20020a9d17e8000000b00661dfebf88dmr5858069otj.20.1670772493030; 
 Sun, 11 Dec 2022 07:28:13 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 07/27] target/s390x: Change help_goto_direct to work on
 displacements
Date: Sun, 11 Dec 2022 09:27:42 -0600
Message-Id: <20221211152802.923900-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1f9dca671d..f755909aeb 100644
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


