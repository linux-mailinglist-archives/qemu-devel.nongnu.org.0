Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5D2F1F62
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:32:30 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2vV-0007i7-3G
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S2-0006KI-36
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:02 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rw-0006TC-5F
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:01 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y12so102966pji.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+VZ34zw/gJ5eF9hiq6PjNGF/Zdf/LyRPrp4QbqxhsNY=;
 b=UTkxvt+qVNsEy8H580vKPZh1VXl1wdWywnr8powCEkGoe29AC2yEk1/q69xuBFW3GI
 bnh0eRwEWMGCOppsK5LDYWjMUwIpMR2v4ey9M4L8yD9VPTBYGd5UTC8C4iuZUrWNJFjK
 RkPfbJO9GoQsqU6QOIaTJdUAqYX5NAR/Aj6pbhOIiump9a1yAZXdFMHpwgqR+pKY0VrG
 nwR8ESLfRU2vNvSY964iAr7OfPtM4fbIEBelPnUplBSUHBiOj4onzlRwPhau2tZkm1bF
 YAUdrjV1C4JEo3hc++LZQm1fv1aQZWq7aAwPpGwuQHLkDazyss5C2fYb3sgNeXqmmRvt
 b8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+VZ34zw/gJ5eF9hiq6PjNGF/Zdf/LyRPrp4QbqxhsNY=;
 b=GMKnazdKARi3jee6B9SNmsPeuBXta6kLxXm3gwW/esDUZB7UmfB33gWyWVrY1iNwE4
 LAJwLb0gRvPGlE/fs9RMjewTquqx/PELAUNInEDCf6PbL8rl+uktUj1uRlL6TdZ072ZA
 mfz4U3E5y9l2AHYhrxRIbRp60nIHs+3FT4D5ziTIAaVFTD/iQopA2RdZoMUfugDbK9cW
 k55kRe7S1asqGlN344BQ1eqgBY6cYGbPrBGiacR1s+1cMM/yJnQIp8BrqC/4hUNLtTRD
 vuTJVCjQqjs86ZWbVyV7SE11Nd1Dw0SaTGUV/qjIj5vFr+NwWD9bHng/r7Urh9DTuaNj
 ngwQ==
X-Gm-Message-State: AOAM530oi+cAynSuc0hkAoJ1X+epgBfJqMTGO79h4NIzfligTjiJBAIU
 UF/nnfZthjkmGmiujeuGL37UwO4RALSWRQ==
X-Google-Smtp-Source: ABdhPJyk6GCakzYN06H9LtDcfp+0yaaTC1IVVbQkJ0+5kVWi87mego8Rzdu7E7rr4zbdSv3QWPxB5w==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr309212pjb.174.1610391707934; 
 Mon, 11 Jan 2021 11:01:47 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/30] target/arm: Enforce alignment for SRS
Date: Mon, 11 Jan 2021 09:01:01 -1000
Message-Id: <20210111190113.303726-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0d543ec1f..3057d102f2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5170,11 +5170,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1


