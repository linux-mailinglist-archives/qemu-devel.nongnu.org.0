Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A25070301E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:39:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIn-0001FM-36; Mon, 15 May 2023 10:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHo-0007G9-8o
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00051Z-Jc
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:52 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaebed5bd6so90783635ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161220; x=1686753220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QMQeFWwqcUFumXr1WKfxiG/Sk++Gp7SwpIzlewGlEA=;
 b=vY8W9qv6VVO3vZNzHxzp15ikXYAwSDUNLoUQKMp7UVlkIdNbXiPFWv9XW+nMGPnDYp
 n3QvtJ2ewT+qZzUEYdo2YXhxdOUHE34pgyqtXfHOCyrR0p7VCixtzy7/N5tl7BUlehA9
 NXY9o7qNJPDD/3led1syGVQmromMrN9w5GafoWJocAquyw7fsQatd0+9Fq3TrhF2AUc7
 9f9qHr0gDL8yqt6cjKoEJEWF76Cw//YKTf0YFxCwtupjvWwU5jDvsrAmcIHt2DuWbP3f
 Rl5iEPebCq6sKdTNd/GgfTBPoLczYsPHPW+wpM39pAxuH9yQn6u5us37TvUZHz+3AT9s
 ZLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161220; x=1686753220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QMQeFWwqcUFumXr1WKfxiG/Sk++Gp7SwpIzlewGlEA=;
 b=BxCdvpJHwTFEN3UGrFQHSS84fflyuwbg25Fs4ARLrmt23EKp63IYb91YiUQgh3WpZX
 7bKZBH7FoguUN26S+FyrAtvLc2CQop9mDBIKZr3+9y9OQV4JDY7xf8giQB5CpIZO38FY
 2ZsSMLtQECEdxCnKGUde3fmdnENT4impoZRbq3tG3vYlTqh7hGcyCDFfRc0h6c0iV1Tn
 KKECgRl9Zz6aqCQSvN/N8+tpqE6xFkgXAgyFS3eSQvLCq3FRFSqKGTYffTbaU6d5wpRd
 auIzVi5DodNqLgXpydubCJ0MUUKrmdR2as9ZtFIP3Ds0mjdG93MHifsRKh/Pln4tWn7j
 Xqvg==
X-Gm-Message-State: AC+VfDwQlzde86NsiYi18fsggEtU/E3UujuuDSaSWbecU3vAZxligMa1
 ScSmZPz82aYA5IfrL73Qj5luzUdbckpATqKrRtQ=
X-Google-Smtp-Source: ACHHUZ6LzmrpBRN6z070WelRkWAMg+XAN3lWP7556E2Bbh9VETdFOB1cjo57fgZiotfYyLWS0tusYQ==
X-Received: by 2002:a17:903:1249:b0:1ab:220a:9068 with SMTP id
 u9-20020a170903124900b001ab220a9068mr45238720plh.42.1684161220627; 
 Mon, 15 May 2023 07:33:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 30/54] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Mon, 15 May 2023 07:32:49 -0700
Message-Id: <20230515143313.734053-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These functions are now unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  6 ------
 accel/tcg/user-exec.c  | 10 ----------
 2 files changed, 16 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 64f48e6990..7dd57013e9 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -60,10 +60,4 @@ void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                      MemOpIdx oi, uintptr_t retaddr);
 
-#ifdef CONFIG_USER_ONLY
-
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
-
-#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8f86254eb4..7b824dcde8 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,16 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
-}
-
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
-}
-
 static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-- 
2.34.1


