Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E933C1811
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:26:33 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XnE-0007Y8-7l
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5G-0001mf-IT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0008CB-40
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id o201so891561pfd.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s832VNdRirCs83GalQQ12ruK8zX761l5jTqXjzPJJqg=;
 b=ZTDWayYFFG9iXuEUibLMuRYI4alhmDzcwbmcWv7+U7hmsL2yYbm41jLVC/HNG7LIta
 h14lOz1quQUjgJpzyNtlpL3pqmJEdqH0rYqVlw6kLASDoJvO+y24j+92/bk4TP/5xoMT
 WWXpMDSImSRR3lOli4uAkNcta9xqf+KlqbWAl/rBjubB6nIvhVbFrWcinGjXhC3Qv2GL
 qF55Sp7jcnpJEdvqzQ9NBEPG+ApQqUp0D7frYbVovABjR2/YkF0117G39BK/mGgQQgQ4
 /h2N5Clfj397DD/xFWe/uZgHEGgVPuXuShbGX78dUOgFVchOERODV41P78xsd3aMiYp3
 C5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s832VNdRirCs83GalQQ12ruK8zX761l5jTqXjzPJJqg=;
 b=mLuP1GqJDvTzwSvEfdazjeEhDLq3vM51PE5n3x2r/kF/rjnG4dyBC7e47jjOr5xsWY
 1tv2DpNFZzU0KKi2FruX7tT8yiPeEXLO1tBwvny7E36jmsWysO0Q4rAmi2bkG8cEFCOy
 FsSmwz3GWrz5v6k4yVStzk8UF1hS6w3SiXDGfCtx1Yet0FNCh6/nB3PecUdi67WifV53
 Ii3YrpCccx0JrW7MuBkv+HcS89dq8y+zQZRWEPv95NtHKNnFP1cA8dexlEwNIyCgLDP4
 vjOfen1330/IfuOtTyFXz+HFYBK3jDfObGTcUCBB5C2Ws2ohnPA419wDPqE84ROLUlND
 7RbA==
X-Gm-Message-State: AOAM530AlEnKVdjhHi6XysdHO3s/lNEXeujFzA6ommbb7dT1UDKscpJz
 kcMcFQSxlS5muGLR7iXTZkXKsuBr4uG+JQ==
X-Google-Smtp-Source: ABdhPJwAg30sDz93Ykb6ayo9TtNF3FWWEvqK8Wmasvn3ov93f8/9jy8RjAbVqB49eXrDcr+OcpAaNQ==
X-Received: by 2002:a65:4103:: with SMTP id w3mr33113451pgp.308.1625762458889; 
 Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/28] target/microblaze: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:36 -0700
Message-Id: <20210708164050.711967-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
index c1b13f4c7d..b753f080e7 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -125,15 +125,6 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
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
@@ -141,7 +132,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
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


