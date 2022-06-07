Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C90541CC7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:05:50 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhKe-0006f4-Sl
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5g-0007FV-90
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:17 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5d-0001JY-MY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:16 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f65so6779229pgc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iN+ZQSw54uXkjIjlKW1pFe1Mm40xsm8fxs3pFQz2QI0=;
 b=vicYudqvcclxAoOqhlETQImNvV4SEX43HVC9LQhd4A+ubPugNW3ke7QwdDZhdwKKu+
 anV6wXdhT4tQmEePESyaCA+cpPu2SFHxms4bGDoKnvgIOHAupKo/5hJqFB5uMFVqJF4S
 PzIx657g6m+QYMldnfO0I0m5MpjdN/QxLKPceUvj9muUxZ+SES6sHm7/yQ4Luni7BHRF
 22ZFBetSe575uPXBVNZQL709ISV/BgAPUtLQiNIIZJ3SrrDw++wjh7FmvmwDISjeU0IP
 ekFkyW/lwk0cA8hsBso80eUilDbtoiSOnjxOj10r8EdiP+6nVv5yJllMQJsSQznefT/b
 sv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iN+ZQSw54uXkjIjlKW1pFe1Mm40xsm8fxs3pFQz2QI0=;
 b=f+P9ogxx1kc/cG4+Sa+AC28njR7WRCoZnYjsy62MFMoi3PmNleby5DQhRo4xl1dZC1
 cEz9D4MNt8aB3/XYjSZ0sfrOr8b8ms/Et+u8jlAWkwXVDjKWrDzT4sFHUyf3FJVtr7Im
 qVghBk42CQOnIFaOdSaCQ5mkUZFZTi+HKstRWiYsJTzIyVUUK4PXgT+xb4lR9cVuHAyo
 ml5lyRFiDhTp8vJEUfWYaDBqxmjyNu5Fj21C36JaxiUN/K9KA0VWHcPHU4FBuAArvAVg
 +EY8dk79P1bcflrYCBj4ivN5IqdCGATYYPJlaVUysodzswWJziCVKvs3cVMLc5UkW82e
 3SGw==
X-Gm-Message-State: AOAM530/plrt701JRLRNcX+8WQeUse76uxDt2b2IyIO9mX1PQhgJpeib
 m+XUmzeBLGOpEEGALkaWYFzGyyn6xCqlPw==
X-Google-Smtp-Source: ABdhPJxLtucAfG+FxkScfa6moP1LwmHWvEclG3a+1wVfx1QwQ6I77XXdZnR3W9oi6ndKMIYI1e0iyw==
X-Received: by 2002:a63:90c9:0:b0:3fc:f0c9:d0f with SMTP id
 a192-20020a6390c9000000b003fcf0c90d0fmr24091360pge.608.1654634772915; 
 Tue, 07 Jun 2022 13:46:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/53] semihosting: Remove GDB_O_BINARY
Date: Tue,  7 Jun 2022 13:45:19 -0700
Message-Id: <20220607204557.658541-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The value is zero, and gdb always opens files in binary mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index cebbad2355..92c1375b15 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -92,21 +92,20 @@
 #define GDB_O_APPEND  0x008
 #define GDB_O_CREAT   0x200
 #define GDB_O_TRUNC   0x400
-#define GDB_O_BINARY  0
 
 static int gdb_open_modeflags[12] = {
     GDB_O_RDONLY,
-    GDB_O_RDONLY | GDB_O_BINARY,
+    GDB_O_RDONLY,
+    GDB_O_RDWR,
     GDB_O_RDWR,
-    GDB_O_RDWR | GDB_O_BINARY,
     GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
-    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
-    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
     GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
-    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
-    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
 };
 
 static int open_modeflags[12] = {
-- 
2.34.1


