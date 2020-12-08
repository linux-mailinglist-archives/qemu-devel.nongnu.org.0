Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E52D1F26
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:42:09 +0100 (CET)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR4y-0005Gx-59
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0I-0003aY-Hl
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:18 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0H-0001Ak-5c
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:18 -0500
Received: by mail-ed1-x543.google.com with SMTP id dk8so12890320edb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBcAqpVeWvYa5kT7ybzBYVgh68psdEjYqVlt8VyNVPI=;
 b=EF+mKy3oCXc7rxnqO3XKMyE5cT6yoc49bbljauyDu8Z4h4SwLe3V+8SOQCrOGhM34b
 OY1WUXROwPnpHjU5K+jvVZEEK3nuKQeMJgUnE/b+cMiD0JaKD68B0XSYqn1vCtaKv059
 FKEWGFrVf5rbcdQ0WMCtJt6dtSQXd4rRTdjpg/DqjKi8d1qlXLJ4z1oqIIQoV8fg8+Bg
 W0uaSc11640bqgGyejQegNrJ3M8Lg/twsTuSmtKA+VI/mgd0eDPA2UzTyhsJ1f/0nOiG
 NR6vJJKDBeHqXG1iDQXftECja90SlFss0TsGl3GkCc7FyPipxp/aiDgm0p5pPytrzTvY
 5jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cBcAqpVeWvYa5kT7ybzBYVgh68psdEjYqVlt8VyNVPI=;
 b=f+DMupeATIErWHnwqeQFtSNwqah2nStWXlOp0JKbs6OOwBeEFb6tBTyzXGvQ4GiGVJ
 bpOrHbzR0p1DjVY221jp//+baGgrSv/V4zxl/kZazeDwWfFSxjZmXumNJu55p21YiABs
 5ZtNzbS5aKwnZV3l90GsYAm/uSHl+mBDbIz3mAPzEqgaTCQ7UML6I5YiuHGXRmnvXNuE
 R/mqU36sz5bcMOSmiTa6nJkCMrOYxw6PtaiVAnyJAzZpDRyO3vhqEBTwEJXFgzKxPKVr
 18TciAmf9XFJ4H2oHK41wfywa5RCy4fTvjhDtOhwgkB1Icf4lhsJguMqG+vgCxjMBap+
 DTAQ==
X-Gm-Message-State: AOAM533n/g88eReXtgGRdqyxHEkSj5wfnIU9q9Wce5XZKFhj8pw31/pu
 Ya0xjGpW09uh45gUkdBppc7NLcELRtQ=
X-Google-Smtp-Source: ABdhPJwYUp7Xv29jcHxIdBN4YcvGvOJHHFZ1ZiLF9SaK7CNzI6qtsm7cRuqA13vmJvwaMSH62iP6GA==
X-Received: by 2002:aa7:c749:: with SMTP id c9mr18694617eds.3.1607387835615;
 Mon, 07 Dec 2020 16:37:15 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c5sm15390194edm.35.2020.12.07.16.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] target/mips: Simplify msa_reset()
Date: Tue,  8 Dec 2020 01:36:47 +0100
Message-Id: <20201208003702.4088927-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call msa_reset() unconditionally, but only reset
the MSA registers if MSA is implemented.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c          | 5 +----
 target/mips/translate_init.c.inc | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cb822e52c4b..b20cf1b52d9 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31876,10 +31876,7 @@ void cpu_state_reset(CPUMIPSState *env)
         env->hflags |= MIPS_HFLAG_M16;
     }
 
-    /* MSA */
-    if (ase_msa_available(env)) {
-        msa_reset(env);
-    }
+    msa_reset(env);
 
     compute_hflags(env);
     restore_fp_status(env);
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index cac3d241831..3c9ec7e940a 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -1024,6 +1024,10 @@ static void mvp_init(CPUMIPSState *env)
 
 static void msa_reset(CPUMIPSState *env)
 {
+    if (!ase_msa_available(env)) {
+        return;
+    }
+
 #ifdef CONFIG_USER_ONLY
     /* MSA access enabled */
     env->CP0_Config5 |= 1 << CP0C5_MSAEn;
-- 
2.26.2


