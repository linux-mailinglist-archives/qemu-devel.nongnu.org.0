Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8695362831
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:03:17 +0200 (CEST)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTkK-0005U8-Ga
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThK-0003PD-J0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThD-0004Bz-6k
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:09 -0400
Received: by mail-pg1-x533.google.com with SMTP id p2so4354150pgh.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=mqcwaLZi+d0arlLA76I0vNPvphyZbetckfBnxaXTcWRftAQ2HzZJ9PqkWxg4SRPlaN
 ECBpjIC4VE+g/A+TitNpkDchAKtSmvBiV6gbSq8HMSqTFUF/yTlNy8xUis0hi51HBkRq
 zvYon89rXn/aqgB80ArZPQ+YyCgnDF3PG6RR+iLwAI8kTQ/jAzE55darLNtnZIT6Wy3G
 5kFmj0DgViXe8tjDT9dsR/dbUC2MYRDL81xlypJC47FQ82oQ8VDWKR2XTQfIs+QQpU2m
 7VM0RCVY9Vkgt5h3HzuzUKCMJbJkebF88GjXtkz+ietmoWwG1sxhPcKBrSfndUrEBM/E
 xATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=h+0/duOYFUmqYO8RobVExAnO92mR30+t461QgO6Ag3rw2dTqRrSs2yO9hYkJFMrI7V
 XduKYT6PYHN+d9qwkjvmF2abIxwHcCq1ljqln8gGzPBc3qn1zKXEyN3Zz5NGul87J6TX
 JYLUfLjZC3r2jpT7jGOvTig+N7VGDiwpXrSeOJ6e749UOJgBb30er9qjEOTkwlDFgcvQ
 ly6PXOZlC7tSJdcfRBWxHSEgYikwxDh8BzBLLquR9wIbqiPHNL0oiZLgg+z4wYwq282R
 GiX8vrz7JWkcGCWJY3a1wjXdaSJF3zVDkE6M2rs4soNB3Pd7zA7F0R8ScjjD8wOOwSHg
 oZTQ==
X-Gm-Message-State: AOAM531LiIWNu399p7oKdAxXMisY/wlJsjVN+83MEyN9TfZ4RIEtK7Cw
 jzLyCKHfOeVr5X6+hhKEWfK8/EVXthHGxA==
X-Google-Smtp-Source: ABdhPJwIv/y9xjEuncYY2Cf30IMrZ/5siiPFNRuL7fbKHnl2kfxSxJPa7iL5FzgMENGm5BBxJY/79g==
X-Received: by 2002:aa7:8c57:0:b029:246:730a:5607 with SMTP id
 e23-20020aa78c570000b0290246730a5607mr9355991pfd.74.1618599601816; 
 Fri, 16 Apr 2021 12:00:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/30] target/arm: Fix decode of align in VLDST_single
Date: Fri, 16 Apr 2021 11:59:30 -0700
Message-Id: <20210416185959.1520974-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..0e5828744b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1


