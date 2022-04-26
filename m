Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08E5103AB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:37:51 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOCE-0008B7-E0
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Y-0002vi-Fa
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5R-0003lR-7B
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id v10so5403429pgl.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3nhL9lpF5kEdI3yITzr/5HwVsaS4vWPU90RPBOwW5I=;
 b=jExGMUTV0a+clhEs0uma1Nem8UT8VekwvnCypB9rPRKVacvCOejwxp3qzljQbMn21x
 FoHVqi/pWMjoWpGH0Eyw/sOmdYki5YdYLZBgpYYlBKiD3jE9ZUuQt5niQkX/vz5Cz8TC
 llT8JnLkRapUZaNJqnPtvZgwe5yioUdeDyrsssiUa4RjX1NpDWgRsFVKXg8pEwdVG7zy
 DiEyvBq0CYTIeJS5ij5++/fIQmoaRpI8qiTvGzHv9LNQAFTkgex/BwSLZ2fbtFfuuMI2
 z7UQETBzljzgfuNmYjIRNlg63oF0bLbNFIcc7AuFXL0PTaCk289tkCdfWNwFDEWqLb4+
 8Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3nhL9lpF5kEdI3yITzr/5HwVsaS4vWPU90RPBOwW5I=;
 b=xb1ctWzetO38TjMBbK/gbSKacXagfbCBMUQnkKSeC3aGBByP3eHyCj6++qXb9IZnIK
 JdQsufwGrOjMknjP5WTbus3ig3eJlM3yxJ+1miCRKYTpQPVQQ01Y/+TS0h8jK68EwXTe
 zBFx40VIFGECCP6vdV6MQIBTcX9rYzoEbrAVGHhYz9SPdAqFvTPcNUdC4pd3SREf+U+k
 Ps25M22fhppYGt64dB73F5zBvQGCAHubIyB8GiFdOftxrMr6X2ENM7O3wpI2XM/bfjAi
 2X34HWwcE0a3JEPDX8exS8lLVr7pN2xWFk3U9Yraf8pY+zVpuMIpvEr9e3U9Z/dT3oD7
 NOBQ==
X-Gm-Message-State: AOAM530Hu8EIGGphFSTyqLvy1nmBnNp3op/0uFa8dvyNfXue+uYQK6g2
 caaySnoeY//XKH9X8w49jMksHnYciO9iUQ==
X-Google-Smtp-Source: ABdhPJw8VK9HrEkSXg84XjkSyySI+ZqfiOH/jUKxrynRGhakgt32cbiFC/Fz0qnz7ZkRfYTE0CG8+A==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr25100217pfj.57.1650990647197; 
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/47] target/arm: Use tcg_constant in gen_mte_check*
Date: Tue, 26 Apr 2022 09:29:58 -0700
Message-Id: <20220426163043.100432-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c6ab0433af..7b5bfb0889 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -258,7 +258,6 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -267,11 +266,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
@@ -292,7 +289,6 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size)
 {
     if (tag_checked && s->mte_active[0]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -301,11 +297,9 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
-- 
2.34.1


