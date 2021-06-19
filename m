Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A078E3ADB66
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:39:14 +0200 (CEST)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufs9-0001KO-Nt
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV3-0000yU-JV
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUu-0002Oz-Hz
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id p13so10416254pfw.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsjy1JiJ2x2+FvZgfCJN+MKtpHaomLmEry8fdDvNSE4=;
 b=sR3puWTumD4O+ggwV5V+dLFrOpB3SOGZqC+D7xqRYlA+y+XR6UFg1HRmcwOaktsyvK
 YC2BXdGmz8sLil1nN0ojnZcCvGjDUf16nWz7wm5vKg5rIcjrsPYDWhLH7rsSTPE1e3X5
 smfh00sAdcIaPlkx7NkNecm5LdFza7SgiuP2NKcEX9gZ+TkS/BdeAxPlmNUsnOaGvbL1
 P+jZKacuUz4w9CwdQF99yYkBqjmtDFl+1dta1OntWO19gPQzNG9/fUgtf72j+uWzOB9H
 /VsTtLubLKWfrsQk0hQLz49pG95fuXc3LzDWnFtD3TQrzGTxo+mKP7PjO7mvJSlQJQgI
 olow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsjy1JiJ2x2+FvZgfCJN+MKtpHaomLmEry8fdDvNSE4=;
 b=Kdw19uhjcZdY+6v0TeOpR03MMKGwK3WDtgJjJqb8Le6o9dG7RwfAbIkOOmqzW4xdqc
 O+qKhHjDwueLHAjaSFCymjABpUSmnrsMVUl0TyCgwsab8Q2rDeg60Gfix6995HNq6Goz
 WBFu2qdUnJsSjenGH/8Nb9EC/VdMBeVXO53i+agpBAT+YrkPr9q2zafNYJX6Hl/Xetem
 eVvSjfTUzzSFF5zhFpLokq3gC37cfWr/ovb9KSf29Dp3r5TpHTwspJBI5YT4CZjmbFAa
 cLgaMvwksrQ0+AB96JjqLk3bSvhT7d0sFCfWLSUkkrtkgQTGAV52KsCCpX5dgqFu4gE6
 gd2Q==
X-Gm-Message-State: AOAM531u9OiF/88G4v02agt/ZpTEA8zEKHu8sSm68ViGV0aG+5XxSChW
 EcQMKEWJrRvKRxWl1fz8TOjHXTfUGVqgKg==
X-Google-Smtp-Source: ABdhPJySr7lpY/44/n7IAPv9qtfZkCTHTN9xPV3GxpGW4Hde3HhSUEK4bXidZY7Wa9o6DJPUI2JusA==
X-Received: by 2002:a63:c2:: with SMTP id 185mr16004604pga.18.1624126510999;
 Sat, 19 Jun 2021 11:15:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] tcg: Restart when exhausting the stack frame
Date: Sat, 19 Jun 2021 11:14:50 -0700
Message-Id: <20210619181452.877683-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assume that we'll have fewer temps allocated after
restarting with a fewer number of instructions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 47cc66f159..fec922fa9e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3039,7 +3039,11 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 
     assert(align <= TCG_TARGET_STACK_ALIGN);
     off = ROUND_UP(s->current_frame_offset, align);
-    assert(off + size <= s->frame_end);
+
+    /* If we've exhausted the stack frame, restart with a smaller TB. */
+    if (off + size > s->frame_end) {
+        tcg_raise_tb_overflow(s);
+    }
     s->current_frame_offset = off + size;
 
     ts->mem_offset = off;
-- 
2.25.1


