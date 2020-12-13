Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FF2D9072
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:23:40 +0100 (CET)
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXu7-0005l7-7V
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqw-0001JU-4T
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:22 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqu-0005G0-Fg
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id y17so14367257wrr.10
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s6etg05C/BF399R/sCtLPATOdY8AkUS5HEwSvbkWAQM=;
 b=q4Prp5VDpN3rINMABx1tB5qHHGoJp9wExi3jL5uSHNsSREz9xmjlJpKgJLDEI0nRnb
 SEH5OLN2DDe1Uv+sCv4EFmTSzWAr62LWrJUCmGGhw4U/NciSZWU/xewdzor/2AQLvCA2
 VK0sNiuweaJZ/Z66bF/qSabLa+jLFxy1NH9kJDRbtSwQ6/bVEhvBBclWGJhywWlaYLAm
 JA6mpkIMwqyOMXu9EO99W3KGya+i7RL/n9G2A59bifZZmi0I77DgpBuzLC4Inv6wsWwD
 YNzZKn82oQuaYqRuB55jAm80wN4awzHSd0CtpIwZn5en4Re0uwMungEGFH97Axt+iFji
 XXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s6etg05C/BF399R/sCtLPATOdY8AkUS5HEwSvbkWAQM=;
 b=qIkOipIQpgV6Xs3miPr6xTgOxjgCDLlvqczvQ/upM2Ydj4r3DUoNMnJaolhANUJrbz
 pduXq+879IhHm8pwZsgk3pjzDA36vYQm3/1KpP01pXCcMB98Ul3iLpgdBEkiryIweRIx
 p8Z67tLC5ftH2yARhZVhJ/DJsgOgqxLr1X7LGysoIzC+JSDCD8/5FRlrKmoQ0zWezC9t
 sJBlBiRqiX/QYYFnUXo9SDh37WpZqm5Ss/P5AvZWJNdKGe2CNdbT13UQjPIKZg6+Iyf2
 q43eV61yxAv3yCeo9Ir71Pv9y+Ir1MHEKf0TrgbE3RNWvcJPPSmBcSm7dWmjBzjpacBi
 i7Vw==
X-Gm-Message-State: AOAM530P3pJaO97TH66vc6TEfo3kLo/ZOmm1n9CIfsn0WDs7b7C8iw3r
 HLP2syItTRlRv0OVBZrV23K99ugVMAw=
X-Google-Smtp-Source: ABdhPJyZsyojoo5AMZgAvYJyhWWykvGk9uZc61cVzGwJ7TbpydQtRq7kaBJdz/R8v4Gzu5uT0JKT6A==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr23100083wrn.190.1607890818932; 
 Sun, 13 Dec 2020 12:20:18 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x7sm19488199wmi.11.2020.12.13.12.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] target/mips: Do not include CP0 helpers in user-mode
 emulation
Date: Sun, 13 Dec 2020 21:19:26 +0100
Message-Id: <20201213201946.236123-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CP0 helpers are restricted to system-mode emulation.
Do not intent do build cp0_helper.c in user-mode (this
allows to simplify some #ifdef'ry).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
Message-Id: <20201109090422.2445166-3-f4bug@amsat.org>
---
 target/mips/cp0_helper.c | 4 ----
 target/mips/meson.build  | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index e8b9343ec9c..caaaefcc8ad 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -32,7 +32,6 @@
 #include "sysemu/kvm.h"
 
 
-#ifndef CONFIG_USER_ONLY
 /* SMP helpers.  */
 static bool mips_vpe_is_wfi(MIPSCPU *c)
 {
@@ -1667,10 +1666,8 @@ target_ulong helper_evpe(CPUMIPSState *env)
     }
     return prev;
 }
-#endif /* !CONFIG_USER_ONLY */
 
 /* R6 Multi-threading */
-#ifndef CONFIG_USER_ONLY
 target_ulong helper_dvp(CPUMIPSState *env)
 {
     CPUState *other_cs = first_cpu;
@@ -1709,4 +1706,3 @@ target_ulong helper_evp(CPUMIPSState *env)
     }
     return prev;
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/mips/meson.build b/target/mips/meson.build
index fa1f024e782..681a5524c0e 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,6 +1,5 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
-  'cp0_helper.c',
   'cpu.c',
   'dsp_helper.c',
   'fpu_helper.c',
@@ -15,6 +14,7 @@
 
 mips_softmmu_ss = ss.source_set()
 mips_softmmu_ss.add(files(
+  'cp0_helper.c',
   'cp0_timer.c',
   'machine.c',
   'mips-semi.c',
-- 
2.26.2


