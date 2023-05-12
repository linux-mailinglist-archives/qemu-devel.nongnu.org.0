Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2C700C04
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:37:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmx-0003JD-U9; Fri, 12 May 2023 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUms-0003Gt-BG
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmq-00060D-7I
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so6639294f8f.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kyd9YD67afENN/WZ4WK9/2k+BPiSbgkUwINKrCywvQA=;
 b=H3qpNy6hXN04uU2348n0hetl6MGGNPcOTXmMYiTpcg6t5LPAiZCh2RLYootv7VmPEq
 cmaMF0jazu4dhlVAfXM2DnI7x4r4UWoqn8IOlIXO73qFK45xs95/+R0d2zoYqFr747R8
 ma5pM4BHmcUKudTds7uVfwPmgafM4PREr87Oqd3LSdwPc8qImHMcTU6Y652FfBYKXsk7
 tnxMmI42JCeilrwc6xg0ttVyT7Wb/NhNUrIgEhOfxZijogzuXFciP/LqjeYY7wCTe8IO
 Gv4Bp8yIFiPBx2iBGPNu7p3LPwDKT1KREibfUMn8o5RvhMjat8CD5YEIk10PtMvqmdic
 YAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyd9YD67afENN/WZ4WK9/2k+BPiSbgkUwINKrCywvQA=;
 b=Teg33hzb4l9TcLrdAWAFPiaSqDWGYF4t/TCh/sPTpTl1lxXwOYrodCJsPbmqeyS48R
 sljISkLxL75lRI5G1My4mDABGvAV9rTMs7CusLMEWr5RArVtgO62UtPEaK5eg+boC/tH
 8D3NeLzHK7GkmlOwCuyZiRTXnJyT3U8xdOXCgJ+aO38ONlA8u0a1dBqAWwzUfVqdxx3k
 YTyWMCE3+7/EG8v2daLO5YO/QJFJNxJsCnTOTR+g2+FN48VRunelPx5tKc4hdDFBf5MB
 naQy2b5uUnCX2FElO2LBs809sZ8J7xEi7pFD4lfMfpDIn/2iI2qXM18h1J9fESx0kOI1
 4vEg==
X-Gm-Message-State: AC+VfDxwDomrjGbhDv8zzNQT/7P1+sKUStOfHUb1iAo5k0OpLJLsSI9g
 jVXBHo3y/WOFL55lvEQGQ3LvYmSDYSOpzQdIYHA=
X-Google-Smtp-Source: ACHHUZ58Xu4nf66gDCrnVbI19y0jfSMURpyG2hXR/C/1Sf8edLo2Y3IN3Y4MxVlG+PG4RBcTufPDeA==
X-Received: by 2002:a5d:5503:0:b0:306:2d3d:a108 with SMTP id
 b3-20020a5d5503000000b003062d3da108mr18030517wrv.11.1683905666762; 
 Fri, 12 May 2023 08:34:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Date: Fri, 12 May 2023 16:34:14 +0100
Message-Id: <20230512153423.3704893-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-id: 20230504135425.2748672-2-peter.maydell@linaro.org
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


