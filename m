Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30E3AD777
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:45:27 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRvC-0002uD-0h
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtZ-00009Q-ER
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:45 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtQ-00082N-Ui
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:45 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h12so9240416pfe.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YC2foJgnALUaFU8F6U+DDhXWrRa+DNA7R4W0GBliIEU=;
 b=AausL1d+dIJbIcyEOLHzxetr1Gqs9u+R7IU/7/O6HOHcDY6VmHkcsTmnLF0ftUhZXr
 CaVdpZZarNPBlqUYHdfm84aMZzY08JLzSu8wrn90TaGgrE4zyRP32zHXyNDP0a7jvPWu
 Sq+sGVKlzgyrqnMmcAnfGhl07KJU66O3AOdNdkeCYVsOk42Ay/EQKbkfKM6Kqyyp3Wrd
 O8YuuLwluwzAzwH6yk8sB6JXXBFr8ibNEpiEz3JwtGv4KhfY/ukvW3OIJjWxkIlrZaCt
 pUtbLl8PhZyYqcdecCJgA8nTLbRa4b1yqfGJgaecnB/4jyIjBMQ+r68lBxL9jerEK4mH
 Ak+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YC2foJgnALUaFU8F6U+DDhXWrRa+DNA7R4W0GBliIEU=;
 b=RiQFF5vfXoyFo8u5CCIC5vxUELsCDnkwxKbUx10jErAObix2tXmuAYWwulLtRAsfTq
 OdkbWh9X3Kqz9PmrHhVIqyoYhXpMrMLNXI0S0KMWKLWwN1qxrqmPxz9AXiF/sCvtI3B7
 HctvrRVXf/Y4HKvOtY1V0wwBuLD90f5u5MdQKA6XB73z2VLdYDkDeAMP34x3gHf8H90Q
 jD0SvQHeJMPgAzqEKUr2ZkEqwPEHpmQtO6PTKwHEMHhtr1YlUKlHfrHE00PfqArj0EHG
 AWu09dJSaroJ02gHC8tD5DLda9ML4aAwh/V8Qh6NjQ4QCBoSnKtY/02/P/NlwQuGoLC3
 QDZQ==
X-Gm-Message-State: AOAM533az+NhZ8j3mKJ2Q84Op+1PAnPpsgBXwUD5Mv2QQ2bsBuROX0Yr
 OybmgIfDrlNWE+m3f8xi6LAMchPS1xu3DQ==
X-Google-Smtp-Source: ABdhPJwmO2VdPmtSS4QzbZVGQjB5d/G8iAuN1S9OXWNIP4/E4hgvCNBKg9G0krt/SEGrFmONWZUqVg==
X-Received: by 2002:a63:6d8d:: with SMTP id
 i135mr11084192pgc.350.1624074214962; 
 Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] linux-user: Replace bprm->fd with bprm->src.fd
Date: Fri, 18 Jun 2021 20:43:24 -0700
Message-Id: <20210619034329.532318-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

There are only a couple of uses of bprm->fd remaining.
Migrate to the other field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h      | 1 -
 linux-user/flatload.c  | 8 ++++----
 linux-user/linuxload.c | 5 ++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index f4cdfb16b3..dafaae6293 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -211,7 +211,6 @@ struct linux_binprm {
     char buf[BPRM_BUF_SIZE] __attribute__((aligned));
     ImageSource src;
     abi_ulong p;
-    int fd;
     int e_uid, e_gid;
     int argc, envc;
     char **argv;
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 3e5594cf89..58d0d9352c 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -460,7 +460,7 @@ static int load_flat_file(struct linux_binprm * bprm,
         DBG_FLT("BINFMT_FLAT: ROM mapping of file (we hope)\n");
 
         textpos = target_mmap(0, text_len, PROT_READ|PROT_EXEC,
-                              MAP_PRIVATE, bprm->fd, 0);
+                              MAP_PRIVATE, bprm->src.fd, 0);
         if (textpos == -1) {
             fprintf(stderr, "Unable to mmap process text\n");
             return -1;
@@ -487,7 +487,7 @@ static int load_flat_file(struct linux_binprm * bprm,
         } else
 #endif
         {
-            result = target_pread(bprm->fd, datapos,
+            result = target_pread(bprm->src.fd, datapos,
                                   data_len + (relocs * sizeof(abi_ulong)),
                                   fpos);
         }
@@ -537,10 +537,10 @@ static int load_flat_file(struct linux_binprm * bprm,
         else
 #endif
         {
-            result = target_pread(bprm->fd, textpos,
+            result = target_pread(bprm->src.fd, textpos,
                                   text_len, 0);
             if (result >= 0) {
-                result = target_pread(bprm->fd, datapos,
+                result = target_pread(bprm->src.fd, datapos,
                     data_len + (relocs * sizeof(abi_ulong)),
                     ntohl(hdr->data_start));
             }
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 8b93b9704c..d0d3f2ed0e 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -36,7 +36,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
     int mode;
     int retval;
 
-    if (fstat(bprm->fd, &st) < 0) {
+    if (fstat(bprm->src.fd, &st) < 0) {
         return -errno;
     }
 
@@ -66,7 +66,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
         bprm->e_gid = st.st_gid;
     }
 
-    retval = read(bprm->fd, bprm->buf, BPRM_BUF_SIZE);
+    retval = read(bprm->src.fd, bprm->buf, BPRM_BUF_SIZE);
     if (retval < 0) {
         perror("prepare_binprm");
         exit(-1);
@@ -133,7 +133,6 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
 {
     int retval;
 
-    bprm->fd = fdexec;
     bprm->src.fd = fdexec;
     bprm->filename = (char *)filename;
     bprm->argc = count(argv);
-- 
2.25.1


