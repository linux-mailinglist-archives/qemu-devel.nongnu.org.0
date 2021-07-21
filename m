Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5243D17BB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:14:15 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ibe-0003GA-QK
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO8-0002rB-KF
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:16 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO6-0005lR-TE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so1965379pjb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehY8U09jBm9UvNr8BfCejix3nlnXxTqyEmybvBBu+AM=;
 b=dqqQrwrNBYZEdU1t/HtQLpyePhi2gq0lKHjw/cV9aTWfDckCmpSM1erCzDK6hYLQoG
 IK/eqMGNayfVzBRzqRLP5zz1z3M3svIv0GNpS8uRt0sN83okO5VeYcLpi+FQ2JYksxR4
 DeaAsvI5sSN4FSk2zVtvNBd6om2R09doXv2h/N90L5A76fxR26K2rB9zSlXqmp8Azd85
 J6hGzB59DJ+Ue4QwWJ6TvYjet2d9C7bqpW1pzBUdQ9Lq0mJ3KMbsaIf0lISx7ixQplag
 lKrJqykpN2CcM5OHCZhYNPCybmOBI43MHiII1MbQLa+M2Fr7bJAORaUR1hs0dj52WIht
 xNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehY8U09jBm9UvNr8BfCejix3nlnXxTqyEmybvBBu+AM=;
 b=GyIk3lLkiC8t2oQR8oiKCITK+kXCc6A1Rv8V5o/xif7njKkJLnB6ylJ9S8QP6/o6z7
 LEP98eRAjucXtnj5hw9jx6V5qyWBX2PmY6JnBZhFg4RHPoPsXRxjYdSKL7gvIKvG/xUn
 cDdZhg3vx6Y5rmADR7+o6PlyenrQtMX36RVAqglFBR3WoxSQ0aXdsyCns6ODXsu6C6Ps
 N1ens7L73Z+GaDphBRVQ8hqERI9lBIn+JGp+/4bfY0/hjA1NLMpQVsqxPFqw9EFvPHpK
 yLsVD5yKV9ygp20vkNFNHZuwpdiAeFCLQZ3NQRC1jBB6VcVPLO7xPjGZS7K5pbr18hCh
 +Hqg==
X-Gm-Message-State: AOAM531kED9h2JWXuYSTj9I9QHolrsxXNQ4XU56h//awALqb2KQ82rpl
 KgxGCUavynCH7duin9eXPKWYrWcoPlJvDw==
X-Google-Smtp-Source: ABdhPJyI+cEb5fn1FCvVra4j9CzJ3uVSexEWtOGkkj52b9HIBiuov6P4Ls6S295IL7tykRZJIhE+PA==
X-Received: by 2002:a65:5c01:: with SMTP id u1mr37993214pgr.181.1626897613723; 
 Wed, 21 Jul 2021 13:00:13 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Wed, 21 Jul 2021 09:59:39 -1000
Message-Id: <20210721195954.879535-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210717221851.2124573-3-richard.henderson@linaro.org>
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


