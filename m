Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9426370E10
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:51:17 +0200 (CEST)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFJM-0000GW-Rs
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmj-0006By-0R
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:33 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmh-0007rA-FP
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v12so3093831wrq.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRwpX/8Cx1qFim5Lxwv/XxTDijvHeV79c3pumAeSJhI=;
 b=U5XJDP0Wsdzm30fty0bgu43F9f5TBt/amse2frvrDh5laGODTZEFCFFV2eTaNy4IBV
 koa5pB+YWTKwAr/JZlNP4sX+IW9yL9qEz20w3tfCDJ9Xs9QBwkZRkrueRiFptSVKAmgj
 RQcY4U/5mfUNqDGFp5ekPvPPbVAo03bDV9mjPfdUxGiA4TThSkO2OGKJTL3HNtVC64Z2
 CfjGdqxqhdFvuawxGmgLEuqjn+VymqaTlfeL+8M+2GKeYCfc9kBTia18HSTccZ2qksWH
 J+Wro/t03wH9qKt8+0xJEE2sAT32nGg1dWcErGWric/Mm2EeRJIVPhC8YuIHjyB4IS/B
 wYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aRwpX/8Cx1qFim5Lxwv/XxTDijvHeV79c3pumAeSJhI=;
 b=bLZ8v4cQx3es11WG66E1CZhTOUNskK8f46z/QQYvo5kVlieEwURG173HPmKU8hRJjO
 eBFHJkk6MO546NpESN5fR+UTiSklQePhO2imYykHXOqW2Ben9GqUyT6b/v+XN3R9M8gf
 y3cU4LhzndGvW0qEOhFA4snqkc3lsx9+XmW8qhHw4jbBVH9epKk631AbSYKBdoFkNpep
 9If//cNft6M5KkFRqwYDWrimOJRoiILNCTbvVGOBvaWoin1h/ZC42cKZVKhiAvamQcyW
 nEx+j+Hs4XzKEej94uVOL1iK4Nu4xD4ZPAYf/8+Jr040Tip1qaCgy8omPmLh6DJkBGGD
 a7sg==
X-Gm-Message-State: AOAM533Sb9JB4NIxfXonJTG4Ade6htBK+lYqaY0Pdr+hDrAU/bHycv3j
 dBTsG71GKcIqXe9re5P81dkfN3UIKLPR+RSI
X-Google-Smtp-Source: ABdhPJyyMo5UUEPEqiyVU7gYLEKjuYDeYvBCWZUbIPIUtIbztVI5Sts8K7oWd4+CzfNxhZAIsW3BSQ==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr16134549wru.316.1619972250014; 
 Sun, 02 May 2021 09:17:30 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q7sm9264544wrr.62.2021.05.02.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/36] target/mips: Move cpu_signal_handler definition around
Date: Sun,  2 May 2021 18:15:23 +0200
Message-Id: <20210502161538.534038-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Message-Id: <20210428170410.479308-16-f4bug@amsat.org>
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


