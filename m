Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55869E0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:51:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS56-0005tX-BA; Tue, 21 Feb 2023 07:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4h-0005K9-1O
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4f-0007wR-G7
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfeScznHotqd7QR6Mu/sr37TdIAE+QzDflLW+7MhA3U=;
 b=ER/wfsFSUADzNRyHMdVRz9iQzOBd1eurSbODy9AFZfITCwP8vPh+NWUXRt6ejG3/QCJRTb
 G1pkBQOtsTZzC1S+eYXAjBg9NeQyn7qqDge1UZAFAn/5/DeCZ7NIwGw9wCnt/emoqSbgJv
 Haczxp90b6zlHqqN+VKlzFbpuGMMKqk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-psYO9uhvP_iF7hf2FexAHQ-1; Tue, 21 Feb 2023 07:48:45 -0500
X-MC-Unique: psYO9uhvP_iF7hf2FexAHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0AAF2A59541;
 Tue, 21 Feb 2023 12:48:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F24B2026D38;
 Tue, 21 Feb 2023 12:48:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 09/16] aio/win32: aio_set_fd_handler() only supports SOCKET
Date: Tue, 21 Feb 2023 16:47:54 +0400
Message-Id: <20230221124802.4103554-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's check if the argument is actually a SOCKET, else report an error
and return.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/aio-win32.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 74d63fa21e..08e8f5615d 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -22,6 +22,7 @@
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "qemu/rcu_queue.h"
+#include "qemu/error-report.h"
 
 struct AioHandler {
     EventNotifier *e;
@@ -70,10 +71,14 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_poll_ready,
                         void *opaque)
 {
-    /* fd is a SOCKET in our case */
     AioHandler *old_node;
     AioHandler *node = NULL;
 
+    if (!fd_is_socket(fd)) {
+        error_report("fd=%d is not a socket, AIO implementation is missing", fd);
+        return;
+    }
+
     qemu_lockcnt_lock(&ctx->list_lock);
     QLIST_FOREACH(old_node, &ctx->aio_handlers, node) {
         if (old_node->pfd.fd == fd && !old_node->deleted) {
-- 
2.39.2


