Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90459C2AD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:49 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9LA-0006tg-By
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ96k-0003g1-OY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:12:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ96V-0004Jf-4G
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:12:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id h1so5757713wmd.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=r1xWEOHWHOt3MBY5xlN7HosIZZCC0kMBbMC4Q6TASCY=;
 b=TtwXxZPjJkqewIsyOPEc3rczi4fDZTbgvfeIB8B62EEbFXTpX1DESdezNls8TKf6rp
 AIz8NvnUyYX9s77mYAiAWnFsm6feHnJAHTIrgZeXP/jkJvN5qGlba3r/zLLdJ3tDKHhA
 r4zBpPe8IvpNT15G8mkNcbh4q0I22fukf08/3RNhTVisZG+kOhV56wAX9vkUoG/ogTqH
 IACPfzUAZQlgGeYEFtVE0NauI1TnrH5MTzLuUw5gAamEtV4fiQfw05jQxc7bZPErslOb
 T3IP+GPs38Oaq8Qm4J2z13whK6zI9fVSj56hCs/6U0EdkMp/zpm4TyYS7SD/8UduWIZr
 q6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r1xWEOHWHOt3MBY5xlN7HosIZZCC0kMBbMC4Q6TASCY=;
 b=A6X0/0FG8x1TjCTfyHwCRSAgaSqv96fpX1ZDYY957A7WW7bHhtDbSRngBe7KUQtjI2
 8oc014mtaz5z6jKnZ3zbz1Ta6cz2nLZMCjsupFPfmYTawlEEIxjMMvBbiY9wDnIe42wC
 KVZVe7OY+plRuSLzOuZsBAUU6U0TYpbGCAKeKxv0wLNcJzz2dCZG5wsp3vPF/5iwn+Kh
 dcP0NEMmOh8YKYbW09hSnweO7NiEyW8w6FGMMADlBQX4r3B4BHYNkp3bZv35IsBfVXYD
 ifPZSoPOxPG9bOOczNpdgAVfR0XJoI9bUBQ7ZVEHKMG3manpgDUkkgKYCvsNwZ92DSm8
 wf8A==
X-Gm-Message-State: ACgBeo2IC3cod0ODce6KNOtubHY6crEeSQNk8H3yYyePNclV2nJ4NGJT
 KkLFb9o1y9An9IAKzCuKMEMp69u0zUJYrA==
X-Google-Smtp-Source: AA6agR6DNN0E2mWTaHDv6skaCGzHgfGGwSghUnFjG6NR8aFSURYg+71PMzOdi3dTTRsdTO0DDp0h8w==
X-Received: by 2002:a1c:7c08:0:b0:3a6:2569:4986 with SMTP id
 x8-20020a1c7c08000000b003a625694986mr12318271wmc.117.1661177561665; 
 Mon, 22 Aug 2022 07:12:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 6/7] target/xtensa: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:29 +0100
Message-Id: <20220822141230.3658237-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

xtensa semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index dc475a4274b..43d55989349 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2360,13 +2360,14 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
                                         const OpcodeArg arg[],
                                         const uint32_t par[])
 {
+    bool is_semi = semihosting_enabled(dc->cring != 0);
 #ifdef CONFIG_USER_ONLY
     bool ill = true;
 #else
     /* Between RE.2 and RE.3 simcall opcode's become nop for the hardware. */
-    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled(false);
+    bool ill = dc->config->hw_version <= 250002 && !is_semi;
 #endif
-    if (ill || !semihosting_enabled(false)) {
+    if (ill || !is_semi) {
         qemu_log_mask(LOG_GUEST_ERROR, "SIMCALL but semihosting is disabled\n");
     }
     return ill ? XTENSA_OP_ILL : 0;
@@ -2376,7 +2377,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    if (semihosting_enabled(false)) {
+    if (semihosting_enabled(dc->cring != 0)) {
         gen_helper_simcall(cpu_env);
     }
 #endif
-- 
2.25.1


