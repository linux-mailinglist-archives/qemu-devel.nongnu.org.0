Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5924B0468
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:19:31 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0vb-0008Iu-2z
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0he-0004C2-Lu
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:30 -0500
Received: from [2607:f8b0:4864:20::432] (port=46699
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hP-00048F-IX
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:05 -0500
Received: by mail-pf1-x432.google.com with SMTP id i21so6501427pfd.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0BDFAPkSF6UtdIiOcrkoG8O0FSVru9MSa+YtK3MJG4=;
 b=VfVSvp1XHZhiM2vUDzkt3W1s8VjmnrZSjQVXCAsUprBedlGa1jLQnBI3S10ed6eTkF
 l5ayso7ftaaj0A36mQE3C0R/k8bFhU6V6PhhHVIKEVZMwVr9ctdk7jesG9KeWkDdI/8V
 o/knUIJNEyznA6uRWUkKqEXxmkKe/g2era05Xk07g1wgRx8xLobvkFUXI0WvhCNSB4Np
 wD+b7eczMzEQ/HEU7cBFQmzXSkvjH3uX+JDDJFe7y/wXtiGrkD4zBk2ghs8+A+7Goj1c
 8U+Ee0vEysRJ6y6JLQcRRNiwKo9d3RNTKLhJzc/vF5ONgPMB2ykRsLj1YzuG8PI/wU0r
 RMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0BDFAPkSF6UtdIiOcrkoG8O0FSVru9MSa+YtK3MJG4=;
 b=G5CFOsPvbF3Sngm3jiNIiadJFd//niAQwOlQyS0Hi+r59GC+8++qP+wSiqK1ta6KjV
 VVLdh8i9Y6anoAh3rGWvPQPN2b2i8iQeOWgb2TO7n4DHdw4Z6bVbWzWtBAgnODNEfXMT
 p5qnkCg8QRkgi1+dX5n87pOc7zjIwkMB6gu4aGEKOOul+FlSFtlihBsagXGbr2FLHVb1
 /SAHdPRFx6vc68qOtDMIxeWRLg9mgEyitFGVDEHKiH6P6C2gn96gQzg/TbbGYbq6vO3e
 s7gjlVMBKXmDcUzSOVDtT4wiJRxZO3ohpSmMHHn8/7nbkeAO98cPqpwKvhtGTVZoZ8DV
 Bgcw==
X-Gm-Message-State: AOAM53226FRV4s6V6t33o3rF+r3rsD52xbq2QLjQwwZ/U7gmlKS66XJN
 p8GQRxHZzJHWJ03H+JMBnMbbMRrB12KO8ykC
X-Google-Smtp-Source: ABdhPJwuZMsepO9q9/j09tINpIeynsZrU3+PTyL0HJCWT7jZ611no/AYpjpImPucm2E2oBFeJkptXw==
X-Received: by 2002:a63:690a:: with SMTP id e10mr4589146pgc.599.1644465889715; 
 Wed, 09 Feb 2022 20:04:49 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Thu, 10 Feb 2022 15:04:14 +1100
Message-Id: <20220210040423.95120-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The macro is a bit more readable than the inlined computation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf38ebd816..94304804cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11516,8 +11516,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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


