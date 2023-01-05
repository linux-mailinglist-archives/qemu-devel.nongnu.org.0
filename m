Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679B65F230
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:06:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLu-0000KD-7q; Thu, 05 Jan 2023 11:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLr-0000Bh-Md
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:23 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLp-0007Lb-Jk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso1734007wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F/5EJBYFSRrAmo1vD4tU1WXQrdeBd0ZRx/qGyNKF6P8=;
 b=qDZMeaYiYNDzYr3EONnabtzevfAdpv6S+k4rBuXC41YwVlTnkJTANjXikb3M3L+wOI
 WFaUyZ6hxX06bnzEYmld2oRyAmOOx53bqoKg9WL1GVAELNACUr4AGcp0Qau8ox6Z6o4A
 Cn/xSZ0l8PxgSoFuWXufjW+p24VoJ0rQNsd4X4dknoou8vBSck7l8sDpcjpC08G2ojpR
 MW7z+TmSK6sqP3e3/aCyuc188Y73X1Wd/MqcOxy0nlLJQC717QVTlrvUi+2pnE96FGhS
 pLAokyY+lgWjEUyPcn4VcGsJhx15pY97JmTSN3amPEbGRh1BEaMXRFRdZBY/iJ8KeHSK
 oocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/5EJBYFSRrAmo1vD4tU1WXQrdeBd0ZRx/qGyNKF6P8=;
 b=2CQxQ7keji9jyV1PTFHy5oCUEptIlwQqRgZaooE+FjOj2BFMMGt70aiLxp71F+/5Rb
 EERV1XA/IJDIPFYPQM2i1x8nJ9JnvIC78cJXlFsf9xLD0j7vw7dyyPPQyJ2lq1prek+f
 syWtRE64ZH1hbJGtSGh/ULKlCedqlXXDZDvjloeie3NCrUGfTTVJtyKtlDwBOEwz3X8T
 lg4U2asn6jFaCuZzeuiLytST04oa/mlym37ibUnHh+rG9ZUGN77XeXCyhgYA1UZdw3rr
 4YzC4X55o0xDWD90Rsa+YSGu2UOmJq/tmwrQHYwdK5jwc92XXXYo4tKGR+0UcBbPS1SU
 iR5Q==
X-Gm-Message-State: AFqh2krvTAG+z4Jk+eI9P/LkD5YtUic8bUVxScpJH9TEzs+SPviTlJ+f
 4buPQM3XqUHD+CyQ9/OJVoRNBUmFwDviWipp
X-Google-Smtp-Source: AMrXdXtWYdCSZp6LalDGiA0vcIb0PFFxNm9Tw6spVikQJKUCn+cXOpfs2RLilYdDk1X+UgkQZzeLZg==
X-Received: by 2002:a05:600c:1e24:b0:3d3:5075:7526 with SMTP id
 ay36-20020a05600c1e2400b003d350757526mr38135203wmb.31.1672937060194; 
 Thu, 05 Jan 2023 08:44:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/34] target/arm:Set lg_page_size to 0 if either S1 or S2 asks
 for it
Date: Thu,  5 Jan 2023 16:43:44 +0000
Message-Id: <20230105164417.3994639-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In get_phys_addr_twostage() we set the lg_page_size of the result to
the maximum of the stage 1 and stage 2 page sizes.  This works for
the case where we do want to create a TLB entry, because we know the
common TLB code only creates entries of the TARGET_PAGE_SIZE and
asking for a size larger than that only means that invalidations
invalidate the whole larger area.  However, if lg_page_size is
smaller than TARGET_PAGE_SIZE this effectively means "don't create a
TLB entry"; in this case if either S1 or S2 said "this covers less
than a page and can't go in a TLB" then the final result also should
be marked that way.  Set the resulting page size to 0 if either
stage asked for a less-than-a-page entry, and expand the comment
to explain what's going on.

This has no effect for VMSA because currently the VMSA lookup always
returns results that cover at least TARGET_PAGE_SIZE; however when we
add v8R support it will reuse this code path, and for v8R the S1 and
S2 results can be smaller than TARGET_PAGE_SIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221212142708.610090-1-peter.maydell@linaro.org
---
 target/arm/ptw.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb2..2e7826dc29b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2655,10 +2655,20 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     }
 
     /*
-     * Use the maximum of the S1 & S2 page size, so that invalidation
-     * of pages > TARGET_PAGE_SIZE works correctly.
+     * If either S1 or S2 returned a result smaller than TARGET_PAGE_SIZE,
+     * this means "don't put this in the TLB"; in this case, return a
+     * result with lg_page_size == 0 to achieve that. Otherwise,
+     * use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly. (This works even though
+     * we know the combined result permissions etc only cover the minimum
+     * of the S1 and S2 page size, because we know that the common TLB code
+     * never actually creates TLB entries bigger than TARGET_PAGE_SIZE,
+     * and passing a larger page size value only affects invalidations.)
      */
-    if (result->f.lg_page_size < s1_lgpgsz) {
+    if (result->f.lg_page_size < TARGET_PAGE_BITS ||
+        s1_lgpgsz < TARGET_PAGE_BITS) {
+        result->f.lg_page_size = 0;
+    } else if (result->f.lg_page_size < s1_lgpgsz) {
         result->f.lg_page_size = s1_lgpgsz;
     }
 
-- 
2.25.1


