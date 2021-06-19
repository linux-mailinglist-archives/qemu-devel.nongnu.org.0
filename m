Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD23AD778
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:45:27 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRvC-0002zQ-P4
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtV-00008J-UW
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:42 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtP-00081j-10
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id f10so3546124plg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtXXZ8iOGwpaQfUOm6DW075wk6Tcr8F02y3NmtzbotE=;
 b=oma6t+J6HZwI1G5DffLzF9PdZihCwD5yizlAwk/JNOeRv87FMG5v7B0Z2dDbC9HE89
 Z6xSQ7iqyjumfDXLJXzPcja39w00px12wHyMDdPSBZhDLv4/dHRQoKL8UCsHma1x+PWe
 fuHGI34Q7+flia9cmetY6Srz5n8cM78tuSECthmNFBgzX84vya9Bwzkwq0UCLsT1XEst
 WI+q0u32TD4lkOWVkwFQ9RHH55TOl1zpYqQpoNnHjMCHN9gqij31Od2Pi37OlJb/YRk4
 40qs51WYJrtDIwHqZjM+ZMPomVzhRJRQnKVUa0dR/JXedD6BYYnFCCVDOq8z8XBEtz6/
 ChQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtXXZ8iOGwpaQfUOm6DW075wk6Tcr8F02y3NmtzbotE=;
 b=ZxTnEh6NYxlyajyhfS7vttjsGcSu1MIe0FaNG5K68UwWBs2ONs0Jmr59bSdU5NRinZ
 SXw3YLZVuKMwvhpOL7q1H8ezKu4WAB6YfdXGsCEBrmImpE201salactNEcD14e9XUydm
 soj1n9zX3CkjHUGGWWoZSPu41KqcgAH8gQ5Rf5NM9EP3eJwbKFj5SSw6Kzj8yqtIFHdp
 NeRQqj+OBeiZHHaTa1whNr8BlNggxbw+noSWsWpXviuMrS3bv7fwBfav1hn5JmuzO609
 0fSr4elzCqLBrGUPFGkvCt8bhLxaecg2k+H2SZywXL2U52F7pFkTY2+/jUgEV87HFIMU
 s7Eg==
X-Gm-Message-State: AOAM532YThW1H56D94Jm4MytKYld5KDkwyrBH6IAv9hzbBzysmsW48gZ
 hhUALpvUVT2gSDYXonb+xWNxi1y02iK25A==
X-Google-Smtp-Source: ABdhPJy68PQvmsUop4drCfpO/8YVJRXp15+svNguey1sqydTgj2SxHbTcpF1X8IjjWQ8HRGSy41Rgw==
X-Received: by 2002:a17:90b:393:: with SMTP id
 ga19mr14289824pjb.182.1624074213153; 
 Fri, 18 Jun 2021 20:43:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] linux-user: Do not clobber bprm_buf swapping ehdr
Date: Fri, 18 Jun 2021 20:43:21 -0700
Message-Id: <20210619034329.532318-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rearrange the allocation of storage for ehdr between load_elf_image
and load_elf_binary.  The same set of copies are done, but we don't
modify bprm_buf, which will be important later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c0236a0b09..1f9a69703a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2622,16 +2622,17 @@ static bool parse_elf_properties(int image_fd,
    On return: INFO values will be filled in, as necessary or available.  */
 
 static void load_elf_image(const char *image_name, int image_fd,
-                           struct image_info *info, char **pinterp_name,
+                           struct image_info *info, struct elfhdr *ehdr,
+                           char **pinterp_name,
                            char bprm_buf[BPRM_BUF_SIZE])
 {
-    struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
     int i, retval, prot_exec;
     Error *err = NULL;
 
     /* First of all, some simple consistency checks */
+    memcpy(ehdr, bprm_buf, sizeof(*ehdr));
     if (!elf_check_ident(ehdr)) {
         error_setg(&err, "Invalid ELF image for this architecture");
         goto exit_errmsg;
@@ -2944,6 +2945,7 @@ static void load_elf_image(const char *image_name, int image_fd,
 static void load_elf_interp(const char *filename, struct image_info *info,
                             char bprm_buf[BPRM_BUF_SIZE])
 {
+    struct elfhdr ehdr;
     int fd, retval;
     Error *err = NULL;
 
@@ -2965,7 +2967,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
         memset(bprm_buf + retval, 0, BPRM_BUF_SIZE - retval);
     }
 
-    load_elf_image(filename, fd, info, NULL, bprm_buf);
+    load_elf_image(filename, fd, info, &ehdr, NULL, bprm_buf);
 }
 
 static int symfind(const void *s0, const void *s1)
@@ -3157,8 +3159,14 @@ uint32_t get_elf_eflags(int fd)
 
 int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 {
+    /*
+     * We need a copy of the elf header for passing to create_elf_tables.
+     * We will have overwritten the original when we re-use bprm->buf
+     * while loading the interpreter.  Allocate the storage for this now
+     * and let elf_load_image do any swapping that may be required.
+     */
+    struct elfhdr ehdr;
     struct image_info interp_info;
-    struct elfhdr elf_ex;
     char *elf_interpreter = NULL;
     char *scratch;
 
@@ -3170,12 +3178,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     info->start_mmap = (abi_ulong)ELF_START_MMAP;
 
     load_elf_image(bprm->filename, bprm->fd, info,
-                   &elf_interpreter, bprm->buf);
-
-    /* ??? We need a copy of the elf header for passing to create_elf_tables.
-       If we do nothing, we'll have overwritten this when we re-use bprm->buf
-       when we load the interpreter.  */
-    elf_ex = *(struct elfhdr *)bprm->buf;
+                   &ehdr, &elf_interpreter, bprm->buf);
 
     /* Do this so that we can load the interpreter, if need be.  We will
        change some of these later */
@@ -3245,7 +3248,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
         target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
     }
 
-    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
+    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &ehdr,
                                 info, (elf_interpreter ? &interp_info : NULL));
     info->start_stack = bprm->p;
 
-- 
2.25.1


