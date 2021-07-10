Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DD3C3551
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:41196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FCJ-000401-BJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExW-0005ex-Tf
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExU-0002Lo-3u
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso7781831pjp.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtV1oQWQj2aiAo4khTYZosWNvQunNKSfTN6eXGpTJBs=;
 b=jWkaKA0sfixNsD3Tueey6DRh92hFfNjI34WGD0Sv6+M9S8RkqcKs58EMDX5L5lgzXT
 sQK5tLN/m/0HQF6uJttASsVOKzSkj0Km4lbqfZKt7AUB3n9PwMB4E8AK49BnfvfNYmfo
 PAjojWg4+FF/fu/iMAaTcCtYfLWGB06lft40z8RdmVNQCkkcNAVPkutRA9OSeYTMw8sh
 swJZOLtu8TGfMV6zLtALvCEnGvr746DS4aE1wN3S4ni/mPbpt8DsPU+JRDAlMP24Lu8f
 6vdeyTC2b30eR8hKoxjpDAjaJjawhF0StfDeXCbjuj/hr5XZmo9dFMkx9WRqBPUUSRuo
 GDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtV1oQWQj2aiAo4khTYZosWNvQunNKSfTN6eXGpTJBs=;
 b=Y/lrrPkU1560hXRXCEiQ+uIGMZBAtTZ1W1ZIUqoCt43ORCZVs83OqhWtLTWwHalTb3
 sKS9eSbToYz7TmJh2vXwgLCoMSitRFKYYx1uthDZklsL0zJPyNLRuDMIpZyeKLpYgg0v
 EZhCAsSbyM2XwkHwXTpslS0MPIcjHZLgZ7aanx9RP/ow9WuSHzWmgAOoUSBENcTjY4Wx
 qp0NQenKdERPcvsDX1+mqOBDxng6DhrciC1RRYSGvrtntaSHjZ6PBtc77jx7Ek9EqqCv
 kE5qOBPaOtHId3RrkanXUQlT5Sizd9aYdwtzuKk1zX3Ndl4GM3ySp6y1PdD5hNpJfxXN
 sVBw==
X-Gm-Message-State: AOAM530+tqZZj+tLrzwzHhhdf/rDfdUNHWsnU6zPWabxdOxJUA8XnZ3z
 Ck663Im4s0SUs0/fqwJh6QDi6bvEoVcR7g==
X-Google-Smtp-Source: ABdhPJx0OIwevQ4a55CxsbuZ6iXd9IIw31ToqcfIgX3GzLie3OzHL7CpI3pZ6O+6Glrz2FcZyCBDlQ==
X-Received: by 2002:a17:902:249:b029:12a:fb53:2035 with SMTP id
 67-20020a1709020249b029012afb532035mr1151098plc.73.1625931118874; 
 Sat, 10 Jul 2021 08:31:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/41] target/mips: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:22 -0700
Message-Id: <20210710153143.1320521-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/mips/tcg/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index cb82426f66..5cd3e7d8dd 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4947,22 +4947,9 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-{
-    if (use_goto_tb(ctx, dest)) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
-- 
2.25.1


