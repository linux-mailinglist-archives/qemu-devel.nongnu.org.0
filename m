Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593B3C17F2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:16:43 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xdi-0005eh-G5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5N-0001zY-Fn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:13 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5G-0008FU-8H
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id f5so6602340pgv.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5zdFypNJUiuz9mUBU1bW+MPnocbJgkyrT9X/Rkk3hE=;
 b=Xh7uVwrgHUDXt7AY95Sn8I5LnzxOoF4dobWodB/7YIm7htG/cBdEpW94p+2t/ryOmh
 2/0vswapfk9JZiZ4G04RNvLRowaT7wJtSvLV5wIXxqLmbwKA1rAZjpYJ2uMBjYT7Yhhi
 xo30E2bK7jWm2BfJ52xSyV2MQR88/RUpG/eRkrbPsk/e2HZ17odZmw0PkGgYWitHHvEi
 OvGJ71TG6FjEGY7hIhq//jnRlUcBLSsOO2lCvR02TCuMuyme1GuDPafsUNsEFJ0eLJhK
 FNdoIeQsNDomPQIDWnAMIUWqizndCn9xwYkJP36GG4cg9qmJ2GgY2EOUNgzkw08019Sr
 lkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5zdFypNJUiuz9mUBU1bW+MPnocbJgkyrT9X/Rkk3hE=;
 b=i7n6C0UezleQL8QztnWwbhXDCo8CIW5TcwJ45nBrG5P02lRFDpfS5ESHQiyyiPOqZ/
 cpoIY8CgjOu3XDtKFDmVDmpDCvXtLgTWh3q5A5Dqrd/BFDQDZQ6ZNEhtO9uxWY+iA/ti
 S1dL33zE/vHnwLxtkm2LaLvDrRdIFArE4jLUl5iQbxJ59mzD77uDJARwFTckOASDOfH1
 bs3Q0j0PKr3Ms5GVXayOwaEHkEMYSmIZ7jmbrZnGuc9DeO0CEbMQuDMY4n/JV0cIyBeq
 CRjdcyjPJrVkMHCNbUDQNpez0aZRsnNf1kNOlxnupw06QOQQHx/ZNBL9kfLv1FKFDpXJ
 nISQ==
X-Gm-Message-State: AOAM530hjSNDUzdhBTZugdREiSA+qLvnQYLBdQJYPEUGl4oQeSEbR3RZ
 e+ZVsogkDeHW5Sl5A1PG27+QBWZQAhJcqg==
X-Google-Smtp-Source: ABdhPJyEQ6Du+UyCkG8KS7GGBlOsdOiEyii2AQIauY6a44JCDOqd6985yramldp+n5LpGtmcMW6iqg==
X-Received: by 2002:a63:381:: with SMTP id 123mr32883059pgd.395.1625762465016; 
 Thu, 08 Jul 2021 09:41:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/28] target/sparc: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:47 -0700
Message-Id: <20210708164050.711967-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4bfa3179f8..fb0c242606 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -339,23 +339,14 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
-                               target_ulong npc)
+static bool use_goto_tb(DisasContext *s, target_ulong pc, target_ulong npc)
 {
-    if (unlikely(s->base.singlestep_enabled || singlestep)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) &&
-           (npc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, pc) &&
+           translator_use_goto_tb(&s->base, npc);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int tb_num,
-                               target_ulong pc, target_ulong npc)
+static void gen_goto_tb(DisasContext *s, int tb_num,
+                        target_ulong pc, target_ulong npc)
 {
     if (use_goto_tb(s, pc, npc))  {
         /* jump to same page: we can use a direct jump */
-- 
2.25.1


