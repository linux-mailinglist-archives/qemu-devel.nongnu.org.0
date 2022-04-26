Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7451074B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:40:59 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ7O-0001e9-I3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmV-0002U3-JT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004LF-JP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:22 -0400
Received: by mail-pg1-x531.google.com with SMTP id s137so16737010pgs.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqaKUgAiXbPVN3N+PzEnaP4AnWTK8+75oezV6iZmBrU=;
 b=Z7ZfNARVKLpCk5n9Lzj471DsDyvx4uGeSCFFAA7BwMQ+Q+lSMVisiWP/s3eacqkZpi
 TCNkRl6c2hKWEtUjvrUEVYfT78ye9MoS/iYGetRbgZtphk1MfDITvF0037DwBzvl+UNq
 jtg/b3Q7MnPEi/ECCt39dWpKgCK70DrwU/QkMgOJBqWpPK35N8Osn989sskJpoXztOaK
 gcElw7S0vtMY0pAmw9UNxefqEhWHfvZhq59E7Adz1BWCnLkdldwwtS+3dTvZMt9E04wj
 A4ev6/HHLv7vsxcboxLgYDuaTNCgp8Y+pFstk8/vLsPFn+zKl4vzc1FOvrS0JJCws16X
 /75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqaKUgAiXbPVN3N+PzEnaP4AnWTK8+75oezV6iZmBrU=;
 b=eBpDaad5stVJVmdCcx0C5cPaO6JrGRxRI7mV0El06mGUISY3lB4+MA6i8A0tCQ7pan
 nYAmEYKNBYbLZzCpQC+gkGQCPGF2lp9BFHe8TLyo6W26bebfDXhCHv1nUbc+ts4TJHPN
 W0Mu572XQk+5CB9UHrwmD+PFimV6ve+rGGr7iDsDgXSIhzPmcl1Y4YAU/m08PPvplWGH
 yjL7F420kXSRdjMWQBLAzqPVFnvJdMoNo8353K7j0OC2ImrXmt9RQz0yA0p93jqwB43i
 1tM06KI3ff2SfYGX79M/6tawYQ0GCEkFWWw10/8sqMksxAqoQ2Cq47Y89jUbXRU2DZxN
 VNuw==
X-Gm-Message-State: AOAM5316xj+laiW1qaYzBwEypGZYc0NOj10smwoZjcmiBmPljRcM17b0
 ut5pQZneTDQYgA5wYqSXJvU8CjfMpEM57Q==
X-Google-Smtp-Source: ABdhPJzbj6H/OVWDzZpAIo7mSNwGOtZXQugd23+VFQKyZstBn7Ss0OjB5y0Iqsan4Xq5ei8p+H722g==
X-Received: by 2002:aa7:88d2:0:b0:50a:cf7d:6ff1 with SMTP id
 k18-20020aa788d2000000b0050acf7d6ff1mr25849739pff.67.1650997154198; 
 Tue, 26 Apr 2022 11:19:14 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/68] linux-user/nios2: Remove do_sigreturn
Date: Tue, 26 Apr 2022 11:18:05 -0700
Message-Id: <20220426181907.103691-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

There is no sigreturn syscall, only rt_sigreturn.
This function is unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-7-richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..133bc05673 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
-long do_sigreturn(CPUNios2State *env)
-{
-    trace_user_do_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
-}
-
 long do_rt_sigreturn(CPUNios2State *env)
 {
     /* Verify, can we follow the stack back */
-- 
2.34.1


