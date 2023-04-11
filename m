Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D236DE21C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:13:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWN-00043F-TG; Tue, 11 Apr 2023 13:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW4-0003tc-Ro
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:49 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW1-0006Av-1y
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:48 -0400
Received: by mail-io1-xd2c.google.com with SMTP id d186so3399143iog.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zclL1sz9DiET2xZFRK88IBH+o8EERoMQGeM1NawjRU0=;
 b=lKdjUGprqr0zdFFau1yXgbI2X0YHPQHan0xVA4UZ8ITHCEOFJofIKgYxGcbVFeprvd
 Kmqk3ACevlJhjsQhNrAdbPDw8x2rhE+JpaCM6Z8Bibi5s0/WGVLlVuQIqtqJDKh5nrUU
 aoiIXLRIbl0ab1wpQQNaVelX3TH8CRKehz7ZdudnAcuEdmfFCkVIDQ/fH3figXIS0/fa
 /vzGOwuiOj3SIvLqdN0FXmHUValE8jSpl/8Z8V8GF+eAynN2kr5n/yfiyCufwnl+efFa
 9QrseUNx4yjN2+DRvqP9tEuRGKXb6kvX0tEht40Sly9rGEcv/ztZtKm7wu5ajBlSdAEq
 Q9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zclL1sz9DiET2xZFRK88IBH+o8EERoMQGeM1NawjRU0=;
 b=QLsxf+X9R818ET4XSxGij+BBUR31Kb3vnCUY8MnGlk7pl48Yo3BsOnYbtLWmgrqQ+5
 cPhe4ESg/C+NBGsSGPl/v/z6KitrCeSg6mmLJ5XhLYF9GITnjXPlLpGm7RFdCRdHOtfV
 Nt3l0i8iN9SSeiWiJT0ldn2/sG7gzpsK+EeVhN41fQo8oNH8mgGKVnP4r2zn23/m8xFw
 pFjuZLdgMa7g0C2Zcn1ne/3shB3/Vg1/c6rJZTpgTgvgPxNoiOoPKHNWyOZguGjwrI2x
 u/52yyVXNbjy/snl5d+RMQsO0V0oMLmDLCcCJSav2r120aQC1UOlRFFVqEEJnKWDHwRw
 DUjA==
X-Gm-Message-State: AAQBX9eViItGFyw9Wvk8/ut0u/iTE7p6DVWig6C465zzZBDdjMRjD4cH
 mbPOCdqXYR/IMpM2bLfRt12w8QuFBiMMRz9NUm8=
X-Google-Smtp-Source: AKy350ae7ARd8R/VdI7bbsEM3KYlB/9dvWrRhj/dQ9qUZnzElG/CtDSpJ5ZYxcB02zpLKs0fAIslHA==
X-Received: by 2002:a6b:da08:0:b0:752:731b:b7c with SMTP id
 x8-20020a6bda08000000b00752731b0b7cmr10042723iob.14.1681233042649; 
 Tue, 11 Apr 2023 10:10:42 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 20/20] bsd-user: Eliminate USE_ELF_CORE_DUMP
Date: Tue, 11 Apr 2023 11:09:55 -0600
Message-Id: <20230411170955.17358-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's enabled on all platforms (even in the fork), so we can remove it
from here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h    | 1 -
 bsd-user/elfcore.c                | 3 ---
 bsd-user/elfload.c                | 5 -----
 bsd-user/i386/target_arch_elf.h   | 1 -
 bsd-user/x86_64/target_arch_elf.h | 1 -
 5 files changed, 11 deletions(-)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 935bce347fc..9f963d4747f 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -29,7 +29,6 @@
 #define ELF_DATA        ELFDATA2LSB
 #define ELF_ARCH        EM_ARM
 
-#define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
 #define ELF_HWCAP get_elf_hwcap()
diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
index 2905f2b8414..606c42dd4ab 100644
--- a/bsd-user/elfcore.c
+++ b/bsd-user/elfcore.c
@@ -18,7 +18,6 @@
  */
 #include "qemu/osdep.h"
 
-#ifdef USE_ELF_CORE_DUMP
 #include <err.h>
 #include <libgen.h>
 #include <sys/mman.h>
@@ -1318,5 +1317,3 @@ out:
     }
     return 0;
 }
-
-#endif /* USE_ELF_CORE_DUMP */
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index fbcdc94b960..0477d243a4b 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -35,7 +35,6 @@ static size_t target_auxents_sz;   /* Size of AUX entries including AT_NULL */
 abi_ulong target_stksiz;
 abi_ulong target_stkbas;
 
-static int elf_core_dump(int signr, CPUArchState *env);
 static int load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr,
     int fd, abi_ulong rbase, abi_ulong *baddrp);
 
@@ -818,11 +817,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     info->entry = elf_entry;
 
-#ifdef USE_ELF_CORE_DUMP
     bprm->core_dump = &elf_core_dump;
-#else
-    bprm->core_dump = NULL;
-#endif
 
     return 0;
 }
diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
index cbcd1f08e2f..a18124f0f29 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -30,7 +30,6 @@
 #define ELF_DATA        ELFDATA2LSB
 #define ELF_ARCH        EM_386
 
-#define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
 #endif /* TARGET_ARCH_ELF_H */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
index b2447118883..08abe62be6f 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -30,7 +30,6 @@
 #define ELF_DATA       ELFDATA2LSB
 #define ELF_ARCH       EM_X86_64
 
-#define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
 #endif /* TARGET_ARCH_ELF_H */
-- 
2.40.0


