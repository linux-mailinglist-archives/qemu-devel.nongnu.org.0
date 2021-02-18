Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E35531F31B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:31:45 +0100 (CET)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsls-0000Vl-9o
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjN-0007d3-Ma
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjM-0003AP-4o
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id x16so5125956wmk.3
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWEzlOjuX0padjF5jmJWlKBlFUrkpDO3sa2VHTewRFM=;
 b=cfGrCKROdWsp8c+1vxcVc/rxpe5apTe9y67VYuVPhT02OTvyb49jaPz/jVBMWAfUuA
 A/CRcC4IaAnngaTY3QjW2v7xKD85QUe8XI+DWMQ7PQK9AFM95stso3G38Dzpt/XGUHef
 Lm3AABQJTheLakwNRMHouC5JXJ48v0AOposy1b4Hk0D52XsVjs4i5XbrHL8Arvf7K5Oq
 YSj9qwnxG0KSmesmXKh8aEgG0NANmn4o7UHB8t1jGyUZ4ACA1QbvGtch3onSbn/fgPqP
 odTFMX1Ko7h3xF4b5CV1gaE7ykUYL6hqBJ1Rf+unQov7SrJVB2azclaQjd4l2Tp38U+6
 IeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HWEzlOjuX0padjF5jmJWlKBlFUrkpDO3sa2VHTewRFM=;
 b=eniF+jqp8jPlUTntpCkXWO+5sizN7mgPNZ/A+g/4za1bA5gx2br0lP2c6nWe7ESVBU
 hORLOKJsJVLG3YU1jEFCJuXtgAfBnFTCal9MG/lREBi7FxgWRWGSiV5q+pQodazvtCpa
 HUvatyil2t8XG/cyIt6R/eXSZQDgRzjyyPHSmg5vL9wCMCh7cameiZjjuQbWkfCOLBVt
 3u9Bw8ESTEDJ/9Lcx1peblHlugFrHNRm1jl0EurzZyyFTO0w093uAHvran3NjbvKnz4w
 yb6032ul7UHGoFyQraMEk7t3XwQMiVzz3H46K/7vTaqpDVtDPZWbBKzwh+a7+5PTjqKC
 k8Fw==
X-Gm-Message-State: AOAM533d1fF1XKLMga+XBFnjP9nLhmJIIYpGYBlwTwLhSSSsRMtxSlAP
 mPr3jcou4aHr5Lay3pvdyxjhht0MRoE=
X-Google-Smtp-Source: ABdhPJzkIqVjTK1WpSmMcBlUqsKWoDrgzrHQdtw3ebEeOakCKmm09zT95WzUogU5qo9OpVR+5vQm/Q==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr5539614wma.37.1613690945331;
 Thu, 18 Feb 2021 15:29:05 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b83sm4507958wmd.4.2021.02.18.15.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:29:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/5] tcg/tci: Merge identical cases in generation (load/store
 opcodes)
Date: Fri, 19 Feb 2021 00:28:40 +0100
Message-Id: <20210218232840.1760806-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
References: <20210218232840.1760806-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 5/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci/tcg-target.c.inc | 49 ++++++++++++----------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f9893b9539e..c79f9c32d8b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -440,25 +440,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[5]);   /* condition */
         break;
 #endif
-    case INDEX_op_ld8u_i32:
-    case INDEX_op_ld8s_i32:
-    case INDEX_op_ld16u_i32:
-    case INDEX_op_ld16s_i32:
+
+    CASE_32_64(ld8u)
+    CASE_32_64(ld8s)
+    CASE_32_64(ld16u)
+    CASE_32_64(ld16s)
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
+    CASE_64(ld32u)
+    CASE_64(ld32s)
+    CASE_64(ld)
+    CASE_32_64(st8)
+    CASE_32_64(st16)
     case INDEX_op_st_i32:
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
+    CASE_64(st32)
+    CASE_64(st)
         stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
@@ -552,24 +547,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #endif
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
-    case INDEX_op_qemu_ld_i64:
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
     case INDEX_op_qemu_st_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
@@ -578,6 +555,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         tcg_out_i(s, *args++);
         break;
+
+    case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
         tcg_out_r(s, *args++);
         if (TCG_TARGET_REG_BITS == 32) {
-- 
2.26.2


