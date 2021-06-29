Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532923B78FE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:59:17 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJt6-0006hq-Cw
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwf-0004AC-Jk
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:53 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwM-00030x-PP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:52 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so2609222pjb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqcIH7qyxMLCC/xbyp4OcZdnc1e2Y1iNmkzCM4CoVhg=;
 b=WlBo8Bo8YXuU9RjQWy4jkn+1reyL52IKjAopoye4YTadviBhzeYh4LO4s6YtmyeziD
 JC1WM6aixncYYqDhWUDAQ4EZnt9i3nJ9foXgfpeit2tAZp8piX0UlCNSSlwhy8EJLwdC
 QThbiPv6F0RwO/TFnsTGqBYDsx5q0FIs9AqQsSXuEfk9AYrXX/9YAAeVvwenpQvmuf4p
 p0jKgsoPDYovtc7XP8genmR8FlB+fgV3CY0mBWWe3uOJPmV/6aOnkLn3/+hL8M9O6ZX5
 omqI80fv/H8L1Vk1VM3xGIkR3XZVkDj1ap4F/gUFNKT+0vHEHwI0yAtoFwl9wh9CVyuS
 ZuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqcIH7qyxMLCC/xbyp4OcZdnc1e2Y1iNmkzCM4CoVhg=;
 b=Eze5nQajjO3hqG05LrNUlZxQ2ThdX5XBTP2vvMK6a4sp5zG+DaNB/hV7x7pHVxmchz
 vH8Z/7y3OaqCFo/PFnOaFs79PYbf8Un2DhslraN2AoyuiR/B414BQSTMFhnLlGvOMZjA
 xQ5q9UAFlRtJsX2rJzrlYJw4aphMaoT7pqLhfKHGRowrNoRY9EKyXi7POvep2E1hhLVB
 /QcA7Z+SztwesFj4YpShDrH7PAKb356iqtZT35yH2o3hNOVjtzs6wUJh0dizx/iQtUL5
 222v0bI4aRFrWPLDuxeSvAJ3cgUtk6GJLF9BsLTXqmVZvninR0qNz2J7AGJgnQ3jYyTS
 fbzA==
X-Gm-Message-State: AOAM533uVu6tKduSjI3a/P8Zy5Ud8hFDIcGF4RawQ6YJL9wvYDAG8S3v
 VBoxoI2RnBQro9pr9QMqgC3zhm74G1F7YA==
X-Google-Smtp-Source: ABdhPJzoDpDdZlWboP1RIfdNT40AprQmIshi6s+iAu82XzM9zOKpyRacSm8s8NWMdP7envpHurwc8w==
X-Received: by 2002:a17:902:bd03:b029:11c:d504:c1ce with SMTP id
 p3-20020a170902bd03b029011cd504c1cemr28841666pls.7.1624993112813; 
 Tue, 29 Jun 2021 11:58:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/63] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
Date: Tue, 29 Jun 2021 11:54:45 -0700
Message-Id: <20210629185455.3131172-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform any required sign-extension via TCG_BSWAP_OS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 949cbf2f03..0eac2d1969 100644
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


