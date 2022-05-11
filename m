Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D18523F75
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 23:31:31 +0200 (CEST)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1notve-0003vT-2K
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 17:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1notuH-00039n-5b
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:30:05 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1notuF-0001ww-BA
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:30:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id a191so2883779pge.2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+iuJrndhPVIaL0CLeXs0HVabN1xL1R6dnDQYbpre0mg=;
 b=Vvv5KHQ6U6sX+nGLrdP+dPolmmTz3ljFoIR8HDSj/ZYYlLJADY82lFi1+UeR7uRQvu
 CHR+IzMas+E6B0MteMfwKZLcvDIb8/6lbVUR6TktsPeAMaBTZtNpsjVU0oh3nfzK0hit
 ZWAwc1mEoMaykRPbpjxWx0qrq5cdlGPu3OlU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+iuJrndhPVIaL0CLeXs0HVabN1xL1R6dnDQYbpre0mg=;
 b=1WLzyrsYjuYgS5/+iCEnYD4fwYIrSWOF1v5d5eassVlspquyJlN53fYH/JDQ9bFxyo
 +z2D7Q9GEVKEqphaREl95iCsxVbOMEDhP6+4aL23xOWGvhq6WY+IwFEE2XmRl1+TIgPB
 UfWRLCm9v+F+NAaL9uvI34nKV8E5D/HDYGBQFx0ur/3RLDg22M64uOtGD6V+B2Z+Zblf
 4I8Uv4QpOkm56WVCJuplJz1eCW8La4ulGUdfF+tC7ZGS8mISLPvaHx86omoT+d2bxLP6
 3Lms8XWnHtDdxxdLuvgnSc4OhlKjFewM7S2g3S2U+TabqYLLXKkl0bkCKtxjrf76MdGV
 aGLA==
X-Gm-Message-State: AOAM531od1IPNvwjgmHivtmWykkFBRU+DXo8F3AkxJT4hx+ZDxeb2UAE
 VsCR18RV5bBjZLtrP4AtqKa9vcthbEIdJQ==
X-Google-Smtp-Source: ABdhPJwCmfMczz/Q+39Z8IK0qrX8k9dYPi36txWBhi3PewytXwFvLttyXHLASYXSDR+LYKuXRI14iw==
X-Received: by 2002:a05:6a00:1808:b0:50e:eee:d78 with SMTP id
 y8-20020a056a00180800b0050e0eee0d78mr27122620pfa.81.1652304601107; 
 Wed, 11 May 2022 14:30:01 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170902c2d500b0015e8d4eb27csm2315073pla.198.2022.05.11.14.29.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 May 2022 14:30:00 -0700 (PDT)
From: "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?="
 <philippe.mathieu-daude@fungible.com>
X-Google-Original-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 David Daney <david.daney@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
Subject: [PATCH] target/mips: Fix WatchHi.M handling
Date: Wed, 11 May 2022 23:29:53 +0200
Message-Id: <20220511212953.74738-1-philmd@fungible.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-pg1-x533.google.com
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

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

bit 31 (M) of WatchHiN register is a read-only register indicating
whether the next WatchHi register is present. It must not be reset
during user writes to the register.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: David Daney <david.daney@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
---
 target/mips/cpu.c                   | 2 +-
 target/mips/cpu.h                   | 1 +
 target/mips/tcg/sysemu/cp0_helper.c | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad74fbe636..c15c955367 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -305,7 +305,7 @@ static void mips_cpu_reset(DeviceState *dev)
 
         for (i = 0; i < 7; i++) {
             env->CP0_WatchLo[i] = 0;
-            env->CP0_WatchHi[i] = 0x80000000;
+            env->CP0_WatchHi[i] = 1 << CP0WH_M;
         }
         env->CP0_WatchLo[7] = 0;
         env->CP0_WatchHi[7] = 0;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5335ac10a3..6b6b8776d1 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1005,6 +1005,7 @@ typedef struct CPUArchState {
  */
     uint64_t CP0_WatchHi[8];
 #define CP0WH_ASID 16
+#define CP0WH_M    31
 /*
  * CP0 Register 20
  */
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index aae2af6ecc..5da1124589 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -1396,10 +1396,11 @@ void helper_mtc0_watchlo(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 void helper_mtc0_watchhi(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 {
     uint64_t mask = 0x40000FF8 | (env->CP0_EntryHi_ASID_mask << CP0WH_ASID);
+    uint64_t m_bit = env->CP0_WatchHi[sel] & (1 << CP0WH_M); /* read-only */
     if ((env->CP0_Config5 >> CP0C5_MI) & 1) {
         mask |= 0xFFFFFFFF00000000ULL; /* MMID */
     }
-    env->CP0_WatchHi[sel] = arg1 & mask;
+    env->CP0_WatchHi[sel] = m_bit | (arg1 & mask);
     env->CP0_WatchHi[sel] &= ~(env->CP0_WatchHi[sel] & arg1 & 0x7);
 }
 
-- 
2.35.1


