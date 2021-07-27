Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1363D739E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:49:47 +0200 (CEST)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kef-0004HS-P3
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd5-0001eM-Ra
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd3-0004rO-JM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h14so6693567wrx.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1mZJ5FGvYLau6qKYyaJX7Qgxa7nGm6Q4YV3hT8YcFO0=;
 b=SHxxglEmzEVG8HQ1zLp5BxASUP0gA5uO7697FTD4OVaZevenor+lNeqruL6Sp13fm4
 oHqm+BC0UaPsxiMugO7ClOgMJE9kM2cewVcleVPchuZqTLyDoF9b5Pd9wZv3ScMmp4T4
 VeKGPXqPFr82Sh0dVQXn3ThrywsqkR2PNPnzfGBUgmsLJP2yQtOiA9hChY7sh55kblZs
 pO0VZutwzmwU3sR+sogkbVkZgXl3HjyE1ajHDz0O4cLQ0tMRZSBHTwWBGcKc3cFTFtax
 TVgB/5wvnOCleNcyljaynA76k3lwdz8pOz2ZXp770lCWNRGdPChRnR6sp4jA7Ijph4I9
 N+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mZJ5FGvYLau6qKYyaJX7Qgxa7nGm6Q4YV3hT8YcFO0=;
 b=cwTzO36AmtWY153DaYT5onNBUrYlJz/WRlJIxWISA7T62W1lf41oQUBc0FJBnAuXmQ
 oMeJn5ycmal/eWwNNcGZHqQOiFSApGni9ul09/ncGSIUw5oplvT2p+nF53ZKPvXH1Cm9
 YZbTKEnuqSChGQCDmTrPrCDcdxJvfm60ZGaLYAKqbBhoiMh32ot7aZIL7LPQnbdCUQ91
 csuE1gA85DBN9pdauloFWwA8zn0qyQMDC+D3XyKK0kuzD6gQbGkO84+ZDAGNy+lLimjB
 KkIUUcRrOokxmdqk0/ACiLu2o0EmGpzNudcDemhukTapLkt0XNPbsfy43jB0WFUNEHCM
 E/Bg==
X-Gm-Message-State: AOAM531FxwiKAGkG0mFF4CqVGOdezCpmShLLL9xGgdsmYAAtp1SkWeUQ
 LE1wnz4HwKDoLEzMvTL5mRP1/oGBEaMQGQ==
X-Google-Smtp-Source: ABdhPJw5dfSBDVVlMdSqAqOGx1vYd5b2gJAst5mrA8Ijm0lL8TW1tULfHu6TJWdRlmUPSJ/zevpYbQ==
X-Received: by 2002:adf:d087:: with SMTP id y7mr2715884wrh.323.1627382884168; 
 Tue, 27 Jul 2021 03:48:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] hw/arm/smmuv3: Check 31st bit to see if CD is valid
Date: Tue, 27 Jul 2021 11:47:48 +0100
Message-Id: <20210727104801.29728-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

The bit to see if a CD is valid is the last bit of the first word of the CD.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
Message-id: 1626728232-134665-2-git-send-email-joe.komlodi@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 3dac5766ca3..d1885ae3f25 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -570,7 +570,7 @@ static inline int pa_range(STE *ste)
 
 /* CD fields */
 
-#define CD_VALID(x)   extract32((x)->word[0], 30, 1)
+#define CD_VALID(x)   extract32((x)->word[0], 31, 1)
 #define CD_ASID(x)    extract32((x)->word[1], 16, 16)
 #define CD_TTB(x, sel)                                      \
     ({                                                      \
-- 
2.20.1


