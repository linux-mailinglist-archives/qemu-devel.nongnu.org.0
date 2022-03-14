Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2F4D79F8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 05:47:02 +0100 (CET)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTcbl-00086t-Ih
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 00:47:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY3-0003DB-C3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: from [2607:f8b0:4864:20::429] (port=45958
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY1-0004Of-FU
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id s8so13201089pfk.12
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFfrJYY5Ma0BjX1lYohp7IXb94eb73+HfKk9HI5l13k=;
 b=YrZ3jsnLM3czeMzWYH9P3kmmZtzf6Ix9noe7QgMtyHfKkYJ/paQEyfct/TcN1VBY0O
 m0i8/IA+lufPHLkYlQCxIM3VA0jVEHZApmJn+E03Yq2TRtiwDEkp9+0vVp3Um8lSoeCE
 JAvC+U7Yeu15t6FQH/4vz8LUEQ2vIftTeTbsooKzBqDNlY/UYSYOatOpMg6Ti3aN17Vi
 keNzegvIbJytmav8K9zcDBpjImQtSa4SJBmGWY7pH8fLBS0iTcMc4Jy3TRVCutwgxvw/
 sobkF2YCkaE/IgrQ/dDOfXAC9ewN5EkxKvtjwPOuXo8mDVzqFBpa+nIZd41kzRkr00ot
 EAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFfrJYY5Ma0BjX1lYohp7IXb94eb73+HfKk9HI5l13k=;
 b=AjORhAKAPHSrYRgGNAJ1sK8qwxYUGSi/qdfzFPj2meD8y+akF6l3Y4XEdgBujz7q8v
 GV6nu+bQDmytc/xdej0gm0y4kqqQsHrF8rEbl/3PeX8GIoXpoE9oSlMmhZwLqzziXqDV
 y5rjelhW1xHP7BuZahnOdOn+pOacCvzmrPDPjHGCju85zJo8fj8V38fouXEx1dvPQ1fB
 sgxT8re96NaIREoLsW6b4X4Em115+hfrZtrdbxVBXb9HjeeTAJSoUxhTRNQ33lz6eNs7
 71C78IDUZ3cGazZGWmTebMcsRzcnDdEa+YoJiMgTTQw8iLMXH7B0xOEgIJ6gaeiHMcyP
 6Nmw==
X-Gm-Message-State: AOAM531UQS5nSIzvtQJJRkhN619OzYPbbgSqYm/u5RnK2STFfak3Wt8o
 qH10QfF7R9H5sLFuhlsP5IJNPLyOEdw18w==
X-Google-Smtp-Source: ABdhPJyy4RPV/Y2zkFw2ZsNF4OUnTFm1o5Eiu7ezqnzzRAPLKonFqQKx1Dz8PsiwvzHsF+I8TdDHlA==
X-Received: by 2002:a65:68d6:0:b0:380:7ef:30cf with SMTP id
 k22-20020a6568d6000000b0038007ef30cfmr18269455pgt.271.1647232988120; 
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user/arm: Implement __kernel_memory_barrier
Date: Sun, 13 Mar 2022 21:43:03 -0700
Message-Id: <20220314044305.138794-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314044305.138794-1-richard.henderson@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fallback syscall was stubbed out.
It would only matter for emulating pre-armv6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 032e1ffddf..a0e43b261c 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -158,7 +158,7 @@ do_kernel_trap(CPUARMState *env)
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
-        /* ??? No-op. Will need to do better for SMP.  */
+        smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
          /* XXX: This only works between threads, not between processes.
-- 
2.25.1


