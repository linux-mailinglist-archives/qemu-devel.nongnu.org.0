Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4D2D907F
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:26:26 +0100 (CET)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXwn-00023h-1k
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqr-00016R-56
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqp-00057m-H1
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:16 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y23so13446335wmi.1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ISNCVzJYbaoq1vI61by2IBAkaqbdNie7OHgVDeXnbA=;
 b=QnkMcMiqG8UVyDMMuGRox71t7T+UqZBUKvKswBUB2KOeED01VBfl1gTqc5svpwe1CC
 rgudl0VE4QS0bigb8esLT9df+NjBOsWyrZfVj+qQPS449oSmXo9w2OybNxuwdEVbGcnf
 9OZMrO0pd1dU/wYb+ybwrpJ0agz5ct4pj1VARipaQZi2eWaE2lDbgFBkJv4TXxPQ73ds
 n3sXcx4L7PddPgiwLLwSksoL8J28lLeRaYWBl/pcU7PRnZTDyVwPmI//BYk9vZdt7FsQ
 HwBqSaqbkszXuQTYtepR5kp0AgKMRup1qCrXkbc0/S+7Kkax0P9mPw/pOaLd5c2R2Ccw
 wprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2ISNCVzJYbaoq1vI61by2IBAkaqbdNie7OHgVDeXnbA=;
 b=Ep2H0xo1BMck9vmvSVMMPXg7tRnOE7UVR1phBRS/8O/7L+AbpBnX56+M0EFQD4+1In
 26TxAOOUbT0LBEXA8hv+Xt446f1pdeAZ/tR+VU5Ny/QrBpTUoBofZG4xz+retwT/TSDm
 FSJ1iwUBuz+2XIyIBcKMdQ+KxlpRLXf2/V8+QDZN8ioeI3UKIbhPa7cN90+/FpikpQ39
 coaaalylC6Dc3bd/w7Gb06Z7t9we2L4WHURycQw/0kAO6yKLOo6u2zbkfrZT6WaZhBf7
 LIhVg+gEZlIyuQgsV4ufG/95BWhMAGjp+i22U5GPcea1H08t3fSzCOOQ8WkSkqOnvcmb
 Ra1w==
X-Gm-Message-State: AOAM532rMVTHnjKyX9E22tjrLgoboGaxahSTpPTMCCxlsNS4PoCP5IDc
 eeQJ6aVK9V57n2i71O/T68WnyT59MUU=
X-Google-Smtp-Source: ABdhPJw2ev9B7VvAvmY2StzAj4Kxo6/UL0BE2A2EbJKABhbhMiX+nTwfhVj5Xh5TwXp8OPQeLmPEsw==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr24316116wmr.162.1607890813972; 
 Sun, 13 Dec 2020 12:20:13 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm20448668wrb.73.2020.12.13.12.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] target/mips: Replace magic values by CP0PM_MASK or
 TARGET_PAGE_BITS_MIN
Date: Sun, 13 Dec 2020 21:19:25 +0100
Message-Id: <20201213201946.236123-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Replace magic values related to page size:

  12 -> TARGET_PAGE_BITS_MIN
  13 -> CP0PM_MASK

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
Message-Id: <20201109090422.2445166-2-f4bug@amsat.org>
---
 target/mips/cp0_helper.c | 5 +++--
 target/mips/helper.c     | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index a1b5140ccaf..e8b9343ec9c 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -904,7 +904,7 @@ void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask)
         goto invalid;
     }
     /* We don't support VTLB entry smaller than target page */
-    if ((maskbits + 12) < TARGET_PAGE_BITS) {
+    if ((maskbits + TARGET_PAGE_BITS_MIN) < TARGET_PAGE_BITS) {
         goto invalid;
     }
     env->CP0_PageMask = mask << CP0PM_MASK;
@@ -913,7 +913,8 @@ void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask)
 
 invalid:
     /* When invalid, set to default target page size. */
-    env->CP0_PageMask = (~TARGET_PAGE_MASK >> 12) << CP0PM_MASK;
+    mask = (~TARGET_PAGE_MASK >> TARGET_PAGE_BITS_MIN);
+    env->CP0_PageMask = mask << CP0PM_MASK;
 }
 
 void helper_mtc0_pagemask(CPUMIPSState *env, target_ulong arg1)
diff --git a/target/mips/helper.c b/target/mips/helper.c
index 063b65c0528..041432489d6 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -858,8 +858,8 @@ refill:
             break;
         }
     }
-    pw_pagemask = m >> 12;
-    update_pagemask(env, pw_pagemask << 13, &pw_pagemask);
+    pw_pagemask = m >> TARGET_PAGE_BITS_MIN;
+    update_pagemask(env, pw_pagemask << CP0PM_MASK, &pw_pagemask);
     pw_entryhi = (address & ~0x1fff) | (env->CP0_EntryHi & 0xFF);
     {
         target_ulong tmp_entryhi = env->CP0_EntryHi;
-- 
2.26.2


