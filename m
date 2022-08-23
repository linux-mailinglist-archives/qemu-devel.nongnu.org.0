Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D359EED4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:14:11 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc9y-0008Eg-Tq
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1z-0008MU-DF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1x-0001QS-S6
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id 20so14013018plo.10
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=En4LPLesOggHoQwnB9qGRYYiS0yNvrYUHdD3JufEjSwTyHMQpkAd1kwJPTBBIVQeVX
 YGt+uydHtoNIBRr4sOhp6eFNN4Inh/Y6Q/WE3+/6KnighuMp9FkrZkqu+foykEWgidSY
 8Mg+yia4yyKmcM/j6KDtyThUHvt279t8STLZrUy8PJXasgVzdBLRHlZMGiGbqn3oF4wF
 EE60OyDGu3QMZl22jId6lmz+QgGzrmgF3y/RUNo2lt/9hD3f1z+ASOPL+Ne3N4JO2gev
 +02CY2iyd9r755lCyuVZy9uENNk5/n6TMPxwzVZq7yYEvCBnQiAxqsHXXxIxVMhjxq1h
 6HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=5piTSELva9nuvVISdsaYjFMs1FBo3aUxt62ZGIYQpszRHVKRbqgb/gWYlV/KzrWWJp
 VrDfAa5PMpFnf5o+r+4uXl0ylN+HNPmzeEOCf+aRV2ySQVz78pRsvqPJXkvI8RevyYFH
 e7YDkj6Eux53quOy4+7SChGf8P+PbeaqiNR9sn+YVvAVgBtu0IC2YfZEhONjzWZuZCN0
 dVMx3aBJv0fMSbEPdg3M7thYi8dQ+3J26kXMKK7MThNYhqQtPUu0/zr0c7rYUnRkU7VN
 Dtz3nhLbzX/B8q1WWMiuQQdfCoCTgVLnBECiaVoUdgsuGodHvi5NY/N+7rLIi+vBll6m
 VecA==
X-Gm-Message-State: ACgBeo0mTv7R1uR84SlmBuFjBwHr67xv6MXgn8qY5j1sR1lDHUjT2UhO
 VjHm2EJZfSnFR5WcUeI7iaUGI+s6TiV+JQ==
X-Google-Smtp-Source: AA6agR7S+nhMuw5CjpX/1kcDTktR3C6E/vHS/FFD/s1hf047D8vj1mI+nF2d5pYwkHGvCfwivJDyxA==
X-Received: by 2002:a17:903:22d1:b0:172:f11f:de35 with SMTP id
 y17-20020a17090322d100b00172f11fde35mr9030208plg.150.1661292351512; 
 Tue, 23 Aug 2022 15:05:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 06/20] tests/tcg/i386: Move smc_code2 to an executable
 section
Date: Tue, 23 Aug 2022 15:05:28 -0700
Message-Id: <20220823220542.1993395-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1


