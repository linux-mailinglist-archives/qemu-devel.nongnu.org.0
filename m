Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38E6DCAB8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8y-0002ks-OC; Mon, 10 Apr 2023 14:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8r-0002hm-Ur
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:29 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8q-0000jF-6f
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:25 -0400
Received: by mail-il1-x135.google.com with SMTP id r19so2854982ilh.8
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/kdsqldOBrk/wUsR2F0VSQ7qxlK3cCoeCM9XaJhoL4=;
 b=ch3A7Rumgn7Itie2XKQVS07tilvS+vbcPREa8zsU2pk+qJ26Bv6Iu7r//XAu3aKBba
 y84liF+CoVTp9GQyrPZahbqAo6cICLuihsp/EHSQJk5Y719nDheaHLMkG29rQUu5MMI5
 Vaj/ulTHu7tLwAlMQrd4XrEyFK2kkPy9gzex1S6VedpknAOnf9VfnJvvRVcwhjYOLyUx
 SBR+qeVpHBwc5EOigw25BM9GUidksYkJiKahQcv0/UaiZXxyjkXmax0QWC/+cdWc4NsJ
 koU9nFjTtBzQ6K8uPVIPXXlEL/gqbDgGhVVRnJkzGRgr63Nyiy+42VcG6B1INVLdCj/r
 m72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/kdsqldOBrk/wUsR2F0VSQ7qxlK3cCoeCM9XaJhoL4=;
 b=5IhWrCuG9h81WSeKCo+c9yVgISrRdpOayBthA0iPBHChhTfRdxnnDZE80Nx1kP8YFW
 WCyQDGO5rCyN+7FY+txibc4jJ65o+ZY2rDT1f2cBj5oLUrwt6EdLBXk9t/A0ln9e0bVt
 Fquwzy/9xfrzJxRv47+5HevN1DsQDPeI2jDo5vTWQr1S/s0YakmMsYYhAUOsUABY3FzM
 CsK2aySugJlWTZJNoCVqeroHhRovRZYKfQnOmL8qXw1AZb60n51NYoz05D2PEA7JR4HK
 +3zSH22zh30oDypgqHQ8VVxh+CQgNbGbj0jAIgPbCdepNBiESNw1dMs789awu/Fhv0w1
 mxjg==
X-Gm-Message-State: AAQBX9e/zKEysUF8np0ir992wPZBPnzkgPvW2cgFOy8F0wFe/A1AlaSI
 Y9tZpKLKbbI5kT1xMrN3AmCvb1Qc8TUxKRwi5ho=
X-Google-Smtp-Source: AKy350bhUviXuRT7/hzA98k+KlW3s3h2KKzxYsE/IuPMQyMN8DRJKE5sN3gI8ZwHUAYHf0rWimIuww==
X-Received: by 2002:a92:cc43:0:b0:328:bc51:282c with SMTP id
 t3-20020a92cc43000000b00328bc51282cmr2136892ilq.25.1681150882260; 
 Mon, 10 Apr 2023 11:21:22 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org
Subject: [PATCH v2 19/19] bsd-user: Eliminate USE_ELF_CORE_DUMP
Date: Mon, 10 Apr 2023 12:20:56 -0600
Message-Id: <20230410182056.320-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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


