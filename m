Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00C3E3752
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:03:09 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUPM-00065z-4n
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6H-0007wj-Gf
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:25 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:36826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6G-00057V-0I
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:25 -0400
Received: by mail-io1-xd2d.google.com with SMTP id f11so19876891ioj.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnr+5rbOJGaDAhEuFudq50cgY0fAjmRcHPUHHvIxNIY=;
 b=DEnOTeEEKz5jQc+0CQm62acebqc0uV8/bh9h8CKmIXWUZh4QzCVpI7KDhXruKBLYmr
 cKIP+QUTeNv9pbPmsv073DZZBrR5oB2n3J3Vvg1P/xPzdW1vM9m+UkR2X3ieMK/vIEX1
 D7zNQ2VQB87hELcLYO0zJQnb51KrOcB43FvPMd3y4sgqYYDU1r4vyEz6KoHoy5t1zqTg
 BkQ7CwcWIdqey0cd4yB3InMv3UPtCq9NwAYbTIFDJ/UFyH1MGFuTQhsMvoHY38uJpwsy
 i50syFD+9qmHvYT6mwsKuromzInTW8qXAn1NimFS8pPgbuUpKpF7wXQWK2Axovqs6GYJ
 E6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnr+5rbOJGaDAhEuFudq50cgY0fAjmRcHPUHHvIxNIY=;
 b=CIxAzvzXclciN7C+jaJIKNZt2+vKqArMBXdL6v409SWqpPOPd+sBpwV0vcLhunJpW0
 vwX0c6wz+NlbnroKfyxYjS+e79leROReq+r0U8F3j293ekLbkMsx8IQpQ8tPs596kIV5
 XuYAgl1F1BjEe3ok5xOk71V4JTNSgF3HG3lkyOfVwDBqvx6beA1GrS2A5LCz5xdh1Bpa
 zASd0dH21KBsfWCG2KHWpVhsAX8eNpXH3qxsOxFSTEAZsSCLFXFhJuxX1Mqvu6RwPf+w
 V+//Ib0ejJfL5LP+M1BrwtF/egUNgH/5NXirQ7h5a3X0ytdTvtAFRqp8lGLT/AypGHDx
 af9w==
X-Gm-Message-State: AOAM530znEdx94HoMJfkHZDwbvd0ynY9lcGDnrniEk0CrIauhfnt1mV/
 1cLfixLBDo4nEfomjV38ckGraUHkLCfE+KjF
X-Google-Smtp-Source: ABdhPJzYW95/2fNxH2moJj4qnNJBAYFMBre1IPUW486FANAJQMmV5Qno2Tn/XpFUXFMipBEb2hrJBw==
X-Received: by 2002:a6b:7f48:: with SMTP id m8mr412751ioq.5.1628372602781;
 Sat, 07 Aug 2021 14:43:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 31/49] bsd-user: Remove dead #ifdefs from elfload.c
Date: Sat,  7 Aug 2021 15:42:24 -0600
Message-Id: <20210807214242.82385-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove it.
Likewise, remove an #if 0 block that's not useful

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index a09f8fb315..c0787a4e52 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -558,9 +558,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     abi_ulong elf_entry, interp_load_addr = 0;
     abi_ulong start_code, end_code, start_data, end_data;
     abi_ulong reloc_func_desc = 0;
-#ifdef LOW_ELF_STACK
-    abi_ulong elf_stack = ~((abi_ulong)0UL);
-#endif
 
     load_addr = 0;
     load_bias = 0;
@@ -761,11 +758,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
             exit(-1);
         }
 
-#ifdef LOW_ELF_STACK
-        if (TARGET_ELF_PAGESTART(elf_ppnt->p_vaddr) < elf_stack)
-            elf_stack = TARGET_ELF_PAGESTART(elf_ppnt->p_vaddr);
-#endif
-
         if (!load_addr_set) {
             load_addr_set = 1;
             load_addr = elf_ppnt->p_vaddr - elf_ppnt->p_offset;
@@ -823,9 +815,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     close(bprm->fd);
 
-#ifdef LOW_ELF_STACK
-    info->start_stack = bprm->p = elf_stack - 4;
-#endif
     bprm->p = target_create_elf_tables(bprm->p, bprm->argc, bprm->envc, bprm->stringp,
                                        &elf_ex, load_addr, load_bias, interp_load_addr, info);
     info->load_addr = reloc_func_desc;
@@ -842,15 +831,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     padzero(elf_bss, elf_brk);
 
-#if 0
-    printf("(start_brk) %x\n" , info->start_brk);
-    printf("(end_code) %x\n" , info->end_code);
-    printf("(start_code) %x\n" , info->start_code);
-    printf("(end_data) %x\n" , info->end_data);
-    printf("(start_stack) %x\n" , info->start_stack);
-    printf("(brk) %x\n" , info->brk);
-#endif
-
     info->entry = elf_entry;
 
     return 0;
-- 
2.32.0


