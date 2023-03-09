Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA06B2E75
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:19:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMb0-0007A6-8E; Thu, 09 Mar 2023 15:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaN-0005IS-7M
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:59 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaL-0001dC-NA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:58 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y11so3241979plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQB3i+gSmXbmYMzEXUrNqnv/Nb9VzuZ1ZfDmoAznhmk=;
 b=XhFFlmn7jkxXXLt5FCbS82+qKPvxXZ1kjrZEowgHNYyDr0Fm8MQnr8P+FpNv3BD8vx
 oj22gBm60FlyvxNAfQyvwdT4hhvoZxmjgHw5K16hmEshBt0g9tj9l9i+YLwK0tLNTvHE
 EPs/w/2ikgocEa+iy+O2smppbYYjl0wE6L5zUf0WkfJ6HVeI4cbIdUz5wbxsQA/93J8O
 pubtp1MwwbOvWNtVhssdFk8dW0h00x95Hx01oRiTGYH7cv/3Z8zzG4x3M5pQLilqFXjX
 lcDkiaSzQ0kNL037BfsC8PCWj1aDrKhXlHdVfD8mGIHfDzERzD5RnGJ6kV7ihaTiEAe4
 xgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQB3i+gSmXbmYMzEXUrNqnv/Nb9VzuZ1ZfDmoAznhmk=;
 b=XqKKp8KBAaZwgf5qddBIkjIa9gB944nf8j/j33JE2yCIh3EKK0k+V+PCHLZuW1C1Z7
 bzNWljhS4mcGmPUEHK2xpP7h69kypJjZXAfkAv8I3jGElp/ZnB9VqrCKc7pyjkPFggTf
 oIf2OBy41Pz6sbdpwIRV/D8amCALDp/N54NwSMS6pO2/rCVc7oR7pdKyJbIjTMQ8K2/e
 UC8CQptQ5ZMoObOisaTUqVXC+JganaTNsNEqTfRzp1igrsqPhykVaacfD8bbjZV1jSyq
 0ppCGScGHndUA8BAGF7YAKChGG9Szvv0rLwWMsb7ghXHzmmhm4froIyFv9gVx7+tgFYu
 Hrzw==
X-Gm-Message-State: AO0yUKW3PoZmT5dKBv49Wtkp+G0NLHhHZdl8dSfdPiIhqB3kjAnvh3pB
 86Iz+YRhWb9HUCqvgPO4mH/ODBo1KzSgrrNdsZg=
X-Google-Smtp-Source: AK7set/xd+EIdyJhVwtSIiWhS1Yx3E7urvqI9BuQMJiya+pa06nEh6/UtN0GE1l3R2lxP8AiN2zSMw==
X-Received: by 2002:a17:903:441:b0:19d:244:a3a4 with SMTP id
 iw1-20020a170903044100b0019d0244a3a4mr21135998plb.47.1678392596383; 
 Thu, 09 Mar 2023 12:09:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 73/91] target/arm: Improve trans_BFCI
Date: Thu,  9 Mar 2023 12:05:32 -0800
Message-Id: <20230309200550.3878088-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b70b628000..4451aea09c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,13 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     return true;
 }
 
-- 
2.34.1


