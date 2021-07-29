Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833093DA209
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:23:14 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9487-0006W5-OG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940d-0000BV-72
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940V-0000wc-CU
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id c16so6427389wrp.13
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=m/8jrRsIdWQaEvtiM0ZzsiP7w+nuqXtKnLnbQL/QIreJnepWWyOIrMQxJsrQzy7L3f
 wtBAzFj04ma9Fyo97gjRcLkfAE8qoOETf5rcQTGy3h1KKM2Zgv5rNjKxlZebZGiJEA7Z
 h9xDfd0/Pxr0A3d+OcwI6o4NIjxdsnbWFFCKEt9hYm5irFPO8UrO/Ton4ezT03Bwz6ce
 5ejtZc907GIR7G5aQVJqbX2+KHSvuZiFoTCn+1L86rvt8n/PmUPT9iL2mt8kLL6zJ71B
 r0OMFJHpxQLXvOiVuuSVDwXDlEh8BTynQiqQSpqFVuKmeSL1Tj1Dc8m4fjNf10mkREnz
 AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=rZDoHt7+IaxOuRrFSCi8EBHI5qRN/wimBQVYRGqfgnNFkvUQTR116dqJhiHct6a4HI
 qEC2eFiAkrZnPnbM/aKDw+HWamX1v+yX002yyZe5TpT156745937wYP0XOdtsVzVTPJv
 qzd/P0ErHwgwRpBVesqmxOt3QcSmvBvX93dqUUU1KGXykU5ZvgczEM9gPgKZu3aQ12pf
 0vMMeWnMNsT3AvM/lDRprFRY0mFvny5om2BNHZ/83/9m1MxgjcoBlskHiW3YjGSjm3/o
 MGhNidz5nfETrNLqbFsCn5begsPif0RAo9jC96fFX6+JB8DCKAxMEhNCuHWFEMF60Drx
 cv8A==
X-Gm-Message-State: AOAM533TnNQJo4XYYFTWGXjZjIKQs5xusTUDoCtCvNgN0Bi//zSRvqlg
 aDjAearlA7BI9pt3jZ4d2m6CDg==
X-Google-Smtp-Source: ABdhPJwOEoMbNAGJklqLss3qcb4JE36wA0LIoXcI4b3t8f5eqTrABeViERrInEBVi1N23FkCHOOMFA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr4293021wrl.61.1627557318090; 
 Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/53] target/arm: Fix signed VADDV
Date: Thu, 29 Jul 2021 12:14:23 +0100
Message-Id: <20210729111512.16541-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

A cut-and-paste error meant we handled signed VADDV like
unsigned VADDV; fix the type used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f14fa914b68..82151b06200 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1182,9 +1182,9 @@ DO_LDAVH(vrmlsldavhxsw, int32_t, int64_t, true, true)
         return ra;                                              \
     }                                                           \
 
-DO_VADDV(vaddvsb, 1, uint8_t)
-DO_VADDV(vaddvsh, 2, uint16_t)
-DO_VADDV(vaddvsw, 4, uint32_t)
+DO_VADDV(vaddvsb, 1, int8_t)
+DO_VADDV(vaddvsh, 2, int16_t)
+DO_VADDV(vaddvsw, 4, int32_t)
 DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
-- 
2.20.1


