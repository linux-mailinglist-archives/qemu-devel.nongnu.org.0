Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EC6A0F0A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFxC-0004M9-GW; Thu, 23 Feb 2023 13:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFx9-0004LS-UR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFx8-0003jB-Fz
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r7so11216437wrz.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLLO+81M+6ty6hlvULqERzdS4cWY4gmEFmkpDmLu/ig=;
 b=fFtflJ6/P3wwPKXknD/aqwa2tY/MMqarVtT4Uiy5DOxxX/DSFbhWSNrQ65smCFt2S0
 xx6gtQCWL08oA4KHYbylo8rPWJhg36Zx9p0g6aiL6tr1B8NLJYaMRZUxNsn1ctQidKEO
 g2piG5W8IO2cktHdu75X8krMhX4LwKAIhvFoQUF+f7Btkq8tUgekIgwY0OoeFITPFW0n
 2h6b+tEJ4vDdDmOIg3drGHzkeTVyrsKV5gozrQKstfp72fRCJS/yH7eqwQ4sBrM18V68
 IxaZ2CZkm2zZTTc5fE3aeFcN8JF2w+A8VcKQFwGNhaEZjYgRQWM1bGhCl2kmVa/pUMeA
 GAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLLO+81M+6ty6hlvULqERzdS4cWY4gmEFmkpDmLu/ig=;
 b=KRanS5IRytdjtFMo26UsehJiVVkR/bz7Pb1bMcO9jvybMqI07isJzKqKwSbVPlXEH8
 7MC+V7CkfDE31RQTv4l3rCTJPijTgkfyecD98gQoIftVJflYYawkY80ERMMPsEGShB2Q
 q65/bHTiMSr6rAB5Vd85RLc+C3XvqYJxvzG0W6shpcV9tUrXS6s9+/5ih9qiJQsIITap
 l8GtFhiddjyJzLkpaIytNtPzsqxr8V2xGSQKW4we7qqPnIJRY2Ppq9O0RaGPrkr/2xdW
 xmHKXSj4Y0Bb9Xc7p1Vvf7TjOU7iuiigiPNf/kE05aHq1hWgSKlPoecCum38M1MWXUAb
 hnJQ==
X-Gm-Message-State: AO0yUKVHROAJlXHzL/0e/Z4InJtKGdq7+xThTZhawLgINFLQWb/2EEiY
 j+yruiT8wvKe2YToYDHTjvtLXqib6WJXbfzz
X-Google-Smtp-Source: AK7set+gCxGrIvi1ARP+H3Ra1UHhceXh/I/t6oZxHQ45Hl6tfF306ZKp8ZXv2/bP7Hz7FRldt0Swbw==
X-Received: by 2002:a5d:67c6:0:b0:2c6:45b8:ff15 with SMTP id
 n6-20020a5d67c6000000b002c645b8ff15mr12520805wrw.35.1677175460923; 
 Thu, 23 Feb 2023 10:04:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5709000000b002be099f78c0sm11224248wrv.69.2023.02.23.10.04.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 10:04:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/3] target/alpha: Replace TCGv by TCGv_i64 in
 gen_cpy_mask()
Date: Thu, 23 Feb 2023 19:04:04 +0100
Message-Id: <20230223180405.31836-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223180405.31836-1-philmd@linaro.org>
References: <20230223180405.31836-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Although TCGv is defined as TCGv_i64 on alpha,
make it clear tcg_temp_new_i64() returns a TCGv_i64.
Free calling tcg_temp_free_i64().

Suggested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f9bcdeb717..06894094b7 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -798,7 +798,7 @@ IEEE_INTCVT(cvtqt)
 static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
 {
     TCGv vmask = tcg_constant_i64(mask);
-    TCGv tmp = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
 
     if (inv_a) {
         tcg_gen_andc_i64(tmp, vmask, va);
@@ -809,7 +809,7 @@ static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
     tcg_gen_andc_i64(vc, vb, vmask);
     tcg_gen_or_i64(vc, vc, tmp);
 
-    tcg_temp_free(tmp);
+    tcg_temp_free_i64(tmp);
 }
 
 static void gen_ieee_arith3(DisasContext *ctx,
-- 
2.38.1


