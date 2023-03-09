Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF486B2E93
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMay-00073u-Nz; Thu, 09 Mar 2023 15:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaS-0005aj-VD
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaQ-0001XB-CH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:03 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2996217pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6ZC3hw06E0OtNkXZnnMKm93jFnanNTgLI9Wcvcgr6c=;
 b=nqyM5Sbq3/C+6ggvUfCUmkg7cnvZzGtAYG0A2bZp31loXyvZUT/92zKCOt8x+/Tdli
 tCtmc+0MXP+gvMA/6mBGcx/ChJDlIULR6EC9YNDD1ngqsXZTbwxhGrl56rQ4oyWAkK9h
 +650sPaJRSZFq6Ll4q6ZJ2txxpSb+zLf7kdytqJ7jUc6qjgeJzqmglOYstJ7HGvpD5Yl
 Q5pFaUcSnenn2HqvJMFNWBn8FQwSJDCIM/8PgGHwWqbDNurKVPfVBL+MHvu1hg3cbFdk
 9VGSjtnDcdXuEDT26FNTBhPE0q383RY7SEzeKKgb47wHO2GRoFlOeOWXDwlwpVfP57sz
 bOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6ZC3hw06E0OtNkXZnnMKm93jFnanNTgLI9Wcvcgr6c=;
 b=MBiK94ehpm8pBDnFkg7Wt1Yb43NRkrqysONOf7vWdRlhDw1gWCLJTBjQ6KXZt8Ku7W
 yhrMHTPwpWB5PBTBfW/Nhwieb9cWEcgB1C9TZ3vB7UyylZktITs92S8sn9arZ5eSaqKI
 8Q6xxVjJ6P3kGXhVIIRRT4mI76ScZ9WdziKoj0RNzWShL/i6s3Gz8Np28pxOtG8CiGLp
 cTo4+TIm4i5jQfSWsQJoOOtC5yK4OxcsD9ookmQ68+VprMVxHu23RDSy+5buQf8OXYEC
 VCPEh8ldHKPHwVHwnK9auOEC2AX0jwR2+uGBvxH1l6BfdtQVvhalsob7CRan5N37ll8a
 aQ/A==
X-Gm-Message-State: AO0yUKWa4bVUbaRSikJ3ily4xESw9DWzjQe5JykQbhSRyk6gn8i/e2th
 uZ5cKf8Le5SoERFpjB8KL9WB97BvcUQud18WeQc=
X-Google-Smtp-Source: AK7set9zRfwd7Ysw1WikJ+kMZDDVkeScKcak+sOI/A6XF+66pgM0wrQMCArqt1gpjwED29yxHuF9TQ==
X-Received: by 2002:a17:902:c40b:b0:19e:8bfe:7d68 with SMTP id
 k11-20020a170902c40b00b0019e8bfe7d68mr30181954plk.11.1678392601589; 
 Thu, 09 Mar 2023 12:10:01 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:10:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 79/91] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Date: Thu,  9 Mar 2023 12:05:38 -0800
Message-Id: <20230309200550.3878088-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Return a constant for an immediate input.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 44c3ac0bc3..422f4652f1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -916,7 +916,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         default:
             return NULL_QREG;
         }
-- 
2.34.1


