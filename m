Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ECF3C3534
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:38:08 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F3P-0004yd-IO
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exb-0005w1-Le
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExZ-0002QK-Oz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id 37so13197632pgq.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOIIIgFSsplaRIYV7/xcUpt+eZ6DdDmbIOsCJze1E68=;
 b=ZT596TWrwqnrpxOUlpSLqlN0xbeS+ZMp87D0ZrsphHVoHt49pHMBJ3rFqRa7EQR0VR
 I6FZZxMWejSyFLwUbXSK05Lam3pehYi3JAPy7sg5cB755IO4i84rAxsnEE3pauXanCGY
 7r+kkxVxQjQ0INsFCFAR0zMW/ch+c0e+89JmtLs0gtAxT5Xii1pR5Y4bLbmkXAgQfOyr
 6vhbD4i767YscOzEt32uubCvT3M5hFth4CknyMr4FvYSZJLgOaR6S6M20iibqB59gR7o
 2Qc6PJa/VHgIx2PtGsjQP9jGUHjiLnL13stxDcGLilUTXKpi9Pud/d8vddrO9BeXbbec
 ymhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOIIIgFSsplaRIYV7/xcUpt+eZ6DdDmbIOsCJze1E68=;
 b=NFP5Cmh9sU1Goh1nnukWwihjoFpImaEg2SwgIqRio89XedhbZvnR4sarLJIVJD2aoG
 4j72ErxZL0PTmwMs0EWGqe5PcWZzBE7sMnuEPHgYpF3MKfBVpq0UywPM9V8LA5yc3DV1
 U4uf00FANpqTGr6ftN6IZdUG9sYH4RhcPNZ9zECcdddbm2Xjo9UQXkyNlzMgZsV6SYcj
 Xs6/8kRP2PecCa/vlZNfYzsVU3eMf3OmxCDEPwzfXIFOstOR0a6bwrMO+tcZM3V+Grbo
 ekhfJws0aifn65u9oyBabnZe9YDqoZvbSHrpVe2wYJqwNuIiiUXGJ75Q5fDms3BJgc9I
 FQ7A==
X-Gm-Message-State: AOAM532xVOREzaZ2W8OuGBZFp1SNn4JO53x/uK181NZMbHzB8jcYK2Yw
 yna2sTjEJjt4/eapLWQt+1ZHDdFl019v5Q==
X-Google-Smtp-Source: ABdhPJyTMO/7XEHPs3DXZgBVwWMDmtTdBqFqb24c85NxFocTvbM/8y0R5nWTKh9Uk2g1GPIXxzLhew==
X-Received: by 2002:a65:6a0b:: with SMTP id m11mr4043505pgu.380.1625931124570; 
 Sat, 10 Jul 2021 08:32:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/41] target/sh4: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:31 -0700
Message-Id: <20210710153143.1320521-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8a25a4362e..40898e2393 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -224,17 +224,12 @@ static inline bool use_exit_tb(DisasContext *ctx)
     return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    /* Use a direct jump if in same page and singlestep not enabled */
-    if (unlikely(ctx->base.singlestep_enabled || use_exit_tb(ctx))) {
+    if (use_exit_tb(ctx)) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-- 
2.25.1


