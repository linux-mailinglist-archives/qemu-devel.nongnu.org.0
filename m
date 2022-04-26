Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43021510746
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:40:10 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ6b-0000L0-By
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0002Xc-I3
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0004LA-M5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso3273046pjj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaXzjQ4uHQf8aegyrwpNgla1ibfyULSXvI/9Vr/sAxc=;
 b=KRnKrTVMScpLU/xoFxQbQTW+SGx7PnSpEZder1TS6rUrnpqqA9g+L+vOOf7d63Rk09
 dgVpli8D5/GWTkSryl6aN1LNf8VwhNLAvIqB2dal2RBeq47Qz0QhG+pmn0glhvKD0Bj/
 KTbYOZxkhXhgCZiD9c8Rw4hHiDOMb0RgKqEYPSpGQjpRIaHAHeD9jJ0saf8IhDVukpTg
 DNyu0O9SNcGSB173h8IyFGrJ1xAPjghY0hfHYjrsT1zf7aYN5iTo2IWa+sAgjAqbRNbV
 tzl3YwJmVN+hhr9uOJWKtOiRJcoUBtuTk3fFGNRLcDDSExX3KDS1D0tCy37KYB7gdsKL
 e4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaXzjQ4uHQf8aegyrwpNgla1ibfyULSXvI/9Vr/sAxc=;
 b=v3yE3+fBmilw6E+6GTz8jf+EAx2WtYH+2C2u4Ve/QC+9XrM1pSvk9OT/KOGNiDS428
 FOtbyUx5z4E/foruFveb/no+s7qbsJ40OWA2DEmzHGktczqnw4Xig+uHJr41DS2FlWHl
 L6qSg4OhgEG0GLpjAF8t0MRxuCGxEu8L5m7goQzGPPTHtRmhDl29kyM4DADfr9WebHZ/
 zmxqBWv1XWpKSMGz9Jtx24uEQrO+fQCSIutKstur8pnqTJwAKWzEO8bnM7oIVjTh36KZ
 YixpA4u8D6MVO9JtheFfdQiYG0hfzOThNjuUx7uAuX6J9rDpX1lf/J4UJNrbjNDoK5xy
 E2GQ==
X-Gm-Message-State: AOAM531g4vf7rQGfXDnNHOmJVX4mOgcYAcRV7Rr9G6bwA7ezEs9UgDJL
 riPLX0v0OZ4rBek0p4C2EIuJ5Kh6LpHGoQ==
X-Google-Smtp-Source: ABdhPJzTrjeML99g+aeNt8r3IZMrP0+82Atc/h/k/d7POg3C1o1cdmKwQdEdU6RMF3+USIPI4EARyQ==
X-Received: by 2002:a17:90a:62c7:b0:1da:2c51:943e with SMTP id
 k7-20020a17090a62c700b001da2c51943emr132006pjs.208.1650997153292; 
 Tue, 26 Apr 2022 11:19:13 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/68] linux-user/nios2: Handle special qemu syscall return
 values
Date: Tue, 26 Apr 2022 11:18:04 -0700
Message-Id: <20220426181907.103691-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor QEMU_ESIGRETURN and QEMU_ERESTARTSYS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-6-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 63afba5862..2963fc62b4 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,6 +55,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                if (ret == -QEMU_ESIGRETURN) {
+                    /* rt_sigreturn has set all state. */
+                    break;
+                }
+                if (ret == -QEMU_ERESTARTSYS) {
+                    env->regs[R_PC] -= 4;
+                    break;
+                }
                 /*
                  * See the code after translate_rc_and_ret: all negative
                  * values are errors (aided by userspace restricted to 2G),
-- 
2.34.1


