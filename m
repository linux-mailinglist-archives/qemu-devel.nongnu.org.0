Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F388D2D916A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:36:34 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobqr-0001J2-To
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobnG-0005TH-3a
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobnE-0003Nn-8o
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:49 -0500
Received: by mail-wm1-x341.google.com with SMTP id a6so12244775wmc.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMAErKW9IQhgLiEPThDzXOhnuONkFBKQNEJV5aJE5AA=;
 b=eiZ0D+FLjVQtAvxHJ3BBCTlspOT1ABJKjhqd+PjJy7sv/pePvbL65Xf8T6CYAgJnEy
 8YLhBb3ndenB8XCx0lH+TuD73Foiyuu/7aEpA2IuSJ+PGbCURkDuE+nqc5Jc/HIv/eFU
 yjKVooZkYGhPnOSLWX0cmXtrgcYu5yXa7IPI7WDLb3uJJ47AZIgIeUfDiEnaI4BTtyPL
 H3LtQ/AwyqG2cFQ4owll368SQNBS043f5FY8F4NCpyj8iK/Kke4bX3Xa8tzFLaBMSMxc
 lgK9j3bxSFf0cxkowR+mFG5QXyrQsQT4so0jf+z8+yzBq3wc7zQ8QJYAb71Z97iWEr7j
 iYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DMAErKW9IQhgLiEPThDzXOhnuONkFBKQNEJV5aJE5AA=;
 b=j4X+iFW0/uV+1GESZrxS/YM9CKjVN+HitItQx3iBOJCmKKslz41PHfeR8MTtg6ngaS
 sw5FDpjrZFh+tq7YzddavPHKU+HbmICMS/27JgycAKeC+QPPAxyY7JVwFpziZCdKtEWG
 EcQ84FnU4y5EFwZkKElgKGWXXBII0++PPRaYrU+9jMdOJE8/GOg2fb5pzIC2B7IE6i4c
 kJADv1CWDiyAJmjozDTCRN18G8qWPUFWt0VazLG2/lUrkvObU24qxoKBOp0wP0gjmCME
 eUta++vFXcroBa87HhidhFQOQ+818MrW/k47ntS5eB04vUQiLtFo9kJQM4dG6KTmpovL
 QVTw==
X-Gm-Message-State: AOAM5300TZvjgUaRIriEKJU4SAV6jJPfNTJWi5gKhBeQ+tBtvmjtixW7
 GyoUNWGLxP6U9LgOL6lgmArvsN0vZGA=
X-Google-Smtp-Source: ABdhPJwREj2r1uBTpDJu+lYe1T5f46HRFV0vexARhQj6yIdG5uilNsTxaF4ejVWtcpyn4jpj2DbFJA==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr24396069wme.183.1607905966784; 
 Sun, 13 Dec 2020 16:32:46 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j9sm24038845wrm.14.2020.12.13.16.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] linux-user: Add support for MIPS Loongson 2F/3A
Date: Mon, 14 Dec 2020 01:32:15 +0100
Message-Id: <20201214003215.344522-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
References: <20201214003215.344522-1-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Userland ELF binaries using Loongson SIMD instructions have the
HWCAP_LOONGSON_MMI bit set [1].
Binaries compiled for Loongson 3A [2] have the HWCAP_LOONGSON_EXT
bit set for the LQ / SQ instructions.

[1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
[2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0836e72b5ac..a64050713f2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1024,6 +1024,8 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
                         2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
+    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
 
     return hwcaps;
 }
-- 
2.26.2


