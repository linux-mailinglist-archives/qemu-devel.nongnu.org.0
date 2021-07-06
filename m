Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107BE3BDFFF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:02:17 +0200 (CEST)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v16-0000eX-3I
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uox-0000sg-9E
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uou-0006bx-HP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i13so46243plb.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaeBKd2588gwtTJA1dNcYNPRKjLEqNsjOOLvdzic+bk=;
 b=ZjuhVCKkQfznQsgOgmFV77pmONWIQPaYd813tDpYCQaQg1LgaK3tcI8svsP+SocvEA
 PQaifbNeDES7uvA4/2lNed65J7kFLqAivYt+39P6N+dpxH35wcJmjEEuZKkZje90CqTS
 9uxE5XrrG+wYLl9xxl2Z9H2GMypkNtGGy9tfGXrwmWo2dI/A/HtJLbmNqoY0luqlJtVp
 G6tav5BjqlI/Vg9CRFaGmoTT9/5H4E71TIsGiVApwigtkpyIsyeitm7hC1Y1XRGyZ0GY
 3n5ZGCVi6XNJ2eaI+S5H/1ZwXg2A5HJ5zC7t2ZIt1djPMtIlYAUHQfZuTntqAK2e/SyG
 y4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaeBKd2588gwtTJA1dNcYNPRKjLEqNsjOOLvdzic+bk=;
 b=AFk7qO/STZET+maYl/aKD4SiwUqZkfBDzq7QUwaGWeamcrvo8w5/qNec5mCNFJh8+9
 HvPBpCurgFt7yUVy/N5C0AlHsE+FB+AZrsLNvHcIIW6b2/JJ/aJkauSS/lS2e0MQ8o3/
 UnzFXNHJXl5wSynWOxYoJaRS9YIQxwwgOh9JXukdsv6Y6dcp2hyCfwTuRj4Dwpu6jIm6
 2faSnQG6Ym77HHoeDKOCFk+a2AkaIlsbVZoDu48TkiMT0k+PEs+m9ezSLO8mkFCbBJiE
 bf4bbkxXYw06lvjhPnQF83YhOzHMq3kX0ViSXuvORjmjqfZsOT0vGDvQmwBOEhUo3IFT
 QphA==
X-Gm-Message-State: AOAM530WC48HDER5ahVA1kQTnMheBqeifM2FD1eQ93ktrZaxd8sJkaSS
 QIePD6xG6oTLRmEY9HaBhXlu6jGL6MpJ0w==
X-Google-Smtp-Source: ABdhPJxb+1DrHblksGsYtrKN5kf45/lddOJ8SDufhxZVqAQ/sw5DHLraAUsj1EgRWKr6YbklidnOIA==
X-Received: by 2002:a17:90a:8417:: with SMTP id
 j23mr18325344pjn.168.1625615379216; 
 Tue, 06 Jul 2021 16:49:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/36] linux-user: Replace bprm->fd with bprm->src.fd
Date: Tue,  6 Jul 2021 16:49:04 -0700
Message-Id: <20210706234932.356913-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

There are only a couple of uses of bprm->fd remaining.
Migrate to the other field.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


