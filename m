Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D53C3536
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:39:48 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F51-0008Eg-Ai
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExO-000560-13
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:54 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExM-0002FS-7m
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso7822189pjb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCqRJMe+RdTFdeG7cM5qJnxRaVl12uLPvY3JnI4VuRk=;
 b=nwlCfDEU+AT8OMBSeTIrvwv4l7jOmWubC+VKK2zzeHHX26Z6GIKqXM4kVnF8leugWQ
 8c+cV7SK5LRtmFmUBGTYY0h8rer16X+biWFbL3hXNEz98yssyK29i0CnpLxOzR79Levk
 OTXmlxjLRHUCqMEBmPWG/f8/GLWbPMtpwFlTbyYZNBP0ORVIJKZvHqxuyEOw/JRSKAkQ
 5gb12cYUGWsO4umE8D/BUWi8t1Gwh4LJb8H2hShqLqWQeMjNBnh+ArUtx5ZauJ7RPVwA
 lSG4hgpTggzEBW0YIt4e0hBcp8llQkEjsnhZ6oSA5RBAvvtbWM0lcmDl8sXl5pikjD8Q
 Q//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCqRJMe+RdTFdeG7cM5qJnxRaVl12uLPvY3JnI4VuRk=;
 b=HbDGKT7gBwDgd5CfvDap8N1YyPc59OpC4fPONNr3ku2Srom77sbn2HLw3pP8nVo+qy
 Suy8pDVFA4i3Qz+7i06PG1X+9CA3c8XgoxlBYP6Gq92S5Ihib2UoxUg+y4PUz+f7wFti
 Dzx7yiN4VqNp1CgYOsQXE1WE7bNLPdeSlYVFhJAuRAfp2PLdtRAsaCAKL5yzfSERWj4k
 JGUS6dDhgt2cH+78+Y/8ia44Sc+5kV2hgb4DIJZ0JleADfC73s5yEd2aaekFS3WVPjZ3
 vtTM7ePzPtTdeqKnL7ADX3Y9dYYjj1NawkQHAaW9iKvsN7j3PR5hYU7o153xGPHcEHjd
 tBww==
X-Gm-Message-State: AOAM531jHafFhKdgDnCdmzJo00gVaTvGoDZ5j1XjV9YbRtPnd2iKgsiZ
 PZchCvMBohnj/xjPYB77dWEpGVI/VcD/fA==
X-Google-Smtp-Source: ABdhPJxWQgloEl8cH692D93CgmwT7O04s+aqrZnvn2bs4gRewPdig1Ib+/K9x6r9+RHD4DQiVB8xdQ==
X-Received: by 2002:a17:902:864c:b029:10d:8c9e:5f56 with SMTP id
 y12-20020a170902864cb029010d8c9e5f56mr36119865plt.8.1625931110857; 
 Sat, 10 Jul 2021 08:31:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/41] target/alpha: Remove in_superpage
Date: Sat, 10 Jul 2021 08:31:10 -0700
Message-Id: <20210710153143.1320521-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The number of links across (normal) pages using this is low,
and it will shortly violate the contract for breakpoints.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index cb2cb2de6b..bb7b5ce994 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -438,24 +438,9 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
     return DISAS_NEXT;
 }
 
-static bool in_superpage(DisasContext *ctx, int64_t addr)
-{
-#ifndef CONFIG_USER_ONLY
-    return ((ctx->tbflags & ENV_FLAG_PS_USER) == 0
-            && addr >> TARGET_VIRT_ADDR_SPACE_BITS == -1
-            && ((addr >> 41) & 3) == 2);
-#else
-    return false;
-#endif
-}
-
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
 #ifndef CONFIG_USER_ONLY
-    /* If the destination is in the superpage, the page perms can't change.  */
-    if (in_superpage(ctx, dest)) {
-        return true;
-    }
     /* Check for the dest on the same page as the start of the TB.  */
     return ((ctx->base.tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
 #else
@@ -2990,7 +2975,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAlphaState *env = cpu->env_ptr;
-    int64_t bound, mask;
+    int64_t bound;
 
     ctx->tbflags = ctx->base.tb->flags;
     ctx->mem_idx = cpu_mmu_index(env, false);
@@ -3019,12 +3004,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     ctx->lit = NULL;
 
     /* Bound the number of insns to execute to those left on the page.  */
-    if (in_superpage(ctx, ctx->base.pc_first)) {
-        mask = -1ULL << 41;
-    } else {
-        mask = TARGET_PAGE_MASK;
-    }
-    bound = -(ctx->base.pc_first | mask) / 4;
+    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 }
 
-- 
2.25.1


