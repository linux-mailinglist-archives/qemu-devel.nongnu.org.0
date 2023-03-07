Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45836AED6D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbP-0007dM-Ap; Tue, 07 Mar 2023 12:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbav-0006fi-Jf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:27 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbas-0000LA-Iq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:25 -0500
Received: by mail-pl1-x633.google.com with SMTP id h8so14979598plf.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dzaTq4Hk7e5zysi1fCZtiBija1HdA1vnsnzcrh5iSw=;
 b=XeLF3vLhXrUNh3TpTRsanq0zbRtXNxNPhYF25Qh+7/jN49Om+pUQf/terH69iSa/te
 tQ5WKXcNdPDBjQJv3PJZ2jzs4Lh28VrrLrH+aKOJqKAZDVqCwPSLIotBQLz7wMxsX51w
 qMZtZf/LKNS5AXSIT2jr0d899Ex0pEcSRJErPiIZC+STyYqtYe5JzUNtfIx8IGADBeCg
 +IC2K49dT7c7DshlzvqjiBXdA3X82jwTaoNj/RHwmzvl2RNW+I/t+ANYeYSXSIBXLK8U
 DbFtwHt9rTN44r48MiSAUaoFi88mnB1dze7lVzA/TbgBdWEr7NVuALqYpxawNUatS2wP
 6Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dzaTq4Hk7e5zysi1fCZtiBija1HdA1vnsnzcrh5iSw=;
 b=01gvbrl6AAk7LgovcQ5Li1L2PRr6XmJ23MoevFQPADBMoFE52srw8lt508Alui2Ec3
 Hchz0uHuyGXhDSxrtzi00aNE5hIWZMW00z9LaXkUAzk/mndV5PQv2o+x5bSWa5JxzjBD
 ZYtZtbc2aqe8jt7TDI1IBPbiIgZxckZdvXrfIMjIG2A9d3vo3xEyY6aILOEey+kYUvVX
 WdPfWoaFaQ2hGHQvmY0xhF1GBjsJ35+cK0qZPVNPBYMQvoeybRTjmKuK5lrDwTQeGp/v
 H7O/yb7EBwSxzGRG84ZVPcwSU5Ospm8Q1rEaUQMGlw/MVcyp8deU7M1XMfupg6VQHkW6
 upQg==
X-Gm-Message-State: AO0yUKW1MH5c6AZxqkLufIED2vE3mRJxMAautjSMS5eqPAi5v0Tm668G
 MA9zLnEdvRZQDKzy6m35G9Yq7knspk3UAcEoYdg=
X-Google-Smtp-Source: AK7set9ICQNgauL8BX78e5jKZySPs56xfBm10eaeOipWsrsZgV/qVK9YFifnU9liyG2bWD1oA4lSqw==
X-Received: by 2002:a17:902:f548:b0:19c:947c:8819 with SMTP id
 h8-20020a170902f54800b0019c947c8819mr20211106plf.59.1678211960741; 
 Tue, 07 Mar 2023 09:59:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/67] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Date: Tue,  7 Mar 2023 09:58:20 -0800
Message-Id: <20230307175848.2508955-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

The use of separate data/port variables is existing
practice elsewhere, e.g. SBI, CBI.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index b9506a8d86..190d0c3f97 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1288,12 +1288,13 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
  */
 static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
@@ -1305,12 +1306,13 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
  */
 static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
-- 
2.34.1


