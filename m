Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9D4E7A91
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:02:33 +0100 (CET)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq8m-0001bq-7k
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:02:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpze-0001wV-9h
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:07 -0400
Received: from [2607:f8b0:4864:20::229] (port=41820
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzb-0008P8-JH
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:05 -0400
Received: by mail-oi1-x229.google.com with SMTP id e189so9284383oia.8
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b49/gyL3nhPHdkIknNEuvRr52AV4Z59e2KtiOdvbnJc=;
 b=geOAeSHxOhYUQsQGhYgNOr1wdRY7ShbbFxdZm5weFgvGhnW+8vswopZoU3Tu+X8c0T
 66V0x9f6viS1rSXT17BeC9fNOD/8wJhSpMGl8kKeBy7TH/z2ZTi/13PXZPlz1Lz7aU1g
 6fAfvcTU3d7h1qlgSaQAM0rcqdosjGfPP/avx9E7trcDjd9UIFTwYMjMvgMusVrfF29B
 GbTaoQ+kXL7M+bUExdBsL2SVVgsj3t2y8rwEoR/p7Z0tuDbKAFuy0OKvJfUwE54l5ZQK
 D/fhozq1RCEdnegw71fyA5tLGbzSM/ED+ybVj1dbwlB5tkpHX9I8WzJ1uRYt6KKg5bjy
 xpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b49/gyL3nhPHdkIknNEuvRr52AV4Z59e2KtiOdvbnJc=;
 b=ffvvqnrfzPLXGm1/imDEpGHrohkbY92/khPrlhs/5HtSZOBLh85onXVPoP8tewsW+k
 CC89aWCngyT+l5lG1w6XDWPuYOEVsDJD6vwZbMk41iN6lJBTNa0CgYdyDh3Q9bPmsuj1
 Qfhkx8Nw+VzONWijGXIEH9dQAI3xfaUNjjLGY1qlizKSzALmrj3weQjsVrRwxGZQj4WY
 Mwspyayk7L5F4zuEb3i2jprNiXz8FK8Dl13xL5alWwSD/0M/a6NZ5OYbrhH/YCJVmEUp
 OYQjDbqo/yrCQhXMLpRA+5ElVFhUTJUtXNlFvRgW8S8mwF5L/Cg6GhigCguB/BMRTxkb
 0N3A==
X-Gm-Message-State: AOAM530li1205zoFx2U+JCN9XzRibDWgKWUGsHFQvfRvq0SLmw5vyrZX
 fz+C/yZ6bVSNvI5GjuTjtVFMex6fudb4Y0PL5jM=
X-Google-Smtp-Source: ABdhPJxRBX7xrwAeF4WYkbm5hSD5o7NUwyP+tsz0eIPWVkd+CjiGoR8rIcCLnrz1EtmGqSJVj2NGmw==
X-Received: by 2002:a05:6808:2114:b0:2da:1bae:5197 with SMTP id
 r20-20020a056808211400b002da1bae5197mr10320213oiw.17.1648237982346; 
 Fri, 25 Mar 2022 12:53:02 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:53:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] tests/tcg/nios2: Re-enable linux-user tests
Date: Fri, 25 Mar 2022 13:52:50 -0600
Message-Id: <20220325195250.386071-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that signal handling has been fixed, re-enable tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


