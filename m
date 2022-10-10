Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77285FA0B9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:57:14 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuDR-0004OL-PR
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl2-0006Nn-El
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl0-0005Xn-Bq
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id b4so17335095wrs.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D9f9Ogi7C2qQwTonIlgIUzx/S6n2fOCeloaV1MSlzPc=;
 b=EjnOgeWYlnl5hkOgovDlUcBl4GmA4ipE+pri6PWeQ76qgeIitDEkPQPjGDF3iXPP4G
 E3Prm/N+Rg6yu9LE0u7liKTYb9RqolGa7xVlE30/HOoxMQ0RntAvpwoJc4CrqFY91eQd
 g0aidgpbO65F31IcqDfhQy2mXvYCUh1TngRpPd6gGkuBcYZwxUN2VU01gR2G3fqPA3Ut
 Kt5Mj7VoJVZLh/8BTgUVxlsfAESlX4wRBBl+Zcf1yN3YCYdPaP2hn4XAFvnMKfc3BU4Z
 K2jC+PIqfs8mrRWSLg6FtqLbY5036ONcoODiQmhQ96agcpWvSsqkXdIazIztmHZt/dpl
 f2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9f9Ogi7C2qQwTonIlgIUzx/S6n2fOCeloaV1MSlzPc=;
 b=MhOBBz8dqh9fXo+X5fmeyXvAr4vT0+4pUdpceXLfc/dTAGOKVPRjjO6MKfm9eQ7Rtb
 Vcojnc+MvGpzz1+Ly+UU2NV9wSipw4FKsclWiCDChhrZIeeKVty/5pYYh7fmr1GfHRI1
 Czw3mOPoBADlcpG03Qaa32qn3B/hfBzl5BOQ3ab4DpponJ6uHDga3rhvZled77xHwWFC
 mYDijUSURI+jFG6BVWw9vFQnXekiWl847MmCGz+Sb9lmOf4UaartgsPCdwu9fbk6p+o9
 6vPg9lmkQj62MrDRCz6hm5u9ddT+AjeqVU+cNEzo1Hye9Hov8Xf4wy6F2XxqD1POjcMr
 A6iA==
X-Gm-Message-State: ACrzQf2rdrv5S2DOknX+hoyFHtPW+c0/wfIx92x3J+hJ3MyQtv94DGdk
 XJE2IpC/Q47yuLPbaVM6x6CrGQ1vMeDUGg==
X-Google-Smtp-Source: AMsMyM5pZEXHTcFzeD8mM60opLKRJNWHQqQFJcR+dHAy4uuwOI3+mFZNQyh+c7SW3OMvaEssijKR8Q==
X-Received: by 2002:a5d:648b:0:b0:22e:ee60:db37 with SMTP id
 o11-20020a5d648b000000b0022eee60db37mr10261011wri.116.1665412069545; 
 Mon, 10 Oct 2022 07:27:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] target/arm: Drop secure check for HCR.TGE vs SCTLR_EL1.M
Date: Mon, 10 Oct 2022 15:27:18 +0100
Message-Id: <20221010142730.502083-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a514a78c924..b3e0db19369 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,8 +157,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && (hcr_el2 & HCR_TGE)) {
+        /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        if (hcr_el2 & HCR_TGE) {
             return true;
         }
         break;
-- 
2.25.1


