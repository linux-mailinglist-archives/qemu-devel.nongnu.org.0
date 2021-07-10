Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D23C3550
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:45:05 +0200 (CEST)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FA8-0007kM-4z
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExT-0005Qd-5i
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExR-0002JR-MS
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id l11so7418876pji.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgZhcSy8wA9T7RvUf4moyrqBuAXS045DsDPF940MlKs=;
 b=UgyQSEEdU8Gle9tNrK/5kZJSrK28Hb7itWhRwryEUlQVoRakQp4xnZ6fYsTFMnlyC/
 NdKI4yn04RoNHefaLdT2+awNFIvcPTM89IGIwMUtZO7Exto6IJR/cIM8pG/17z56xYCI
 1FnIcpIe5wDd7/Cv6ZupUYuTq+EyMlCa6sZYzZQLoa4Q+Dy6EzkCeInRNc2mmvAUsWN1
 giJiTRBgbCN4hd0L2N6Ol+8p0FiFJu884PrTDZXvR7VpsiW68GV3EQBFYitesoKNDVd2
 LW2nRpmzkVxIDU6TqSDqUa4liwM3OVs+nhpq4wfLrNDGvwNYBmKKOhUw7kZX8IglaVY/
 e/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgZhcSy8wA9T7RvUf4moyrqBuAXS045DsDPF940MlKs=;
 b=O2gB7bU6mYHvsm3q0ZCsWFWIxH0JLclQnu8jwlB9vMZO0upW+eRaNPRdE0dHJEMpKJ
 4wlqv8oWom9c1cUtk1U1vGi5akr6xY6KA6ClNPYKYX3Txic5+/dy4Z0GcBizS3NzpWRT
 vz1w/+6ztxIGTXpiZQKEJm54Sga/JC/KhE4T37m5/GXYjiQsicz7yZVYkrvRAqIvisIT
 XhOsf9Aq3v4djnlByd/3N40ykBHJbHpi9uwfVTA94l6FVKQQzdtYvy8eqhu6OBMegMid
 EBDwG1siKmrvTW5uCEel0s1alLVN1a0GeHcsm7laRfFfDaq7p7BXxzv+XEkhYmW8l3lE
 q0Kg==
X-Gm-Message-State: AOAM531TM1T9S3UQHZB5lggFDWtKoW/i1zVthCnytrzQ8L0LzJBAVTRR
 +bQcHC6TuH6Xe2JWpQ1vJunlJ0Fbck1qvA==
X-Google-Smtp-Source: ABdhPJzMHryPDmrKtS+zPAH9yW6cG8yZAjhAWilC43NPvfYzku+Bo/RwDwBxmyyCG3S4GbRJst4bAw==
X-Received: by 2002:a17:902:dad0:b029:129:c3fa:715 with SMTP id
 q16-20020a170902dad0b0290129c3fa0715mr17568018plx.45.1625931116388; 
 Sat, 10 Jul 2021 08:31:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/41] target/i386: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:19 -0700
Message-Id: <20210710153143.1320521-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 85b00a6945..37a66b4097 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2313,21 +2313,11 @@ static inline int insn_const_size(MemOp ot)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc)
-{
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
+static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 {
     target_ulong pc = s->cs_base + eip;
 
-    if (use_goto_tb(s, pc))  {
+    if (translator_use_goto_tb(&s->base, pc))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         gen_jmp_im(s, eip);
-- 
2.25.1


