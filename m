Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C3591552
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:12:07 +0200 (CEST)
Received: from localhost ([::1]:52622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZ8g-0000Qa-Nj
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4z-0003Ro-8V
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4x-0006Wj-OR
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pm17so1668831pjb.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=OQ7J/JI1OdHSWBWyuLgDtL/ikbkEDHi2vq/ft4iirzEC4Msm1V8ZRm+nDNnkVutrRD
 kFYT3VwHw8xQB5xKk1kkKxmwjVQx/QMvKQNQ6h2B9oB6Y/BcGY6T7ZFyM3sabmQXJzn5
 +nS7AUwMDM1kyVf9Q30lIDSoPTgNkUe3zhpTVe9KAUEJasXx6RzD3oHgS4p2clkUI5p/
 7WulnjqLpQUav4+vlqR6EaLTPa221IKEOJtfOkavrqS3+gDYesmFzzxP6gA50DJ1ccMY
 4RJRAnb5FGUyCgVqka98bb7DbHiS9ImuWrsJHC8h8Kp14mV0qB3b9vyTQpjjcDkLVuUX
 CgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=qWOwkQdJYAKNhEAzyhWUxhVzvnBKOEnTii+NNNnmvR78uiMe17WphYbwZLomrQL0bV
 259oPoqN2wTFXMa1K50C6YhWA4kw9NgpD+WqcolSIsm5TYTdlY9S4Svk25XlL1EQJVfx
 ek+MUjMCSSce79AX1iL4UJoyF7f+pyHjRmRZEYbZWQBcs1wUda88zJH9HPREwIjmtD+j
 4vSyDwYKPRytPm6dD+3i3lI0f8kfia0x/TDvo0bzjy5ZFdSxD/B8aWsEW1azMY4wk6Ep
 EqBfRbuRLoOqVhOcG8ykG1GC5TpHp17zbNEpdX52v4W4czi4wVYvtkLwg9Zv77TFSrS0
 rRRA==
X-Gm-Message-State: ACgBeo0Bf6HwVnTYU2Uh2DDAvS2Aof5M+hNASVMzZGJcyNp1JV/bs2UT
 Ralx0Kmf5cZgkFf+Cb399ylCzjLHp1Co3g==
X-Google-Smtp-Source: AA6agR6eGoGrlZnsaw7ERZC8wI9r5hyP055AoZGxLxeLwA4RWxYF27SHQ8ZtPXyhkmcHkZ/3UbYW5w==
X-Received: by 2002:a17:903:2cb:b0:171:4f0d:beb6 with SMTP id
 s11-20020a17090302cb00b001714f0dbeb6mr5155131plk.53.1660327694468; 
 Fri, 12 Aug 2022 11:08:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 05/21] tests/tcg/i386: Move smc_code2 to an executable
 section
Date: Fri, 12 Aug 2022 11:07:50 -0700
Message-Id: <20220812180806.2128593-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1


