Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13105B897F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:52:25 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSoS-0000tH-Tf
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMO-00088E-22
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSML-0000ci-4c
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id ay36so1983926wmb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Fst4x49rn2TZohR5patrgQl48OlHihnTjCr3gqAYNQs=;
 b=n2hdNL0XAYIF6KU+WDutOS/sYWYvGx/kajB2zcxYR7PcJc55jIPdK32DtYKNlnBKti
 9di48vukFIvkycrUErxhl22UnIH1QEKf8stf3dlrMuDGB5Px9dhMeZmtOx3A3fP0FM/K
 PSVuCEy5S4dXprRUrJCWFuLDUv15kkBd3OocknGtPkboXMraHX2wYVc0aWOEdqaj5rBj
 VYurw+5hTZKV6xeIY2v1KpwfhRbHkhdlUMqDoL+HN3HGODHsKJS4Ynm7gZk6BDUBLuzO
 tPYzIbzhvIKCBkV6Bco51h4F8i0woGwsr1jZdfOg3iFaEfMKb+nebBpd2LcmixiRXv/D
 5PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Fst4x49rn2TZohR5patrgQl48OlHihnTjCr3gqAYNQs=;
 b=w+F82WCFHk4mburiQH14nuGYqfL/SoaVYcaIx1eLAq3Fq7uENR62vHBa00ctzBhGMJ
 X+OgleXwEu42IF4FdTQoM0LH7Ftrxc5IxOiQyo3DmyjSv5L9OWbkRjipCE44dx77hyZY
 9qTneRj/KOJ3DQsi4bxLYEdxOmYZXlhf73hHqQsyS9Ma0VJnLMrHalhpnbS2EDRumRcP
 5Ya7aL7AFosoJLxJRGzkDg3J9uqKRy8cCEWMjrCa8vxsI73C2qYDOaEHxjcuDPJicPIQ
 ropAGBOzWrZGMnWITO9u2Zs3eYfbaJM39ROiooKIqzDLJ0i1CHZLIS9vV5627vee5y1R
 UMNw==
X-Gm-Message-State: ACgBeo3Sk84OjPtO6Z3bPxjh3cN7+lA9pm/EQqXCLZjtPUtGbMstLNku
 m4Jk6oltt2UljPoD97PK5ItkD1lVgqm2LUba
X-Google-Smtp-Source: AA6agR64lv1OMuegYYb5qYbYv0ZAMGQ4rSa26ZwHA3nI2KZdnTu8/65dt/P0LGuogBOuxX1YmBBsvw==
X-Received: by 2002:a05:600c:5486:b0:3b4:7e47:e19 with SMTP id
 iv6-20020a05600c548600b003b47e470e19mr3189672wmb.12.1663161799577; 
 Wed, 14 Sep 2022 06:23:19 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/11] target/xtensa: Honour -semihosting-config userspace=on
Date: Wed, 14 Sep 2022 14:23:07 +0100
Message-Id: <20220914132308.118495-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20220822141230.3658237-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index afae8a1bea..bdd4690a5c 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2362,13 +2362,14 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
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
@@ -2378,7 +2379,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    if (semihosting_enabled(false)) {
+    if (semihosting_enabled(dc->cring != 0)) {
         gen_helper_simcall(cpu_env);
     }
 #endif
-- 
2.34.1


