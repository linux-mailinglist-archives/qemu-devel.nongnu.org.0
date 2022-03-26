Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F04E8123
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:39:56 +0100 (CET)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6e3-0004Eb-E2
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:39:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QX-000777-L9
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:57 -0400
Received: from [2607:f8b0:4864:20::22f] (port=43751
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QW-0005MW-1M
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:57 -0400
Received: by mail-oi1-x22f.google.com with SMTP id w127so11074209oig.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYuWaRD3BVfH07lx10ciC+hnANbY9oKSD0sVPEBlcEQ=;
 b=J1aFLgD+2IRA6gLwVZNtDRKl0b+nN+IMO+TqYrEGCk78SNjgeSQ7/V2fvnan+nwwhY
 mbL28JPUwbCYX9vAUAC0gPYYbiwnRo4qW7nEwL4bVqTewlrirLo6/3dLKzLBRY739PoV
 iUAkQrS6s+J43fCMj3HBrcO/zpatf/ghtzvXv/iFci8IfuggNopqzHTZUUdZTxma9zFP
 sR/vSjOzAIQs7uMtGjNd53Kd+QvrPmmRrhXnnBPXlidXO9CZvHfiaxzRSLuEQHSUCOMk
 e13CpZKaD7sfK20WdSYZ3zxO5p5tQPBR+WCKAkOn5x60mQS5PDbpwWXooPJkChhqOtvc
 IxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYuWaRD3BVfH07lx10ciC+hnANbY9oKSD0sVPEBlcEQ=;
 b=ziqC7gby4mhQ4vJ98xubPSwbAexdoYTMt4LVUBk4FKxNM9mWVOLa6yEaKWlz5womFt
 iVNAwVQAPrzrSKyi7+qBYi8kqqOEgy7EwrrTQnkd31KZ51D9CQ/4bKL86f8c8EI4jMK+
 bK3ba8I07GfduqrlgiNv15UFGmNVNch/ETubYkuifdk4O3qoV5YSdUW4yWaJcCx8iraO
 5ezFeH+bZLhwymZN65LhIIjHsp/7N2fB1vJuZkDV9O2a/88lDWxqk9ICu5KQti+/KKM0
 XhXCfXqZ9LYhCZKVTzhXrcyJfqEEl7KrBD/mDbNcDxk3KLldfRB5gsJWIqPJ+g/0YVT5
 PuMQ==
X-Gm-Message-State: AOAM531tAZbgm7gHs4kZ34YpxY4U9Nk/vSOLg10ZCHjWZol1oblloFd3
 fo5NMzJoCvyiBHw02Y1VN+9vYKnY1Ly7sL0F
X-Google-Smtp-Source: ABdhPJxZVU5PewVpy6xi5gyrkOTvkczsEarfvMIj8fVq6YCEISgRK1Jwrsk5y10n7GtCU6OoNu2ifw==
X-Received: by 2002:a05:6808:2218:b0:2d9:c3f2:4042 with SMTP id
 bd24-20020a056808221800b002d9c3f24042mr11825314oib.270.1648301155023; 
 Sat, 26 Mar 2022 06:25:55 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Date: Sat, 26 Mar 2022 07:25:00 -0600
Message-Id: <20220326132534.543738-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the kernel-specific "pr2" code structure and use
the qemu-specific error return value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 133bc05673..9aa525e723 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -77,8 +77,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_SP], &gregs[28]);
 }
 
-static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
-                               int *pr2)
+static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc)
 {
     int temp;
     unsigned long *gregs = uc->tuc_mcontext.gregs;
@@ -128,8 +127,6 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_SP], &gregs[28]);
 
     target_restore_altstack(&uc->tuc_stack, env);
-
-    *pr2 = env->regs[2];
     return 0;
 }
 
@@ -191,7 +188,6 @@ long do_rt_sigreturn(CPUNios2State *env)
     abi_ulong frame_addr = env->regs[R_SP];
     struct target_rt_sigframe *frame;
     sigset_t set;
-    int rval;
 
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
         goto badframe;
@@ -200,15 +196,15 @@ long do_rt_sigreturn(CPUNios2State *env)
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
     set_sigmask(&set);
 
-    if (rt_restore_ucontext(env, &frame->uc, &rval)) {
+    if (rt_restore_ucontext(env, &frame->uc)) {
         goto badframe;
     }
 
     unlock_user_struct(frame, frame_addr, 0);
-    return rval;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return 0;
+    return -QEMU_ESIGRETURN;
 }
-- 
2.25.1


