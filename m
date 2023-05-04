Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAEC6F70EA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoP-0006zd-Rw; Thu, 04 May 2023 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPk-0006tN-Gy
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPh-0008Ec-LV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso3983055e9.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSMeFOVndklcI/jbHH1oIdgkQ1sxHzP52KBybeWL69E=;
 b=i0iA/4P46rEWsS9xSMFcXZknTOQ82igTIXQiWX0tIXrLnwZZPKdd6Rgi3HiMR6RD01
 D4C/GGtTB4DSYFpGCKvq6PS1S/VH3aLcffYh8J40HD75IZW2q/8B+00iohtg6XSd6xSR
 xVopkC4a6iFCXcLmpeMge8EUPgnrX/1LXCvbZauD9o9CvOUBNLtCM/Q+dGQ7p30D1RS7
 TU6xRalBxeLDSdUBu/1GIqWrchVDc+TKjb7iDxs3YlQ2HCYvW9BFhp8tjxa17ZTgRxol
 5KjZVLhcL8I+xZyY6W2FE2i7TTB2HOglJ9NeLLc5Xg5cL/CE+ksYT5ihSqsJDoGJExlX
 +jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSMeFOVndklcI/jbHH1oIdgkQ1sxHzP52KBybeWL69E=;
 b=d/gKTYHHp5tJ4LuInU7gZhUwS05jWcrxUcQtxcc98ZyFD8pIP6MNC12cgM5IKXuaqB
 ajKACd0cj9LwPfCbvwdnagop9fLvWj4s+vT0nunbKoIj70FmwKGY1WOOOrDSGx5mojTz
 tX+maHUEQF8dFH5aYZFwDsLLKGPkDLUT8oNfKQAmjNGEkooLuKLvM6Yvtm4klUClBce0
 XtBJ/xOi9Mr6bC4bnb83W4TQ9n4pjmBdYH8p6DXPySq6eJR8Ke8OvuAvKwvNRELdeu23
 2rlVtL/DTSHbfntWa2zZK6YFOxJl0lU7bhplFBS/qSeDA1B0d7reuTyJ1B710mipSQCT
 kSnQ==
X-Gm-Message-State: AC+VfDy6qgFMtk5mHJ9ZQgZ+L7yndF+Mx4Xlp4LsAzrVA1gPW1jJt0rs
 IrXYh9POdbDR62qeEWunflyPTw==
X-Google-Smtp-Source: ACHHUZ4n5PCBSz6234rjXeRFuOMc9PV3Y2tEDtvE6oFQZbFcWgl1rNokKSIjeHKIe5JBgNyxAa+hBA==
X-Received: by 2002:a7b:cbcb:0:b0:3f0:310c:e3cf with SMTP id
 n11-20020a7bcbcb000000b003f0310ce3cfmr16876356wmi.37.1683208467572; 
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003f40049a65bsm3800428wmr.21.2023.05.04.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Date: Thu,  4 May 2023 14:54:24 +0100
Message-Id: <20230504135425.2748672-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504135425.2748672-1-peter.maydell@linaro.org>
References: <20230504135425.2748672-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Bit 63 in a Table descriptor is only the NSTable bit for stage 1
translations; in stage 2 it is RES0.  We were incorrectly looking at
it all the time.

This causes problems if:
 * the stage 2 table descriptor was incorrectly setting the RES0 bit
 * we are doing a stage 2 translation in Secure address space for
   a NonSecure stage 1 regime -- in this case we would incorrectly
   do an immediate downgrade to NonSecure

A bug elsewhere in the code currently prevents us from getting
to the second situation, but when we fix that it will be possible.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bd75da8dbcf..8ac6d9b1d0c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1415,17 +1415,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddrmask &= ~indexmask_grainsize;
 
     /*
-     * Secure accesses start with the page table in secure memory and
+     * Secure stage 1 accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
+     * Stage 2 never gets this kind of downgrade.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
+    nstable = !regime_is_stage2(mmu_idx) && extract32(tableattrs, 4, 1);
     if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-- 
2.34.1


