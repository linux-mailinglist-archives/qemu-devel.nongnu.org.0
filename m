Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B766AFABB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2D-0000vZ-N8; Tue, 07 Mar 2023 18:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2B-0000v8-Kp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh26-0002ha-CF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so176630wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzhjArs2G8Y1PX8+/j/k05IJYSC1IAa/Noqj1UMnTIQ=;
 b=jXr9mA8GAJNuJ5KraIk2h2k3nNvnAm0swfZ+Y/Vezbu8meeXIZw2/dXnhPlLk3aLdS
 G/LPyZbAIjuvrcfpSBMfQ9U+yMxDzAGFcTcUh9HwzaVgGDGZiZyJgKtxW8e4EWzUwcMC
 j0JQiyx02gTG5s4jz1kikx5BVQWFz2UuWx1tA244wOz+jcWVW6YCDYYpZJdEl/HtC2Au
 AsUmAlDk/0B/PDnh8iZ60zI4X/IF73wuegD6mzhpPgNySzo7BLSwvrALfIGQqhnYBRTH
 H+e9fQmUNNAUplE49rbIh6rqjBcVmkN+ewUi7Nu+dNs1rOsobWtnmYgNEBjsvs4Eeoca
 UXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzhjArs2G8Y1PX8+/j/k05IJYSC1IAa/Noqj1UMnTIQ=;
 b=Rq3jdEezp4c61k6dfMfONaqTpIzY0FOJzwkzcRkL2GogQOdOtWt00yIOoALBKQUTj+
 EOxx47tO29AMaE1HtriCnnvN6LyEcXqmkspeIimzdFFF6BpsifewlU5aIisl8MHgJ++B
 yxLOx+TLDknlVWfA6bda6N5vz0F4wBkP6ZF9bskukAmpmVysdSlCq4GtthXJO+tLgjz7
 op/nu1asIoh3SiE/zxe73nlAsvK6cGlq3VoFr5FfyeeG7ItkMiqxsW8qLVBI6GlfHFrf
 EnN0NULuXNR198DGDQ0/WHnefZGqOhWTVf0F7cwgjHE8QIqHQ3m706Jpr9j+yDLxc5Et
 odlA==
X-Gm-Message-State: AO0yUKUleBVCTpNAICTU5nBxJPScGm4Srcoa+1xZMFKrVd2cidDhiDgw
 PS7PxOC7X9kH2jXYV1XO1DgE5Sa4CqQW6VD7+SA=
X-Google-Smtp-Source: AK7set8xHkeE0qbdp4Qbh2BUl9bzyZZffd48Hhzpfi6ZJKRK8c9T++0SnSioaMWdYXCDTyMTdtRatw==
X-Received: by 2002:a05:600c:3153:b0:3eb:2708:86ca with SMTP id
 h19-20020a05600c315300b003eb270886camr14294684wmo.28.1678232868847; 
 Tue, 07 Mar 2023 15:47:48 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c069200b003e6dcd562a6sm13839271wmn.28.2023.03.07.15.47.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 06/20] target/mips: Set correct CP0.Config[4,
 5] values for M14K(c)
Date: Wed,  8 Mar 2023 00:46:57 +0100
Message-Id: <20230307234711.55375-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216051717.3911212-5-marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu-defs.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index fdde04dfb9..d45f245a67 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -332,7 +332,10 @@ const mips_def_t mips_defs[] =
                        (0x1 << CP0C0_AR) | (MMU_TYPE_FMT << CP0C0_MT),
         .CP0_Config1 = MIPS_CONFIG1,
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (1 << CP0C3_VInt),
+        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (1 << CP0C3_VInt) |
+                       (1 << CP0C3_M),
+        .CP0_Config4 = MIPS_CONFIG4 | (1 << CP0C4_M),
+        .CP0_Config5 = MIPS_CONFIG5 | (1 << CP0C5_NFExists),
         .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
@@ -354,7 +357,10 @@ const mips_def_t mips_defs[] =
                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),
+        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt) |
+                       (1 << CP0C3_M),
+        .CP0_Config4 = MIPS_CONFIG4 | (1 << CP0C4_M),
+        .CP0_Config5 = MIPS_CONFIG5 | (1 << CP0C5_NFExists),
         .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
-- 
2.38.1


