Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAF3BDFE6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:54:09 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0utE-0000do-Uc
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uot-0000iK-5F
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uor-0006b9-DT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id a2so402734pgi.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XhZDg9Govvz9gc3VGnWdnVC8clvh9XH69vOvHyBLl0=;
 b=WpSFoxlfzzIrc6qgT2OGQuRqAfSdzz4uAIuOgSIFmrguCwTGC+5rTefv5ailwYid2e
 OnW0G0HvJJ3+cbewcNf9P1+uAE/K6Kv7aOgEsOqROShxIMghCZyKdo103D9izV/bFSZz
 6aYZ5NHDmNUd3TZLZ5qJ2MkQt0SjQe33g5dtF7uIrSWTCwiGWCOrp1YUuXI5QCnsl8D5
 gtpPGB1v1S6u82HEW85+aALz7r34ACUJ5RkA2HbJqwWNbseNsiHQ7x8JSgcvuQfe83k+
 feVbf5/N0FlJg4CcdYJ9mjKYGu4MNJn+WGqm+44APrq/eiTgA0J4emzY5aGrxNWLKyaC
 MQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XhZDg9Govvz9gc3VGnWdnVC8clvh9XH69vOvHyBLl0=;
 b=cDm2A1qCT2fFfjp+Fuq3+AvTcCqUS3c/9Sd37WSBsp66rKau5LDSSK4Z7zrQ+t0arf
 AAQVgjvjcJ2zVOH5vyUk8jX05/Fmas0auKditPXf74/s/Dy71mbnrCv4AOUDSImxul9r
 jYzHBqMoWzOss9Quc7TGHcGoKdLsTQyUUGVchSOSreiH+fBMkGhKpi62LMg7Ucg5OJAZ
 s+XYJdl2jLODTTA+qUcMphlosY5O6ryev/1Yxrmo+apzXAn/dpsirtw+DrM8PkNz1yH4
 0ojn+U4yDi9QmAIIoP55IChQxhCwOJGVVzousEiyqAiFJXOIVabWThTxS+LZQjYFsVvu
 gIBw==
X-Gm-Message-State: AOAM533xqRsLZeFqyPrNS6doF1/e3XGvtc0BJDzmBmqXlN61uq43jc9R
 dkHFlnBnm9/Zo00BnwWuNiFVREgfNwjQUw==
X-Google-Smtp-Source: ABdhPJwdOQbuT0uNEBFjUljchrSWII62yoOqq+8FRrUb9zCX9VcE+uc0OPyJtMPiMRo0+ptzBpZM8g==
X-Received: by 2002:a63:d612:: with SMTP id q18mr23365770pgg.77.1625615375948; 
 Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/36] linux-user: Tidy loader_exec
Date: Tue,  6 Jul 2021 16:49:00 -0700
Message-Id: <20210706234932.356913-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Reorg the if cases to reduce indentation.
Test for 4 bytes in the file before checking the signatures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/linuxload.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 3b0bafc490..8b93b9704c 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -143,31 +143,31 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
 
     retval = prepare_binprm(bprm);
 
-    if (retval >= 0) {
-        if (bprm->buf[0] == 0x7f
-                && bprm->buf[1] == 'E'
-                && bprm->buf[2] == 'L'
-                && bprm->buf[3] == 'F') {
-            retval = load_elf_binary(bprm, infop);
-#if defined(TARGET_HAS_BFLT)
-        } else if (bprm->buf[0] == 'b'
-                && bprm->buf[1] == 'F'
-                && bprm->buf[2] == 'L'
-                && bprm->buf[3] == 'T') {
-            retval = load_flt_binary(bprm, infop);
-#endif
-        } else {
-            return -ENOEXEC;
-        }
+    if (retval < 4) {
+        return -ENOEXEC;
     }
-
-    if (retval >= 0) {
-        /* success.  Initialize important registers */
-        do_init_thread(regs, infop);
+    if (bprm->buf[0] == 0x7f
+        && bprm->buf[1] == 'E'
+        && bprm->buf[2] == 'L'
+        && bprm->buf[3] == 'F') {
+        retval = load_elf_binary(bprm, infop);
+#if defined(TARGET_HAS_BFLT)
+    } else if (bprm->buf[0] == 'b'
+               && bprm->buf[1] == 'F'
+               && bprm->buf[2] == 'L'
+               && bprm->buf[3] == 'T') {
+        retval = load_flt_binary(bprm, infop);
+#endif
+    } else {
+        return -ENOEXEC;
+    }
+    if (retval < 0) {
         return retval;
     }
 
-    return retval;
+    /* Success.  Initialize important registers. */
+    do_init_thread(regs, infop);
+    return 0;
 }
 
 bool imgsrc_read(void *dst, off_t offset, size_t len,
-- 
2.25.1


