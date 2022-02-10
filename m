Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F844B044F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:15:07 +0100 (CET)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0rK-00017U-90
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:15:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0jc-0004OJ-Vo
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:09 -0500
Received: from [2607:f8b0:4864:20::434] (port=38792
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0jU-0004Lz-Pj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:04 -0500
Received: by mail-pf1-x434.google.com with SMTP id x15so5567832pfr.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySk6DI87bH3eZGMitydYEQW5NydufZmFbEicSz0knRM=;
 b=dpyNdJ/FKi6Zmei/B8RXxNVHE0F3dnzClNKC/Chn7jfsgSbMp3Z3ZHnZzZhJi6TYeU
 Y4qToCWUSvQpHzFZVHK/yPcNTMajdFG80e0m8eYIg8Vldv/tZrVXdvjhYGoPpyxSVw3w
 PBSgLGUdJjLsOfADwOPKNzXFuoNOSbVihRAfWsKGoKTzlIUDl1JQ4BOD3/pi4Eqr62HB
 tAoFBAcWnn3nG1W32czzvmMVzyTz9OFd41t2Chl6k5tWichkJmpJdiI8BzftUMpzdNW7
 qz49lRXNYlCdYFZ6x9CcYFG71NNNp5VuMLaUwB0Dm6ieIYqfwhWuMsht6FvFha4mygMA
 Qetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySk6DI87bH3eZGMitydYEQW5NydufZmFbEicSz0knRM=;
 b=p/72x6rYe6dzasazGN/jF5jykF6OKd8HBJxnlpLyda0aJ/nATZHM+pFRbQUoWfwKVl
 ILaZXbDN1dBX2iWzdYWvin6QOZKql+Q8pXpuf/alEYTwGmYO+bee0BwqKojagavF+6ov
 05zygPrR1CEMxXaT3FdjwkVygy7K4eFq6u8LShwffMRslPaIz3eyG+lWmR9VBiCILh9a
 8oJi2xp+UXcFCIO388wmHyYG+I3h4wK9XhZPfjtss7WLL6Yy36VP5ELEPfOFIGRzMTuJ
 LzQAt8tLlbOy271AhPMTv/sK8FuOcYnfIRlhQLM9GZExEN4MNtle3zi71OhNfMMry+N+
 Cc2A==
X-Gm-Message-State: AOAM531cuq7e6PlQI8ckNOj5FztvPZ9umD2bSWNu7k3odQDF9BjQNIkY
 k130/GmDqBo++1xcIW6MhAu7KnDgqdG60foK
X-Google-Smtp-Source: ABdhPJw8KonN67F+wAYkGlmu4ESxVSktkJM3Mp7G2/79M3cEf5Cm9/v1Ugatsx2uNXDd6S8ol8yx3g==
X-Received: by 2002:a05:6a02:195:: with SMTP id
 bj21mr4545558pgb.277.1644465908969; 
 Wed, 09 Feb 2022 20:05:08 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:05:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Thu, 10 Feb 2022 15:04:21 +1100
Message-Id: <20220210040423.95120-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The shift of the BaseADDR field depends on the translation
granule in use.

Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b1899ceef..e2551e693b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4536,10 +4536,11 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     ret.length = (num + 1) << (exponent + page_shift);
 
     if (regime_has_2_ranges(mmuidx)) {
-        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = sextract64(value, 0, 37);
     } else {
-        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37);
     }
+    ret.base <<= page_shift;
 
     return ret;
 }
-- 
2.25.1


