Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBA4405BB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:22:10 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbCL-0004a1-Qf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9N-0001qW-Ks; Fri, 29 Oct 2021 19:19:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9K-0006ja-Vw; Fri, 29 Oct 2021 19:19:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d3so19118785wrh.8;
 Fri, 29 Oct 2021 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ieQbVDxIHnha6cbVzHSPGmTvFgdN0qxlT4jv5otEkqQ=;
 b=M6SfMHp4Zc6aXXjB4JyAWmmq/OmIVjg17/xj/sQneHpq9G53s60ZDJL0bX34rBFFBL
 C1o4RFQBs0J+9NizVoz7+br9VJqHQivGhsdwiaJkbrCI31CW01VT3i6KbYjW8IdpM/NO
 ysyt3ji5QNxekGvzWChvSWZL+4EZAEToRNsDqAlCYF/o+7dNBxYZCKX9XNXkEQK3NbF9
 9HE2LB3Ut6O97U2H9Ii1ftYmn15O9LVo58Fuh/6ic4ri0XPTzc7J5BA53Lf+VIfHfthG
 yjNkxQRggc00bfFYNRWBtlqEkL3amuX12GJUflQkl1CDEOHxPY4vUlEMJmp/UtqzEYdX
 s0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ieQbVDxIHnha6cbVzHSPGmTvFgdN0qxlT4jv5otEkqQ=;
 b=hvRjJhdu4knmGGKssCSMQXxIpXG/cl2eNJpt7wE15GjcYLTbrLdZIhct80x4X6KEAw
 ToXYmY8p1rMSGnjtRfazkDj6Wnm6AHUHJ1OW8dEW7PTYGM0JZGKSE9zfZiCDqA5oaJwu
 gXr/AKBlqwUfyTVC2VDJauiKFKi1KWPYzXVN8LHuwc8eS/eu+XgfH6TnL8+Hm6Oehyyg
 /6KLsjbNGmSuFbt7Hh0qHpH3He5KgTi35mlIdkRitTx3Tw6zJWn3lFvD56NBll/IHA+Q
 AlQJjxZ/ocQkCXJKriGTfWafFYHooEhXrXa1EktwZNDFYnLP5gXBk5mBf7dwybRvbwKh
 y5oQ==
X-Gm-Message-State: AOAM533gEkZFqsemeHyLox1pxcBIeFchwv/yb+RIKMTU0GZAnDDjTYj6
 9yFBdTlXTX1YVvwoqSJKNqunIp3nXYE=
X-Google-Smtp-Source: ABdhPJybpCFo2JuRbV13PP3ytPacRhElX+Ik/UdY6qq4B2n5zhXKPGu82zvLmPFGiE6uly4ph2QlzA==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr14551589wmc.5.1635549541257; 
 Fri, 29 Oct 2021 16:19:01 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m31sm6101077wms.25.2021.10.29.16.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:19:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] target/arm: Use tcg_constant_i32() in gen_rev16()
Date: Sat, 30 Oct 2021 01:18:34 +0200
Message-Id: <20211029231834.2476117-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
References: <20211029231834.2476117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the mask is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52ba562c96b..98f59259284 100644
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
2.31.1


