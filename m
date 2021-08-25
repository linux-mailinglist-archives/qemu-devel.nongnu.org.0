Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A593F738B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:43:03 +0200 (CEST)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqN4-0005YI-O8
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG0-0002ol-L7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFw-0005Fl-UG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id f5so35618160wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=fmBA4Xw6AqYFEkMqpmR+skkqbQwxJdO4/iYbpeMmwjvjzmPDRg9WJc29DmiU6qE4Sc
 KxyvZ+ig66NlNPSKW1WydpFXqg4+EgKD1tnJmE46tt+lRsxmZPA0qMgc5yQ4CxX8YxNM
 ghPFmArJ2njMDQ2P0B6Np7nvfndhKUG+Pn41jDbaVvJavxpSXKHb7gIVYVe5r80kbX8Z
 li6fQbM02RwibD1naerWqL1iLWBb4ENcGt5U1xFkVBktmtWHHd6GJ8RxjNT/JUjICiQw
 u2aSB3mLrZSkP3WYZXpCqtOljmgSP2OlR9uT3tr+59b/AdqfWbqY2UbFHTmoBO2F2CmJ
 5rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=Xext1ApqlsUGgh8F3hUlRSkYwvOExDdE3J8xwlAOB/AnpJl4bY0HABuC06KuO2+yWJ
 dl+LiC1YTwP4ElObDw4JVMGD4uy6YjJ6aphqnExyhHLuHykdFaLe+UnRDP35gE54FQ9z
 dsZpE8NEkiUh9ZagKpgPbLcaMB6fWZ4z/Mhr+guKMyZ3utWmOIn5wlI65yVz+5CUDSWo
 UQ+qYcInohTmMJ3Q0G726ZvHE0yBg4eZqBs4Llkx+wZHclWCyUkdHrm4hP1diu0Ub1zP
 0844zwtCSRZi9ivZBB8u0vbKwSCKpIJE0+l9ilyVMI+t+g9dWEGuSQhpohORSQG1rXxP
 actQ==
X-Gm-Message-State: AOAM533L3sWOeoXyQFQivROm2lnBnikjkjfgcKPrWWvmKmnpLuTwt9L2
 fWrxmGEBaLW7JChnTjdKjE6yg7kffG1Lyg==
X-Google-Smtp-Source: ABdhPJy6WpeGxymio4FcUprMVAaP0eeqRT1lh/6gdlymlec/3dmZ6OXsySjG/9UP7dCYR9JMo1U64A==
X-Received: by 2002:adf:f991:: with SMTP id f17mr11535965wrr.56.1629887739372; 
 Wed, 25 Aug 2021 03:35:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/44] target/arm: Fix signed VADDV
Date: Wed, 25 Aug 2021 11:34:54 +0100
Message-Id: <20210825103534.6936-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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


