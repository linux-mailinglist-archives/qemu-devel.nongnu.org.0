Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE966F68C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVi2-0002IB-A1; Thu, 04 May 2023 05:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVhz-0002H9-OK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVhy-00070x-4f
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyuKRxaLkz1B5iAJ1LQlzYpb1bDdlxXzh5htwDQA5YI=;
 b=CcW+01sWyJE6MhuRYg5FooGpSSgltnu3LMAgH/N1FTzqlT14ElFaAy7zK3/JPH+na/NclZ
 pqmdM/bsQrTUiKO4wo/sS8i5qvb/tL6L6CRJG6bVQAVVxfdzmX5QKHpSCg65kGpOULAwBK
 /mxORgaP/RGAb7juLTgzbO6ZAD7/weY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-1dmbtRP6NIWOHWL01uxccw-1; Thu, 04 May 2023 05:57:04 -0400
X-MC-Unique: 1dmbtRP6NIWOHWL01uxccw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F7A2807D64;
 Thu,  4 May 2023 09:57:03 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.225.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18E27492C14;
 Thu,  4 May 2023 09:57:02 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] qga: Add `merged` variant to GuestExecCaptureOutputMode
Date: Thu,  4 May 2023 12:56:54 +0300
Message-Id: <20230504095657.239048-4-kkostiuk@redhat.com>
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

Currently, any captured output (via `capture-output`) is segregated into
separate GuestExecStatus fields (`out-data` and `err-data`). This means
that downstream consumers have no way to reassemble the captured data
back into the original stream.

This is relevant for chatty and semi-interactive (ie. read only) CLI
tools.  Such tools may deliberately interleave stdout and stderr for
visual effect. If segregated, the output becomes harder to visually
understand.

This commit adds a new enum variant to the GuestExecCaptureOutputMode
qapi to merge the output streams such that consumers can have a pristine
view of the original command output.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands.c       | 25 +++++++++++++++++++++++--
 qga/qapi-schema.json |  5 ++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 01f68b45ab..09c683e263 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
     g_spawn_close_pid(pid);
 }
 
-/** Reset ignored signals back to default. */
 static void guest_exec_task_setup(gpointer data)
 {
 #if !defined(G_OS_WIN32)
+    bool has_merge = *(bool *)data;
     struct sigaction sigact;
 
+    if (has_merge) {
+        /*
+         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58+, use
+         * g_spawn_async_with_fds() to be portable on windows. The current
+         * logic does not work on windows b/c `GSpawnChildSetupFunc` is run
+         * inside the parent, not the child.
+         */
+        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
+            slog("dup2() failed to merge stderr into stdout: %s",
+                 strerror(errno));
+        }
+    }
+
+    /* Reset ignored signals back to default. */
     memset(&sigact, 0, sizeof(struct sigaction));
     sigact.sa_handler = SIG_DFL;
 
@@ -409,6 +423,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = false;
+    bool has_merge = false;
     GuestExecCaptureOutputMode output_mode;
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
@@ -445,13 +460,19 @@ GuestExec *qmp_guest_exec(const char *path,
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
         has_output = true;
         break;
+#if !defined(G_OS_WIN32)
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_MERGED:
+        has_output = true;
+        has_merge = true;
+        break;
+#endif
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
         /* Silence warning; impossible branch */
         break;
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
+            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 44e44c2a5c..5a75e81be2 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1210,11 +1210,14 @@
 # @stderr: only capture stderr
 # @separated: capture both stdout and stderr, but separated into
 #             GuestExecStatus out-data and err-data, respectively
+# @merged: capture both stdout and stderr, but merge together
+#          into out-data. not effective on windows guests.
 #
 # Since: 8.0
 ##
  { 'enum': 'GuestExecCaptureOutputMode',
-   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
+   'data': [ 'none', 'stdout', 'stderr', 'separated',
+             { 'name': 'merged', 'if': { 'not': 'CONFIG_WIN32' } } ] }
 
 ##
 # @GuestExecCaptureOutput:
-- 
2.25.1


