Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788D3B93F4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:30:03 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyde-0004oe-3l
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZh-0004WP-RK
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZU-0008DI-Kv
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id t9so6428251pgn.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=se0upj8uwwed3TnJTE/iIfzC0n2efWNdGM2VdkwZygY=;
 b=KOqZw+rxJfNVRBW97RxKMPpf1mHicOBT7+X8PwrobaYRY6fWZKG2gf9FrKUcyymsnv
 TTRx9O1c6GzV6OU5i8iQ81GhBQQaARjrlLnW6oZnf7jDenEHRzaY3SsKghoJYbxsfquR
 T5+PO0VDcANvArVcLkx4DZlk9vTiHq7NmDU8wWWTO1CR0o14yzm42MMjgeRODHHaDPSJ
 FtC+mEC7ByT/Sl00qYctjfBULrGnBNzrkf3pix14931yYQUTikiU23QcMcvbxj7Y2d6p
 tCfpeZUEhyIw03zRAVRlZkjjx7R+YLgPncw7LEzq9dhqr4kw03cnG5BI261pAk2bLiqU
 k+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=se0upj8uwwed3TnJTE/iIfzC0n2efWNdGM2VdkwZygY=;
 b=GENSq71RVAb1De5CFN89iDWPFvVU/2zbJo18JKu26EtMFQnVK8qa41Sd1sWdhfxAF0
 bbSd0YkpeX45/kDGWdOT7HakVNTwhIBnhX+KpJMCJuVEop3LrP8cbv8in049t2Tf+5vz
 KWLJB9wotgplIsm7roLD+9MqTkOkzoWCiuAIR2hO3RMuQjKYWmEHohM62bZmHs1R4/Es
 DmCRH9YHvwmsVKt3Q2X+cINMjDQdNbvoGJLCnMUJYcaCeA1sUbYYvDF3FyBVYI+T95FR
 6xXzvnvsIM/WUdunB+ARFDaTqkvwj9k2RSxWgJI+EvH+Xo9Ym2CtzAqdao3U9hZaSe4L
 ZZog==
X-Gm-Message-State: AOAM5307DL8fMUP/IUU+7RfrRiczxwU9Wo53qoJkWo3FZYKoaT48g9dA
 d+Rso5Gr0iGlQSj9dPFFMGR8h9exWH011A==
X-Google-Smtp-Source: ABdhPJyC262hSUlyFBPEXc2Z4KEymxSX6pcMZB8pmyGiI+jdSXbeBO5EG0OoGwgCG+CxaZd47YO95g==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id
 g15-20020a056a0023cfb02902d5302edc77mr514244pfc.63.1625153143392; 
 Thu, 01 Jul 2021 08:25:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Thu,  1 Jul 2021 08:25:28 -0700
Message-Id: <20210701152537.3330420-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 5 +----
 accel/tcg/cpu-exec.c    | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dfe82ed19c..ae7603ca75 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -565,10 +565,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(CPUState *cpu)
-{
-    return cpu->tcg_cflags;
-}
+uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..ef4214d893 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,6 +145,11 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+uint32_t curr_cflags(CPUState *cpu)
+{
+    return cpu->tcg_cflags;
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
-- 
2.25.1


