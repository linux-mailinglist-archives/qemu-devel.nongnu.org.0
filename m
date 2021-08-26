Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A03F9051
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:51:29 +0200 (CEST)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNHV-0005hb-3a
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgF-0006Yh-Hg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:59 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg7-0006zw-9m
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:59 -0400
Received: by mail-il1-x12d.google.com with SMTP id r6so4690716ilt.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4pD6neQvy0XoKUC6JWDE0NkeOdi6hxyFhFa7E0KwLg=;
 b=sxRJfh+U4N2w2EiSHYjIn2ZeHnxYaMxmHd7FiZxkdc+nquAqNGaWVUAhm0qqbpm/K7
 3ax57SyPAU1FqUiHVQlmh0+/aSMt+du/L45jA9EBTiaC0q9QZyRqTjGXNUDZHtgEBcaf
 S1ovysQ4f40ObHlgQfvdYqoQaj4ldI13H+pmisC39/HlqHahAsAf5HmBDOWF7ts7wRhS
 H5ZJql2bNM/sN9sQu3aNMyYBvwd37UW7NZFtxMZX2hIwxhIdIkMIbm+hJCmqfnYgpfcC
 cPuBHCg+2hNBimAoXq9nckIM4LmkwnSEQTQVqafM1eNmFpM3Qtrd4KyQUExIRqk+WGXE
 T/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4pD6neQvy0XoKUC6JWDE0NkeOdi6hxyFhFa7E0KwLg=;
 b=bi9ShIH/HAumeOzOcenfUI+S93+584y2XejFl59NunYPkIxQObipG3yiwm4IojX4FA
 TOYRVo+tNWvEVt8906oDpceiyFmfyQSCxRpV1OJS8fcU+qjF2YxjDw7Ryihz2y+W/CYt
 yzfxMxZqUrCXQMvji/fVAcAahaJQFoPh1iOWpUQQMWzp+vOz0D0OzKmpbJ//i2yEHqgd
 1QcIX5Q47pwnj4BsLnplZY8iA9DOh5zojLOtLQ8rKCofFrstJV3sqA038GzR1CUdmBU5
 qwtwtLxUoIDem4Mli6E9UDaJrmdMJkxCJ7k/wz7vutcl+knJwvfzsSq5eZvmVt9Nfn63
 eoeQ==
X-Gm-Message-State: AOAM53120phEZhwBLtGlJAgE9U/66I2sj2sy8k+TRMzcWOH2/2aIaoan
 /JSk4j1rgdrwHfVVnwOoegiAbpUvJj646DGB
X-Google-Smtp-Source: ABdhPJxI+6wnRro3+/9YUS/pR0NGCJqg3NvM9KEhS3BufA6GPCVUKrOm5LTWinu3GlfZY1hu3j731A==
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr4148560ila.113.1630012369459; 
 Thu, 26 Aug 2021 14:12:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:49 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/43] bsd-user: Remove dead #ifdefs from elfload.c
Date: Thu, 26 Aug 2021 15:11:48 -0600
Message-Id: <20210826211201.98877-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
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


