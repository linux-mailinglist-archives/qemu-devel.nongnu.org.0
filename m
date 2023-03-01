Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5096A6619
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:01:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCin-0003j6-HR; Tue, 28 Feb 2023 22:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Y0-EJ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiO-0004Jn-Cs
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:13 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so47965pjn.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgP/VlqDeygJvTan3lYcCGUlGsSNoYjFb+BGi032whY=;
 b=NZYSrR0++HnlOriFb/fTFrSn1xs8a23uCIA7JH8RTIQrOtboLQSaD3KMolrlBxL3+1
 DUl7QyUruCydXFMQUqwJlLxnU/C4Qbjq0U9p9u42nwsey3Wnu3ZA8B01hTv5c+3W5CAm
 gV0DlEEd85N3dsKQnNAVxn5LJTtQ+i9XS8sjXCePt5sn6A5AxigVI7YLpqqgxrhewIMJ
 IW+jM9dKx3klF2OJLXrSYVV7Yq5WRHmI+wz7fGeJMF1pzspYXLojbVigB/+8TrBfoObc
 HAX58m+wSp8CS7TzBLgYkZWfliii27JvA38DNUG8AIAslLw0EBcdVR8URWbDrkNks9tj
 VtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgP/VlqDeygJvTan3lYcCGUlGsSNoYjFb+BGi032whY=;
 b=q40HmcMmExJPX8A+YmNcjQRh4xK6q7ehS3VZVnXCztqnztDn+7FSFePFJF/BYjSO00
 KsmJSnIfrLUVjWWlyl/WuJAqsdgy6IjHD6DXP5pGG3RoOA9Y5U1hguPJ3cLl6YKwcR/u
 jFf2a7Ch+uxdkXc00sVtUxixUe22/8QaJxSdcq2bOOJ4BVIpjOTAwnwRax4MkCSo84YU
 Dg4ScH5csQiUZdIprOa8lKxMmfjKYrOJrlH86uw0l5PKCPxnOj515yZMMB74n9+EniNG
 ZKYfTuxdshWFiIFGBU+KlA8qZIGrHpLMv072THmxfCqCkfpJmVrRHN7IEp9h5WNVj0Vw
 Z+1A==
X-Gm-Message-State: AO0yUKUv2RIgv879TuWCzPLfi57uaDn60EVH4D9yArRNsYtzVlvcIH7X
 6rHDpJoJHBBnqgx4x27MdTWqZgF+f4MKRysJbc8=
X-Google-Smtp-Source: AK7set+OyFR68VsPbECQkKL2f1svtP5HJW9u0yNI9bhrsHE+TPhY3p6aFDGI44rrpu/GHcnupzROXA==
X-Received: by 2002:a17:902:db0f:b0:19c:edcd:26cf with SMTP id
 m15-20020a170902db0f00b0019cedcd26cfmr6052110plx.61.1677639671053; 
 Tue, 28 Feb 2023 19:01:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 50/62] target/arm: Drop copies in gen_sve_{ldr,str}
Date: Tue, 28 Feb 2023 16:56:31 -1000
Message-Id: <20230301025643.1227244-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we now get TEMP_TB temporaries by default, we no longer
need to make copies across these loops.  These were the only
uses of new_tmp_a64_local(), so remove that as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  1 -
 target/arm/tcg/translate-a64.c |  6 ------
 target/arm/tcg/translate-sve.c | 32 --------------------------------
 3 files changed, 39 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index ad3762d1ac..ca24c39dbe 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -19,7 +19,6 @@
 #define TARGET_ARM_TRANSLATE_A64_H
 
 TCGv_i64 new_tmp_a64(DisasContext *s);
-TCGv_i64 new_tmp_a64_local(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7bbffdd1fe..f092aec801 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -436,12 +436,6 @@ TCGv_i64 new_tmp_a64(DisasContext *s)
     return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
 }
 
-TCGv_i64 new_tmp_a64_local(DisasContext *s)
-{
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_local_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
     TCGv_i64 t = new_tmp_a64(s);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 621a2abb22..02150d93e8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4344,17 +4344,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4370,11 +4359,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /*
@@ -4445,17 +4429,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4471,11 +4444,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
-- 
2.34.1


