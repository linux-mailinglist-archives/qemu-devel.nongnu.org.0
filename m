Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FC50A457
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:36:46 +0200 (CEST)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYrN-0007iZ-V5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ4-0006tz-Jq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ3-0006DZ-1q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:50 -0400
Received: by mail-pl1-x629.google.com with SMTP id b7so5180491plh.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKOlYlcxrl/nPWmFD1pBufh0V0TUi2r8yo6MvhqaIYI=;
 b=PMzeICDraAOOLw67iHi8Z+X6k8ub+PkGZXep5DY/U08BuvxXBWjokz69meb9Y3Cjvc
 mjmHsjhtCaC9mwpgVoP9Iyl1Qz7nOEPCS087rsuvC7A94YNUvNLouSxSl/W2A+GsYYEF
 JbVI3QkmeVt+1lT/6Vg3MNAuRq7TuhbGPAWZvmJ366Z4BqV16hplf6pX/2wBpWguOaKE
 B+4kcdw6sw8pDCPiY8bZ6ylUEu5KcoJHRDEBK/h8gpmSeZC7ftvnQiRnBCvMtb9zMWq2
 f6TUxUfrZGhQ0xuBDAS84zX8yDsx5gGULgfU4sbtunnPXWo6Vo+Ac2v0IkGKD+O5KB/Y
 jjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKOlYlcxrl/nPWmFD1pBufh0V0TUi2r8yo6MvhqaIYI=;
 b=FQZ+bQcVWHMCXZlaLGpSwBa2XL6hENpWeOeB+10VMdhlV46z3FVKl8YDUQyxuCzGBt
 MA0oh1exAC+Bd74WGXLs0xxTLXB3+OCMTM4dW2L1n3/vddsfsCxDdZgXMlYHjoo+lb+U
 MyyJgpRjsLGMVPhfpnHk0fcPnskS7oG6qDsfw/ZeCfxsEouWEXS9apjBpKEXT3KHYZ/1
 AeWsQby4Y1kMM46DqM71ddGqRYMYRBqvd3pDH5c/NF1jWFL/Wu66P6FNA18bKrzByO5K
 bx1LMYgBjxKd159tIQXz47M9xa42JC01gaxi1Yij2Hd0NVkFye8hjKO88ryetUnzUKax
 +4lA==
X-Gm-Message-State: AOAM533xNS3A5mcSrZoJnCv1wL9ooSvi4t39odjRmuQoZX7hEXeAntKD
 cUeG5tMh0snzJwkqRHXe9RaJKEh0BJlF+Q==
X-Google-Smtp-Source: ABdhPJwnVOLxcrKc8sEPcsQFUyXnJ0lxvudAAjm2Q7sT9feNBwhsgjJV1f8/x611uynedoMDCBIytw==
X-Received: by 2002:a17:90a:4417:b0:1ca:a861:3fbf with SMTP id
 s23-20020a17090a441700b001caa8613fbfmr11089787pjg.80.1650554267740; 
 Thu, 21 Apr 2022 08:17:47 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/64] linux-user/nios2: Remove do_sigreturn
Date: Thu, 21 Apr 2022 08:16:37 -0700
Message-Id: <20220421151735.31996-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


