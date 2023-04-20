Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13116E8F99
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHa-0000s4-Ro; Thu, 20 Apr 2023 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-0000e5-JO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHF-00080J-K1
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCqBRJcCY9i3GrrdVn/uo/h4OMts4OWbIQoJsVCbAe0=;
 b=Qb0GmH+P1NSeVhFQT+ntwSJIBxvUfhPXzxiw3I4YDUgSaGtHdd6nbkajrxFFQVvQGT+/RO
 pp/cqWBRBJ70y3e0HM50pJLBJXbiwrtzfJbjr2CNTGUkvzBzc9/6EVn3qbMwmP7YAZrorn
 j2DhFEw5mOAwnd/FPj3rfI57PwQqAz0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478--nnOqrTqO12eQiSO4NfDfw-1; Thu, 20 Apr 2023 06:12:29 -0400
X-MC-Unique: -nnOqrTqO12eQiSO4NfDfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCBEF1C17423;
 Thu, 20 Apr 2023 10:12:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE64440BC;
 Thu, 20 Apr 2023 10:12:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 06/23] chardev: Allow setting file chardev input file on the
 command line
Date: Thu, 20 Apr 2023 12:11:59 +0200
Message-Id: <20230420101216.786304-7-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20230413150724.404304-3-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[thuth: Replace "input-file=" typo with "input-path="]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 chardev/char-file.c |  8 ++++++++
 chardev/char.c      |  3 +++
 qemu-options.hx     | 10 ++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 3a7b9caf6f..263e6da563 100644
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
index e69390601f..661ad8176a 100644
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
index 59bdf67a2c..04c259157a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3360,7 +3360,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev file,id=id,path=path[,input-path=input-file][,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
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
2.31.1


