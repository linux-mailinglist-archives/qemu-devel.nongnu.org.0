Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FF2D1DB0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:49:19 +0100 (CET)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPJm-0000GQ-Iv
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEt-00050z-Nt
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:44:16 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:41469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEs-0004ib-9Y
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:44:15 -0500
Received: by mail-ej1-x641.google.com with SMTP id ce23so18100464ejb.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebX6EqR8iV+mywCcc9nVlxDVQFJHaCVIYwiIj4Zd7QM=;
 b=Oriq1RjC0ujDCiVlQZA7KuSM8Uu3hud48XW9Exnen8UoJkUvQXn8mk3Hm2ePUva9oh
 oEUzQjVF0r6uB/nJMU4WG54N2QfwkTZLR9xCIOMbtsmHh5IoKb+h3TLTfCcX5zE2nxur
 rJwGbGnimZZsVA7EoCSsRD44eQRlg15/Fn/+zZNX1UYXIA6lx/FPKQpKriWN977Ut/Zh
 3K508JDVEPMHl6fWMAkaa1i54evLS4uAjagrPR01xtV7MU7MGQNtWUCAY/R6n5TojuHD
 SwmfiJ4Ndjglwyd196J4yzR36ZCEiurQ7b/nuOe33OUwDwsjbB0UO5cL1iB0oIuvvgUA
 RObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ebX6EqR8iV+mywCcc9nVlxDVQFJHaCVIYwiIj4Zd7QM=;
 b=VmoOD+O9owAqFEo0CKz7pHyQ2PjYAiN7iQworCdMxtxEw4nur6ml2vlNYVuWC+KNxY
 YrluMcyJjZj7NhvpYlDOTnH34IImmJGJR/GMhWmM2W0+gmsY+PxXLZw1EKn2bJJOu81D
 1JqnkYEtLkzeMmScpYlTGwil3IC29MJNcuFFTfHJXY+Q4JdyvxKU94BZv+uivzTdhSN3
 xAGPZVN0gLo/3RDEfDTWSPOlt1jnfysI3HTvNyZwdQTHYKBuUFOMKOMrPYZ1vbrGq2/u
 5DJKCgVzOEOq0gV3J+tKFLNT0NqwrGwST2W9jTesAccc8yAVpekJyiNAqPgQoYFEwK9k
 kSEw==
X-Gm-Message-State: AOAM532l6nCAbj1FSsDnQlkvOjvExaGf69h+1tCqeyKR555yZcW0xRy+
 FjEbMZ2hmHoNsoThZMsMmRUaaX5+k6A=
X-Google-Smtp-Source: ABdhPJy34bJrANzmK4xqXXK2kIzqAvRkQDXfKqEH3VucBRmwYbhsaiAvSxu1yLc3/y+KXOhEp7RmPw==
X-Received: by 2002:a17:906:9605:: with SMTP id
 s5mr20994359ejx.179.1607381049838; 
 Mon, 07 Dec 2020 14:44:09 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id r7sm14951863edv.39.2020.12.07.14.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:44:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] linux-user: Add support for MIPS Loongson 2F/3A
Date: Mon,  7 Dec 2020 23:43:35 +0100
Message-Id: <20201207224335.4030582-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
References: <20201207224335.4030582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Userland ELF binaries using Loongson SIMD instructions have the
HWCAP_LOONGSON_MMI bit set [1].
Binaries compiled for LLoongson 3A [2] have the HWCAP_LOONGSON_EXT
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


