Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FD362877
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:17:07 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTxi-0007he-AX
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThs-00040G-Te
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThW-0004Qb-Bf
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h15so1257679pfv.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=B4LOV82qPNJQsvpB5aw3HxiFRhYA6LA0K602UhIr5GiIbz0d90mOgkhb5OKP/SIFSB
 JRnCHhjyTUAILmJg0vykBFbls9DSYb/nX+cGPQuuoOJwT4/c5BPOBGEb0iD7sbmjYaP0
 Dx/tuIr8L41575PnlTnGp6Rdru0I5jbiWz8fRxwW8Cyt1RqXQ3H6QFesIwIHmADThznz
 yJ1I/B5zPwFABrrZwQh/irdhGYn9HRWMsKFCHCeT0tPu7EKe5bXZ9+GmGezOjGUSji1E
 emJ0bCT0hWs/L0x0bjOhSXUf0Ow9wF37CZTPB4agvV8PXaSST8cOEbs52uzOoAqV5XLW
 JFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=UPHVcVnA2vWAjgjrN7JYaMuGnpkbcFj9zSuzptQHIEJFUdsal2/rANNW0xZuPrsU62
 sooebE3EmR22BMPB2c0jsRFm0///x+tTIvhjgGBckL9cwarqTrY7dkqfkT1Nd3d1jqMp
 GfaTR+GE1oWMjtxb+b3A1pJraFF9iwUweTKVDW0x1zHU0PL7uBITqNR5LXXKaHVxIZk9
 CHkQouYYmxuWXdBTNm2qKTINAEMVlj/rtKva2Md3SdgTijsdihrWs0tM+alqzO99oBSG
 HB/p9hfzEQFL5FcSyOHaNucx0tG+SfqS0WuoJqtWM+BGE6h6O79DaxhiR0gyBBZrmi9y
 DiSg==
X-Gm-Message-State: AOAM5313YfmcfYDqn5c0/FJqkVXy7jUvqWeztRwCmnUdjeQoftoDWXqs
 IPZnsCOwsKl+4uo1akRnGW0bJ3TmsrwQZw==
X-Google-Smtp-Source: ABdhPJwOR+kNSJ0yVjBjbTFCWt592LvjccDZBaL9kB4CVOXB0amzEJQN2N5m/wLMFIXaVt3Trz351Q==
X-Received: by 2002:a63:cd01:: with SMTP id i1mr495292pgg.262.1618599620607;
 Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/30] target/arm: Enforce alignment for VLDR/VSTR
Date: Fri, 16 Apr 2021 11:59:49 -0700
Message-Id: <20210416185959.1520974-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f50afb23e7..e20d9c7ba6 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1364,11 +1364,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1398,11 +1398,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1439,11 +1439,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1


