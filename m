Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE5441AE1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 12:50:22 +0100 (CET)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhVpV-0000XY-FK
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 07:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVnK-0006Nc-O4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:48:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVnH-0002uH-LF
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:48:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso1150257wmh.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QZxIwa1pEDFQAhCJl0IdwR6BmA13thqKx9CAe+K+Mg=;
 b=S0YB1vxFY1BjQIIeE4vmByVN5EwvaGup0ClcxAcvqKkhbGY5i2kWafneHZBR5tr9yt
 ujX0Kg9hGM8bmtZ45Z3TUiOLX5VsSbO+/HtFO5Ws7UuFvA3pdI5d1gxrF/2C2ezXhFZk
 ZQedn/0Zpbla/ezR5HwfXYGXoz9D2n3t43n3J1pmgbeRbKwpx2R6VTK16Pn2LIEkxqdS
 bitqHKn4OBEZg/n+aeF6UV1fLo45vnOwzqk0DKYMt6MOPtRCgetSJkQxwSxMLv7lrXJA
 l7vH2KUKSb9rjlBonOgh5354Me0J3JNoVhBGdU8HAhV5VGU3CEQVaoSndyEQ4rVSkTKx
 lzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3QZxIwa1pEDFQAhCJl0IdwR6BmA13thqKx9CAe+K+Mg=;
 b=M7j5XbXDi82UfIqTykzRelmVtoyo8xeA/RS7rPNhqWWYUEUkYRcJ5kb3Ea5S3HUO88
 7FXa7cl5bj/RTw6a4sKRe8rCJQoZcPSxytpqiD6iTwLMC9Rx2ccs11v5C00oxF/3G3S/
 eK+oRFQHS9AtgYhI+Okbt0CtZq2gryaE5Ys+WmO4HbOz6ox8m75U+nHuxX7KsqblRNqw
 uVbaJrauq8x+tSXUyRV5HfQoxb176BwyXyrQLGMeB8nG3sisVX376N/Cl0F0T0lHVrMI
 rWaVtjETgYSU0KDPwV7stMDBG+B+ahxo/VqvxKoEn6TmOOySNNxsdZ4+NdkUaIvCBGaq
 u4kw==
X-Gm-Message-State: AOAM531Oh/dODO1NHgzkBqc78pBoH3RHp5Kt0B5G3PK/pTHG+TGrXMwW
 odZidRHBRIJgzijhWjnA2Yq7n05fzu8=
X-Google-Smtp-Source: ABdhPJxGCTCru7JgkTP7HcriAreNbmTk8ioxMP+aeHeq4L5ynLKm3gGZ3ao2CpL3XjO0eKuwvD84gg==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr31605775wml.144.1635767282194; 
 Mon, 01 Nov 2021 04:48:02 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l20sm18169890wmq.42.2021.11.01.04.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 04:48:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Revert "elf: Relax MIPS' elf_check_arch() to accept
 EM_NANOMIPS too"
Date: Mon,  1 Nov 2021 12:48:00 +0100
Message-Id: <20211101114800.2692157-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
X-Mailman-Version: 2.1.29
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "P32 Porting Guide" (rev 1.2) [1], chapter 2:

  p32 ABI Overview
  ----------------

  The Application Binary Interface, or ABI, is the set of rules
  that all binaries must follow in order to run on a nanoMIPS
  system. This includes, for example, object file format,
  instruction set, data layout, subroutine calling convention,
  and system call numbers. The ABI is one part of the mechanism
  that maintains binary compatibility across all nanoMIPS platforms.

  p32 improves on o32 to provide an ABI that is efficient in both
  code density and performance. p32 is required for the nanoMIPS
  architecture.

So far QEMU only support the MIPS o32 / n32 / n64 ABIs. The p32 ABI
is not implemented, therefore we can not run any nanoMIPS binary.

Revert commit f72541f3a59 ("elf: Relax MIPS' elf_check_arch() to
accept EM_NANOMIPS too").

See also the "ELF ABI Supplement" [2].

[1] http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_p32_ABI_Porting_Guide_01_02_DN00184.pdf
[2] http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_ABI_supplement_01_03_DN00179.pdf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f9b82616920..5da8c02d082 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -925,8 +925,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 #endif
 #define ELF_ARCH    EM_MIPS
 
-#define elf_check_arch(x) ((x) == EM_MIPS || (x) == EM_NANOMIPS)
-
 #ifdef TARGET_ABI_MIPSN32
 #define elf_check_abi(x) ((x) & EF_MIPS_ABI2)
 #else
-- 
2.31.1


