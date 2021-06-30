Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596983B88FC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:06:43 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfXm-0003iW-3d
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0w-0005io-HS
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0u-00028q-27
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b1so1989115pls.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5zdFypNJUiuz9mUBU1bW+MPnocbJgkyrT9X/Rkk3hE=;
 b=XYko2A8DkdqNp2CiO+ckRPZLiXhFRfUQqPKHEgFO63Xlw06FTIJ3xKANnlwfsePULX
 V0iEViUIdfvBNa1uigszfYDVgaAgOqad+6uvSyv+XSODewWFKnWoPoBFCHB1APv1lsmX
 rjxpS5A+WAAv8LL7M537e1vEX7F57x2oUQVjCj4cyVddUPtwU5uuCyBcEO9aH90H1JwX
 iM+K69TIgrMuZO42Gs072r9JnudPEVvA1+h3AgEF3Qf2MRudjXXuPe66Dhi5g5DbvvEU
 B9+C9SYxxOiR+/Vnkz2NdQJvIGemf+Ltu1yNvubvBEAN+9PchMuRm+2m+WSjSKwdpkAJ
 kweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5zdFypNJUiuz9mUBU1bW+MPnocbJgkyrT9X/Rkk3hE=;
 b=HCuTpjX/D+Th10S00uqfl7hhahXWjsPfBAtOWgXlLzntOWvPWskwaypRdlrXkE1scf
 IeRAMWbzA/xxj2m3ghmDENNX3ws88S7DHRRgCb9bxD6OQfQVX18m97aRp/PQ2/l33dPD
 G77yQ9OUjK8dQQr9pXpq+2w7W6HQjDxvbqodv+NbHx5Bl0pfttSV7Pdl71ECuZOSY8JO
 Qry2DI4CnWDiljWLlaoG+LdQxnN9RFq8z9ZY+TN5bfAaYIVHy2lHYm/6uXJUOy9s4EyF
 dgkSIeditNpwraeTErOxdTGMlSbHzT6Shak52LOSTjosyoFz7zzR4Oqz9dtE4qFLBxEV
 +HtA==
X-Gm-Message-State: AOAM533dIpH80iAfQNbPoO2J+Xx4ng21ZtE9y3lRCnRiokLKy6h2Yu+x
 BIZHSv/Mk8awG5oQGiQ/DdHTP26/W0eCtQ==
X-Google-Smtp-Source: ABdhPJwP3Ajn7xCkq4svQtsVforHCgfwr0dGJVTFfKCHBMHOtTUZZuB0o5wV2VztAyMWTDYj6cqqnQ==
X-Received: by 2002:a17:90a:348e:: with SMTP id
 p14mr40143906pjb.151.1625077962723; 
 Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/28] target/sparc: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:23 -0700
Message-Id: <20210630183226.3290849-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


