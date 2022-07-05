Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C8566909
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:22:35 +0200 (CEST)
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gdV-0004TS-8Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI1-0006wD-3Y
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHv-0000i1-Oj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:20 -0400
Received: by mail-pl1-x629.google.com with SMTP id j12so3900026plj.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9T0Dgh+y//OTwBqoQX1MWiwDSflPGnZ8HYkylQu7wI=;
 b=EQU3B7LxNZnUFF7ESH7A/1GhSlgrkBgDNDuRfCBJXoM+VAUv18YshTvRl8ZAAuDBMl
 HcLjUy8aLVpiB9e3TuqkjEoo9VqX2R/Kaz31Ucw/I56rEk6TqqMJvCZyiOvyFGN3sIeF
 coCxsORuLHRAwlDpZMzSF59JRpeF6GttLcBOAgL/5UrvV/zBgc+5A69Pdz3JA6mY7LQe
 W+BQww2Ieup1b4er5VkIFN3jtktnyYb6m/0uTgPPdaYZTWpPTT/5/kb9fEirRpU9IPcH
 XdNSKApqRV4wPVI5LmXS8XbU8WRucojlbThLeEQ3mcC/1Z40kLajdeNvln84lDJ9VS96
 ounQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9T0Dgh+y//OTwBqoQX1MWiwDSflPGnZ8HYkylQu7wI=;
 b=TRq77//GX/YM7Gp2wYyTfm26c7IICvXEGcGWADXxt7gq5JgOnV3TTIVNrZiJY9vPAg
 xhcaSD285KNSJo7m6r9EjXQIzeVs+cIQqtLGEaQE3I3j95OLHcaOrZ1/ASYW8tOHm7Sv
 6T98nnuGawIdOkpWub52UQur0BP+h4m8atcOF47coIBOf8nF92ei3JbvT4Bd+7rYZmOk
 FgyMafEZLtP1JVwcrcoEcdKeN2M0h0J5EzXcMeV5bjHJHYPbUhOyhA69zG8iakpJKRJe
 4UJYsAyQ+Gs89hyJVhQrmIx2cB/yDHSfRQtOQ/UUZUH8Q2FqjefieICPgsh2PTvRZcad
 T2xg==
X-Gm-Message-State: AJIora/jRYfXkQGpzgLZekt9W7Qqer4gbQeW/3x8SAec3Rx9hPtgxRPB
 s5Oh0HN9s5AW+x01JDb9OqKNCXTrPauVUPb0
X-Google-Smtp-Source: AGRyM1vk+l+yrTSt3CNPYZs13Y+pRUqgbaL9l9oZ4x6hYFYcnAjLyUjVCs/8lhRDaJJe4SVxbGmMnw==
X-Received: by 2002:a17:902:f543:b0:16a:54c6:78c0 with SMTP id
 h3-20020a170902f54300b0016a54c678c0mr39498075plf.22.1657018814491; 
 Tue, 05 Jul 2022 04:00:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 4/6] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
Date: Tue,  5 Jul 2022 16:29:55 +0530
Message-Id: <20220705105957.1144514-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing in this environment variable that cannot
be done better with -d flags.  There is nothing special
about TCI that warrants this hack.

Moreover, it does not compile -- remove it.

Reported-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 5 -----
 tcg/tci/tcg-target.c.inc | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 033e613f24..ceb36c4f7a 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -53,11 +53,6 @@
 # error Unknown pointer size for tci target
 #endif
 
-#ifdef CONFIG_DEBUG_TCG
-/* Enable debug output. */
-#define CONFIG_DEBUG_TCG_INTERPRETER
-#endif
-
 /* Optional instructions. */
 
 #define TCG_TARGET_HAS_bswap16_i32      1
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 98337c567a..f3d7441e06 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -823,13 +823,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 
 static void tcg_target_init(TCGContext *s)
 {
-#if defined(CONFIG_DEBUG_TCG_INTERPRETER)
-    const char *envval = getenv("DEBUG_TCG");
-    if (envval) {
-        qemu_set_log(strtol(envval, NULL, 0));
-    }
-#endif
-
     /* The current code uses uint8_t for tcg operations. */
     tcg_debug_assert(tcg_op_defs_max <= UINT8_MAX);
 
-- 
2.34.1


