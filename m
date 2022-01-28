Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B149FE51
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:47:57 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUPk-0003lV-Su
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:47:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDP-0002IF-BM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:07 -0500
Received: from [2a00:1450:4864:20::430] (port=42597
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006QL-SM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: by mail-wr1-x430.google.com with SMTP id a13so11560961wrh.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3BkzG1qOW+DZvKNI+SKdgFHpMvjgidL5omXaK1z9mCE=;
 b=bo0akB3wq5pnFDEW6AnGmzJ87UklTvgknuayv2eawh/yc1TBBSWO/bo53k07Y2NrSo
 YsPY5z9q6impbuO+u8DzC7Qe21dTmulS3G0pDiKWJrBzzFSAvFaleV+MaRui4vXf3473
 Nb5uOQ0tjKSBe8Nb+VEp/c4zfXwdHKveXAXDSdW3egum9DyOQrFlnQuJhyFBxkHVGvdk
 3JdjetnD7LhhdyggVaZbPdVFNBW9eIWiHNPFho4krMD0Z+kt/snZf2cwyau/G5/aWHDI
 pkaMRf4ZAfV3kKd5hxgi/gfCFdDD/0zUiGLwzayVv5Fv0YR2WsIXNjNdf80AwB6gN5vZ
 YOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BkzG1qOW+DZvKNI+SKdgFHpMvjgidL5omXaK1z9mCE=;
 b=BE+ctVZIY8LSTGVmrSseqFNr+b2gI/RqbP7m3IuiYWL2FTz9dzhaSo6VdvsnWSLkpP
 vBbP0recjFxCSEr0hPk9L5vC5oAlwOjG9Cl4qbXRWf4sDeYZeg86hZSiIkc7a72T+/9z
 7KQ7+FO0AHQHfyC1iw6W695sTaJc8HMhDMKsb/HvdMWgxSjzuWH0wo/hc7b0dnjbTita
 x9aoa3KHB7fUvocsCzNjfsF4Rtoe8gPRlJcqkpp+u4gzKzDyX+T4AAQUaABmK2qBtzcK
 r27DgeToURsfHluXuEmmW4xob+U//C9XO/9udmwKxAZSMx5AnIfvk8te4cKcjrCgs/k3
 eEMw==
X-Gm-Message-State: AOAM533rSsmL2OuPOFVIRF8fLRVAyCjHVZ8rDKOvTkAvO6e96oUk1bU/
 5CzGe3pq25VuemZgjBfw+pSrvoS3QIm+sA==
X-Google-Smtp-Source: ABdhPJw53kWjNxDXZO8c/uXdEwBQaZJnIoJu0b1xI4NYLPlx5GJ1OINpbhitZXvxLdT9Pouwa55dpw==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr7686417wrv.521.1643383835205; 
 Fri, 28 Jan 2022 07:30:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/32] hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on
 writes to GITS_CBASER
Date: Fri, 28 Jan 2022 15:29:58 +0000
Message-Id: <20220128153009.2467560-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The ITS specification says that when the guest writes to GITS_CBASER
this causes GITS_CREADR to be cleared.  However it does not have an
equivalent clause for GITS_CWRITER.  (This is because GITS_CREADR is
read-only, but GITS_CWRITER is writable and the guest can initialize
it.) Remove the code that clears GITS_CWRITER on GITS_CBASER writes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 1763ba4a671..d9ff7b88492 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -866,7 +866,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 0, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CBASER + 4:
@@ -877,7 +876,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 32, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
@@ -1027,7 +1025,6 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = value;
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
-- 
2.25.1


