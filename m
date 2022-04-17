Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0B50490B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:51:42 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9zo-0005KM-Kz
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90a-0004nv-Ny
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90X-000478-4a
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:22 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so14994481pga.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7bwI399xmkYMZYOeiF66UP7rD5My88v054sfcO3BxLg=;
 b=zzb2qRTpQv5YOaWzGfE0jQkLcnBU+zDntc/eh/oowf/cKflXehA6hIbAtaFYICsHiY
 jR6w3MTb8AHbOEKJ9wRx8/LNe0ZeA2+G/UtjZMtL0CBwXoqMWferVNOOWJPU9D23yt2g
 NyEy7E2BE8ICudIycjncU36WJF+K/sZ6dxSU/J0cdvXQIASElqfqTWf8DfCsoG0u9yUJ
 QsJuMu+CDpz2HokuqofJokUNwlaasnnvy8ZORdqlBo3xLhNYazh2VQda6v72JW5XRalj
 9/l6sy1eD75ZFAMlL+0kE2kssvvCR9fq79qqo85hp0JB8EV8Vs5dVus672lTiFafEmii
 dUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7bwI399xmkYMZYOeiF66UP7rD5My88v054sfcO3BxLg=;
 b=BGb+7sZ3XuQdNQ/Husr2ABXPoUlS8Gc+6YQzkBG5gytnGN8fHJL4Ap2rFzvaoYslyD
 1WMJaVrpBfTi6keHuUtUaSaCXn/8vT7t0wJAi6uXSvSNPgWNWcOtC6q1Olj7YQ7k5So4
 Cu0237b6rCxli1Irq2rlbA5ZY/tvJT/CwXbdlfyOxfb9vp6TWF3FV6+/cR8gq3LKh6Ix
 p2TqYVREvbfRWPC4j6dBHaAJECFzdrQLDpNMAc57CMXgH4W585U+w7GTW4yZswQczGRA
 ex40aSunByRq3MsrHJqE0cY8kGdbwUyjo3WWu0E+9RY965oFVb+mDuhdfk4DYUj7XMFT
 rCgQ==
X-Gm-Message-State: AOAM532V9zA6a8zSgpn+xzPZyHRjhpwkGg3Hx1ggkScy/Mc1Ebvvn7zA
 wFAdwzxJJ4RoF0kBbooo+WbR6Tlc7NWzLg==
X-Google-Smtp-Source: ABdhPJwjhej7vM/4pMjYvlT4Tylq6UTCFOqJhtFl8wMMJ3eD5u7N2jHIm2Sv5nbiySjUqwM1ZEV8Bg==
X-Received: by 2002:aa7:8a06:0:b0:506:28c:1282 with SMTP id
 m6-20020aa78a06000000b00506028c1282mr8418956pfa.19.1650217699937; 
 Sun, 17 Apr 2022 10:48:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 58/60] target/arm: Enable FEAT_DGH for -cpu max
Date: Sun, 17 Apr 2022 10:44:24 -0700
Message-Id: <20220417174426.711829-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f75f0fc110..bc9cdda75a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6139f51267..336a941acd 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fc0b3ebf44..b44ab3ecf3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.25.1


