Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B563C354E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:45:04 +0200 (CEST)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FA7-0007iD-33
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExW-0005d3-FW
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:02 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExT-0002L0-EO
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id d1so1426772plg.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o9A9j6l/wX1G4+Ye4FYMb+DUZWuGQ1B3FFGlncSiSJM=;
 b=jVPkH4TM9bGxmXZGnooq9FIUvwkK6gD5WpJaufSouLTElI1T7g5DLCEcjId5ASsI2o
 UvZC5Pe/tcXf53nz8e/70eDeGbWJstnBLnrWkJ2WtOSYGz9KNLtYZO+NjTSdGlJWN1WA
 IjQcj9wbY5ud7BFpoaZELzgnHraOBDbvcpyEWYvgbeFcCXQJDiXpito2b/2DPMRRbXoI
 PgeBbVL4y6C5iIz/c+Q26Vs/iuHC1webs9qmmjRmiT7zlIlC4cK+v/43nza7B7ZRyvk4
 6aI8L9LY9kTyoZN+36Ly4agJqbgevUNI2zxp8MsFXCr5csBcksPqy31Kgs3nbbv2Gm6Z
 0ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9A9j6l/wX1G4+Ye4FYMb+DUZWuGQ1B3FFGlncSiSJM=;
 b=by34XcLKoG+zpVMU+qQ8OUkyAZ6CKx2twAqpgwVN0j7shEecq6mwzHIW463pdAA6fu
 5TneJeXaiBfunrJ6LOOE/AWLnXjbpYQHByJ63tst21OvCpv0o72dVmkJPcWSOd05UNPO
 uGRzrY4lt/OSMN096KJLEN+g4+0pvJrnooMi8rC7Zc8TO3jS3GmOpEQHiHXYZ+K/sGd6
 skjpSzMl686qO7g+MgZnDouBHImsCcOZbEBAG/sUhRXjsm3/X3Fu0Nn45MOeKLJFzA6K
 suszPsoWkYObVHfqMcRg+hKKUvPIxtnDbnGi8LVrbsybJZAOzAI98U/wvE8mZYTuJxDw
 tr1g==
X-Gm-Message-State: AOAM5328Dq9zrJlW3ktnSyJ56fRVGoZrWmEzhEd/CtRkm2D8/OrukU4n
 p1OXJMQflmTAhisbp5h3dQZEEtJOVp+GSA==
X-Google-Smtp-Source: ABdhPJz+/zPYz37mMdZ6YGqoE3p2LKiz0j5eauPhbdqRaI/+YxPmXd1dFrhuZWuvATlUUsly/LqWww==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr35874381plp.61.1625931118030; 
 Sat, 10 Jul 2021 08:31:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/41] target/microblaze: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:21 -0700
Message-Id: <20210710153143.1320521-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 5dfb08d49f..c68a84a219 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -124,15 +124,6 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
     gen_raise_exception_sync(dc, EXCP_HW_EXCP);
 }
 
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
     if (dc->base.singlestep_enabled) {
@@ -140,7 +131,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_movi_i32(cpu_pc, dest);
         gen_helper_raise_exception(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
-    } else if (use_goto_tb(dc, dest)) {
+    } else if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


