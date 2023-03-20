Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E76C0E62
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTc-0003n2-HW; Mon, 20 Mar 2023 06:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003ky-9r
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTQ-0000Cx-Cy
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so2243909wmq.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAnVh7k03xLE58mG3oLOMO1waepQbpwXIySIk1v3C+8=;
 b=XsM+JvwxxH19827PpcXWEDIJjix0RtoE9yXcg4ijCoInDv9eI16r7WM1GW4XQJa3ca
 rMsQzCuv+cR1BR92rTJTX0gDV9c1O5i6gPNtrsJoq56QbujCUbW7OGIwgsg0aHqhlwv2
 XUReo7yMYVJmVaG7rhjES27BkOhBtl0oEXdZIk0oOXHJJTjlxnD5Y+AX92ZFACDqkKmx
 upPZ3Knpxq2EwghLQnJIeB0PgMMh4H8WjDdMNVM2SesFXnrtuGL/hJHxDVY+imb/OW1p
 wASJgMbtvayTgdHy2qTbZiMgml6nOCR1czBTgE1pUZMMtQOV17CJVh9ypwM3xKpLaEcA
 DLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAnVh7k03xLE58mG3oLOMO1waepQbpwXIySIk1v3C+8=;
 b=xpILFA7U/0vpjXv8r9Q4iED3yuWno9NaGlwIzbG3Uwi/gcvYpNbBGXnh+J30lDGkjB
 816GkSjh1MIDBJqhQRXXi9HcurIe7cb9bhEqLhgQCvgjRKaWj3BH1mDgPsdlYC0fJjw9
 xfztqB8+6Q6lS7i31lZY63pZfvFIBLsQYvA98beiE76ST6vddtUf2m/ijAa8JhvGRnNY
 0vNEGYAlHSTfWrjDU3mbaugOc0ZVNfk6wRLENMWmlh8OCBRi4aydD4K3k1KWvXc7FccO
 zbCezzrE8TVO4hmcqhyL9R+ADL6oin132m0rAenb8i1oko86SLuZQ1l+T78o+1EmPqgz
 0iSw==
X-Gm-Message-State: AO0yUKVO3yxqOvuDk28QfWXn/s3DqFblyjiEuRBkZtl9ACMrsU6hiRFW
 Rwh0rTINuuSYsEKnIMEqgrFGqA==
X-Google-Smtp-Source: AK7set/J0PHhATqmxBUjrlGX7o7nTxJKBpUBunceCaWxn+rxxDGBgba18DClVG/63j0/IT/U25MjxQ==
X-Received: by 2002:a1c:f601:0:b0:3ed:8bef:6a04 with SMTP id
 w1-20020a1cf601000000b003ed8bef6a04mr9687377wmc.27.1679307038981; 
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a1cf308000000b003ed4f6c6234sm10016207wmq.23.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592A51FFBD;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/10] accel/tcg: remove the fake_user_interrupt guards
Date: Mon, 20 Mar 2023 10:10:30 +0000
Message-Id: <20230320101035.2214196-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

At the cost of an empty tcg_ops field for most targets we can avoid
target specific hacks in cpu-exec.c

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h |  2 +-
 accel/tcg/cpu-exec.c          | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 20e3c0ffbb..66c0cecdde 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -50,7 +50,7 @@ struct TCGCPUOps {
     void (*debug_excp_handler)(CPUState *cpu);
 
 #ifdef NEED_CPU_H
-#if defined(CONFIG_USER_ONLY) && defined(TARGET_I386)
+#if defined(CONFIG_USER_ONLY)
     /**
      * @fake_user_interrupt: Callback for 'fake exception' handling.
      *
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f883be197f..ea2e7004fe 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -698,13 +698,13 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         return true;
     } else {
 #if defined(CONFIG_USER_ONLY)
-        /* if user mode only, we simulate a fake exception
-           which will be handled outside the cpu execution
-           loop */
-#if defined(TARGET_I386)
-        CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->tcg_ops->fake_user_interrupt(cpu);
-#endif /* TARGET_I386 */
+        /*
+         * For some user mode handling we simulate a fake exception
+         * which will be handled outside the cpu execution loop
+         */
+        if (cpu->cc->tcg_ops->fake_user_interrupt) {
+            cpu->cc->tcg_ops->fake_user_interrupt(cpu);
+        }
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
         return true;
-- 
2.39.2


