Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEB3AF947
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:25:55 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTIg-0006eW-82
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC8-00012M-3j
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC4-0005zv-G4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e22so9217604pgv.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/ejmvPg+vmROgq70KH/tbjTwCCjsvsFjg17XJyJI/Y=;
 b=oFda8L2qJhd/CqoTHlA6OVWaudHu99+9rYznhORIb/RYN56Aqf0MSjlfdfVzzAAp1f
 sfs+1XXW3/TMyURrP+JmUWlKwJVpGAd6LwLJk8XUHdOJuUCohzYSW4Z6N5ASLKAevYBV
 IVoHlfuYkBN2D6pv5vBv0qaSncaXMb+hJ9V5Ho6vGNttIWN/BA13sPq9CtUxlp8eYoYt
 QWLt6gykjhZ6TNYn/G71ET6/rV8HSy3iYg7YG5DqQc1jPnSOVOuNduPmNyhrf5cLqWKk
 6qetOMNGgOR2+/ifK7VBdhUdVjQ4+6A89KwJwe42fTyugYoPErpwfviTlYjHZf1ncR67
 53ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/ejmvPg+vmROgq70KH/tbjTwCCjsvsFjg17XJyJI/Y=;
 b=SPBhWxVc54/UdrLg6punqMXGZpO9g6OoooqKR2EyUQb/C72mqUwLJhPQLi0f9hLeBz
 jcu/SxGerfndC0LE/TC9MYPGOgoCgF2hVK33rAOTpMwPiw/w8KRcNOqb4tGQBD2S20Kc
 y1NODFRMn3FQc+FgNxr4JAt/bbgpOHyKXuCNWDb5yJD0MemYgdkOOAYizW8C3LokQB2G
 PesnrM2QKrDZN+wdrs6wqogiIUK58bWUkw1h0IIShKCWEHvGmxPKk532P45QOR9kqcXd
 GUSy8Lh501Mj8YaiVuqWOkGrMM5QJQ07ms+naBrfv70Q806QlGn8Xhg3eYq16ctjLrZF
 jsmg==
X-Gm-Message-State: AOAM533+XLosn5P9tTFLldPIrYQ7TNgs7TDHct5Yi+q4KzvwF9oo4NZn
 sGg27q7mjwzAal7K2wWjj1cniG1jtQJyNg==
X-Google-Smtp-Source: ABdhPJwZXDveZXbTH0gxFJtduerRUZLlczt4unFLxai+e36+n6qbGfTihhI83MSLV9lptiidKEHaSg==
X-Received: by 2002:aa7:8e18:0:b029:2ec:a754:570e with SMTP id
 c24-20020aa78e180000b02902eca754570emr603287pfr.38.1624317543161; 
 Mon, 21 Jun 2021 16:19:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/29] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
Date: Mon, 21 Jun 2021 16:18:39 -0700
Message-Id: <20210621231849.1871164-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform any required sign-extension via TCG_BSWAP_OS.

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


