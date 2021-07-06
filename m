Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20853BDFED
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:56:17 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uvI-0006Ct-Nn
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uou-0000k4-AL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uos-0006bQ-2w
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f17so525544pfj.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esOfXUyRVMGOg67ITfNoE/UDJ8GPb3XxBVP+gF1D6+o=;
 b=VVf2Pq8BmS8ZvyhYQmyNzP99jtiF+PmLeKqh7SS5g3MRhxUiuTh7IdFQNCPiFCN7iS
 RWD9kc3dzuo2QKcL3IM6VfT6+3cww1YSKqj/zQrMRrQG7hbr3cVJx7fPx0e3Swa1zm2V
 H93GKOaTswHPbJ4CytIJXw87gnt3YOtJ5Ha0t0IC2uBDRTgUPb+G8ESnfV8JU0i8xf38
 wvNgreUl3UOOacRKpeVjnzKN0pMX4/C4m+mVXMcsRPOYUtWU4NAKU5McL5G6Zla+87se
 qQbzhAYEykSCitjUi6Hz38VgZvfyq0HJicC9fc+1xRPGJcd/DnWtPyJBjosgx/0z3zl3
 qxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esOfXUyRVMGOg67ITfNoE/UDJ8GPb3XxBVP+gF1D6+o=;
 b=bPU0Yi38QDpMxzAmmp7BYNhyV7fjZ3I2ZzOAdhhTi9s/YsI27LZpVBGYxjRXl+tcK+
 /Z0AcXtqjLIwQLmmSPqxvQ92ae/KzpXywGdzIzF0DxPVh2EXaj4OqqqDvjBzOXtSmRL1
 etjAUM72F7gVDiUpKqAC0WYaY89mQVcZmPzJlBFT1ELpCSYJOfhdeT6PTCbJQpj6tPML
 gqfR8mUGMt2Jav2YJzX0Z6Forb9L8F5KMli7FB3ff0baPB0YJ3SlzpM08b7Dflczbgb7
 QIpG5UtFRQ/K7yNRxpucty5SBRd0tz3DKl6HGqGmpNvJyf1N7rqqsaljcc5Xot0utMPY
 BzXg==
X-Gm-Message-State: AOAM530jlyet+joM37PiyLa1vjCvLsaQbMQ9jLdzU6BsDIEEqFSl3WQf
 nqRVzAYwnXbwMnMdxBJmXhPdVghkynRz+Q==
X-Google-Smtp-Source: ABdhPJxWN8p/yo8oEPUW7+3rnYuqjTlfnVL5Uj2gXJUQw3x1McaGHcdMKlCqsGtxf8DOHXxJqbZoRA==
X-Received: by 2002:a63:7d8:: with SMTP id 207mr20633541pgh.267.1625615376626; 
 Tue, 06 Jul 2021 16:49:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/36] linux-user: Do not clobber bprm_buf swapping ehdr
Date: Tue,  6 Jul 2021 16:49:01 -0700
Message-Id: <20210706234932.356913-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rearrange the allocation of storage for ehdr between load_elf_image
and load_elf_binary.  The same set of copies are done, but we don't
modify bprm_buf, which will be important later.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9bec6613a2..d1278c2d29 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2627,16 +2627,17 @@ static bool parse_elf_properties(int image_fd,
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
@@ -2949,6 +2950,7 @@ static void load_elf_image(const char *image_name, int image_fd,
 static void load_elf_interp(const char *filename, struct image_info *info,
                             char bprm_buf[BPRM_BUF_SIZE])
 {
+    struct elfhdr ehdr;
     int fd, retval;
     Error *err = NULL;
 
@@ -2970,7 +2972,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
         memset(bprm_buf + retval, 0, BPRM_BUF_SIZE - retval);
     }
 
-    load_elf_image(filename, fd, info, NULL, bprm_buf);
+    load_elf_image(filename, fd, info, &ehdr, NULL, bprm_buf);
 }
 
 static int symfind(const void *s0, const void *s1)
@@ -3162,8 +3164,14 @@ uint32_t get_elf_eflags(int fd)
 
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
 
@@ -3175,12 +3183,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
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
@@ -3250,7 +3253,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
         target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
     }
 
-    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
+    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &ehdr,
                                 info, (elf_interpreter ? &interp_info : NULL));
     info->start_stack = bprm->p;
 
-- 
2.25.1


