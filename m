Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1214D0DCB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:03:39 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPCM-0005hd-QE
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP37-0005yl-RB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:05 -0500
Received: from [2607:f8b0:4864:20::1033] (port=35665
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP35-0007sB-Vi
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso934687pjb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtJ1WVyADzX2ANKzcizHx7LgtBfPM0zU79D8VSBbj0k=;
 b=s4EPNfou54vFyO0+1hChsqhf8BJmA5RXbVlNQfU+zYejEU9If0DlvRMpLcVZmb+TY8
 6RlHIoz+a4rSOE17jz3rX9vA54a5bRvbLWzyDEwRXbak+au2sKuxuEIAMWnyGmX2F7Y/
 otDneaWUV7ygcMp7a1pOWXFCrOyOVxM+r1Zk6nGd56P1QZz31PzrB6bU/YG303Ys9+0M
 RggnHr8UfqSXR1HF6PsLhq8krd2YBT/dQhjMksRVwA7Eh6QQD1NX2kKUy3BHAZge+euL
 PCaBkc2iAyu/11VAho4Ydtp+dpSG2SDg8oAqUKo1390IPMx2K3FCbZmbCR/O3Z2KhqJr
 60sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtJ1WVyADzX2ANKzcizHx7LgtBfPM0zU79D8VSBbj0k=;
 b=I12ztX5AojfTRA8BPZbQEJ19ICd3ReSSkWRSB2M2/DavSKaykqiLE7MR9KAHUjKvzk
 HAvCqFOA+cCyTrEnkna12B5g1JkSvMwodZxkz5oD2q4WjiwOjOintRF4LiSropHlk7is
 YSXjQD395K12ZYRVDPWKAWXEYrL6ky7T3jSuR1h8ZbtYr3fv8Kqw4LuuIbyCaYHBYQNO
 0WzRYeaT322RuzGhP/EbS702IN/wmnnb/81KuGp64U6Xis1KdgJIrVeMsiN3YdKBhs47
 pNzgBumBBUd3OHOVV+EAa1054gfcTmkOmH/AFKuE84OrJjKl4NuwzXDpGdIbf8qNHYBe
 32PQ==
X-Gm-Message-State: AOAM530g6M6VJjaVYufj4W+NLWXNFoNPcEDEuBIoUKrcLjOP2TkYuiHr
 3EO9LquLiD5qtLzbVUkJyqL5tExtgwq7JQ==
X-Google-Smtp-Source: ABdhPJxqxyWsdpZ5QqnLQfP/7xqsv6wL/zIWRRV4n5gsJexa26tbZgHlX7FYbhAvwzYfquKCBuaLSg==
X-Received: by 2002:a17:902:d2ce:b0:150:19a9:d171 with SMTP id
 n14-20020a170902d2ce00b0015019a9d171mr15147623plc.155.1646704442660; 
 Mon, 07 Mar 2022 17:54:02 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/11] tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
Date: Mon,  7 Mar 2022 15:53:48 -1000
Message-Id: <20220308015358.188499-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Swap half-words (16-bit) and words (32-bit) within a larger value.
Mirrors functions of the same names within include/qemu/bitops.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  6 ++++++
 tcg/tcg-op.c         | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index caa0a63612..b09b8b4a05 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -332,6 +332,7 @@ void tcg_gen_ext8u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags);
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg);
+void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
@@ -531,6 +532,8 @@ void tcg_gen_ext32u_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
 void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
 void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg);
+void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg);
+void tcg_gen_wswap_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
@@ -1077,6 +1080,8 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_bswap32_tl tcg_gen_bswap32_i64
 #define tcg_gen_bswap64_tl tcg_gen_bswap64_i64
 #define tcg_gen_bswap_tl tcg_gen_bswap64_i64
+#define tcg_gen_hswap_tl tcg_gen_hswap_i64
+#define tcg_gen_wswap_tl tcg_gen_wswap_i64
 #define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr32_i64
 #define tcg_gen_andc_tl tcg_gen_andc_i64
@@ -1192,6 +1197,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
 #define tcg_gen_bswap32_tl(D, S, F) tcg_gen_bswap32_i32(D, S)
 #define tcg_gen_bswap_tl tcg_gen_bswap32_i32
+#define tcg_gen_hswap_tl tcg_gen_hswap_i32
 #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
 #define tcg_gen_andc_tl tcg_gen_andc_i32
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 65e1c94c2d..379adb4b9f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1056,6 +1056,12 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
     }
 }
 
+void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg)
+{
+    /* Swapping 2 16-bit elements is a rotate. */
+    tcg_gen_rotli_i32(ret, arg, 16);
+}
+
 void tcg_gen_smin_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
 {
     tcg_gen_movcond_i32(TCG_COND_LT, ret, a, b, a, b);
@@ -1792,6 +1798,30 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
     }
 }
 
+void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg)
+{
+    uint64_t m = 0x0000ffff0000ffffull;
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    /* See include/qemu/bitops.h, hswap64. */
+    tcg_gen_rotli_i64(t1, arg, 32);
+    tcg_gen_andi_i64(t0, t1, m);
+    tcg_gen_shri_i64(t1, t1, 16);
+    tcg_gen_shli_i64(t0, t0, 16);
+    tcg_gen_andi_i64(t1, t1, m);
+    tcg_gen_or_i64(ret, t0, t1);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+void tcg_gen_wswap_i64(TCGv_i64 ret, TCGv_i64 arg)
+{
+    /* Swapping 2 32-bit elements is a rotate. */
+    tcg_gen_rotli_i64(ret, arg, 32);
+}
+
 void tcg_gen_not_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
     if (TCG_TARGET_REG_BITS == 32) {
-- 
2.25.1


