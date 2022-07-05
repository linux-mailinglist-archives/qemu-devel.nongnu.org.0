Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D055668F7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:15:04 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gWF-0005rN-G2
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHs-0006t6-53
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHo-0000fV-KP
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id n12so11234743pfq.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cb/72d2FcQmj3zj3zP3mY08HLs4aMXys8/KVOUFQofg=;
 b=mVKMpvJChQOAkaM3IfHVisIBF5KDEj6nXN5i52Iqx5BL7Avk58y6BpkTAqHvaacwEQ
 YrGV41aVFv+sQTCZg1aQzYHZ7VMNLEK3uzFAe/qO1FSnYlsEG5CLRAUQ/iLwXUW4CE+5
 zQ+bUAw98S6edzpCU3GY5PrurZnP9RSq9X7aaiWtWObHdUzVLMdSLy7TR2nN54IcK5yV
 AczwanNBDTI/3OW/X13zkadprMRuf2Ls5xjAP/UVEig4Q5E1iMe0S/SFb2dK/FfcQXxA
 8NkWCIwK/W4AT3wAH9ikSf9l6QMRAbXe24px/4zBfmwiJHOvMtHjX5EmGgEywzO+and8
 qQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cb/72d2FcQmj3zj3zP3mY08HLs4aMXys8/KVOUFQofg=;
 b=DtBWQ0J3TlgHOJA5vNRg1uzsIGnZ2p1Jzsq9ALXuJhi4gUvVp0EAwCCf3yjbM/vyOB
 jh0w2iYOM9eh/GK3ny28nycuG81o0nmbs9V5HAZHYTZvZj04bKh9kTDIDBFsFIH/qrod
 q7e2HYd+xHw3Sk661waWerlG+2Q+qX7LAMcIQBocPd0cc29u0Ck5Of/ctdOsxAH6nphS
 tu1tZV5DphOwG9of1fUK6muNlc8WdcH5bg3yt8VDn+ptcP+QNMj8uHtEf+0gm1qX3LdP
 tLVjyLsVyO0PaEirfIvReyYAFltJ21ibc+Y1GxSpXmXj/AfaTOjYk5098OaxU4Dmyvs3
 FE1w==
X-Gm-Message-State: AJIora8PBb7HHi4Fo8xBVSqYupgqZEEfA/NxGzPC9QX5fUYknzdRNy9C
 0LZ1Jvl/uNjNSzMvFAm/VmSavFhZwEWCJXOx
X-Google-Smtp-Source: AGRyM1tE2dWvbm5lw030EDAGKwt6L49aVoJlbdb0XC/6IHfDX3kkJDC9IR8diNJ4MPSQCtzgx5ZeiA==
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id
 l16-20020a056a00141000b005285a5ad846mr14619647pfu.9.1657018807217; 
 Tue, 05 Jul 2022 04:00:07 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PATCH] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
Date: Tue,  5 Jul 2022 16:29:52 +0530
Message-Id: <20220705105957.1144514-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


