Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4941C572
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:21:37 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZWi-00046t-7k
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIH-0007MJ-Ss
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:42 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZID-0006Lt-8l
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:41 -0400
Received: by mail-oi1-x234.google.com with SMTP id q16so2764689oiw.10
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zszFeWHoddqJiQjxDacbGdC0FlOhNlodUAD1GXKctw=;
 b=ubKz+tGh0AlMI2BYp96swNidwDBdZ1rscbambE9t9NVmhJu0btAq1qR1DYjh1lQN+Q
 XMoEqmt6o7RzY4ecTzBXKUVRBMeuHA9zaz4geCV72WDARcIJjtuULArQgzBcfGG7L/XJ
 VRQye4wQRqvREC8eR17MDMjSZeUujqOe9ptMKuNM+2NA0/x68uRirNVSRF+5Qlg7d+r7
 aLMRNemr6rSuN4gyO3GhTkecu+eJSCaHl+6zkcwF8hgb4aXBhJJGsGhfgqtjxzBleuUa
 HpnkU6pHa4gQ+ylFI9NJ50S/C+PBCDlXjTI9yiOTB4AAvCA6yVCobqvlz2xCi0Izr2zd
 GDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zszFeWHoddqJiQjxDacbGdC0FlOhNlodUAD1GXKctw=;
 b=x78VaHtJXCQm55dchtS3x7rFyewpXhVtcqJf/loVouNVhZqqqZrwxOu6wO11Q34OK9
 9zx/KozoenfdyYnllyMau7F9T4gPWc/2Q2KYLWGs3T/Fel2aQGlVqnIitxqMXg0JlUi0
 S5oo/poUIUsY7uTSNA902L9k2KVN6s9A950ZGnx51G4xRbsZLYDuuxxjsixx2xhe6ZVt
 vgRedJJPjMXOR8SfNDP2vWqF11lan/er6FZPzptMh2C3ihB06sq9XskK9+frIIl97Cj0
 5oh3qq+/rBJGj/W1wtuGowem275+cQ/rP7ZsvUKQx/W2LoScnDrjVD6cr/6TysfXIJiF
 V2oQ==
X-Gm-Message-State: AOAM532+x0vOSoOl7rnWp17S5zM1KsMrfDGLR1VZl3MZ4kW5b77SXe7u
 S1Uoj9/aU3oDEisxFUS2uYlblsgsfsyseQ==
X-Google-Smtp-Source: ABdhPJy3jnaR7x4YPis8623uYVLXsIEMIjEGJGv3Ai5adCnNI28BROvDkxIJTPCKTCQcDPJCchwNaQ==
X-Received: by 2002:a54:4810:: with SMTP id j16mr8009994oij.103.1632920796235; 
 Wed, 29 Sep 2021 06:06:36 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/26] linux-user/ppc: Simplify encode_trampoline
Date: Wed, 29 Sep 2021 09:05:45 -0400
Message-Id: <20210929130553.121567-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sigret parameter is never 0, and even if it was the encoding
of the LI instruction would still work.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index e4d0dfa3bf..77f37b9f01 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -309,10 +309,8 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
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


