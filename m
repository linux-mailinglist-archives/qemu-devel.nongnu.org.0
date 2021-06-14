Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F73A5EC3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:02:29 +0200 (CEST)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiUG-0002rH-9h
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6x-0002Rt-3c
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6o-0003c2-Ie
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:22 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h12so6159007plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UVKS3oIvQJqq/m46KHoZVGeIMZjC4WFobcwJ7uSJNW4=;
 b=haD5awAve1TkWeDf8PA/dXAj/yXjjrYaYGZ8fEWUbY0kXXQ14t/7xWqIzho3NYrzKd
 uKr6HZw/vO/3qTdiHmRLeN2R7REkMFoJRK1aP5k+yXZja+uXNqaCRby5fpKJKWZLn3YF
 EIDqBjFpily6qKlTH1MvfPkwLaL/Wmi7l32B/FWy+LVon8s2rDeVlrOyls08UudSI+JQ
 A+lryCwQgRqxDdHICVqgNJ6tDV/GD6I93y4jwQysuaHFhyjKiIlkp1OWLJXrvXA4zz1u
 kcrSAplooSI784kkMdWEq3MhZid+185Qo4i8qPrJjwSzXX3DsrG6Jgfv6CbEzBdlc5Ts
 2/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVKS3oIvQJqq/m46KHoZVGeIMZjC4WFobcwJ7uSJNW4=;
 b=tODRNGyDcyB52BXAUSo/G5xzrRVe5+YSszB9C6zOQ8a17jiykMmGEVAaT4rEAB3XEj
 NgTBMzi2kYRWp3Xrtziv2erdKcWWVX7iencGyJ2Q9wOlHyCqO4F9qFtriMbqb1lfSl8+
 VDpK3g0n+MI7nNwck0AME1Pnh/wBXgke4fNSTbv0ddxOGZjb2eHfeAOl2L+k5qvW/Iqf
 OJVH6LORYgmBJ9jUArlCJCDKcfyXo3CnoNgmo9P16QqAY6kWJXZnrT4llziBOjmXwuQI
 BfokhK6A7s4nb1/rGgXpEoKe5claA4ay4lj/EHwVlZA9OUPFdTi3aNTpamzYCETPKsPj
 WHNw==
X-Gm-Message-State: AOAM532V3u33iO4rujMAG3h+oD6s9uoLJcSsLiGJN3Ebc099ow96YLqi
 tmdfcQ/BTLSmrn4//WSWDpxQBzI3pgWEfw==
X-Google-Smtp-Source: ABdhPJwiMU4mHHigurckWItxoUfSYRbBcFZUzCSA1NFhk589Q43yvUnoOCesFhJxoz2o2BNodFeHSQ==
X-Received: by 2002:a17:90a:4503:: with SMTP id
 u3mr18213194pjg.210.1623659892384; 
 Mon, 14 Jun 2021 01:38:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/28] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
Date: Mon, 14 Jun 2021 01:37:50 -0700
Message-Id: <20210614083800.1166166-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform any required sign-extension via TCG_BSWAP_OS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 3763285bb0..702da7afb7 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2876,7 +2876,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         memop &= ~MO_BSWAP;
-        /* The bswap primitive requires zero-extended input.  */
+        /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SSIZE) == MO_SW) {
             memop &= ~MO_SIGN;
         }
@@ -2889,10 +2889,9 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i32(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext16s_i32(val, val);
-            }
+            tcg_gen_bswap16_i32(val, val, (orig_memop & MO_SIGN
+                                           ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                                           : TCG_BSWAP_IZ | TCG_BSWAP_OZ));
             break;
         case MO_32:
             tcg_gen_bswap32_i32(val, val);
@@ -2965,7 +2964,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         memop &= ~MO_BSWAP;
-        /* The bswap primitive requires zero-extended input.  */
+        /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SIGN) && (memop & MO_SIZE) < MO_64) {
             memop &= ~MO_SIGN;
         }
@@ -2976,18 +2975,15 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     plugin_gen_mem_callbacks(addr, info);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
+        int flags = (orig_memop & MO_SIGN
+                     ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                     : TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext16s_i64(val, val);
-            }
+            tcg_gen_bswap16_i64(val, val, flags);
             break;
         case MO_32:
-            tcg_gen_bswap32_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext32s_i64(val, val);
-            }
+            tcg_gen_bswap32_i64(val, val, flags);
             break;
         case MO_64:
             tcg_gen_bswap64_i64(val, val);
-- 
2.25.1


