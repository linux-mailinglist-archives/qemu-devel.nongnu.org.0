Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB555BF0B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:24:49 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65aa-0005uE-NA
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FG-0002nT-0x
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FE-0008Jt-BZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so11321501pju.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8Pjs5cOqk+oGTnK7FdV4C/Z/WLlWltx0dBsRwUkzCw=;
 b=Nggt7FqbmwGySBd6EoF1AsxLfQWei/HVcjh6YuzAckI99FcmRmM38KF5OUjL/BLuQw
 9lIjBp+r3fdx+bC2YLI8IultRc/35/VMBOUlZ5E6EdcE5X4gUbf1elbuWr3HTSitxGZN
 4YiEJGU7dUK5PKkVpk5OWpniD0YNaio8lBEVe3tiQVCtqSgnNfwAV03FZr82Gojr/kw6
 +YoIzXomFB8yqSi8335TlWIydPUAFLceCjQTAhTC+Bx4FaOTIaTSw2zn5f8ZJ436BKMl
 +N/AEoTdNiN35ET3B5qYwG/QM0OiLBlWufNmCZyLiABlJkqmx+JuYdYJhDaqPIMA2Lo2
 shoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8Pjs5cOqk+oGTnK7FdV4C/Z/WLlWltx0dBsRwUkzCw=;
 b=k7HfBndfH+Tfx0FHggOI5nxEvz1VfrDszrlSuef/Z1F0fO+izrykAcTmrXpWPHDgHg
 DG11435hSqMHbeF0hI5uYLw0UwYkibSzOYt9wtz9saW1eUDWHgCe18/2YzVuNGUPD0lj
 GzFmvq1qdgiKeUu4V3S07hqgJztbVT8XFQtqicWm0irQHfJE+/rJD/rRvWfSEB8eeZek
 z+qy9egJDs3T63+XQpDM9J64aPjk5Dte0EZ0jCTCyKV27j5M1RV8ExtYfN2H8Io9BVYS
 qsWjwsc6BHH9FtvhYoyVpjJBCsvRcFkFQuTgbwpaQgsGx3dVdJf4QlB1wtNwZZJakfE3
 bvOg==
X-Gm-Message-State: AJIora97Vjl3kMlcToELA4mA8aYpACYwdOltDb7DJy0r+mCB08gHm0If
 DPipcIH5OGNrKyKdZlP0Vwpp+IMnOFabeQ==
X-Google-Smtp-Source: AGRyM1sRHoLnHwLy5L54ohL/zqg49c0TC2N/J/0gzxFgw81RU+XOmTwyd2G8TLHawsIISAFelosCwA==
X-Received: by 2002:a17:90a:ac04:b0:1ec:81d2:739 with SMTP id
 o4-20020a17090aac0400b001ec81d20739mr24846127pjq.171.1656392073904; 
 Mon, 27 Jun 2022 21:54:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/60] semihosting: Clean up common_semi_flen_cb
Date: Tue, 28 Jun 2022 10:23:14 +0530
Message-Id: <20220628045403.508716-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not read from the gdb struct stat buffer if the callback is
reporting an error. Use common_semi_cb to finish returning results.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 88d6bdeaf2..cc13fcb0ef 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -346,15 +346,17 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract
-       the value. We assume the size always fit in 32 bits.  */
-    uint32_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                        (uint8_t *)&size, 4, 0);
-    size = be32_to_cpu(size);
-    common_semi_set_ret(cs, size);
-    errno = err;
-    set_swi_errno(cs, -1);
+    if (!err) {
+        /*
+         * The size is always stored in big-endian order, extract
+         * the value. We assume the size always fit in 32 bits.
+         */
+        uint32_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
+                            (uint8_t *)&size, 4, 0);
+        ret = be32_to_cpu(size);
+    }
+    common_semi_cb(cs, ret, err);
 }
 
 static int common_semi_open_guestfd;
-- 
2.34.1


