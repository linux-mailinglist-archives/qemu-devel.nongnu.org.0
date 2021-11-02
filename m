Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21627442FCD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:08:04 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuSJ-0007R7-8n
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu70-0005e9-6v
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:46:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6y-0006Vl-8E
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:46:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id o14so33291492wra.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPgr2/raxy90/7F3aXd2gpTt47Yic566Ru6PdSvILyI=;
 b=cntFLM9MCfKJtCX3xVHrA8VfWxeSiVhFfZPch7sfIS9/qVPinFRQJA2h/u7jWPAMXW
 VE+YvzLCS/L/KydvYTY07/Kw6QinHNbyC72bZiDJfbzsxqyYmlL0bqHGiDTAu6MPH9xx
 JGs2isGDlRZj4jwwzbbuqKefzuY2krF+82UfRIyzV9uSayy1Wu3JIiv0E71JRYxOSzHT
 8lnDdwo+ldpAj2hZW4HyKYFKbRsfmc+h3f1fMywBTRGhkBLjzYGC7EG4DTprWJm2z8sZ
 1azWHaUC+Qi+d3pVFJiGQ8HJGoQJIDmhnHCyCKdFeBAeSYApy7PScdQrGOOpxlUMNesI
 6KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UPgr2/raxy90/7F3aXd2gpTt47Yic566Ru6PdSvILyI=;
 b=TdLoKLIqcClLkCjharCejwgSkw30RX60nCqlwM+PLqtOCVQ2szPGDQF5WMQuXui5SI
 quJqz+fAUUO1WpQ5B3ib0f18hKYqIiY1qYcT/5wSJ6Cj3oytGMssIL+CLhYJInJN60ta
 xkAWVdDalouOWLxhIx9FvV5L7rKYI8QaJpK5bzgpgvy+iOZ0/wS3I8jsQtxgisSlQKdd
 iY7GQdqmI98+B4nwpqGqQQ6U9cAnGuPj+i3oqo//Q30YW/8rVQ5bQcOnIhDJibwejpWt
 MjlSaUX8A4EGeYewMNebPtLBpfbH9SA0cW/cgWmYEOvc4Azl+RysDd7BqyBlosuw8OAG
 w9kw==
X-Gm-Message-State: AOAM5301YJ2B9JNLN3I0JpkFJkJE57R4IAoamaKcEHTJjttCGswiJ1U8
 Ei1XG3XiWoyXhZ8hkU1q63IVr8OrqqI=
X-Google-Smtp-Source: ABdhPJyBJyBnU8S/20ugPI9BTfzIE/jr8mYPqPQrEBxaBEjgiCg68I0ImSkLVBcCSTxO5KrxyjOtKg==
X-Received: by 2002:adf:f904:: with SMTP id b4mr47730038wrr.403.1635860758855; 
 Tue, 02 Nov 2021 06:45:58 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n32sm915830wms.42.2021.11.02.06.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/41] Revert "elf: Relax MIPS' elf_check_arch() to accept
 EM_NANOMIPS too"
Date: Tue,  2 Nov 2021 14:42:40 +0100
Message-Id: <20211102134240.3036524-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211101114800.2692157-1-f4bug@amsat.org>
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


