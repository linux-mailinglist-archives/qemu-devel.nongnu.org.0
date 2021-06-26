Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BBF3B4D38
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:49:41 +0200 (CEST)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx28K-00089n-Jn
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vx-0002ZA-IQ
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vs-0000RE-DT
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so6861759pji.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=aeiArkHxqTHJZOLaMIWNzDAlAQWAD29fdb9qDhu6FbPXC1sOaIQ/pTbcYRbfUUE7KX
 b8/mi7IdRLwj5+oIgHrXhcOUPL/2dDcwSWx1hJLHIrBJ3uVjHnbyWKomuHmK/m/t76dl
 G5pTrUGvjpY0IdFmU4JEz69xrqAEInwQqa7x29bbYHfs3fmgFnjtCJGzlwe1EJd1glj6
 z7/mK3UaXIElPSR4mMYtqFPJ6dvqpNXnufO+2ATS7rv0mkKZpFV7tJsfCSgmQ1fjCBbu
 eKvJt1d6uUK+Q+7zl6i2g9RFsHvjROzqqc050+KU+l2ZY/Bdzwhel+CJVQSJFfvQKZbL
 QQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=Ahgga1wljxkZXgRIiSwfY152Ybzju2AY2tmdYK+Rpr/XC0s/bt9aJZxnWQBwTSY5sl
 BIvtFVXXU/xEHK9gROLH2qYj2AXlKbYqYQUGFE1fuA5AtrRvZtyvRo1JPvG1sFLk5M5Q
 cCi1057/Q5dBmmvdisd01nydmYfvAD/XxBCKMJzVlr+7/M6oMex6Cod+te6vkhnfCowj
 UmGMRjplawWtkvM/3v4t2yqXDNsEU0SImP+1R5R9yZWY7PnLH9FPxEHz43blE8nnBgxX
 FnZqJLSQe+U4Usuf1Vw7u/QqHEiM4CdKoXEYCgPpLMfj/S5oPAQQrl414lNJ8vwYB09o
 8URg==
X-Gm-Message-State: AOAM530w++kuQl1UTrOWa8ijrKR76ZbxLU5hY2Sd19ng81TpEAx0K+nF
 WCqxAyzLgrqUjxtTRqvXopKu+S83Z2xk7A==
X-Google-Smtp-Source: ABdhPJzmYt6q0FlTepizVXQ/y/Ld1zBCFtJUL19UqcNNPBnRGe/IZk4yyCPv7EsYlxpwlUW5BcUaPQ==
X-Received: by 2002:a17:90a:31ca:: with SMTP id
 j10mr15429030pjf.53.1624689407141; 
 Fri, 25 Jun 2021 23:36:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/29] target/i386: Improve bswap translation
Date: Fri, 25 Jun 2021 23:36:26 -0700
Message-Id: <20210626063631.2411938-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Use a break instead of an ifdefed else.
There's no need to move the values through s->T0.
Remove TCG_BSWAP_IZ and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e8a9dcd21a..b21873ed23 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7195,17 +7195,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         reg = (b & 7) | REX_B(s);
 #ifdef TARGET_X86_64
         if (dflag == MO_64) {
-            gen_op_mov_v_reg(s, MO_64, s->T0, reg);
-            tcg_gen_bswap64_i64(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_64, reg, s->T0);
-        } else
-#endif
-        {
-            gen_op_mov_v_reg(s, MO_32, s->T0, reg);
-            tcg_gen_ext32u_tl(s->T0, s->T0);
-            tcg_gen_bswap32_tl(s->T0, s->T0, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            gen_op_mov_reg_v(s, MO_32, reg, s->T0);
+            tcg_gen_bswap64_i64(cpu_regs[reg], cpu_regs[reg]);
+            break;
         }
+#endif
+        tcg_gen_bswap32_tl(cpu_regs[reg], cpu_regs[reg], TCG_BSWAP_OZ);
         break;
     case 0xd6: /* salc */
         if (CODE64(s))
-- 
2.25.1


