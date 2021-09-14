Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6540A224
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:42:07 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwWU-0006Tw-TK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6S-0001k9-1s
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6N-0007ev-SU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:10 -0400
Received: by mail-pg1-x531.google.com with SMTP id g184so11003558pgc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DOATSVlMI8v93icbZz2oPU0yhH1ot3hFTS6J+8BagtA=;
 b=xbtkVz3aj++4uZAJ3LjbqbNqpVBa+WrmedqMk3LeLwh4NwntYewCQ8HW1IVd5fo1iZ
 02f8b/V7xWEHhxgiP5krFvFO+OP51X9+xJQc2EV5aF0nsWK6WjLGGaBMxd6lwTOO7nlj
 muPwRZne3Rv/f4NvN/sjSEdA3hnjxAQ0iV7jD8j5P75z1T6aVpO6sZn0iFzd+Fkn9RoN
 z0KmjDtQWAGR7a9URzOyUDgIskIuYqcu70wDKOHtwN395aaPef4y+8kGruYKErn3PfMq
 t63C9tCFNDQjB0BFzSmDdtTcTf+mLMRP7z+HRsm71ZWCfycm7DuG6Q4ukGk1EXe+dmR3
 TcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DOATSVlMI8v93icbZz2oPU0yhH1ot3hFTS6J+8BagtA=;
 b=GdS/r95OsxD1qurzGbMtmgkTVmgUTFLobXMFmuwV1Q8vZuDIvzxTUzy6ghuX/jvANv
 QsYTHKiMSW3Puvpa4usSW7vfN+gQpdrodXoxwy8IUZrWERAnrQRFqYCnAbjEFecKvTus
 LeBySySNhJwBuSUtzJLffxN3fho/5QH+vhtU2ga+u0QOYKv7r5K3lOuY3wQLAId/MIRG
 hESpKHwVaE+HnofN6huO4QmBylJoQLVa8lrL4sJe923CDrJ5vbAhKUOsdxhMI9Xrc5+T
 hqBDyJLDDhbj2fG7D/093IbSOferhhnq4qje+z1yr1f7CzeA4FgBNrvOE7Q2wNug0WOs
 Pwmw==
X-Gm-Message-State: AOAM533NBbOwT4UAhLnc5mQ4Dt0hmX9R0qsWYh+05s6xYWjTCEoIjPRS
 6nzh+VohiWdaYOfCuCwEOjKpsgl6Bcm0zw==
X-Google-Smtp-Source: ABdhPJzs4wcudyXyWjBo+edfTHlxFXLUfE8HNbTafZFYnd8m1QRE7jIUcq6Wyp4dxaTJjtnSnjgYtw==
X-Received: by 2002:a63:b40a:: with SMTP id s10mr13170156pgf.454.1631578506525; 
 Mon, 13 Sep 2021 17:15:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/44] target/i386: Simplify TARGET_X86_64 #ifdef'ry
Date: Mon, 13 Sep 2021 17:14:23 -0700
Message-Id: <20210914001456.793490-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Merge two TARGET_X86_64 consecutive blocks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/seg_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index cef68b610a..56263e358d 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
                    e2);
     env->eip = offset;
 }
-#endif
 
-#ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
     int cpl, selector;
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
                                DESC_W_MASK | DESC_A_MASK);
     }
 }
-#endif
+#endif /* TARGET_X86_64 */
 
 /* real mode interrupt */
 static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
-- 
2.25.1


