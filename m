Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74E3B78FF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:59:32 +0200 (CEST)
Received: from localhost ([::1]:60796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJtL-0007Xe-AW
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwl-0004LE-UJ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:59:00 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwQ-000323-8G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i6so132539pfq.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=GMTTfxkLRL/Xcfw/UxsY5I7tjyyEb6w00T2iSBQHB61yBy5y3T42kOKVgDr0fm5MjA
 B/GNkCvbHTerURCAQYAHVGVjOdK9yTosEuUseocW9ERcISokittlOd2nXOIBQBtzErqE
 6fOOd4/fOh8VrFe7SGgB0IYQoBZJr/cxvTTfjgkrUyCfOyMWzxoPEGxZMxGpXCg300PX
 CWGydEDKd7hW0or+8xNbaTF+0XH2RzCy/jp160BDs8lKRCdy3EJJbWZvpnOlyAx04OIy
 XAki4Se76AdCGNjpO5hy6Le6wovwbyHg9EhtiT8MVWD49PLpBRBdrWp3pBEW1brTzFlG
 RgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=jw9RYdRgv68WqQnaldBGDjMchfwKg42zCLrLWNWUsdto7V99gdB9to3upDpwDP3THs
 ug0U+T8aHS2L7/1je45kKTd6/AdYAXlwrnzXUOsBggl3ZmbOk2+71xoKJU/54CiH9+Gn
 +DyuWHsmzJR9uJVeQyVodGRjGZ363i0CeiNHRCvFDAEq/oAUXvRJLL6QcnbFZTKScq3P
 ACuSXxF4dBMNS/AFnLBs01AV8MKUovczLAGu1hcotMm6t0SNTuynER8cD78HeHznZ9Ua
 yUEYVj+v4kSjzImKljZ99znDBzzhwEGLrKpNwSL4dczI/8d8AsljwbMYMTapHOGXYRz1
 h2Sw==
X-Gm-Message-State: AOAM53292bdoTho/WuFKqDU3MN8fIi9jIyNOhzdHDimdaE9xKkvlJ0Wq
 qMswZePvJjklfXvKtWf/P8Mx4loIcA8Rlw==
X-Google-Smtp-Source: ABdhPJzw5XSUmN7qWJSO1ZhOABax5IcvFlAbAgHqkZAr/wfanqx5REkAw7j5tpbF4kxig8H3loOgDw==
X-Received: by 2002:a65:6441:: with SMTP id s1mr7155970pgv.214.1624993116416; 
 Tue, 29 Jun 2021 11:58:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 58/63] target/i386: Improve bswap translation
Date: Tue, 29 Jun 2021 11:54:50 -0700
Message-Id: <20210629185455.3131172-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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


