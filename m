Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EAC50BDB1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:56:00 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwZb-0003cs-F4
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWg-0000Qn-7N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWe-0007Ee-MZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:57 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d15so12080761pll.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrNW1rK4WiXSB4GD2xVRHyjJx/JGJkz3Qq1JReZmp+g=;
 b=PoIpBbb5IE6MCFkpeyM2wGG/TSZUXqt6iV49LUva3ltJI3Q0LtAF8HPWE8VHcg2Jft
 TgyocTaP+31sfDUre8tf3CGJ2v5T8hXpBxDzgqaSFiv1Oa0CKkNyDQbvLNvXa2n8BLiB
 dIScKkGzSGiVTbiFnQXfSSr4lZYVYGw9fUIZoS1ZJpu81sCZpOyK3H+6URAidz7C+lJZ
 JSjOH2UJjf/3l8mNXuLX5W/TRUAcOT4eGysjEYNCR7qHmYvLDUaNAwHTsDv7hQF+zsAY
 C5BTAByx8YVJ9YKrhItizcjtPys40HGTc+4pjpBkXZJi6SpjdIBxz7nXLiuuM8KooplH
 vJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrNW1rK4WiXSB4GD2xVRHyjJx/JGJkz3Qq1JReZmp+g=;
 b=nXinBgPjIomZ6DOJtVyhPzPkvSE2sTjjsTIs1kGkJGKsgygazxqH2ePauHis9V7nHv
 4EL5av4dzRR2ZH9cgIiCsy0mx2h/crsovmVkdPgebnVpSqo4+a4MXhvrrqux+pX7pX5d
 aSdJsypmkvGpTJhoNphWRolQVjx1vOkbT4+ykyoLv6+FL3D9Wxx6ewtxZuKyTJhRP8Rh
 +naUTl6q5GTrvyRQn1WnsszqEvmJgEiF/XWp7nIYoCLWKz1tPQ9OhGeaPyZsCkzCct3R
 CaYkc4byEP2YnjGta536aVqDfF4kcQyMPTmLOw5w1ge5Q+STRXK/y+OzdEHzu0NMCnXv
 VGqQ==
X-Gm-Message-State: AOAM533E2OvqsyS+E1gnGULqFUMxYb6l8SXQIWwhCCZNl7WFRgFGOh5G
 L0o2W6qp1TYAj16StEn5dOkbcyJl8Js9jcps
X-Google-Smtp-Source: ABdhPJwWslja0LIt6Dc6+6AtCGbfD95mtGO7vHm+jUOIv1EQCBZa5JGsQCtKVpUmHaIfIZBBEvtI6Q==
X-Received: by 2002:a17:90a:ab08:b0:1cd:34ec:c731 with SMTP id
 m8-20020a17090aab0800b001cd34ecc731mr17303588pjq.202.1650646375436; 
 Fri, 22 Apr 2022 09:52:55 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/68] tests/tcg/nios2: Re-enable linux-user tests
Date: Fri, 22 Apr 2022 09:51:38 -0700
Message-Id: <20220422165238.1971496-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that threads and signals have been fixed, re-enable tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-9-richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
deleted file mode 100644
index b38e2352b7..0000000000
--- a/tests/tcg/nios2/Makefile.target
+++ /dev/null
@@ -1,11 +0,0 @@
-# nios2 specific test tweaks
-
-# Currently nios2 signal handling is broken
-run-signals: signals
-	$(call skip-test, $<, "BROKEN")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN")
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


