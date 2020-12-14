Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE02D9172
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:43:28 +0100 (CET)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobxX-0008SC-5L
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobnC-0005RK-Sj
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:46 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobn9-0003Mr-Ix
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:45 -0500
Received: by mail-wm1-x341.google.com with SMTP id g185so13749661wmf.3
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PsgapN4DayY67PGB6PO85RVxsavx9TC/Jgo4bJ+1BLQ=;
 b=EbDzpl+wnoAoCHLrBjHZu34KUXwBJ6LIIuBWbm1bErNRG26BKD0RRnCFCL/aduhnAd
 gqzRZ82jvufhOn/pPwYdBv8ePJ9oIoVLcei15hKlX2qmKIR3RzwviScVNQv+9O83UUC7
 VaSbUL8fj9TQoKluDsHhsnq8pZHXApNuXyMTAx1xF2x+jRFZscyA54HMuX1U6YP45Uhy
 QooQfUqsbLwK2wytl9/UMTvFDQ8mUrBKinzUDyqHxiBF1ci14RJDcCmqY7kFEdZhgiwH
 d4p/GfnrMDMk0KjMuhVkvbokOIupkUKjh4SQHU/yUrdfZd5ITf0IzhqIIq5+LJTUIb8W
 NyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PsgapN4DayY67PGB6PO85RVxsavx9TC/Jgo4bJ+1BLQ=;
 b=RmR5/PgcrwK7yn5/JEEHiE2YvhQErAEHBr2mn6kpZL/V0V5iv5T5wBKniAM1Zsz5pq
 XV+O99HxK/3ZzJnnGLkyjIcJDEiIipahCI4BSK/yM0o67qCk4TiswbMqexfSP0pTSZRz
 1XNmhro6f3RsEe7wmL1nQsemogvZWjNxK1b4N9VGf3p7FT7Awkqz98fRhLE8IITzMxND
 uumIzudul5tWb8j6wpGePPnuBwd1jLWeiabva4CpB9G+TlnqBRrdzz/2nzhHNF/4+rAc
 jOdo8P/1F2eGkb2ECTZwqXewGuEI/wOwgWvrBawdcE4dR5ISyZLMmApsS6IAPlDbjZ0v
 HGwg==
X-Gm-Message-State: AOAM5319l65iawBLAjLuX1TCSbRuIiYS7TyxBh26CmzlzgfgprDb+br5
 wZN1yi56q199Q7inL3orKq5OOEkt5jA=
X-Google-Smtp-Source: ABdhPJwERaORjBmtyaDQqoU9IwdTiZLdogvsWYbanT9UasIKbvQC6Nku38cRjGg7xI0O6btBm1bLUw==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr25088353wmb.83.1607905962056; 
 Sun, 13 Dec 2020 16:32:42 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id g192sm28937763wme.48.2020.12.13.16.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/6] linux-user/elfload: Update HWCAP bits from linux 5.7
Date: Mon, 14 Dec 2020 01:32:14 +0100
Message-Id: <20201214003215.344522-6-f4bug@amsat.org>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8f943f93ba7..0836e72b5ac 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -986,6 +986,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
 enum {
     HWCAP_MIPS_R6           = (1 << 0),
     HWCAP_MIPS_MSA          = (1 << 1),
+    HWCAP_MIPS_CRC32        = (1 << 2),
+    HWCAP_MIPS_MIPS16       = (1 << 3),
+    HWCAP_MIPS_MDMX         = (1 << 4),
+    HWCAP_MIPS_MIPS3D       = (1 << 5),
+    HWCAP_MIPS_SMARTMIPS    = (1 << 6),
+    HWCAP_MIPS_DSP          = (1 << 7),
+    HWCAP_MIPS_DSP2         = (1 << 8),
+    HWCAP_MIPS_DSP3         = (1 << 9),
+    HWCAP_MIPS_MIPS16E2     = (1 << 10),
+    HWCAP_LOONGSON_MMI      = (1 << 11),
+    HWCAP_LOONGSON_EXT      = (1 << 12),
+    HWCAP_LOONGSON_EXT2     = (1 << 13),
+    HWCAP_LOONGSON_CPUCFG   = (1 << 14),
 };
 
 #define ELF_HWCAP get_elf_hwcap()
-- 
2.26.2


