Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D03D3D8E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:27:56 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6y1i-0003Np-Vx
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvv-00004q-4x
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0000mQ-EQ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id z8so2956897wru.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=25KPohKxJgwnGi/5F22vyFBpbh7T5Mv/FLljFv1RBvg=;
 b=MVR+KH17X035bYJ7dmzqEKZ2hDNHNNdUuB6zq44bsqU17LRdNmyZEs5nwVsMT6xqSG
 MuWTZQ0w7UbbOCoGz7GA2Q+ZivwNTs+HwK9LYPzJhZoA9kT9NEqZ4nolJcDOQK3X2X/3
 5wlgUoHnBgjyPgTxCv2aTlDlzXv8mnmTm0RZtpL++TPZyw1drb5casLeXRCaGhStL40H
 4MnE0tGxn5NYMqeJdjuii7bUTkUxIJPC/SmO7M6+2/RYSOT0TMl6vCiGxdSQ3ZMu+mLR
 ScmiBgLguIqkfGr80i7JZnYz6KMpN2lkXiWY6/aIZYYYX/IW0iKw4gQ0MSIWZW7TWo2u
 0Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25KPohKxJgwnGi/5F22vyFBpbh7T5Mv/FLljFv1RBvg=;
 b=lJUfl3ZGiMsc83zO2rI3pjlxIoju9V2YuPI2RNfdGfKBl4sgnrTydeZJKN4YH4bFGI
 /lunMDpwuQpFEcaGjwEEkv3xygGa82IhvexBcJj/YEAMHlK2UkQ7N9ll7luv/Uj2NIDs
 XEge+9cEURXLIu0chdhKrELKYm/XR/36G5fEFn9JTz0k1CBBuS8k6m7lFo9kbDmSASmh
 36uW4iBafjUoDuErGXzyHEizFoRkg0RKLZwEgw1y7b6O2bPrBPwNg3YQ5eXJA+9Crdvm
 dvfqbUlPj7Anwt6ll1zrwdHlD6tNyAalrG9AbjLCEHz+kmWCnLrdjEvxJfIr25QGUiRK
 PIhQ==
X-Gm-Message-State: AOAM532VaRWr/VZrW/ss9cmb0JIhccjFu8WXhCFbhf1uUQSbSxRHQVnm
 8jRaHVJU2h0JYDWx5Xjcjd8KjA==
X-Google-Smtp-Source: ABdhPJzHBxOi2Q56WD1gGDWjXh3g/yu4Z8MrZAj+lQCi5Wez8c1pOYq/qetNeGD3M9QfYHigWwddJw==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr6237736wrt.58.1627057312106; 
 Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 5/6] hw/intc/armv7m_nvic: Correct size of
 ICSR.VECTPENDING
Date: Fri, 23 Jul 2021 17:21:45 +0100
Message-Id: <20210723162146.5167-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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


