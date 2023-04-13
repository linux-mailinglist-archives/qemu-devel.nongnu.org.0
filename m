Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C66E10A2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:09:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyXx-000822-QJ; Thu, 13 Apr 2023 11:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyXv-00081O-Gm
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyXr-00054E-TW
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id j11so18164160wrd.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681398448; x=1683990448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYoH05xSwr3WP+EI6CHPy/FAEMfj+7UKOwsjq5SbNj8=;
 b=Rwhq9Q/wULbueen7xmOKEawd5ln0ovlIMEVWPKhcWxHR7kECIqurL8zSj4NX+NmgKa
 nR/wNJUsEFsWnOF2XhNlpyl4M4wj3pX43HM5waQ0FkPyQKgtNu7epklzBRAJl9Czi3Fs
 y6SDgRMsZDc+isGJg65juO10iK7ynAZ98y6zMwUws4GgpxMmWbA2em5bmSM/QJ98t2wK
 +G10OaEdjGPnRE4sWMMkc/i9lv8blSjPwkc/4c6w6IMfHYtPJ1SMQrCGN/U3ACNp+Kes
 PAWFR0e8OwHq6WMm/Qgkn2a+ICD+/NGB6LQsjmg+QOY3U4BnsgxUgrXmWJvLJTfiT0gV
 JXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681398448; x=1683990448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYoH05xSwr3WP+EI6CHPy/FAEMfj+7UKOwsjq5SbNj8=;
 b=BSTm0JDMHII5sOowpJjYUu02kYzhNhQco5KDr9lBXaWWyZlC+MbF2Bm0+cCHHm7DIm
 5mT6V8BeJg38GG6q8j7/wjP58uBXAi8kcZo9mK36ILbm+EPFjM7B+/sbfvvddQQudKR0
 kjrLb2wkEcwRL7CBRFQW5g3fMelX3ryiscg7f4u9Pt2njVvLPODOsng0I4/8q5Pec80k
 r91Lm2oSJAmoKVnGCUv6Obd2NhyYu/E5qArdHh+4dpNxUMNy1J8QcfaE1D1aXAJkcFyx
 HKQqhPKHGcXdLrOQvTd2um/CLqI0w8pvOqjWvb4AfSDCMbzzofq7FfH57mNla34DnW/j
 Hxxw==
X-Gm-Message-State: AAQBX9cntjS8E8ak299MKBkLwXrxtAyHuzGXN9ZKS6PdT1t+PWfFOSJL
 uGGSfCjqbBUyqHaRJW363bpiacRIylfUksLXTF8=
X-Google-Smtp-Source: AKy350buL+UpmlHVQSNUfXQthNTcnGvPfTgEmDHe4ahXvWrWk6Ajioo9zeoJnSwBdzH8Rfr7oU9nYw==
X-Received: by 2002:a5d:6b91:0:b0:2ef:eb11:4618 with SMTP id
 n17-20020a5d6b91000000b002efeb114618mr1834705wrx.8.1681398448320; 
 Thu, 13 Apr 2023 08:07:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b002c55521903bsm1484870wrv.51.2023.04.13.08.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 08:07:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 2/2] chardev: Allow setting file chardev input file on the
 command line
Date: Thu, 13 Apr 2023 16:07:24 +0100
Message-Id: <20230413150724.404304-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413150724.404304-1-peter.maydell@linaro.org>
References: <20230413150724.404304-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Our 'file' chardev backend supports both "output from this chardev
is written to a file" and "input from this chardev should be read
from a file" (except on Windows). However, you can only set up
the input file if you're using the QMP interface -- there is no
command line syntax to do it.

Add command line syntax to allow specifying an input file
as well as an output file, using a new 'input-path' suboption.

The specific use case I have is that I'd like to be able to
feed fuzzer reproducer input into qtest without having to use
'-qtest stdio' and put the input onto stdin. Being able to
use a file chardev like this:
 -chardev file,id=repro,path=/dev/null,input-path=repro.txt -qtest chardev:repro
means that stdio is free for use by gdb.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The "not on Windows" ifdeffery is because qmp_chardev_open_file()
does something similar; it seems likely to produce a nicer
error message to catch it at parse time rather than open time.
---
 chardev/char-file.c |  8 ++++++++
 chardev/char.c      |  3 +++
 qemu-options.hx     | 10 ++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 3a7b9caf6f0..263e6da5636 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -100,6 +100,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
                                     Error **errp)
 {
     const char *path = qemu_opt_get(opts, "path");
+    const char *inpath = qemu_opt_get(opts, "input-path");
     ChardevFile *file;
 
     backend->type = CHARDEV_BACKEND_KIND_FILE;
@@ -107,9 +108,16 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
         error_setg(errp, "chardev: file: no filename given");
         return;
     }
+#ifdef _WIN32
+    if (inpath) {
+        error_setg(errp, "chardev: file: input-path not supported on Windows");
+        return;
+    }
+#endif
     file = backend->u.file.data = g_new0(ChardevFile, 1);
     qemu_chr_parse_common(opts, qapi_ChardevFile_base(file));
     file->out = g_strdup(path);
+    file->in = g_strdup(inpath);
 
     file->has_append = true;
     file->append = qemu_opt_get_bool(opts, "append", false);
diff --git a/chardev/char.c b/chardev/char.c
index e69390601fc..661ad8176a9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -805,6 +805,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "path",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "input-path",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "host",
             .type = QEMU_OPT_STRING,
diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c5..31d08c60264 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3360,7 +3360,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev file,id=id,path=path[,input-file=input-file][,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
@@ -3563,13 +3563,19 @@ The available backends are:
     Create a ring buffer with fixed size ``size``. size must be a power
     of two and defaults to ``64K``.
 
-``-chardev file,id=id,path=path``
+``-chardev file,id=id,path=path[,input-path=input-path]``
     Log all traffic received from the guest to a file.
 
     ``path`` specifies the path of the file to be opened. This file will
     be created if it does not already exist, and overwritten if it does.
     ``path`` is required.
 
+    If ``input-path`` is specified, this is the path of a second file
+    which will be used for input. If ``input-path`` is not specified,
+    no input will be available from the chardev.
+
+    Note that ``input-path`` is not supported on Windows hosts.
+
 ``-chardev pipe,id=id,path=path``
     Create a two-way connection to the guest. The behaviour differs
     slightly between Windows hosts and other hosts:
-- 
2.34.1


