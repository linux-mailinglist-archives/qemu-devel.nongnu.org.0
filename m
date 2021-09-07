Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B84030C9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:15:45 +0200 (CEST)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjNY-0006Xg-S5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2g-00067N-ER
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:10 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2d-000134-U3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:10 -0400
Received: by mail-il1-x135.google.com with SMTP id v16so151219ilo.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHgTeAaYz/lEdKsPhpVfOQ7pF/fy2xdIJ54PjrTVY8s=;
 b=wybpeZibAXIRPzIPv9NhGT7eu69HFXdzbyrrvkOTh8Yei4s8nj5WrlnlVsSFbfSVCI
 P7YfCqRT1vREpMmuRm+Ua10LHlzRAGXzxAy2dHf56qFn7QEbSNHFaR0c31Olm/Vi/cbW
 NGFnwzNLWJhx4ew+5rHy9lwSwDvfepbDVceJNYAvZ6rjnoynt1hrbM8X5sKNlSQM+KHW
 8ksOrFt3zxIDOJOFjaQnQqlKuz1HH3+usQ5nsA08ol1XSaXp1vO5yU6+pdjefgXndf1F
 BnqVCi8eewhSqPCor0ObUvEafLDdQ3dSyhnKqt/nh0mVfdHWOc/JkrPtQZzRrum19G6u
 sa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHgTeAaYz/lEdKsPhpVfOQ7pF/fy2xdIJ54PjrTVY8s=;
 b=tqn0zT0ljagIxdohpeRdbBLKU39YM/M2FPiY/eClCiydi/BcrqsU/4o0kl+Efk4LtP
 esNkElKbRiGlqbmEWr7kIBJYMLLvg/v8gtENsR9IV+hdpgNcHaCxL5zB0NesROeUoyAE
 ReZyNDgjTNZ2p2IK3l7HzeZo09IVrYKHWerVAegIfd5bqEx53H6/kkPj4sKsdXtpxRIU
 gQZAlye2olpcT8VEEEXI+1HBYNuZjf3OsJcDMvFdoAYQPVtM9/uCrQXtyeCcK75/4ZJP
 agbR+8pyugTZjMpXsyr+t4BtKqVEmj7qdeRclBqa28qe0oitLnZG+uFiXsJCqG4ZWRk4
 617Q==
X-Gm-Message-State: AOAM532ymYsaMgweJcxAdsCToe5TWxGqFkQbxdlQnafXxqSppvZW2iV0
 YNL+j+vt88qSGKybfBFURe5T7OYAaWc1E5qWMuk=
X-Google-Smtp-Source: ABdhPJy3/UotqAJOGCUp9J9JE28IKMOWfwSS6YHencfnhjPBFhjr52lFfcy2HJXptDzDpx0AVVul6g==
X-Received: by 2002:a92:cb12:: with SMTP id s18mr294116ilo.32.1631051646041;
 Tue, 07 Sep 2021 14:54:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:05 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 31/42] bsd-user: Remove dead #ifdefs from elfload.c
Date: Tue,  7 Sep 2021 15:53:21 -0600
Message-Id: <20210907215332.30737-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove it.
Likewise, remove an #if 0 block that's not useful

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 6156f9775d..11ca813c7a 100644
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
     bprm->p = target_create_elf_tables(bprm->p, bprm->argc, bprm->envc,
                                        bprm->stringp, &elf_ex, load_addr,
                                        load_bias, interp_load_addr, info);
@@ -843,15 +832,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
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


