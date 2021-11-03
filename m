Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534BE4443A0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:31:54 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHIu-00068V-Tr
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwq-0002d8-Vl
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:04 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwp-0005BN-3P
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:04 -0400
Received: by mail-qk1-x72a.google.com with SMTP id n15so2336323qkp.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laLwdCpLZDBORzW+YMoP8+ykSJDKmPsijwGqiemMxIQ=;
 b=ErQ0u8/FfAVcKxQObxp+mJ4RCQNSt9pyfJdS0sZt6znN/q6HPJejrh1wZ0FGRQXakx
 sILxPMBqv3uPXXRxUzSzzQNVsNINQmN4U9apzpXEfi8O/Vkavt5kwps35Ss4MEsNOoul
 rCnqb5g8j/GFjrFBxl1ESg0Hum7PZAjvtxGXLSRjeIptVR4WGHg5G94VqGYuXVe6Cp7F
 egIxPBZJpitD+h7xn+DTTkx0ObXBA1FqBFfaJhuof2GaD+MhKM70h9RL4ksBH0sGh9hi
 V7q1ZZH0a0sYx8jZxK2fevDWdFsNZB6sb+Z7+gjmUUo68h7vg+LZR5yKNNtpaN3xhXIz
 WQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laLwdCpLZDBORzW+YMoP8+ykSJDKmPsijwGqiemMxIQ=;
 b=ah79ujONxAzTASI988x47DMwzn4/Y4LbUQRQgkvb5uwaTCpjRN32FtARp3tjBjAcdD
 nSMLo76OuGS9yVxOZZWu7SQMFM/vR25we1Kp6Fu2Ee6iBkU1CxyqeObkboXPXS4Oqvgn
 3Ll612Jqy8RlPEC8/gB1yS4XAaDcwFEMtrRKdwt/hny9W8KjRGmWvmc52qmfxiFlKf2U
 QwdvTYXu6M45hS1aKlcOjGkhHCpuxeu2QQg4y9nolzz5WR3qbWKNGacKaRyfL7Jt88H9
 U+uYNckN9+8BAJt5EsrTSgkzOW/M3nQvAO/wKcYiojH4mMTK/W1f5NYBO1hLPC6XminO
 Vofw==
X-Gm-Message-State: AOAM5327TWhyc4PBLJjnupQtvQr8uIZjTYh46HssOsK4tBQHXOAz2voi
 JCaTJW0P6A+Hn5Yx46J5/a08XWnXD/sMJQ==
X-Google-Smtp-Source: ABdhPJwJpTTpgsfw1JN/63wb9tMj+fO9WTzbTky1eg4eTSNkPbCmKitpn5k6XnhJEjkD7jqktKahig==
X-Received: by 2002:a05:620a:178b:: with SMTP id
 ay11mr36326218qkb.287.1635948542226; 
 Wed, 03 Nov 2021 07:09:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/23] linux-user/s390x: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:44 -0400
Message-Id: <20211103140847.454070-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/cpu_loop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e..0965d3abca 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -58,7 +58,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -158,11 +157,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.25.1


