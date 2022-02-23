Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7604C1ECA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:44:15 +0100 (CET)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Mo-0002IG-AP
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0At-0006qq-9O
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:55 -0500
Received: from [2607:f8b0:4864:20::62a] (port=35383
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ar-0001E8-BJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i1so85652plr.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
 b=sLvusCfoq1Ah8GlJxy/j847In4z7s480NBBmtn6FLR+nkSOJTIu7ge+QcHIZc8vM2D
 9m6NiuvGwWaZ2SHOdY3QD+uQieG2uXqwmmvqP7KtTQZEbMPbo5azEwEVFOcukCuc/U5G
 eGH+dMPna0/06OKXrLkupNB7Yni0aAt0ZQbn3KtAo0eFulsbbloCRlAkZyC199o7DmfF
 m/c7T8jYNAaqbjKMpUxNnmxm6ivncOkzg4p0LwuXUAPSvRSaw1UFk4P1lkvLJgzVimvb
 HTFjMjv/A6dq05gndNCYm9U9q71xSeAKIZaJNkrUBuFYSo/IMyeMDaBb3JIIROTHnzms
 sP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
 b=kWZrAiFOoAGIhtqUnPH1G64pX59PcLcxY2nOcNV7CrQkWLo2d0x7I4PU/9pYcjxEzr
 gfW7EZdyWL+NiF480BXXzTLe77p81lEjPyw1arQduSQAVXUmrWgIcLvKRDHdkBT0EsIm
 0P4Zo/bjLk09KNay9e6WgjhSBjIz7H+SRVAtwpFneSZjzOGb+VIAvp9+KpeCUw3jlI7D
 GBsZZbt8lCW7dJy2hdwoljau/KQSEZlRGV6PrSICndVqqv0UA/bzPW8Ma17n7clLSocb
 cHkR+SyNX87RykDFbiE5/xKVas1AURf/4a45bj9tuWsjT2C6ucje5B8dFI2NkzUcu7qL
 jXBA==
X-Gm-Message-State: AOAM532w6VUS34RrK0fHOcC6A6HPSX+FEUhJMrudxrIGd8rLIzSCRchS
 3pdy34z00BqnjpQoB5t5v/N4BgC6TgUzGw==
X-Google-Smtp-Source: ABdhPJxzc71wMMXpch037H4YvReloP6NmGZxGxsBDwK2iXJuifDQMb5dyzuC4bvuwglBR3Uv7JE5zA==
X-Received: by 2002:a17:90b:2251:b0:1b8:c4cc:2057 with SMTP id
 hk17-20020a17090b225100b001b8c4cc2057mr11364176pjb.193.1645655511021; 
 Wed, 23 Feb 2022 14:31:51 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/17] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Wed, 23 Feb 2022 12:31:26 -1000
Message-Id: <20220223223137.114264-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro is a bit more readable than the inlined computation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 431b0c1405..675aec4bf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11518,8 +11518,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-- 
2.25.1


