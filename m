Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD0F508ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:36:07 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBR8-0001wl-8K
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAQA-0002mc-Ja
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAQ6-0005Oq-GP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/pfVqGOjDOunbShKjaH8ND9nAkMyydNHcgPEduJBDs=;
 b=N1QbfMj9WPauUa3b7agRD0PvuxEQ+uaozPhSoAS5b5xvltFvrsThnmHoyiQu7zTawVt/5J
 i+s3FpMwC9DRwc9Gw00lszCGSOLlkfoyavLzkmiw0vJaN6pd8lFQw43ulfuHjY9T9J9q4C
 zLkmKVIs7/DVfC0dDzaMFX8xcBIk+BE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-NzOnvoGNPX29p-yOxBMoTw-1; Wed, 20 Apr 2022 09:30:51 -0400
X-MC-Unique: NzOnvoGNPX29p-yOxBMoTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 611E18002BF;
 Wed, 20 Apr 2022 13:30:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4F87145BA57;
 Wed, 20 Apr 2022 13:30:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 39/41] qga: remove need for QEMU atomic.h
Date: Wed, 20 Apr 2022 17:26:22 +0400
Message-Id: <20220420132624.2439741-40-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the introduction of guest-exec in/out/err redirections in commit
a1853dca74 ("qga: guest-exec simple stdin/stdout/stderr redirection"),
some execution state variables are handled with atomic ops. However,
there are no threads involved in this code (and glib sources are
dispatched in the same thread), and no other obvious reason to use them.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 690da0073d6e..7ff551d092a1 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -18,7 +18,6 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
-#include "qemu/atomic.h"
 #include "commands-common.h"
 
 /* Maximum captured guest-exec out_data/err_data - 16MB */
@@ -162,13 +161,12 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
 
     ges = g_new0(GuestExecStatus, 1);
 
-    bool finished = qatomic_mb_read(&gei->finished);
+    bool finished = gei->finished;
 
     /* need to wait till output channels are closed
      * to be sure we captured all output at this point */
     if (gei->has_output) {
-        finished = finished && qatomic_mb_read(&gei->out.closed);
-        finished = finished && qatomic_mb_read(&gei->err.closed);
+        finished &= gei->out.closed && gei->err.closed;
     }
 
     ges->exited = finished;
@@ -270,7 +268,7 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
             (int32_t)gpid_to_int64(pid), (uint32_t)status);
 
     gei->status = status;
-    qatomic_mb_set(&gei->finished, true);
+    gei->finished = true;
 
     g_spawn_close_pid(pid);
 }
@@ -326,7 +324,7 @@ static gboolean guest_exec_input_watch(GIOChannel *ch,
 done:
     g_io_channel_shutdown(ch, true, NULL);
     g_io_channel_unref(ch);
-    qatomic_mb_set(&p->closed, true);
+    p->closed = true;
     g_free(p->data);
 
     return false;
@@ -380,7 +378,7 @@ static gboolean guest_exec_output_watch(GIOChannel *ch,
 close:
     g_io_channel_shutdown(ch, true, NULL);
     g_io_channel_unref(ch);
-    qatomic_mb_set(&p->closed, true);
+    p->closed = true;
     return false;
 }
 
-- 
2.35.1.693.g805e0a68082a


