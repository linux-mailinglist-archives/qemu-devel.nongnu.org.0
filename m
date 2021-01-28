Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88ED30818C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:56:24 +0100 (CET)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GD9-0002rS-Tv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzc-0005eE-UF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:24 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzM-0008A8-1X
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:24 -0500
Received: by mail-pg1-x52e.google.com with SMTP id i7so5277695pgc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZJGnXzF/NMDb1ycGSuuM5DTXpfVPEQ3f0lC4BF0AxI=;
 b=pbRkK3IaVOuCPYjmdn+qbJWZnZgI2Vlttcs3pu6ylmrf1y/64VpXi4t4gaEQM24GvZ
 UdMXOjgPcTYCt+LFPBIJ/4yrufITKEwp0RGkyumSrwa/YFiua2QBX/oEnd7c81LyvdWv
 W2Z8weYXAGOtMABscklC8UtbqUXw2EzANfMpKkcMtgwJS4CkstXyt0cThA9fEXnRVFWw
 BdMrz3EmnXIKlccxWr4/PxU+dcp5gYWfYzAI16D5WDpe5tRhhwNMZn/Tx3F9aBc0c0ls
 QEWFLldga2q4QtMkVVL29PB799q0io14N86sLuffUu20kvkN0yI4Cool7DzVvB0Pu9EL
 7Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZJGnXzF/NMDb1ycGSuuM5DTXpfVPEQ3f0lC4BF0AxI=;
 b=sq+GerO1GM0aZCrL4FNIwYXKaOvU21wcUQ/lpBYybwoCjxg8RZnmcoNvshvsEI8kyO
 trBzAWxXtPdsXtmNukv6uXkH8exyst+kPm4bL/17RAqJg8zAtOUu09oJEdCYFEPXxnym
 Xtk5kjmdSCkYUEVfT5gtk4B1LGsvOEBdQ56++tkF3CuiTEQv6GmIhJGS5Fbiym8rV9eh
 Az3jNgmmu3xkZYdZe+ApX9cHLorBeecUoSrVlyc5y9wrkV/Er7cIAg8QEre8KTqxT/+v
 MV+emTDGQvJLZi0zaMacSz5IwN3ufEGDu7WRuty4mzTj0iROxUazOwLmP9NANuGyMSC/
 xUag==
X-Gm-Message-State: AOAM531mbxETMjXdSb51v6YIbTB514LpXxgqRSkL3sLlXg14J6g/a+zx
 VQaT0FgnW7390PzIwLg+CB30NsofXUKMcf0c
X-Google-Smtp-Source: ABdhPJwWbvaAdkhaD+Z/Pg1aN8jbMqy8bUivAxx8cppd4NYOsAqKZ6VJAA8c9go2Civ1HOkpo9bJOQ==
X-Received: by 2002:a63:1865:: with SMTP id 37mr1595347pgy.206.1611873726197; 
 Thu, 28 Jan 2021 14:42:06 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/23] target/arm: Improve gen_top_byte_ignore
Date: Thu, 28 Jan 2021 12:41:31 -1000
Message-Id: <20210128224141.638790-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d7..3ec0dc17d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -183,17 +183,20 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
         /* Sign-extend from bit 55.  */
         tcg_gen_sextract_i64(dst, src, 0, 56);
 
-        if (tbi != 3) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-            /*
-             * The two TBI bits differ.
-             * If tbi0, then !tbi1: only use the extension if positive.
-             * if !tbi0, then tbi1: only use the extension if negative.
-             */
-            tcg_gen_movcond_i64(tbi == 1 ? TCG_COND_GE : TCG_COND_LT,
-                                dst, dst, tcg_zero, dst, src);
-            tcg_temp_free_i64(tcg_zero);
+        switch (tbi) {
+        case 1:
+            /* tbi0 but !tbi1: only use the extension if positive */
+            tcg_gen_and_i64(dst, dst, src);
+            break;
+        case 2:
+            /* !tbi0 but tbi1: only use the extension if negative */
+            tcg_gen_or_i64(dst, dst, src);
+            break;
+        case 3:
+            /* tbi0 and tbi1: always use the extension */
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
-- 
2.25.1


