Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B369E376
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:32:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUbS-0002en-8a; Tue, 21 Feb 2023 10:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb7-0002Kk-JY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb5-0000W1-O2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so4689123wrh.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6qn/yx6q7lkoNAawrOJ+PdaXBlkustX5jFFPd6NUzvQ=;
 b=ml40aHavkBRi/dbzj4cK6sMbIjJ7JFkzV7+TNrTJgbkpCdNYnLWnhPMNYwKz+MYnjN
 z7BXniOl2kWi58pbWWFOH5yfgLNP378Fl/KazgRzJG/C6al8wrmy7Jlsbcv9tSgHZZw2
 oe2dwj9Wm9EbQH+pnxJJTz5qMQQ4BOoumK6tDEXd3N164bkNDJ9CDl4epqLYcRkVZVdW
 fwfz1k9/lx4KuuGhNkGGR9gj1lFC0x8bEeHWs0NaZNSY3u4jQ1n9ERFhmgMD7McLAjV1
 K9FKF7DRZBpItrScj24f5yOavNsMJbFruGw1X/KQ4bgyBDty1XWR4A8O1hpLW7h3nj+0
 hZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6qn/yx6q7lkoNAawrOJ+PdaXBlkustX5jFFPd6NUzvQ=;
 b=29Ajy9NSQk8PZ6gnf4Qu4gP7zqCs+802ji3o7YeUhAC7OH/1K/LcCfD5MVLq0WDodU
 CRDsyV8q77irMw103XjiwU/nZaMCXh3WazA/lLNP1TVDb5sYJdr8CVK7UpVwNkWpvYRx
 i2ArvniQDarAhcZKgrJuCGPsGLCQYYPcF5EFpPpOmd3YBXq+SCDSUO/5R9FQLxcfzjdw
 7AGSOU6NwUsn1DFp/d36DIOxHMgqshd8hk/8XaMDLMRiWtjKe+a4nW/6rpDCNC+Dld3b
 bTplyHIauwu3sCH51U18EEUHoJQPMZAM4lrWOXH8waryAgldY13lAZxUbn7CH1UdKKhs
 H7ww==
X-Gm-Message-State: AO0yUKUMOC68LGdObG5TQ7JZQDh9alpreI3RrA+0OMyR83b9qSZDK2GT
 Bb5chnzxJElqOtjv0RoTy/wnyK1xKsmHDuBEkpQ=
X-Google-Smtp-Source: AK7set97zCrajucTg+TJPKe8pFWK92MiIybBZCTqpIjC0Vf5ma6gRQix/2MSL8G1okOVYY3cOPGMMA==
X-Received: by 2002:adf:f748:0:b0:2c5:534d:eebb with SMTP id
 z8-20020adff748000000b002c5534deebbmr3036071wrp.13.1676993425859; 
 Tue, 21 Feb 2023 07:30:25 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2803417wrj.70.2023.02.21.07.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:30:25 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 4/4] target/ppc: fix warning with clang-15
Date: Tue, 21 Feb 2023 16:30:06 +0100
Message-Id: <20230221153006.20300-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x435.google.com
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

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..5967ea07a9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.30.2


