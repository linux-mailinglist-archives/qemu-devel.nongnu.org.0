Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C363A5E85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:45:47 +0200 (CEST)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiE6-0007j7-LD
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6i-000254-8y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:08 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6e-0003Ub-7i
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:07 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g6so10024594pfq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4DK6YQsyP2TgsSpoYuX8S0y+YBX8JV6DUGLMLbaWI8M=;
 b=NMUo5BkXtMOLjG7doIxADaXldMtayo93V6KOKIndFS6FHxdLAUUH4Ev2GE+DkUJurT
 FD5vABkRLGmeTLMzkIsvvA5P24mHYcFDQHkqA0evcxHooGdR5DEn/rIBWtiCfrwdGYcE
 k3Xgmj97tbkwdUaXvZeQ9ntCFen8DCZKi14fQHFIqYjX4v8QT2UJEBls62v8yPI2VGuN
 Xcj3OuXztXZMJSxWhAANBplbD3ay5kWK6F6pSLnCcKmRUA4PddqIwxkfrde/bW+fcY3O
 SQjieZPqz+uah6oUGkC4fG9D+gQ0pK0K6qco3kh1i3udtBe1Xqy0HiBYLL1HzNuuwn4w
 OraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DK6YQsyP2TgsSpoYuX8S0y+YBX8JV6DUGLMLbaWI8M=;
 b=MiRaVouaTePSeP4fZBtECDSUMrqCTARfEeQs7V5r96xLLkqTZ2UNXrElfBfhIqzgid
 mIrkeFaq/Yg8Ka4vAOvfR9h3CCj7v4Acgfg2Y3MZ0ueRWKiE1Mieb0ovL93Tj19f4djD
 P0eE80p7CF3vqpN+E6wyjbxU3XRo73Ge6INOkOnyQXzfSn9n1rt4ulWsHoDty8tx9I69
 ib2b7YEV3OsgTY/E3NsuOaUZe4Tch747MNf3OZA64oppvrqRMh5bpLbgffv3wA/ljBK5
 8t9fwYw2PnlvFGeuvPdKWJAKGtVmT5nyTqopF9lPLpp656hRCLV3ec/zGqJWplV4IJFD
 xs8A==
X-Gm-Message-State: AOAM532VF6SJ5YnQunNA2kITCsFuwVMS/qRJEmxaT6ivVKuM17ojyy6e
 Bdy1xdQSM41lsVHB7eyOHGYoYtKMBw9juw==
X-Google-Smtp-Source: ABdhPJyAlE5m1N/dY2pNnCfX3dhZdzfpAXuzS0DCvbV8iwK6Cp6mcET0LN+dky6/sokwdE90qMfgfw==
X-Received: by 2002:a65:520a:: with SMTP id o10mr16194565pgp.172.1623659882819; 
 Mon, 14 Jun 2021 01:38:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/28] tcg/i386: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:34 -0700
Message-Id: <20210614083800.1166166-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Retain the current rorw bswap16 expansion for the zero-in/zero-out case.
Otherwise, perform a wider bswap plus a right-shift or extend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 34113388ef..98d924b91a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2421,10 +2421,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     OP_32_64(bswap16):
-        tcg_out_rolw_8(s, a0);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            if (rexw) {
+                tcg_out_bswap64(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR + rexw, a0, 48);
+            } else {
+                tcg_out_bswap32(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR, a0, 16);
+            }
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_bswap32(s, a0);
+            tcg_out_shifti(s, SHIFT_SHR, a0, 16);
+        } else {
+            tcg_out_rolw_8(s, a0);
+        }
         break;
     OP_32_64(bswap32):
         tcg_out_bswap32(s, a0);
+        if (rexw && (a2 & TCG_BSWAP_OS)) {
+            tcg_out_ext32s(s, a0, a0);
+        }
         break;
 
     OP_32_64(neg):
-- 
2.25.1


