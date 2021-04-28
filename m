Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6236DE25
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:22:17 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbntA-0001fH-AX
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndJ-0000Tw-FP
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndH-0006QY-P0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l2so11514311wrm.9
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IVwZ7ZYGcqvI/Dkkcktk2wuADx6ZHHmimEVhHCeRWCA=;
 b=TfMkKcPXydgzX4J0810iJjM2celwg0rwx+bd6QVJJ+KJA8Yl7X5aNKQiphMpBOKIOI
 QiA/osKmJIosS8ctTX2Hr9+Fl7CiKTttEF7NlGwO9Vh2j0rqicTOyRwRDjgD19vzV860
 BFUPgByHw1ayEKwO0wyMK9FXIj32TVjK0U4qUXESMKvJnmYZTwpSoQCEdrvVj1VtO4Md
 PNOPQvd85V+H+77r7xMsVu4idnZ2aYksY65D+O+6UtmtJMOaNnkzOWcP2wpzcyi/RMCf
 FgHS3E0iyPkMN95Hw1VIQxl3V9H91DKuQbDHfG3wYPIddZNndKuCgJ3xvLBBsyix4xyY
 ajaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IVwZ7ZYGcqvI/Dkkcktk2wuADx6ZHHmimEVhHCeRWCA=;
 b=mAbQ60+tu+MCG1/E6GWWkYXgVcScqq1fYXi9JNVkKh/z2MexjnzJlD7rjH28OE0KfD
 9He5Y4mQHwayLnjekaKtIwSmKVjEwVFBED2moCHR1oB3CeOzvENwa+nTqq9MunkxnXaQ
 2wFAQhJ47dARyoflSNxro2NpQuwitshY/zXrEhimuJBCWDrjGUmRHEFK6FrJDO4GGCZv
 2vgYXqTFqsPSEFwDUtrm9IID1d5+DTe/uknPuRuByuA7RtzkPxJjR2H9ISQwE9JhYib4
 uk0aLwG/bKAoEG7buN2MuoD3kqWUwuO3QDSwSermlW2nkcZbZ8bCZ+OzpjpLzk0B0gi3
 2VFQ==
X-Gm-Message-State: AOAM533fi1WGsSDp4O3/+ehSSUPwLlSjZgq4DDHRxC2HMpAEdNnBahyr
 eCGwu2CoG1OsRyCOrkzI9321sGGIFrUP9A==
X-Google-Smtp-Source: ABdhPJx6jfpmbwEA+AgtydXhKkzKx90XlLw1YDZMxkrM9p9cXwaiPqYVdrmQS91OtQmxEBM52T6ZFA==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr38160932wrg.165.1619629550299; 
 Wed, 28 Apr 2021 10:05:50 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm438060wrt.83.2021.04.28.10.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/30] target/mips: Move cpu_signal_handler definition
 around
Date: Wed, 28 Apr 2021 19:03:55 +0200
Message-Id: <20210428170410.479308-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have 2 blocks guarded with #ifdef for sysemu, which
are simply separated by the cpu_signal_handler definition.

To simplify the following commits which involve various
changes in internal.h, first join the sysemu-guarded blocks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 754135c1421..3c8ccfbe929 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -151,14 +151,13 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type, uintptr_t retaddr);
-#endif
+
+extern const VMStateDescription vmstate_mips_cpu;
+
+#endif /* !CONFIG_USER_ONLY */
 
 #define cpu_signal_handler cpu_mips_signal_handler
 
-#ifndef CONFIG_USER_ONLY
-extern const VMStateDescription vmstate_mips_cpu;
-#endif
-
 static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
-- 
2.26.3


