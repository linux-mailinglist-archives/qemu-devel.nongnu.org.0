Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0A3BE01B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:11:49 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vAK-0000IS-DZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upM-0001qw-R4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up7-0006gV-OB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id f11so78826plg.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EI7h92b1yJotII6nje5EoFkQR471c3va7QkzOD5rBK0=;
 b=L+Uw4390qrHD/Zlvi8CwiX3Z2Lp1r0PkrWbZWNtSrXyc/gvIDRpsNVznYvLbV/mfl3
 ukAXRCNUwgsXv/2FPsV8KBgXciMtwcP0gMailXPLCPR3FTS3Qx+XzXTssV9Z6P+bQPiF
 HCYWxcTlaPCjaM1kzRVVFWJw8i+eywYR4u1WvYvfFkWz2K2LpyTcLDLr4WP8Jz/xhQO+
 yjAB3HMx9IPDROHWl+Z3mga2iAdH62xJp/jTPLIZ7ua/5QtNn2gTSwhJXg9EV81HVB3g
 wtI/2quUbUo90VLxHap4H5qfIxmDXeVg3aEMf3De0VqTPdMY7dwrGelQm6bSuPey1Krw
 pk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EI7h92b1yJotII6nje5EoFkQR471c3va7QkzOD5rBK0=;
 b=KEHr8NPzMA1Z0b21slzSdMtTJwbOQae+eSgTsbDyPCIszE3wwYvkBH7y/RLTznjdf3
 6e5JVoxRPCthRNyr3TapXqzTzRcE0YCSZO4xGLBYOhpihVZ+iDCRGuftME+h/+YDJN0T
 IJ3xOIAEp8sl3033F5F5Eew7w6AXOWtAb1G/8nJDU4E7lmkO39JwSXtXBDke9gD9H8d+
 FoeADuKmfWoTtB4qlANd8yU2v5rwkJ06RSNsPG2ST73i/Fx0eobCXRGboBx587BUXNBx
 GIRkvEo5Hdf4FCVyMMnpxbYOFL/GKF60YD8S41dzgKFs3Knis5XK0ks0sBm0q9lAostu
 xRWQ==
X-Gm-Message-State: AOAM533yRpiB4UyNgukfa2UrroQubbhsgQ8KH15RbJsEr+v9NNrsIJJY
 4SApQs52L3IpDiaX7l/dNJq2gfFibO8phA==
X-Google-Smtp-Source: ABdhPJxyt3tPDa8gCpKD0sGj15r4CkPXoTrbucTvKeyNs5/O0R6nFJrCYkkJUY53YJEe7/BC1tmCGQ==
X-Received: by 2002:a17:90b:3712:: with SMTP id
 mg18mr22666440pjb.164.1625615392523; 
 Tue, 06 Jul 2021 16:49:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/36] target/ppc: Simplify encode_trampoline
Date: Tue,  6 Jul 2021 16:49:26 -0700
Message-Id: <20210706234932.356913-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sigret parameter is never 0, and even if it was the encoding
of the LI instruction would still work.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a37..70cc27b0f6 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -308,10 +308,8 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
 static void encode_trampoline(int sigret, uint32_t *tramp)
 {
     /* Set up the sigreturn trampoline: li r0,sigret; sc.  */
-    if (sigret) {
-        __put_user(0x38000000 | sigret, &tramp[0]);
-        __put_user(0x44000002, &tramp[1]);
-    }
+    __put_user(0x38000000 | sigret, &tramp[0]);
+    __put_user(0x44000002, &tramp[1]);
 }
 
 static void restore_user_regs(CPUPPCState *env,
-- 
2.25.1


