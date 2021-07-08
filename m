Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06D3C17F8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:19:08 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xg3-0002ai-98
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5R-00025b-LX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:18 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0008F5-Ro
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:17 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a6so3284385plh.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUp8uiYeN4pyOFE+omZX4LipnaNlqQ0o8Xf8RQdTh+I=;
 b=RiscMaj3ACRrujFTRqA0sNySIDuJSvPO9e376d06HIcf2lwBHGy7UNtZrbY2iWGb3d
 AeOo+Fr48J7se4mYZ6LTJScqqruCoaHCaFU/1v4WBBzcWyrzvUF6aGEHr4i1bK1DPyj8
 LdxelG1z/FdFdx+FGbukQGFVJU4i0VJsMk5U++rQtyqIqW1mf6BhtAvPj97W19bDwHaW
 4Lnh3ZbsAMINoJvmabart283Qk50grxVLG1/rrYXQxvnREMs8IwIYk0zlOmlme3YCFVl
 5pXzm0NOuR+VVyNUQyNiolz7zvpd75J98MZEm7ONo7i7Z457LEG/tg4rONg06j/sxOPc
 SxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kUp8uiYeN4pyOFE+omZX4LipnaNlqQ0o8Xf8RQdTh+I=;
 b=mLtXzpRZBIEJmaj/zhV9s/0BfMdElh16lfQghldoWqTVqfgx7VT0ahqFkGa6HRT1Ii
 Fsm+U+2YAO0ypm+ZB0774HYWE42no/G/VpQ1I9bCfNNvrnO4bOD4F0tRWoQc6aAWErn4
 ovSCE0FmpamdLbRyuagosvy/555qdWA4N3EcmO70EKWSsHrmkakJVe0+SXWjPVMSP7KX
 HOPcoEQirmagd6tDdm+jW6L+gxzdKJ36iuuJMBl+dKGDkZZRN8n33NBEfiba5OD3hNWL
 q17vZqEt43mVXP/T+cWq55cRGyVmzrIJIP3LxbhG/282n9qmRuFF8cbT0ALK3r/Ih+ZS
 ZMVw==
X-Gm-Message-State: AOAM533tXDyZ7vXCgSMiIMnIU/nUPvQJAVjPiV4bCd6loTyNuPU17mzO
 pW9v15Wp/iI74ER7fGT8PHnO+Govxb4JRw==
X-Google-Smtp-Source: ABdhPJyxckKO2NzlgiGtNjNepY+dgcJ7vSQun4Viq0NWL6fQVh9z5+ohO+pHXut8GqAMFF/wP9dNsg==
X-Received: by 2002:a17:90b:251:: with SMTP id
 fz17mr5868419pjb.109.1625762464568; 
 Thu, 08 Jul 2021 09:41:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/28] target/sh4: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:46 -0700
Message-Id: <20210708164050.711967-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index 4dcfff81f6..db09a0bce3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -225,17 +225,12 @@ static inline bool use_exit_tb(DisasContext *ctx)
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


