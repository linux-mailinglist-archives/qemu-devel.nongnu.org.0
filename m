Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360F6F68C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:58:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVi3-0002IX-Rw; Thu, 04 May 2023 05:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVi0-0002HZ-JF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVhz-000719-0u
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfXKFgitjjZI2xNN7tEyXGacbeusHdyA+/CrrkS5Os0=;
 b=DdVcwPLtV4JjxIMgZnCc8zY1HiKlqgxBhrXzy4la+LG49hLOpsx6nV2+oTOw+hd7/paFu9
 xbf926qsEDmptplIB4iMaIbClzrq06MfQEAS/dwGLZSXUL58/VMy3xH0sNCHPbAGbBj5QM
 1l8yUaDzhzRob7fCZRjnS3uvgUAs3Cc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-F7wAkQj2NP6MLa8WOy-7IQ-1; Thu, 04 May 2023 05:57:03 -0400
X-MC-Unique: F7wAkQj2NP6MLa8WOy-7IQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE2B88B7A1;
 Thu,  4 May 2023 09:57:02 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.225.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D472C492C13;
 Thu,  4 May 2023 09:57:01 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] qga: Refactor guest-exec capture-output to take enum
Date: Thu,  4 May 2023 12:56:53 +0300
Message-Id: <20230504095657.239048-3-kkostiuk@redhat.com>
In-Reply-To: <20230504095657.239048-1-kkostiuk@redhat.com>
References: <20230504095657.239048-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

From: Daniel Xu <dxu@dxuuu.xyz>

Previously capture-output was an optional boolean flag that either
captured all output or captured none. While this is OK in most cases, it
lacks flexibility for more advanced capture cases, such as wanting to
only capture stdout.

This commits refactors guest-exec qapi to take an enum for capture mode
instead while preserving backwards compatibility.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands.c       | 37 ++++++++++++++++++++++++++++++++++---
 qga/qapi-schema.json | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 172826f8f8..01f68b45ab 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -379,11 +379,23 @@ close:
     return false;
 }
 
+static GuestExecCaptureOutputMode ga_parse_capture_output(
+        GuestExecCaptureOutput *capture_output)
+{
+    if (!capture_output)
+        return GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
+    else if (capture_output->type == QTYPE_QBOOL)
+        return capture_output->u.flag ? GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED
+                                      : GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
+    else
+        return capture_output->u.mode;
+}
+
 GuestExec *qmp_guest_exec(const char *path,
                        bool has_arg, strList *arg,
                        bool has_env, strList *env,
                        const char *input_data,
-                       bool has_capture_output, bool capture_output,
+                       GuestExecCaptureOutput *capture_output,
                        Error **errp)
 {
     GPid pid;
@@ -396,7 +408,8 @@ GuestExec *qmp_guest_exec(const char *path,
     gint in_fd, out_fd, err_fd;
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
-    bool has_output = (has_capture_output && capture_output);
+    bool has_output = false;
+    GuestExecCaptureOutputMode output_mode;
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
@@ -415,8 +428,26 @@ GuestExec *qmp_guest_exec(const char *path,
 
     flags = G_SPAWN_SEARCH_PATH | G_SPAWN_DO_NOT_REAP_CHILD |
         G_SPAWN_SEARCH_PATH_FROM_ENVP;
-    if (!has_output) {
+
+    output_mode = ga_parse_capture_output(capture_output);
+    switch (output_mode) {
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE:
         flags |= G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDOUT:
+        has_output = true;
+        flags |= G_SPAWN_STDERR_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDERR:
+        has_output = true;
+        flags |= G_SPAWN_STDOUT_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
+        has_output = true;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
+        /* Silence warning; impossible branch */
+        break;
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 6a20eeb297..44e44c2a5c 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1200,6 +1200,37 @@
 { 'struct': 'GuestExec',
   'data': { 'pid': 'int'} }
 
+##
+# @GuestExecCaptureOutputMode:
+#
+# An enumeration of guest-exec capture modes.
+#
+# @none: do not capture any output
+# @stdout: only capture stdout
+# @stderr: only capture stderr
+# @separated: capture both stdout and stderr, but separated into
+#             GuestExecStatus out-data and err-data, respectively
+#
+# Since: 8.0
+##
+ { 'enum': 'GuestExecCaptureOutputMode',
+   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
+
+##
+# @GuestExecCaptureOutput:
+#
+# Controls what guest-exec output gets captures.
+#
+# @flag: captures both stdout and stderr if true. Equivalent
+#        to GuestExecCaptureOutputMode::all. (since 2.5)
+# @mode: capture mode; preferred interface
+#
+# Since: 8.0
+##
+ { 'alternate': 'GuestExecCaptureOutput',
+   'data': { 'flag': 'bool',
+             'mode': 'GuestExecCaptureOutputMode'} }
+
 ##
 # @guest-exec:
 #
@@ -1218,7 +1249,7 @@
 ##
 { 'command': 'guest-exec',
   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
-               '*input-data': 'str', '*capture-output': 'bool' },
+               '*input-data': 'str', '*capture-output': 'GuestExecCaptureOutput' },
   'returns': 'GuestExec' }
 
 
-- 
2.25.1


