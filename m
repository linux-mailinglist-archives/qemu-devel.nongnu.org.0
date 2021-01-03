Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A894D2E8E48
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:06:12 +0100 (CET)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAZn-0002Yy-NU
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM7-0003qm-GC
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:03 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM6-0006Av-0k
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id c133so15945104wme.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONmR7DvST/KHwvIMlpQESaWh+hvboxmRkL03nu+T/uM=;
 b=HEzjlMV5Y+TSG3Oz+s7DHMSoie7zxoE+rmiD6vVzX8Sjr/g2KwEUVjmXFLtt3JWG5Y
 H/HCUC7sRl7fkS05Rpt/aYf5sWridbt/Y3Ddqfln5eYvVTLYDfh2jGAi5LwH2nt53thq
 6LfSkwIKUC5Ze1sSQ63zY9+9+fXlBwlX2l/123ad1Vy9mWW1xdnHR6CG2o0AIoAxVHNN
 r44p7HuA+UQnIEw1qtwhjeIFziqoko/2w8S9cDXQAhOvqLgTiUHtbvRDLMZx4DckrQYF
 LqPL/ljscRyBcibzVx20bGEkDLj4GQ82RPJU6kWZj6Ad7y9dhn4/7KEQ0ksGf9/ri7Hn
 gAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ONmR7DvST/KHwvIMlpQESaWh+hvboxmRkL03nu+T/uM=;
 b=PwhOSOzqmB/S7H9eJffp//NiEANf/mJCGJ/3Jv4XErnsY43TS0HYluoNLXIS3fk+5H
 Bx55xDcPKYeK2Q1F3xht5RiE/P/xfNC+uHQG9MRxVcqaMKh27ejDcaPXFDmFC91U66ob
 4+eSNmPN4ATbysBLUUOq9sg+WWrrVAeUdHh3DsoXCkQukP6E103v6Q3nlbil9Eko8gJM
 1FBBqz84abnnqaKhyl9DpyeEXyd70RfVthcwwO0lX+tiaVkRIHpIpIclAugBC9iEH1Sn
 1ldBz1/P4/af9xzxZF2o3+uUDzGqBOPVhvrvfkJxxOXi9QPkGPuBYOlgrhKudAwGcVoB
 qEoQ==
X-Gm-Message-State: AOAM533txzc0uv3yjOtSxYoVoVW1uHid7kRYa++MROtpJT6jWNdTb7ey
 ZSxLXoo0t1RlcdhNHiyIPpTQ7Dbuoc0=
X-Google-Smtp-Source: ABdhPJxASIbbNb4+M6YMd98+8a7g00xjJoE0JcK5zEjgPr7OMHygC+mFDfTHHgJSVmi5Ry8f/ZLIPA==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr23702785wme.72.1609707120644; 
 Sun, 03 Jan 2021 12:52:00 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id r1sm90034783wrl.95.2021.01.03.12.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] target/mips: Don't use clock_get_ns() in clock period
 calculation
Date: Sun,  3 Jan 2021 21:50:06 +0100
Message-Id: <20210103205021.2837760-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Currently the MIPS code uses the old clock_get_ns() API to
calculate a time length in nanoseconds:
 cpu->cp0_count_rate * clock_get_ns(MIPS_CPU(cpu)->clock)

This relies on the clock having a period which is an exact number
of nanoseconds.

Switch to the new clock_ticks_to_ns() function, which does the
multiplication internally at a higher precision.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215150929.30311-3-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index b2cd69ff7f9..2283214c879 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -380,8 +380,8 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
-    env->cp0_count_ns = cpu->cp0_count_rate
-                        * clock_get_ns(MIPS_CPU(cpu)->clock);
+    env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
+                                          cpu->cp0_count_rate);
     assert(env->cp0_count_ns);
 }
 
-- 
2.26.2


