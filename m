Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED2442C2B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:09:20 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrfL-0003bM-4A
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW3-0007Um-SC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:43 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW2-0006ri-C7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:43 -0400
Received: by mail-qk1-x734.google.com with SMTP id bm28so4082989qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kgIAZfpBiG9Bp0aRLB9BDRfUW43JbXvDwVrmE2eY/v8=;
 b=Z/NV4hhKqW0tOWm77uZhklFGUZzngF+3cAH2rjx1O4hQQZNufFkaxuuSDCSekf/AuP
 2XPE2NM1u6OZuMz/gaJ2SrTrO1Xo8ZHX9xw1ZWKHUS40Orgdl7CbiXdDSMcZagKK39Q5
 X3h8vXBC6SvXu0GEwbZvxV4q4milYL4pgyah+00DgpXExStFcyu6qjWA+A667rcOFago
 dqbeC4J9OjD9Fbng4LIhbnQFTBF8VzLBuXx1d+dmZ0G0ZPO3O2z3oZJbj3b0prm/x2Jz
 7EqZ66Yx1KJGGMKfj9RrzrLwsyIwjjDDCSv8n09mkW9FARVJPyKSDVLjtkx5nDQvx0jf
 OlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kgIAZfpBiG9Bp0aRLB9BDRfUW43JbXvDwVrmE2eY/v8=;
 b=SDGc1xWkBjAeEkAfae6z3cbuXd+he+mov2oPbwaHLImbIzT+dcq3HVJKAmtrH0Df1F
 3zTwsLxoC7wVTOVN9kZMTUKDii8Kem0Wa/54wxohfHRS/guALdGjRHaa1kOybd8OX+sd
 0YTjvZ7c1tmkScI+OMlx4D+o3BX5XCqtUXAN0jmd8UPPnwfef8xniK0Y247JHFvfuGCb
 NYTUjlgSdzeTY1AhQri8kmM66HJ7ursBvVq3jdjACDEGK1yMqTY+Ts/C9sphGtKD6K5O
 JEHINe6TyucUxlovrp81Ex7O8giTRgTsdEfFOhjcop2sCtFKqNy2kG+/wtIxPUA40JO2
 HSeg==
X-Gm-Message-State: AOAM531ULP87tmEIpqe1qLFefSVYDGA8fBls/6E5AgjuB0EPH6pSZ+nu
 MzQ+oPyceU2OEQQbw9QaWwZ7b31jWWzVNQ==
X-Google-Smtp-Source: ABdhPJxba/hCChtj3JW5asj9xBZcZH6U85IDIzSMZ1vwA9Q5JC9aDEYP3Ms+D7cZs36sZIiBxcQ5nQ==
X-Received: by 2002:a05:620a:103c:: with SMTP id
 a28mr12149541qkk.271.1635850781549; 
 Tue, 02 Nov 2021 03:59:41 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] target/arm: Introduce store_cpu_field_constant() helper
Date: Tue,  2 Nov 2021 06:59:30 -0400
Message-Id: <20211102105934.214596-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e..17af8dc95a 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -70,6 +70,9 @@ static inline void store_cpu_offset(TCGv_i32 var, int offset)
 #define store_cpu_field(var, name) \
     store_cpu_offset(var, offsetof(CPUARMState, name))
 
+#define store_cpu_field_constant(val, name) \
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env, offsetof(CPUARMState, name))
+
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
 {
-- 
2.25.1


