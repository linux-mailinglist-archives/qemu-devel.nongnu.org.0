Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8752F6BC
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:24:29 +0200 (CEST)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCuy-0006fc-GK
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCew-00033d-8H
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCeu-0004ZL-OB
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:53 -0400
Received: by mail-pf1-x430.google.com with SMTP id h13so2692523pfq.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7p7TZN47ATIiQ3A5Y3xH06vJfjCq2B+xHIDC9Ub+lo=;
 b=I4836iqDX6QoKoNTeY3XgYyWcZCv8IPJugK8o6wqtRs5gdKdT3xU1mCbymrn0dyEyh
 fWVt4MceeMaeiUllJk59/OunkltXn5p0HPjQ7Alhsp5cgOIz7fvE0FUDTz7TzFZAS6Qc
 PBC00/OHsasVF0VItTTBZce1L05YivtLd9ycQvFddjyufmp9zyt6YYn21QiAlPKaRxlL
 ordujAil4S2L8egD9/MN9+jZkQNWFaW5ZM5vlREiJo+R4Q1g2GNfjCtjiLY0mJfnd6ah
 2F2HD0SeT2NUqIxLMIVVX/VYJPJZsXTsXpELUMUR5Ir/bdv15hzk5va0B5pJXE9G1gdr
 mC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7p7TZN47ATIiQ3A5Y3xH06vJfjCq2B+xHIDC9Ub+lo=;
 b=eprIZ8BQW+GCOx6ZTbW9ZScRSngzLtDqJN8KHZkLWoUYHT9llNi5UTa8u0Z7Bm2KTy
 r9ZAS9Dxjr+X8kT36YLJBxQkIp/+ie6ZpxDju5BbOjQPlAyjFE0lCfOxUDHTvtvZkvkj
 eVCuUM+QJtFWZm0wHgMkLVnBeNam8EpJ83FOmUZNRpqErClnHEolzRMeb9Gb7jIyGuVr
 Mtt/Uy+AsSH2m7zuUKvSIdxQuIJYgPzIRS0LFS9tcwMYGGULcQzV7ZKPzyK7SOw4/fay
 RZXrZ1gPgKX9z4XveBuSJYTmmaEVKqCIg4wXtINJUOzdUYrnWhDxWMT+1vsGfIMFMZsZ
 XVLw==
X-Gm-Message-State: AOAM531ae3IYDizHzZpGWh82mvBLcoxod7baj+e+N2wP+5AVZGCLBxL2
 62VVn+XBB8JqZ6LVmmHRkWuWdlycRnmnFQ==
X-Google-Smtp-Source: ABdhPJwObgXbkU+wXFusA5QU4cAvD2RdShOW23vW8zTtWtNGDMBWlP5Z9od04k9l3Up6AN7B6fGclQ==
X-Received: by 2002:a05:6a00:1683:b0:4f7:e497:6a55 with SMTP id
 k3-20020a056a00168300b004f7e4976a55mr12546630pfc.21.1653091671443; 
 Fri, 20 May 2022 17:07:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 44/49] semihosting: Use console_in_gf for SYS_READC
Date: Fri, 20 May 2022 17:03:55 -0700
Message-Id: <20220521000400.454525-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 20d97290ff..9230c69ff2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,6 +290,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_cb(cs, ret, err);
 }
 
+static void
+common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
+{
+    if (!err) {
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint8_t ch;
+
+        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
+            ret = -1, err = EFAULT;
+        } else {
+            ret = ch;
+        }
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -415,15 +431,8 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        {
-            uint8_t ch;
-            int ret = qemu_semihosting_console_read(cs, &ch, 1);
-            if (ret == 1) {
-                common_semi_cb(cs, ch, 0);
-            } else {
-                common_semi_cb(cs, -1, EIO);
-            }
-        }
+        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
+                             common_semi_stack_bottom(cs) - 1, 1);
         break;
 
     case TARGET_SYS_ISERROR:
-- 
2.34.1


