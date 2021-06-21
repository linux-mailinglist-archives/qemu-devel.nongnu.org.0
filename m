Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B93AE170
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:39:19 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8uE-00040B-IA
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0003st-PE
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8ps-0005Bw-DL
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9328353pjx.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMkVnaoY765gCHKs02WDkaTKMwEGdS0qsbGYx4hCN/s=;
 b=YYsO7F/cWLfhAMJMd/DPnzTFb1cA/kwTdhlJmoqgipATMcreq1eVCnld6T2txfnKNO
 ArRI4lP9tahNnReRW0YoZ13W5yJyJKy7a/l4rN5hpNyQHANM4yWOuDmN8pG7pRujcGgf
 lOFMCvKRFkMLh0gwOMhovR9/DiIXsieDcQMZkBJpl+3NGmavjLT0NwkUPoAV25K1d+nu
 UFE5pH/cK5iYzN7+/nY0PRjJK4pYOm0pwpNBxhH3BfakPaJ3ckwbr3tUA8gv83OGrReq
 UpRtXJdLbg70nqgy+0xSu12M61TnpXEdTzn6Y4zNDVzYpYTLPErPqf0eVFLen+u+7vMI
 te7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMkVnaoY765gCHKs02WDkaTKMwEGdS0qsbGYx4hCN/s=;
 b=RXExHktBYki5EKeICHMgqW050o7sRQjYR2Z444UeDpaX4ylH9XhqyGfqsqcCJJE490
 bIpgTXoqrQoVheeqG+fbewyHK8yNVfvpMUe0bUiKRMdBqR6IkrO3DbJclMK0P5AUEWhh
 NyzeVNusnwtE7UuQkhTTeQMFDWnqOyaEHDTcvrE9nv9HkoK5EHqbwnyBtOmnlnRangUh
 RhLzB0ThpQ2Or64vd+dbX2+TsrCvRxbvjkmvf5k741m4SPDby1Quz6nEyRBuxbuwRkQY
 2K6IZqh4dRvI0aM+zJ4bnJbwlqsuxxW4a2wJUaqdNuNrFYWocX0f10/LJnIvky2Z9/1X
 z6hg==
X-Gm-Message-State: AOAM532VSAEgjXNu8NFPR3hz2T1+4/AoiKhFj17hbo6nlgavgodTt/R+
 lp7in2Ebd27J4gJ8zbesD9XikbUDzum9jw==
X-Google-Smtp-Source: ABdhPJz4fF1mhDOiFfgzaqmlThPEUHfIcmwQY8USQBXI59QSNWZ3KjDJAxL+QUWGaq37ZmVn0UI86g==
X-Received: by 2002:a17:902:8641:b029:117:7a89:b42 with SMTP id
 y1-20020a1709028641b02901177a890b42mr15669659plt.58.1624239286684; 
 Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] target/i386: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:23 -0700
Message-Id: <20210621013439.1791385-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a7f5c0c8f2..e47b220ce7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2314,21 +2314,11 @@ static inline int insn_const_size(MemOp ot)
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


