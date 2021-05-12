Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C337CFE3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:35:52 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgslz-0003z9-Kq
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUf-0007LT-V7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUW-0008Og-RH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: by mail-io1-xd2a.google.com with SMTP id n40so6642561ioz.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7bQctyGCIlr/5eXGNXi6VxjLIggmhyddGK0Cjfe3ZM=;
 b=Ilo/2n4Bl1RODYMQ9ceW961vBnv1cNk7Xy1I1wTsR3AiIjdoSepckj0JjDtsDvD2X7
 e70HCBWFUnDCigYOBJ26uyhvWhj8qSopkCav5StsrEwwPbIE8DDRJxuaF9UImDKhVlIR
 t+6tarYRIqtO4jZEmq38quZCI8jidUXDNFYIeigzlOD+npbzNsMfg64y4TBlL2tXP5pL
 wIuMtS+IQDIAKyzO5ILzkAk/5Fe7S+8wNIFFHVj70SgvJZHcAcxbuOmCsgQPdHYsYrG4
 pZBB7dXxwOJE5mVSzRi/sdd/XKxvSUu2bFx4xJfMj9i7vs1vYVk8w/ZFCRuOfRYMb2jA
 CABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7bQctyGCIlr/5eXGNXi6VxjLIggmhyddGK0Cjfe3ZM=;
 b=Aou33ClVf3/KkzjWu+61JWOimkGcchbXEj+qy7k7SpnCK+XbRRbitdbrvV70gtCOSR
 w/Q6PTX4epHKlYclLmv01xgtcKQUNsiWwh6jznav8bjaMysj3w6hwPpVK7nVSlzSBou5
 10PReOp3m9D/jKWUygfFJsA4IMvWWK8fUcxzxUMHAPBMo1jWbhaP076NyFsRj5JWBU73
 jHSi1IxX7BNLQhXftgEwKG0UlKZ1YDAy5t429F0XXvLT8hHm/EYFr5w0MTSQXbaSeQyJ
 1FZk3xtO0Z/NsST55oF0N2vPdq56Gcg7cCxbl1GdtXZU0ONSeBgFtdLt91RYHhmTZD3C
 Tz1Q==
X-Gm-Message-State: AOAM5335hqjJPKypqf5h/PRxQyIZentHdeQ45DD7P1s6XdATB6GKs6fg
 7Abg1Uu5E9EfSiEpXFISKw0cj/rFULNPjg==
X-Google-Smtp-Source: ABdhPJxRJWGYol7zt32ibDgXFiPdZjyJzUXOlrWsMjVOythPS1i8V09Ob28Q69LGeddwDV9RKZBSdA==
X-Received: by 2002:a5e:d711:: with SMTP id v17mr18268235iom.65.1620839866940; 
 Wed, 12 May 2021 10:17:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] bsd-user: rename linux_binprm to bsd_binprm
Date: Wed, 12 May 2021 11:17:20 -0600
Message-Id: <20210512171720.46744-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename linux_binprm to bsd_binprm to reflect that we're loading BSD binaries,
not ELF ones.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 4 ++--
 bsd-user/elfload.c | 4 ++--
 bsd-user/qemu.h    | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index e1ed3b7b60..8d83f21eda 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -32,7 +32,7 @@ static int count(char **vec)
     return i;
 }
 
-static int prepare_binprm(struct linux_binprm *bprm)
+static int prepare_binprm(struct bsd_binprm *bprm)
 {
     struct stat         st;
     int mode;
@@ -127,7 +127,7 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 int loader_exec(const char *filename, char **argv, char **envp,
              struct target_pt_regs *regs, struct image_info *infop)
 {
-    struct linux_binprm bprm;
+    struct bsd_binprm bprm;
     int retval;
     int i;
 
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 3c9d8c2845..6edceb3ea6 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -662,7 +662,7 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
     return p;
 }
 
-static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
+static abi_ulong setup_arg_pages(abi_ulong p, struct bsd_binprm *bprm,
                                  struct image_info *info)
 {
     abi_ulong stack_base, size, error;
@@ -1143,7 +1143,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
     syminfos = s;
 }
 
-int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info)
 {
     struct elfhdr elf_ex;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index eb66d15df7..c02e8a5ca1 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -115,7 +115,7 @@ extern unsigned long mmap_min_addr;
  * This structure is used to hold the arguments that are
  * used when loading binaries.
  */
-struct linux_binprm {
+struct bsd_binprm {
         char buf[128];
         void *page[MAX_ARG_PAGES];
         abi_ulong p;
@@ -133,9 +133,9 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 int loader_exec(const char *filename, char **argv, char **envp,
              struct target_pt_regs *regs, struct image_info *infop);
 
-int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
-int load_flt_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+int load_flt_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
-- 
2.22.1


