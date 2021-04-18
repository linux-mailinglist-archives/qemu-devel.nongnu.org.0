Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECD363865
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:01:16 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGPj-0005zB-Vm
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGw-0003I4-50
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGu-0000oq-Nc
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id g9so16017286wrx.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/Zr2GZmHwcpc4Ys5R+RUKW49Msx4MkT58HWFtOoOSo=;
 b=dmu9JYz/g2jvMguiuBDrMv1vfCP8eN40dRDae+sXsxnAi9UdhR6UwgR6tqX5ZSkhbh
 RduaqQREGNYUaXeSGF2HskWR1A/WtZtCWVVMjXfHdqWEebnt4r8VCkWgvLjUuFj7iFD0
 rQt6eecLpOQNjBFkhxvnb2SeSD79KzamGya/xnkXONwPjBjNswLXpHQ6Ies6TneX9oiN
 PbvfXIs+R1kzcy/zoPzkDwWAa5zh9ef+AeWQTTJLPdZCovh5E/wx4+gsSZomgkkVeuCN
 zaOOQsQhTKRxSGJR5Dal406SUWPfJjUag/C6iAYnA4TEJZokvOhZX4ptXwVOnStTevNr
 hlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g/Zr2GZmHwcpc4Ys5R+RUKW49Msx4MkT58HWFtOoOSo=;
 b=e9NKJqBSbHqrRuWoUVfF+8aHinLWXqvAHlVlo/8aspWWrwj0HIBAeDBa7IVpSgoTzI
 brffNXPYgM5/ss/8Q0Dj4zUmHk8vIgOfD8NpntN+HL2ugJjJPRf0KN9b4X7x3MWOwM9L
 RjG/F3HSbYczIEtLLzKLmfC28kXLvh5wKjjyzHzUJ7RfNVMOZpGWzuHF/++Wzb4yhqbU
 Hc6tFFlORW84XVJAuyyRJZuZpHw5y1hqqpkONE9sgfQagCRzGdyvC//jljspJuVofjAe
 ATaFpdNqSnli37PWPbqO0CQhS1vwfkwCSSBzmAeo5VOcZ4uwzwr01dNEBC/hyA9DWgkf
 HX/A==
X-Gm-Message-State: AOAM530XZAQpIGyfZe4W6y76LtDaQ45vUqSpzo48wAOflUCbRcv3k+Hw
 bFsRjIe5sYnxe3QuRwseZF6DzI70jepx5A==
X-Google-Smtp-Source: ABdhPJypTlRUyP3BcA5bFgx0wGg9zfXFIyQttRBSlmw1pXrqbks208Ry2mrp55eo1x6V6OoTnVYCJg==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr11459975wrq.198.1618786327349; 
 Sun, 18 Apr 2021 15:52:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t184sm17522308wmf.26.2021.04.18.15.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/29] target/mips: Move cpu_signal_handler definition
 around
Date: Mon, 19 Apr 2021 00:50:43 +0200
Message-Id: <20210418225058.1257014-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
index 284ef8d1e1a..8deb0703a34 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -151,14 +151,13 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type);
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


