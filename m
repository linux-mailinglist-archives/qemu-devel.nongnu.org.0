Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9E36F8E9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:03:31 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQvi-0004hv-Fa
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUP-0007sP-G1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUA-0001MK-DV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n2so16825300wrm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2akYtI/cUJ7XE0NSSjfRTkfylAGbapeP5+zgeyJb2iE=;
 b=Dzr3wM6tqfRIxAZE2hMqxQzGT5fbtayG8iO/h6QerE7LhioWOeN2RDaem8qaP++Bos
 1dNdDTuasSEU9T8l7J/AAnMTpGsT6fxejGNu3tzt09fkBkyI/H0WMjZeQnW5HAn1KtbB
 N/xxBFh2iGn47t5iwjSsFVL0/7Zgt0STyuerKI+NZ8qtnDU6hY9OLsIXQsSXK+2+KaUT
 1tx1ctKRde3fQ/sIKDIOyuKHxsMQe/Sz2dWdw1rfJIgfNACOagi7IwQ1cYyEAVns7nIl
 O93KxZkas5v827SPJRqwu47/7UB2FfVfH65ohSLltqPRLLUa98cSuMXB9i0dC6YK9VNG
 Fdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2akYtI/cUJ7XE0NSSjfRTkfylAGbapeP5+zgeyJb2iE=;
 b=RmiHYIqbpUvxPDpv6QbuaUjrVgqLJg71oeSfkAMys7Vfk4f8jRh/OCiczBwf+Ur+iV
 F8ldOw6s/CPlhYzX2WEi/kekuz2vthSHFysv6bxAM+3QrYifnBeRjcgQ4NwTJqFzta7P
 ygNZ2PVMQGLaPwo4YfAHAS138aJpLFzuDek6LJ6d+Qt5kWn97tJYjlOHBC4NaBdrlycN
 ADzpCf3R4WpIJaSGOGgLIfrpLDUCUTOjhUi2BCNnLTtlFAeTRBiAsECmS5adpRcZZaUr
 pamEG7Xy4PRJsSNkrK6xLP+rAwj2VHxd4KfKRPIGYFfuXXyrYIH+vIxgU3ga2XKkuj/v
 7H/A==
X-Gm-Message-State: AOAM533M07y77lZRw1OEDQFi/vVuuqEIWoLQxpN63OimbLzWqb/Ek66V
 WksOdBRBJXtAavHg8M4J32N2wC/F1rLSlirn
X-Google-Smtp-Source: ABdhPJzIOdoqytQnSKySqYdE9I5mY/Usb05ymYlh8WXwpMu2ul82prvQbdsFxmj8LSFvSPO3ZFuxUQ==
X-Received: by 2002:a5d:5110:: with SMTP id s16mr5863009wrt.337.1619778899678; 
 Fri, 30 Apr 2021 03:34:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/43] target/arm: Enforce alignment for LDM/STM
Date: Fri, 30 Apr 2021 11:34:21 +0100
Message-Id: <20210430103437.4140-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5a214e35e5..9095c4a86f3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7884,7 +7884,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7959,7 +7959,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.20.1


