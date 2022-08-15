Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587A59360B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 21:13:23 +0200 (CEST)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNfWc-0003dl-Ka
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 15:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMp-0002fG-7U
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMm-0006LF-NY
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id z12so10075165wrs.9
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 12:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PrqYC+Ea+m5GjOCDRyOYZzhgmh4N94e3qWCRBEWRM+s=;
 b=DjVCRCi60O1vAe97iHukk9eRK7yHiuq9xuKeamidUhGOCB/NmI58spRh0s/Ki5XwwI
 HOxsU8cmasSptLjE8wyZH/mqIQeLlEFLU9FdWFKRQMekDyws75fLGUj42NyjwYtnbnjF
 pMBvvpAxoWezzsZeUaerQXRYnFeE5Le4gRGXU3WS5RPX+XdXimyBk6jeJaqXEyisPdPN
 PGXeq7TrhXTGjXqTpb308RNnjSOq3VbJE+0gjkowCtv2O9cMfW6sKXaecscOtuLgOFU8
 tF1q4gZF9VajwtanfrWvp6bXbaXvu7ZvNUEFZZOud1+9CTgYudTsEyVxXXO2kiggEcGI
 FEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PrqYC+Ea+m5GjOCDRyOYZzhgmh4N94e3qWCRBEWRM+s=;
 b=bThrkaVRaIZwbQFA8UXi+LRn2p57OEojOpiWGlFXOhvg+NAryRiK0O7lrFL8gr07W2
 0s5UVghhsvrK1tfzkmMB19rSL3/7uhu5NzXP7plHNPq/wzVswecaxHgNvUUQOnlH9YEL
 o6q7yjyVsSXInNziUu4ebDrgwilLUoQw5ybeFNmRJHofhNZA7mbuI9B9YPgbbK2mVtpu
 QoRoWE1F5ikSaDGMLrK8vPApbSYr2q+HfzOs76WWMv3tcZKW2RJL+bmuuGJGLquGBu1j
 PKYwBerANSWUNBq3QzalDJiY7LzRHhLL68qzHCRoHxFjxhnzNFonL2PBuPxVzoUpPXjR
 DQdQ==
X-Gm-Message-State: ACgBeo0aD+XWOAcRFuDkUk3Lm81wBNtx4hpdMZcxjV/Qh6+uw8Z4RgIn
 GpAgbakFZAO/ZCy0xDdqzqoZpQ==
X-Google-Smtp-Source: AA6agR55TLqg0vhN0UnaLF8XG05JJjbRv+bApYIf9XYML7NPEexNNps77mRl9pDSMhK1XjyEVuUTzg==
X-Received: by 2002:adf:e44b:0:b0:220:5bc5:e942 with SMTP id
 t11-20020adfe44b000000b002205bc5e942mr9410873wrm.179.1660590191359; 
 Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 3/7] target/m68k: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:02:59 +0100
Message-Id: <20220815190303.2061559-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace.

(Note that target/m68k doesn't support semihosting at all
in the linux-user build.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 4b3dfec1306..a96a0340506 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled(false)
-                    && (env->sr & SR_S) != 0
+            if (semihosting_enabled((env->sr & SR_S) == 0)
                     && (env->pc & 3) == 0
                     && cpu_lduw_code(env, env->pc - 4) == 0x4e71
                     && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {
-- 
2.25.1


