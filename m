Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1B410932
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:13:04 +0200 (CEST)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmKF-0005ih-4Z
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5G-0003q2-3L
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5E-0005Bh-HA
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n2so6151568plk.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbTX6X3ZiaT/yz+580OpvnsMVLtbZ8O1xHLPy0wb8Rs=;
 b=NeHewr+JamXRqPJvzk9BBKgsg4ah7N0Wz4Ilgu8WEIDeQD/mBhVQgphpQppYyNSQfD
 JuRf1jQEF/hHslR4QKjFBEi4t2ewZF4HsJctPnnLYr8t+y2GgrwsTFuhd4aX3+iLesbg
 6dhnxjqjMsy3uLZ+j4zMeSOcZ94slhi2Shw5mIoYPF49LsNUF9h22u0WiVBTGz8lCYol
 TQSzQdChyMgfj+ExKkxCAxvAtr4+W9EoibeKyPpReDrbnhDkwDAkTEx4WTChK7UM8xkt
 cg//74K0Sj9UIxZfrsM+HtxUsmIio0KEmI9i5dt4HW1SUIF6DiQy/8duwafPClwrn3/f
 5JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbTX6X3ZiaT/yz+580OpvnsMVLtbZ8O1xHLPy0wb8Rs=;
 b=6k0d8oPlZGt+TvdJHhFHOPQKtT0qBoU/D4G8pei4Mtn+jMj+mvx3CUk3VAS3cmalBR
 k3uehNASId/qHiMB80qJ+3HYBk00hu9zv3NA+WSIfj0S393Fb2wZCEQ6LFWqIBwa8Zf5
 VM4iAQ6v5aLHtwU9A78tcMzq4BKdX2NFNx8KI3n7S8/z+BqgWRDJxvS2r/EWiGTPPVFQ
 jpG3Rw2WN/gnovxNHNjSYE7xAOxj/8QQxWsW2+mzBrIJX73d7DbmxUNLPUF++GziOJP1
 +PTNxLvXlEYtDDfh3snnBT4PWaUNAnXmyXS7lXuJCGbE0dAbLUTRF6b2QuMOg5sS4Jzd
 BVmQ==
X-Gm-Message-State: AOAM532Ook2VEpJqJY10JNUshgyhMe/TCwvC5vJVtMlaRGY8PP0IamCA
 M0Mg90+AonVCkvZJiexz3/gruzjcVaTdSg==
X-Google-Smtp-Source: ABdhPJyvQ9zkwfElgdJQavrrgmOkHxissi8ew5gihGy2rVY3uSohB0ignw7liaWVrFsRZ6vSzcCVAg==
X-Received: by 2002:a17:902:8647:b0:139:edc9:ed43 with SMTP id
 y7-20020a170902864700b00139edc9ed43mr16489194plt.23.1632016651247; 
 Sat, 18 Sep 2021 18:57:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/25] linux-user/microblaze: Fix SIGFPE si_codes
Date: Sat, 18 Sep 2021 18:57:07 -0700
Message-Id: <20210919015718.466207-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
Fix the if ladder for decoding floating-point exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c527d21889..74b2a9fc43 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -77,15 +77,25 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
-                si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
-                si_code = 0;
-                if (env->fsr & FSR_IO) {
+                /*
+                 * Note that the kernel passes along fsr as si_code
+                 * if there's no recognized bit set.  Possibly this
+                 * implies that si_code is 0, but follow the structure.
+                 */
+                si_code = env->fsr;
+                if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
-                }
-                if (env->fsr & FSR_DZ) {
+                } else if (si_code & FSR_OF) {
+                    si_code = TARGET_FPE_FLTOVF;
+                } else if (si_code & FSR_UF) {
+                    si_code = TARGET_FPE_FLTUND;
+                } else if (si_code & FSR_DZ) {
                     si_code = TARGET_FPE_FLTDIV;
+                } else if (si_code & FSR_DO) {
+                    si_code = TARGET_FPE_FLTRES;
                 }
                 break;
             default:
-- 
2.25.1


