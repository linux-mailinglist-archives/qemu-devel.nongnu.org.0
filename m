Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2C4E3549
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:14:43 +0100 (CET)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWSAc-0003WM-Rf
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:14:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007pq-Bw; Mon, 21 Mar 2022 20:05:11 -0400
Received: from [2607:f8b0:4864:20::734] (port=42778
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1F-0007Hc-26; Mon, 21 Mar 2022 20:05:04 -0400
Received: by mail-qk1-x734.google.com with SMTP id 85so12905109qkm.9;
 Mon, 21 Mar 2022 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YI3G43DEooYXj0cStPID1IbX8K+nJHWH4oT4vvHDMRc=;
 b=FD7cPOjDqAFbKRpJOvC8ZbBQ5w+iIPWr47HK+1MZabiYOvjDU4ad8yjTOgDO8CzevT
 DAawlE1DehW2G9JePssB+CL6+Ny+VAwsBrz/BjcbYz+y84GXlrcnbdSC5d/2NxbdnI+b
 ypr4/1JLPF5+3fChITXrL3Ag/RH0+1f9r36abS4GCO7A2TE+vWk9eITPnHj+1TwzC2Qy
 nu8xRR+I6jiRvkQ/SD/VHZAQxvCWVJN8Ev/mb2oOJw7J1kD9c8eXs8nJctvVEJ7Vxr4I
 CTzVqm4Oqxu0TuJSbSC5bezYHYNnYTbr5seymHEFDOKWLFEiI2ZRPDrehMA7HljOWkxV
 Y70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YI3G43DEooYXj0cStPID1IbX8K+nJHWH4oT4vvHDMRc=;
 b=xBOpfjfGNv4Erbj3heGNsvPZIKQwoYd8is4Lc231MkMad1ThXXKd0NjOelf6yJ5Hi5
 1YcqT524tdKwZ6d16QEckfAk7IrbjzLM5hIddgypzN5aK7UTt96M9308+0x7E5IRYLeg
 JULoMk8tdyNXq2sxzrr/sW6JAzHn64RwFX2nClGe453HseWi/hLGRbfEsq2ltjuzRBDn
 IImLcLf0uRcvYhwI4w8KoRFC56/8ytaFPPk6RRebEm2mn8jKtoCTHzdvIB379d5AL4X+
 49UKVk/UfwZDKOPRTZQlkWIz3tk+wg6uEq04i0HWV5TgIU2U5HyYCwn2vcMvduj2eUaQ
 o6iA==
X-Gm-Message-State: AOAM5326t0vWyEQ6sdf0q3H7/x8NO6vBoXybl6LD2s0Xo1fm4uGoIQU+
 dvKD7addlMBQbnPspSgJ6lwP8AQ2h8gRUw==
X-Google-Smtp-Source: ABdhPJyMDe8pVl2LtmjcWBeDvz5k7GhthO9+kMqPk+fR6DMIUo/aXRAOSlBYTaTEwzR1U80sDkhAUg==
X-Received: by 2002:a37:a556:0:b0:67e:b484:135d with SMTP id
 o83-20020a37a556000000b0067eb484135dmr2146952qke.576.1647907495175; 
 Mon, 21 Mar 2022 17:04:55 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:54 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
Date: Mon, 21 Mar 2022 20:04:31 -0400
Message-Id: <20220322000441.26495-2-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x734.google.com
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


