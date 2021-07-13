Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7E3C715E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:44:15 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ihq-0001ps-Be
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbV-0008Q4-5U
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003dQ-D2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v5so30525221wrt.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k6grFFqHPB3tF2ojR0KuBO/NFzUsEvLnrBSRggUNVfs=;
 b=jN1Sbx1VY9KoDtcdpRFKvgdmKxbzlK32P+heZlXMenNUzJaIIYmthJkFo2AqBd27xa
 mlbsFs/Wice4pEIlCSNEc3CT7GTRxOu/CchTGAOlfeaGi7cYTQGSE/AAmEXFsNJeTOPs
 zpDda8v1mvRdElHuEvayjttRDcDPfczPrF2Gm/sp4NovMv2ob9pHKOBdJkm5Znwi+47y
 TDv2mXhq//qnX9WC4+MOlfxPP/NZOdmyVuCMIOwKU+56yOewEqUGCZZh2y2LrR3EePVn
 JQe1bKbOrA+hJHMwLHpbiuraagoQM5LdutRoneYzVo8fw/liP6Re6hr05lsWx25dqboo
 7HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6grFFqHPB3tF2ojR0KuBO/NFzUsEvLnrBSRggUNVfs=;
 b=KK535vjwzyP0uvUDB9PCJxVIIi9Om62Opxyz9wk3uwXI1WWv5c671KRNCDpC3if/1E
 SMvyBwap+y97YWOwG4bEGBWOaX7m5HuoYUYM7HrS9nZXe38D5WURXtjJDIU36D51Weye
 Ttx9y47TnhGMm+zK7svxXbHIp2i6cGjT3HWaU65//qei+VYtAMKPT8s6cSyWlzFGSwYI
 aHA7MSp1NPpfIW2HV37EkS6yYI0wSOMZ89MFJSTlFyQQaqWu9OPCQnc1wlAOIXsiCO6p
 loYER/dqIgGRr2QGOLHaZwd2H2St7wjkafQ9Vve1Wil+11QT31TTKjpiTGhsvbIooJDX
 DlOA==
X-Gm-Message-State: AOAM531lsjv+4cROu+iPLAfibXZg/8pKf8X649qdWwTxKyfBRzxop8TJ
 w5HeR99YpqNsopjqv2Ta/BcFeg==
X-Google-Smtp-Source: ABdhPJzAnvVu6/SF3bfB9J5GrcKSmVepVqxP+gwQ0e6uk5SsUa0desiOHBw26qJT668icl0omjrV0w==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr5853166wrq.210.1626183454587; 
 Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/34] target/arm: Fix calculation of LTP mask when LR
 is 0
Date: Tue, 13 Jul 2021 14:36:59 +0100
Message-Id: <20210713133726.26842-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In mve_element_mask(), we calculate a mask for tail predication which
should have a number of 1 bits based on the value of LR.  However,
our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
zero length.  Special case this to give the all-zeroes mask we
require.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f17e5a413fd..c75432c5fef 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -64,7 +64,8 @@ static uint16_t mve_element_mask(CPUARMState *env)
          */
         int masklen = env->regs[14] << env->v7m.ltpsize;
         assert(masklen <= 16);
-        mask &= MAKE_64BIT_MASK(0, masklen);
+        uint16_t ltpmask = masklen ? MAKE_64BIT_MASK(0, masklen) : 0;
+        mask &= ltpmask;
     }
 
     if ((env->condexec_bits & 0xf) == 0) {
-- 
2.20.1


