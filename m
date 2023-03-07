Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B781F6AEDC3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe5-00038G-NR; Tue, 07 Mar 2023 13:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdy-0002LD-MM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:34 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdw-00014C-V1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y2so14036031pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=im/F4vDBZlckAbIhl2MUOPmZWNKlDivZpMR3K1n8Z88=;
 b=DZSOB4cQE9/l5C6FXn/p2aTrPIO227tWvARuvdvSanYMp7GfNuQqdK/zq0lt/wzkfl
 Yr4RwMNw3snWHz8phI64U6liMF8MHBztct4SZqmzyTmYmzLNy25epECG6jHFAfFUiF7C
 kY+mH44y60r93o2OGju+yBNv8QP1o4Hp1M1Oicefq8NMe4vSMIPOYKzdgS95clDw+bOh
 QBR3+byWGZKxlN/JORGJG9xTHdyoKWDQ1xdDwabkgUWjP5MQlWxV4ocqRi3ldTl37lC2
 rwFPJFOS3PtNRaqdk3llkvEKYUVvtSnhLjCS7BzbSuxkT+G+AZcwC+AeHX4RkvW+N6MC
 yCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=im/F4vDBZlckAbIhl2MUOPmZWNKlDivZpMR3K1n8Z88=;
 b=Wj438d2xTrQskXpYK1J6cBHbvA4zBBFtPzDrRfdqlzflGj1U6+K0lu6MMABQwC8KSj
 93OcNarW73+M+FmbBAtx5da2z4cen6tTK4ukDTd7JZFnck4x25CpVDdBoDAbUgZow4kS
 ATsrA76pHaTYnqegWeMdRjcY9AF7aWTbSEztnX7qQL2bIgOI74FHZCmrVGYNNisOwArh
 axYcnGsO3u00NdwQNlsuIVq9cub1pCsG4TuzL7iQj7fdUXQKzypIT7wKw4SYr9I85dsU
 vyvYGdkuJeflt1fqcmv7ilSPkuShgR4ZzlUiHD24S/u+cjakGs4U9VNhIyweSROB0qaw
 iALw==
X-Gm-Message-State: AO0yUKUcXrdFQ0jlMSlwiDnAP478iugW1nDVqQ5pM8cJa8GUQ+XT+rD1
 HKuGLDztuYzbJn+XF7E9lIX8ADfPVumX3ZSPkAg=
X-Google-Smtp-Source: AK7set/PADietUkHVeuSv2GXSvlqY0+gZA8BwiKyD4x867OiPMR+WKUWr+jHkprJYHqutzRLf0OU1g==
X-Received: by 2002:a05:6a20:7fa5:b0:cc:ce95:7db5 with SMTP id
 d37-20020a056a207fa500b000ccce957db5mr15896531pzj.57.1678212152111; 
 Tue, 07 Mar 2023 10:02:32 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 53/67] target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
Date: Tue,  7 Mar 2023 09:58:34 -0800
Message-Id: <20230307175848.2508955-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ee656d6a44..7af6d7217d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -906,7 +906,6 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     hi = tcg_temp_new_i64();
     lo = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    t1 = tcg_const_i64(0);
 
     get_avr64(lo, a->vra, false);
     get_avr64(hi, a->vra, true);
@@ -917,7 +916,10 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     if (right) {
         tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
         if (alg) {
+            t1 = tcg_temp_new_i64();
             tcg_gen_sari_i64(t1, lo, 63);
+        } else {
+            t1 = zero;
         }
         tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, t1, hi);
     } else {
-- 
2.34.1


