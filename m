Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E14CC74D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:48:54 +0100 (CET)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsNa-0004GH-2D
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLZ-0001WC-Cf
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:49 -0500
Received: from [2607:f8b0:4864:20::431] (port=34750
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLX-0000yO-TH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:49 -0500
Received: by mail-pf1-x431.google.com with SMTP id g1so5790598pfv.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=her8508EwA+z2+eb8zvRxH56IuxcXKjAk0c8gMcBkP8=;
 b=ZX0CxXI56UK45w+rwZSgLUptr9LEEQjM2Rq9JmhmeTxO48dRUWFnXWO7vbRyYqJK7g
 pmIsJ0hye8nHicrZrMSmV70fI3fNgS6+yBlGxMU1q6cAaVGh/YdvX9230hGej+XS204i
 JQ6WfUqZzlqUJDYm9rsZnOdkplfbdjJ3rWNiW7uxOAlHb7PtEQIkl/S5bDX3u7nymGHr
 Y4/70ltXSBIcJnEbFtEKHtCd1Nc9J4PpLIjtARr3H4PG/gpZW9pf12GduP7r/Lk2wmPB
 pi6u/2cgsJqHOiGDtKcAY7+6f16uE07WfCx7C+mfZgln7YrOlvBxskExCr0MOqVd9l0t
 aBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=her8508EwA+z2+eb8zvRxH56IuxcXKjAk0c8gMcBkP8=;
 b=vVGzaVYI3M9H7L7VbuStdJIdjFgPuiYUrZ+I6C5IQ2ahfcvngEU9601MvYHUprOGBb
 iw8ZnMbC8LUeUKTmqWGhdC688VpNJl8CGV7ZJvwJc9J8b05Y7FqyJMmCHxirORKJEPnJ
 u1Tj+XCz4k2HTdGsIBFBiunEXRtW2Hu71BTzlrdhvuMGMwIEmUf14/GpkfikR1x289x/
 X/5+CB1WoX6tkgZGYHHiHbBJWzsjEFE9FKKHnStjB+XFrLTRdkeqimUu9kXLv8I5ERFU
 2JoCwg9r/Xomwn4Ton2d2GpTsahx5I4wXCo6FwSlZIeMIZZdm8xjyfA3HbL7xQCONrYs
 lTeA==
X-Gm-Message-State: AOAM531j9nirxxXM9fYgyRmC27v7EfREraWF7Mf/peOG2RwguD4+juPt
 z1hTXsBzu8iKMXfp1L5vafB4LII4eM/2tQ==
X-Google-Smtp-Source: ABdhPJy4s/IJEylL1fH4r6xm0TeQswFtzNoC4o65dkvS1XelzDtKB3/JUGPaIdQKFlnMWr2MGCystw==
X-Received: by 2002:a05:6a00:26c1:b0:4e1:3135:97a9 with SMTP id
 p1-20020a056a0026c100b004e1313597a9mr40122556pfw.13.1646340393246; 
 Thu, 03 Mar 2022 12:46:33 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] target/nios2: Hoist R_ZERO check in rdctl
Date: Thu,  3 Mar 2022 10:46:21 -1000
Message-Id: <20220303204624.468786-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will avoid having to replicate the check to additional cases.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 194c8ebafd..fa355308a9 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -447,11 +447,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 
     gen_check_supervisor(dc);
 
+    if (unlikely(instr.c == R_ZERO)) {
+        return;
+    }
+
     switch (instr.imm5 + CR_BASE) {
     default:
-        if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-        }
+        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
         break;
     }
 }
-- 
2.25.1


