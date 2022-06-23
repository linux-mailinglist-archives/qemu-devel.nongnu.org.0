Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684F55770B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:47:38 +0200 (CEST)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JR3-000065-CN
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8U-0008Pb-RV
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8S-0004s2-A0
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdC8wzK3qRlsTGe76YoR1juFzydDpgy+3C0yW+4L/1Q=;
 b=QYgKPyrNDbPeOkzjq479rTBVKq9lKfaFUV1O8E/lGXrtxIqQ1r1E4bICgAuv+0zx68dTx7
 xthCXgikfqK1rFWqY9StP0ceq+eJ9DCgPZTXTA7EEv1Abl9y5VUfRGPCPwVQy03FqWvEsm
 PlMpWdQeZ78jEd8AoO5QDd40HxYW9+Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-mCl5eQ41Oy6anyb72Kxe4Q-1; Thu, 23 Jun 2022 05:28:19 -0400
X-MC-Unique: mCl5eQ41Oy6anyb72Kxe4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93FD729ABA07;
 Thu, 23 Jun 2022 09:28:18 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9866140C1289;
 Thu, 23 Jun 2022 09:28:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 02/33] QIOChannelSocket: Introduce assert and reduce ifdefs to
 improve readability
Date: Thu, 23 Jun 2022 10:27:39 +0100
Message-Id: <20220623092810.96234-3-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Bras <leobras@redhat.com>

During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
introduced, particularly at qio_channel_socket_writev().

Rewrite some of those changes so it's easier to read.

Also, introduce an assert to help detect incorrect zero-copy usage is when
it's disabled on build.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fixed up thinko'd g_assert_unreachable->g_assert_not_reached
---
 io/channel-socket.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..b8c13dba7c 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -578,11 +578,17 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
-#ifdef QEMU_MSG_ZEROCOPY
     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+#ifdef QEMU_MSG_ZEROCOPY
         sflags = MSG_ZEROCOPY;
-    }
+#else
+        /*
+         * We expect QIOChannel class entry point to have
+         * blocked this code path already
+         */
+        g_assert_not_reached();
 #endif
+    }
 
  retry:
     ret = sendmsg(sioc->fd, &msg, sflags);
@@ -592,15 +598,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
             return QIO_CHANNEL_ERR_BLOCK;
         case EINTR:
             goto retry;
-#ifdef QEMU_MSG_ZEROCOPY
         case ENOBUFS:
-            if (sflags & MSG_ZEROCOPY) {
+            if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
                 error_setg_errno(errp, errno,
                                  "Process can't lock enough memory for using MSG_ZEROCOPY");
                 return -1;
             }
             break;
-#endif
         }
 
         error_setg_errno(errp, errno,
-- 
2.36.1


