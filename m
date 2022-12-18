Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E437265043F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xoB-0007SM-Vo; Sun, 18 Dec 2022 12:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xoA-0007Qt-Ba
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:42 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xo8-0000Lm-5B
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:42 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d3so6967099plr.10
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5VmXk62ylG0x2kw8eeCrfeTg9zdaLaKYI3gkMyaAsI=;
 b=u+Oeh66MXglvKNCFiCuNaeItHcCiSCE+MSZwJzwZjAqqJdgnKTmFJOYQ3RBPVUJuxg
 57sv2CXliYcJlr0U6Zpy+JVwSPalANH2JhAqk/eY0pYdAjQQLaUv6L43/z5IY4idMeK/
 xSvTWjWKw2PCELAbCOVLxq9iddGG38F9ThIf4fN/Wrsve8VoKkAQVpRcWQWxWFrrlZAE
 fifCnYsQDI/asdE9Wtt+3fQukXaGbb0nXSikT5Vjlryy5qNOmNg7YDHt2giD/oSMf9Dd
 nm6gawvHU9q+PVzCSiI1R2AZSyUzlkxg7ZkHzPCHmKA1TtFTDs4Qa31Q6u9YheYYkdwm
 rwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5VmXk62ylG0x2kw8eeCrfeTg9zdaLaKYI3gkMyaAsI=;
 b=VAc60Uo9+yiUFiSqtAF9Klz3vFzufLuMjnHVYz3xEnPb6L/Wd7OyGHmEcXAWwVhElI
 X+oVGNzj3uXeWoJOlk5XMXO53g6y8YZm6LMI/3cEpLQiJ2BfTlTw3f+L9I+50UsXyc2Y
 F70V0RX9+ckOY6dAww2TJK3ftseegVqxDfmfngbd+qaAwwDE9KNVIUmJI6t+a4eRDRyn
 pw85UCUXXjwvKj5IzWP3QQ7i1d6Sa6FdSriKesni9rSsiagOKbuEMUMKXqV611/9Y9Nz
 ZQcvo1PNPdiQFy6u0w2Vp3aE+ps8lKy4fwRSc051lrRX0fuT0ztDFepbM03wDuynRfiy
 6JjA==
X-Gm-Message-State: ANoB5plQFicDYJzgfut+FKtiKQ0LUEykH1TgJGt75w7ju7j1M9+z72ry
 vuxa4dkLswfaow4VMFqR1nk00DD4rjm5nWMy
X-Google-Smtp-Source: AA0mqf5ht5LTPHfNxQB/9183Uk0u7hm8dKfwvwZ5x1bu0v9/GlW1sXkkBNVF3yAI9Y90lWuuLHQS9w==
X-Received: by 2002:a17:903:264b:b0:189:ec62:3b2d with SMTP id
 je11-20020a170903264b00b00189ec623b2dmr42081235plb.4.1671385838887; 
 Sun, 18 Dec 2022 09:50:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902d2c900b00176b84eb29asm5318837plc.301.2022.12.18.09.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 09:50:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/2] target/tricore: Fix gdbstub write to address registers
Date: Sun, 18 Dec 2022 09:50:35 -0800
Message-Id: <20221218175035.449904-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221218175035.449904-1-richard.henderson@linaro.org>
References: <20221218175035.449904-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Typo had double-writes to data registers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1363
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index ebf32defde..3a27a7e65d 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -130,7 +130,7 @@ int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (n < 16) { /* data registers */
         env->gpr_d[n] = tmp;
     } else if (n < 32) { /* address registers */
-        env->gpr_d[n - 16] = tmp;
+        env->gpr_a[n - 16] = tmp;
     } else {
         tricore_cpu_gdb_write_csfr(env, n, tmp);
     }
-- 
2.34.1


