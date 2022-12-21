Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC45652C47
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGG-0002D0-0G; Wed, 21 Dec 2022 00:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGD-0002AS-ON
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:21 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGB-0003N0-8h
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:21 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso2582089pjb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQgJmIQMrjWysce1e2je5afVIp4tHra/146j/kBBfUs=;
 b=kAQnHQsgu44gP5gPgMf/OQjjIS/hmKLyKyHKQKiagmDKt2RiMn4Ici3SqYIHssP4rf
 FnWGN8mUKQPUnQtfpStJQ58K+BdHYc/iOMbvNU62fC4YGEpmQSOk8CYBBgWGJkUFjVjn
 FOPPFPTkp17TDQooqhiLT8nto0962RnLcbBoGkiqDJwtivRCpyZl1oks+jCGtne6//gf
 G31Pnl2gfD25mvca4ySkeY2XmH1yxgtIvFdE0/HZ7IJtErc1YeinvmPRshAlSzpGUD5+
 68zT3AYh0LpWQByeXUSE5QDGfRucaW39tszFjXyAKRkgXhMyBQ0lD4fFvBJ6TRlmY1E/
 K/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQgJmIQMrjWysce1e2je5afVIp4tHra/146j/kBBfUs=;
 b=EsnzX1FcEGnfSGaqVSjSgEGnkQmPTQRVz8D4lPMLrknu9Ae/yl5XTQ6NOYEGaPV2HK
 fYVd5U1hvHw482XAgx6pkUnk7RPEDYB0TvFtXfY8/YocYiHVU6mxfaMz0R6uuHVrpwnu
 z7jGsQufxObYCDafs1MXHj8tvnd046Sqj7geRRJYRHZ8FG84bayusTiU9xVNANs0Mo82
 PVBjJNfmX6wMYU9lStE8HQ/EGwSl93ZOGuJsRfS7CVpDg/GBE7wmHmNrLRNvRAfXk04O
 bYDSP6SjmT6wdpxNaSiaeFrZPPDQun3eaYGakMQzSyt2JQg8XfMN4/Hv90dfQp0d5a55
 JruQ==
X-Gm-Message-State: AFqh2kql7soV6xbC7yHhFSDD7ja/WYcyF6AM9INK4IOUmoBCU1OefQj0
 F7gkgaFYFCaAqMVX5E4LtN6P9enS7oiZOm6e
X-Google-Smtp-Source: AMrXdXuURBup7phSEGJ/H8XcGAJ6CxLZIjn7d8RI217xkPsCGqsoF7FopKXy//8zYLANUItcdiCosQ==
X-Received: by 2002:a17:90b:188c:b0:219:44fd:fc0a with SMTP id
 mn12-20020a17090b188c00b0021944fdfc0amr17734778pjb.4.1671598997798; 
 Tue, 20 Dec 2022 21:03:17 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 02/14] accel/tcg: Rename page_flush_tb
Date: Tue, 20 Dec 2022 21:03:01 -0800
Message-Id: <20221221050313.2950701-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Rename to tb_remove_all, to remove the PageDesc "page" from the name,
and to avoid suggesting a "flush" in the icache sense.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..b5b90347ae 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -51,7 +51,7 @@ void tb_htable_init(void)
 }
 
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
-static void page_flush_tb_1(int level, void **lp)
+static void tb_remove_all_1(int level, void **lp)
 {
     int i;
 
@@ -70,17 +70,17 @@ static void page_flush_tb_1(int level, void **lp)
         void **pp = *lp;
 
         for (i = 0; i < V_L2_SIZE; ++i) {
-            page_flush_tb_1(level - 1, pp + i);
+            tb_remove_all_1(level - 1, pp + i);
         }
     }
 }
 
-static void page_flush_tb(void)
+static void tb_remove_all(void)
 {
     int i, l1_sz = v_l1_size;
 
     for (i = 0; i < l1_sz; i++) {
-        page_flush_tb_1(v_l2_levels, l1_map + i);
+        tb_remove_all_1(v_l2_levels, l1_map + i);
     }
 }
 
@@ -101,7 +101,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
 
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
-    page_flush_tb();
+    tb_remove_all();
 
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
-- 
2.34.1


