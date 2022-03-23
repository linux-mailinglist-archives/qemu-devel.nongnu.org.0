Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8594E53C5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:59:55 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1Wk-00023F-BL
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:59:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ud-0007Gg-42; Wed, 23 Mar 2022 09:57:43 -0400
Received: from [2607:f8b0:4864:20::735] (port=33287
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ub-0000up-EY; Wed, 23 Mar 2022 09:57:42 -0400
Received: by mail-qk1-x735.google.com with SMTP id k125so1090847qkf.0;
 Wed, 23 Mar 2022 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YI3G43DEooYXj0cStPID1IbX8K+nJHWH4oT4vvHDMRc=;
 b=Kk/R/1IZUIHM/Lhlkii9qnxoqI3ZDL78J4TAjKJXRGQdarRJI6/Ig2CbH4ge7MSvDg
 pA8YTzeFriKhZCocqV3gEesX9yC1xz4jOnQJ4p1O4OYwXHQdS6Uo0zkUGt7cJNLLTXnt
 9MD6KJt6OkXTiibbBGhRQfhnEjavxnaMQqEKf1EVsy5iHzUOhuvAIpLDqSmOYDCw7ROt
 iSI1W5gbA8lq6vhUjd/Ih2SGm1vxqfHzOw0zMDB6irnkPwoBjkdQVLdK8nDakxe3iCzz
 XU8oiqUEMNWvffJbhRDDV8KY0oMLoKoRTl2D6jZkUN7md271U+tb9oLxMv0KhxsnrZ6K
 DEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YI3G43DEooYXj0cStPID1IbX8K+nJHWH4oT4vvHDMRc=;
 b=DCJybd3UoCdzBbXRrgXSr24OYLvgxxK2fHvMr+U0t7LccBfAE4Q13YCTFZ9N0TaBNK
 5hl6bDz3Qfrrc5pU8cTjGRzrCdQWPPZBlK9yu8tcH0TWvCPK9bSw1nxdoZFoCOtDgtQ+
 5Hc34qaX8pgk9hXbone/l5dt+MWB0CMtkdtGIcm1dFlY4pJWeC9YByqKLZot2JWoffrX
 MatwFNX+eQ5A3TVEkOg716O+xpziRy/JnNE7TlL02u2TeaOtvRGjjinmeBO1EyUjpLM3
 5R4mQ1jKr3cDZXXUY3g14Pat9WhDsHzNT3oFLjo4uBo0q5h6MDUfz5Zjzo50qQ6g6VMT
 rgSg==
X-Gm-Message-State: AOAM532oaMjgDEXZ+ZxizgFjVv9HQuCAwqSxo43rxkRh8FS2cGZ8GOhg
 YI3rUM4nH4eGALpVYsFEns06nz+2Zxo63Q==
X-Google-Smtp-Source: ABdhPJwQj0WGVrd+gnEmD+uUAQgA0WgMSW0YlFnNNNVecvzbkFpLkd0JYrpK7/M+lAFMvQp71fKAZw==
X-Received: by 2002:a05:620a:29d0:b0:680:9c1a:557a with SMTP id
 s16-20020a05620a29d000b006809c1a557amr197936qkp.646.1648043860105; 
 Wed, 23 Mar 2022 06:57:40 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:39 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 01/11] tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
Date: Wed, 23 Mar 2022 09:57:12 -0400
Message-Id: <20220323135722.1623-2-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Swap half-words (16-bit) and words (32-bit) within a larger value.
Mirrors functions of the same names within include/qemu/bitops.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
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
index 65e1c94c2d..ae336ff6c2 100644
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
+    tcg_gen_shli_i64(t0, t0, 16);
+    tcg_gen_shri_i64(t1, t1, 16);
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
2.34.1


