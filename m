Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE11430425
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:21:58 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboJh-0008SZ-1v
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDM-0008JU-NA
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDI-0001qe-Eq
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kk10so9497885pjb.1
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YyDqXYsqrF8hGCU2JD1wGh8x6wmhmGPcgYsbKER5I8=;
 b=oLQlyW9TLh+jJmejYhbMj+8Ik0yYPDaqFBfKk/xm6aIq+tloZFcGU2FKzMbTR90vLk
 VsGQG5yc07N7NAv4YuLZM9LlJB42Zxs1LkmbAM6bg/08qZiToEbo5vFxvH+iP/kwAt9E
 vYeJzApVqyMCB/nxnYsyH0cAADYwOjXFUAYzbG5SXiE+YQro5bgDevIn1He10N6Qdpxg
 ZSdvrPmwQvSQIzqdsOwo9wspLxsxSA53jZd31KtgXQkhMMYscFKA2Ceixkk81/OCXWK1
 hVEDsJHmFCg+mzhSxf2TEGD2baGIziIXS3SKiWRjKO9sTnTnED17llqC6YtgZ14us710
 vWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YyDqXYsqrF8hGCU2JD1wGh8x6wmhmGPcgYsbKER5I8=;
 b=5XBfAt5Sp1wbDyfmGBcuYhsABkzcYsC8mD3sQNtmLorubLt4OJpse3z8mlyYTUO4KR
 26HB59vg+9swC+6SGMNHu7i9noC0ekI9wt9cptuc9yoNRNEl7lWv7h5V+MqBSwVyJRbD
 A/+DI3GgxjSzk9k4AAu95Zv6gIaFNSmW88hcRwkkVu5eeKU9xUqdCum7NN8JhxYvaM4h
 HlW+znIudXhkWG/hFX5U/HIH9X+0VNbgl/vRabH4m6HdyaAg5sIX0TP2dodbm15HQKNQ
 nl2uT8+6rsr3XbCWns54OQRcmVsGvH+cAECd+O4XssWwrHhW/ruTDDpO2ktPtqF53wV4
 YLKQ==
X-Gm-Message-State: AOAM532Y3E0x9BJm91YXNIydKvvEwQk7hYL+yQtMgyJQqDxE6fzaCnrC
 cikCVOKe/kE33dAA25khJ6nnepOe9RI=
X-Google-Smtp-Source: ABdhPJyMYIqR7tGylaB9+dLp+5xaLJlowHo/p+s2IkPmBLbgcz9qpj4sZhzQ/Bh7tW3gLEpqeE5pUg==
X-Received: by 2002:a17:90a:f2c2:: with SMTP id
 gt2mr8270020pjb.2.1634408118622; 
 Sat, 16 Oct 2021 11:15:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/24] target/alpha: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:52 -0700
Message-Id: <20211016181514.3165661-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 0eee3a1bcc..a4c3f43e72 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3005,17 +3005,10 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* FALLTHRU */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_PC_UPDATED_NOCHAIN:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG, 0);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


