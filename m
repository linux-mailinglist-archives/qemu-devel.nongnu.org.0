Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC41518F8E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:59:50 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzcb-000186-QW
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZw-0000lf-SI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZt-0006O5-5F
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id j70so3893578pge.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I2B4gVVCQM10Dll/DA/iXXFd89GTR6tRg5OAZRVt3Tw=;
 b=QQXS2kZR9D/XqZ3UjTzin5KXDBIH1D80S4oQR5bNkOMNzgdfYE1MzNQFISfn5wZwWW
 5QtbrAkGInS2Q9/RlFWdOiTM5yeckR2JSBKAUqszwUJ7R3rHLAsdqgW3lqAQrQ2LrkEH
 6dZagMBTZ2Ees/qBm6MgX//AFUE7aRJlPXzixLzbd11AoY2afaehS7cBcVQRCZoDKZfi
 H127hNY915paun6WCD26GxKXSm64nD61I2fzjI9cqZQgm0FPSwiYoGaaJhEqYMmQZP+p
 72egniGySfkcpAFokLWI20G8aSj0lEPhpFzz8GpfCMApvC45tf3v3YsuTWgfqQMRF+UB
 TVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2B4gVVCQM10Dll/DA/iXXFd89GTR6tRg5OAZRVt3Tw=;
 b=tf8ZNe0aCBKzOODoYGfzoO1d5+LrIUPUkl2n0s4Hm4LZMx4LUAYkGkOciRmkQUth6y
 KwMp5ujkBolkvYAB8MvaICF8RSzr7YnFoeyrUee4iz2eSECb7ne6WRrNQyNSX9tTWYQ6
 XDO4UvhOTSdnsHFJXcHLbL9pE22MDtkYpkM2ZRA5FQ41QskpR1rqs1aSNa1jILXqDfrz
 fWcYge9Gm+iHDUZOvbxvhqtqEPstLJFIQZ68VyB7P/r5oaGjaXsyvs12TJBKDCyIM300
 a9se+gQbVSx63OPPsiO3w9p+PtYWEn7bj20CIOD89Ct3HmqmfnT13GUEcMOw/aU+UT2b
 93Qw==
X-Gm-Message-State: AOAM531uMfJIAQHB/WQOau96FHc3hZn7hAPsfY4vMQyx7te2IM7C4iiJ
 TwJVJj/6V4+IpKTgRSpgw9ptQvW8sLPFOw==
X-Google-Smtp-Source: ABdhPJzND6llTjSqMlbgKyqEGYrn48YD4/s9o7/gKBOglrG6LRE2ZTx3LISHzVVi41d5JW5XDPon1A==
X-Received: by 2002:a62:d445:0:b0:50d:b868:47bc with SMTP id
 u5-20020a62d445000000b0050db86847bcmr17617527pfl.73.1651607574792; 
 Tue, 03 May 2022 12:52:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 69/74] target/rx: Fix the base of the fixed vector table
Date: Tue,  3 May 2022 12:48:38 -0700
Message-Id: <20220503194843.1379101-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This begins at 0xffffff80 not 0xffffffc0.
This has caused exceptions to wrap around
to low memory instead of being at the top.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/helper.c b/target/rx/helper.c
index f34945e7e2..c6e285657e 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -91,7 +91,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
         cpu_stl_data(env, env->isp, env->pc);
 
         if (vec < 0x100) {
-            env->pc = cpu_ldl_data(env, 0xffffffc0 + vec * 4);
+            env->pc = cpu_ldl_data(env, 0xffffff80 + vec * 4);
         } else {
             env->pc = cpu_ldl_data(env, env->intb + (vec & 0xff) * 4);
         }
-- 
2.34.1


