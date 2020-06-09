Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40FA1F4160
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:50:07 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jihRu-0000cq-So
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7N-0006BN-0c
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7M-00018u-44
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l26so3439904wme.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bMx4kzjHRHhQJjT8ZJt6++cIuGHlJtI86oQzfpzysks=;
 b=BI1obM8y5SgFslDkZ+/6zqe6T85WhRdvjT8/N6cTWVHOmOrHuIAJKB/vgHH3fuvekb
 Cohj2YTJ8bAmmI02JgeG8jIS1Tc29V4ffUzB/DbuN03zH9gsyIn9K/SFtbstd9tSKpmF
 6lueMpjalBAq0By05hs/e8xyf3vPCW1MUemhUGUyjdiKCrXxY11xwx/l+NSIl67cMtFD
 5WAKDbhd5YoHhuuzb4jD6rnCs06Ls25jrgOu5tRI348n8wyZGQDnKEQ/kp5jeHItxEOe
 z0RvjIJgvtx0Yb4LLmZJeFg5pXTBHRb8gIg0iCIKsZpd6nIOm4fh9gzTWFee3j9QutkE
 JDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bMx4kzjHRHhQJjT8ZJt6++cIuGHlJtI86oQzfpzysks=;
 b=jkxgmcaKZopykJPONh0DEKzQIRcWjtIsT7To491p7SL9qjALsDg1UOm54uyV0ydz0H
 TgBjyRi1pZI5ieMeePUvEyGGjPF/w5wBtXCTzjb6xHam01yphB6yq/kZEzynyzGhwW+C
 ZeJlgE7CafXaB8ieaAkekTKbwJZIYjpK5vHbbkP7uCy6KPD62ZWodCvymYOfR2ozANUM
 3ziSvTHkapnSKGRXhMjvozf1XIj6n9BgookZX8Os7QNPUun4lOjJLc1FOPew+t5UH/SB
 5ItHMm5G+5Im4L4axHgKkoU+98HxyNcExc1ceogKt+aDCCd3H63Zwz43i2jOuS0FnhmP
 6FlA==
X-Gm-Message-State: AOAM531Z80UoGoTTsPnUUqr07oonC1MFO7rwjzCnBgwzcYMfC54Ci+br
 +rTrJMblqrM72gOUFxR684fYxYL5
X-Google-Smtp-Source: ABdhPJxa5szMWYYFoGZVqyk1Ve9AbowzNboNKPApj0ZXcZk8THTHVgFW4P1erfmsWwUtjOibtTt2/w==
X-Received: by 2002:a1c:49d6:: with SMTP id w205mr5018010wma.151.1591720130716; 
 Tue, 09 Jun 2020 09:28:50 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 23sm3643598wmo.18.2020.06.09.09.28.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:28:50 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 15/20] target/mips: fpu: Demacro RINT.<D|S>
Date: Tue,  9 Jun 2020 18:28:33 +0200
Message-Id: <1591720118-7378-16-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200518200920.17344-14-aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index e227e53..dae1331 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1113,10 +1113,26 @@ uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,                 \
     return fdret;                                                           \
 }
 
-FLOAT_RINT(rint_s, 32)
-FLOAT_RINT(rint_d, 64)
 #undef FLOAT_RINT
 
+uint64_t helper_float_rint_d(CPUMIPSState *env, uint64_t fs)
+{
+    uint64_t fdret;
+
+    fdret = float64_round_to_int(fs, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return fdret;
+}
+
+uint32_t helper_float_rint_s(CPUMIPSState *env, uint32_t fs)
+{
+    uint32_t fdret;
+
+    fdret = float32_round_to_int(fs, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return fdret;
+}
+
 #define FLOAT_CLASS_SIGNALING_NAN      0x001
 #define FLOAT_CLASS_QUIET_NAN          0x002
 #define FLOAT_CLASS_NEGATIVE_INFINITY  0x004
-- 
2.7.4


