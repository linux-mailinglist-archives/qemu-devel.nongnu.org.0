Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B193D73D5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:56:31 +0200 (CEST)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KlC-00014k-3F
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd9-0001lE-CD
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd7-0004uk-Kk
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id g15so14675251wrd.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0xJBpYEhRcZZ5puS2td3GgcOI6cVY9c9SdoaFc8pk1Y=;
 b=dyXaQHB8J5uzJBNeeTcJ1wVnzfQzarVfKo/aQgNf4XgsbuQK9nim3uK9RNs2g9V/oG
 982tw9dxam4ST9M1ye3f8OtAcLoizGz9E68bG6MCyj3TTf7Jo/IESvKdrD8j4qRlf4Sn
 t++W4vDdLt6mqIM1EVFq9b1NHXt7wuvR73MJ0bJj1ZqnTDSys1v1iyM40LZbJitxN9U4
 riHiJSBHGXnCJdvL38OktQnr22MFZbvqTd801hL+HRkajBF8bcy71H01UdD7XQXJkrHH
 3GG4kExZKjhKuvjZV/pfDHEvLlC++KPjZMWuUJEphozl7IbIN4FfBlIP3Aa4XG0/wqi0
 Tf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xJBpYEhRcZZ5puS2td3GgcOI6cVY9c9SdoaFc8pk1Y=;
 b=ZM7UoM+nnEAdNQq2DVJg3uGkmbnt/vOD2qPRb5nBsmKM/MK584MShgx+rNG/KnaWLA
 J7EI0NhgAgQJ2+garXa04+HBAwXsa7S5cyeKpoqaAnKQjSNG3+aMN2yaRX+AgYvU4wtn
 66Zm8S8CCutt7iEfh+oFL2C02KolEVsJrg6cT6n383OOe97oP6dKsMTuDCNV+fTKvNFm
 CqppWHY4EOQAdyndOh1JFlpt0V0Bqv6Lfa4EpvrudHrUOxNkmiJwwr8Gc8r1Ff8VIx85
 nhZ5hkbkahNsPX5Af4PfUN9CHB+ShICEuhC9REmZ4a88lipYMSUTIGZtbGJm1vD0OE6h
 Byxg==
X-Gm-Message-State: AOAM531nR0beCrhUk7vBuwp3RTbV60kNL7dMQZiN65/95gSicECmCMRb
 pKjQlfY7aJwxVP5Wtejf+aZxn/HJU4Gykw==
X-Google-Smtp-Source: ABdhPJxwS3r52xhpwJt12/nojwNc8kG0IbsJ+QFspvjCgsVO46hMS3Ux4PajmmE24GWWCh7RBw+zyg==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr21014971wrb.80.1627382888328; 
 Tue, 27 Jul 2021 03:48:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
Date: Tue, 27 Jul 2021 11:47:54 +0100
Message-Id: <20210727104801.29728-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VECTPENDING field in the ICSR is 9 bits wide, in bits [20:12] of
the register.  We were incorrectly masking it to 8 bits, so it would
report the wrong value if the pending exception was greater than 256.
Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-6-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2aba2136822..c9149a3b221 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1039,7 +1039,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         /* VECTACTIVE */
         val = cpu->env.v7m.exception;
         /* VECTPENDING */
-        val |= (s->vectpending & 0xff) << 12;
+        val |= (s->vectpending & 0x1ff) << 12;
         /* ISRPENDING - set if any external IRQ is pending */
         if (nvic_isrpending(s)) {
             val |= (1 << 22);
-- 
2.20.1


