Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA13FF835
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:02:56 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwfX-0007lc-7e
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRN-00077h-VR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRK-00038z-M0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:17 -0400
Received: by mail-il1-x12f.google.com with SMTP id x5so3575094ill.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHgTeAaYz/lEdKsPhpVfOQ7pF/fy2xdIJ54PjrTVY8s=;
 b=mW4rh7x82Bxyr46G+sxj+tTTsxQdaosVF93UoLW/i64lEEk1yQG2A9waN5W6rkQwdZ
 9gT4QbNFqRZYMcMrf7Rms8PUVzKjsuqYwc04nIqGeLkb8ifSWDE5Kf2MZJMoASPysx1U
 /2S9K+hsEyw2VlNpenFRYiVbhsbPQOVkJvxBS6nIm8Or1pqzg0q8BUoIZuDlqqV4+IO7
 iP9SQDusEQQf78rmwHtCG+twTwE+P6/n7tkpz2HX4ZCs2OA4lOlZghd/Sfc7Hke78qi8
 087VP23M7GBGUClUrl/vpGTe5jvOBd5dJ8jDTSp66cDFUrG3y5dmu4CHDYZe26kzNvLv
 9Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHgTeAaYz/lEdKsPhpVfOQ7pF/fy2xdIJ54PjrTVY8s=;
 b=sEpS3TFywk+Zuk69GXVdae82OU6/pmsVDO8zyQXDYeGEJL6AE+GEF5BSPna/V6HWRo
 fP/k+774oaiXTBocYBxPyTARx980Li53W7p+ezgAfM0C8km8AgQZv+XAoodrfct62qR4
 CpF3LRHdZy+nYyqDarXygadfKKsMb9YUNm6Xkboq0LTw+uQnTPE2GFI8SCrd4sO54n6F
 BKKZoygLREqH6slIEkJusNcBQhuZ46jnrDmcM1osEMsSKQZSDKH9ebyHWVb8dSmSjcf4
 7RiEbMZcxJc8SNC8YoC8xXpVHjI1l4wQ5cvTTTUvWH7BGEFdDuuUqja/GtEb/mwlUbTz
 cZbA==
X-Gm-Message-State: AOAM533FnaDj7WO0xd2c9jNeGHf9FYQx2q3pEzvtpKlcqRQsdHiKpnh2
 NgARbKlqNcV56WsGhG9HL1As0CZOooavFw==
X-Google-Smtp-Source: ABdhPJzKhZQOynx4Lo5JHfU9c0XeFYQdue67bgxQkvxFe0HFtryYK73vtAwh126sdzhmTZCs7su0SQ==
X-Received: by 2002:a92:6a0d:: with SMTP id f13mr563395ilc.212.1630626493283; 
 Thu, 02 Sep 2021 16:48:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:12 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/43] bsd-user: Remove dead #ifdefs from elfload.c
Date: Thu,  2 Sep 2021 17:47:17 -0600
Message-Id: <20210902234729.76141-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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


