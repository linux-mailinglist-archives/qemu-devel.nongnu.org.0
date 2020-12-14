Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3D2D9169
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:36:27 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobqj-0000zC-Uq
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkO-00023D-A0
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:52 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkM-0002OE-Sq
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id q75so13733177wme.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=tt06LM3DuxKu6Qef7nlo0yLmiXQmn95eCC9pK0eUgNN+JnUkQsG5FK03znaRuKug3o
 aK6sYemcKbRWT9lAShDbX/xFVV/k5mzdQV2ZxMH24rMmANeLVVGIxFtl4/IGpPTwRfCQ
 4umJFXLxuZAshAFYdgr0XdyOnKx8cFv9snAYO8LhQWzybvyM27x2AQWRx5RURJNL+Qht
 okIBaENaPNWpHQ7HWC7FL73pZ9fPsRQ7bNkot0Yugf6nl5sPJyBNACvNjp3zzrGnY/oD
 obiyatNVwg+EvfjpqmEV3L2GJ0WQiZ4j1VcprzEJgpkg2QNxnuZEsHcOWvF1MhNywAPX
 4hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=fo7Sb7sdLjWyj6JkssydBLlDsEXuyeCmHp6Ig30cDV9JXIKuO1rTrvMR3RZ1IMUnMI
 vT70m6uCKr9Dth0Yc0/mj3yLQywjkudVJL5i/+dJ1reteQE0cIaa+JcHQNyxWMhTQxqW
 IR0x9Mr27T184edzo+vXfsJqWDOuISocb85ig/LILN9tY9bpy7bx9fQ3IoUqL446cT5E
 lypjnaN9G3jflU3z1Kc9iA3mANE0nSLR7qErdx+Yz6PK7eZ3cqWWD6MuxN97d9H0oC/Z
 Z2BSOKB/g4BmgmPzCq9HjjUuQ+4QoJB217/rWiDxkpuEvv09Ixs9TkW1g8OS5x2V/2oj
 0AwA==
X-Gm-Message-State: AOAM533Y8kyYIQ4fgoDPPqgkYJ923HCZzPmBQQqsb0n3cM9AAmL20XWs
 NBFqSPYOlCVz0d/1jg3USnCveLCAwqU=
X-Google-Smtp-Source: ABdhPJzWIqF3EENdPwL1HfevYdXVo32knI9m0ZMPgWZQdIBBZ0Br+RrHtJqFIScNlUP1FSHWgsgHCw==
X-Received: by 2002:a1c:b407:: with SMTP id d7mr25361706wmf.34.1607905789457; 
 Sun, 13 Dec 2020 16:29:49 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 125sm29216095wmc.27.2020.12.13.16.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:29:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
Date: Mon, 14 Dec 2020 01:29:25 +0100
Message-Id: <20201214002928.343686-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214002928.343686-1-f4bug@amsat.org>
References: <20201214002928.343686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_SET() macro which
checks if a CPU register has bits set.

Use the macro to check for MSA (which sets the MSAP bit of
the Config3 register when the ASE implementation is present).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e1d7e7677c..b7c6d30723a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -992,17 +992,21 @@ enum {
 #define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
+    do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
     GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
-- 
2.26.2


