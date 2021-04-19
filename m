Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F40364AB7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:42:28 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZmt-0007PX-DT
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQs-0007Sc-Ct
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQq-0001RW-Tl
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id x7so35153534wrw.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rr++hNIFKJY6ZyDunycH0lT/NL/uhSgnj53A2ANYy+k=;
 b=IiI7U/ZizsqmsuSegGL7grLiAYx6E2ZEIWfYq8VKdbeIkDR1FZc7hnnSGHK015tm7X
 t9W1PsB9ZVxc3pSxShTWJoGq5kQmvBnKVf/msp5pxjgRjUD9SvMDJQKndfj1cFBK584O
 1xIn8k+swPbZR2NPXBZBQEautA4MHboyIAffnTsTEIOk2Yk02zb85ycUAnxCabGpLp8A
 tsmpduskKeqBAjE3/2EgKhJM48q28GP/QzLvXQSqp1ExCgT6EjkHwRCBbFjw4FHzi6WB
 OG912gPq0Rmb02lR9wWb6vB/dj4I+aAA2mfzS03dA/NrklDvTRX87+ABNRnbC3KlufAU
 DsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rr++hNIFKJY6ZyDunycH0lT/NL/uhSgnj53A2ANYy+k=;
 b=tZUlrs8h0/ktWfgp41fUU4Rb26F2exlgpaTxsaxUK7Wwc99oHBwBudZpusM47wQLJo
 72TaT578HP4OE9uESNbwyPyzod9xmD4qx1baQunzXjFfQMu028A8KG0BLCzKVA9yBhOk
 3cQiu/zWrZHxSyY/XAs3qMH+t5wKZGUxXoo9pn6C2DtBhXXRhhiiMrAp2X/9wFPRw9Lj
 HtLaN9E0UYLO4+qcFjOOKdV7VvKdxLBzq9Kd1LL5Kfb7NvOx7UYHNSJ8bUV9J2p6LEK9
 CpvbEfFN5YJDw8l1AIVmnqeb3+ZoPv3QueGJBoIH2+t4jn2FyEfncMc89Kds7Jjbf5Wt
 5hQQ==
X-Gm-Message-State: AOAM531pd8PsvC5KgJDOgCVar0fsxQXgkjvlKL00Ue08LBy3DajqSlEf
 OpSAuUazQ+SmurAjH9hOR4qjZKbrk74ymA==
X-Google-Smtp-Source: ABdhPJxSyMWYyQ98HmzSLORTMBlW4QhHN/FZfqOIUO/t6VNll4GFX3yFHLBTPYIXgAsLl25p7MH8bw==
X-Received: by 2002:adf:f302:: with SMTP id i2mr15672025wro.423.1618859978822; 
 Mon, 19 Apr 2021 12:19:38 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u14sm24627564wrq.65.2021.04.19.12.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/30] target/mips: Move cpu_signal_handler definition
 around
Date: Mon, 19 Apr 2021 21:18:08 +0200
Message-Id: <20210419191823.1555482-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
index 9e86f6ad6b7..b8d17788080 100644
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


