Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FA4435E3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:43:10 +0100 (CET)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhykX-000824-67
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTS-0005nk-CT
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:30 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:38406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTP-0004EP-TZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:30 -0400
Received: by mail-qk1-x729.google.com with SMTP id bi29so20509552qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GgIC/L4O3idafA92xVJBzxSWcbdJlwK/CFRWNxE3FH0=;
 b=LZsccg3Xc7wmOm3sdWUkKJSa5jgdicBF5AuuOODmBXXxwi8KpZD8eMCuOZAM8jB/3Y
 9mySbsr9fKI7cngLYOWn3RHRLch58rOu4aDruI4w4IE+8ydIhCIQHbMfZ6r3eh/Eqj2p
 VVz6VU4YVJoDsk59rxbiDamv6RtGdGdjbgTWP1qGhPeVKyHtK24uN34Q9dI7qx/XP8eZ
 /8kMiuQVi8uqOxKcOWrgosXekakKwckxcE4nrtxxrnH3PRjgpd/9LrklTwZMuNjvc00D
 5ON1StSpoNazuOTAXm4tVHq2qNbLrD6oGhe0CB4QatNWMjEfBeP6Bbjv1a05ckrXeVzV
 V5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GgIC/L4O3idafA92xVJBzxSWcbdJlwK/CFRWNxE3FH0=;
 b=AzK0aE9EnNOmHB9Hg7H1ywZ04UHmRmU3iyV2tuw/mgEOiG4WvMafZihTPWUk901exM
 fzaGFFixmlrMAhVExlhBfa7Oy/0IJIWDyiN6tNmydcRkKnKAQ+A6OaHiFZGhZOueM9vO
 /FYN/IDzquWdJWHEK7lhSTjBpvJ9YAUtvQmv6yt0tIKVr3vt5P0l93tnPAFfkaswruRp
 AqlCMBN4YG49tg0MRGpDF1fal+8Gz/AZJLh0mT6/RHPRI+Q3gFvCzMxRB2nVlUXh8v1l
 VRs58GrJbh/ganGraCvwPayBxXAsuEo72TayWAM3hyi3JPbcxOSJYSc5v8EdS5MMdDEx
 kMpA==
X-Gm-Message-State: AOAM5315dHXei9yzqoIMMBboBjA8x5b16lVDdRnUp167ua4g3QB4LvXG
 qHX4huNA06lO95YESi6MVnP83ZMpe7RXcA==
X-Google-Smtp-Source: ABdhPJwYl/aC9FZdEF0j/S8q3EePHH+b6lukt9hamIUN8rbixfqzUZo/kp4+goa/PwCn+5vj1ONIWw==
X-Received: by 2002:a37:44ca:: with SMTP id
 r193mr31134365qka.190.1635877526996; 
 Tue, 02 Nov 2021 11:25:26 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/12] target/arm: Use tcg_constant_i32() in gen_rev16()
Date: Tue,  2 Nov 2021 14:25:17 -0400
Message-Id: <20211102182519.320319-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

Since the mask is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52ba562c96..98f5925928 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -388,13 +388,12 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-    TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
+    TCGv_i32 mask = tcg_constant_i32(0x00ff00ff);
     tcg_gen_shri_i32(tmp, var, 8);
     tcg_gen_and_i32(tmp, tmp, mask);
     tcg_gen_and_i32(var, var, mask);
     tcg_gen_shli_i32(var, var, 8);
     tcg_gen_or_i32(dest, var, tmp);
-    tcg_temp_free_i32(mask);
     tcg_temp_free_i32(tmp);
 }
 
-- 
2.25.1


