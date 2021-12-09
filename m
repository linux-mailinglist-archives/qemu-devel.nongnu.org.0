Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C946E5C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:42:17 +0100 (CET)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFwN-0003b1-Gg
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuN-0000T6-Oo
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuL-0008GA-Am
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGKoxdnf58ewGNAWIq5i0b14y2q/0mju46wmowQjwo8=;
 b=O4NdvjxuYa14QGOXgHkxiaWTm4c2AZyUnjvMMZCCHNhq3i77jNM9JPFL0/pGlZBUsALSrj
 MWSIluw/1nIuBiBsCMMT4yEbb+Sp85SCGqkrRLwDYj4hH/a3E472ElM5/2X1J33dkRYzs0
 VxROtta3oR4qJEcyYoDRwV/j/4jAqlg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-TBHSCIKsMMC9j6zjLbOSkw-1; Thu, 09 Dec 2021 04:40:04 -0500
X-MC-Unique: TBHSCIKsMMC9j6zjLbOSkw-1
Received: by mail-ua1-f72.google.com with SMTP id
 t22-20020ab02696000000b002e970ec14a3so3317634uao.19
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGKoxdnf58ewGNAWIq5i0b14y2q/0mju46wmowQjwo8=;
 b=OKbpu9g0kLhvozniMsYWl23AKGC6kWGTcvBC9MCZNKTG4a7W5WnEuPS+NssTHRL6B+
 zql9oXZo88UzSUOy4dtV7ya6oDz8Xcsj8ltHmzJdMgoILiL9IFg3A8L77qwvQgEI7JSy
 cC/UqPpRMEABIeFAULTVCy/QEwr0rvT27b44LaEuFj2IeS9Infa48LsuvtVttx1mkXUl
 o9wavyzUMamxyJDMM1aDUpXSenazLM3kJExRt91Ey1QF2e4B7COjb7Ru0CPbOw5eYrP1
 xBseIYv6SjcvUGLz7C9t6TC8OGpgHM6YoUfAnWl3qsiVLIeLqnslk0jnFavic8/72kZ0
 zCFw==
X-Gm-Message-State: AOAM53275eBbHO5f1/R20N3k3pNlODz+b6dxzd5pUCJwvk6APbmsFE+T
 vc6wokLDszSd0vtjj9jXedN4GilByuDGbE186bfDJDzJhszkmH+ST0bgJfbyvjv3D3gnSYAvLKl
 LaO7Qo9+WI+YHwQ0=
X-Received: by 2002:ab0:4868:: with SMTP id c37mr17257396uad.33.1639042803475; 
 Thu, 09 Dec 2021 01:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0SAtZYfq/FI2DXo8uJhs/vb2TlSezgUn4SIRgJv9hKTA74Yc41VNMpqr+8XE6rZ+3epm5Hg==
X-Received: by 2002:ab0:4868:: with SMTP id c37mr17257369uad.33.1639042803258; 
 Thu, 09 Dec 2021 01:40:03 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:02 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 2/6] QIOChannelSocket: Add flags parameter for writing
Date: Thu,  9 Dec 2021 06:39:20 -0300
Message-Id: <20211209093923.1293701-3-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209093923.1293701-1-leobras@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change qio_channel_socket_writev() in order to accept flags, so its possible
to selectively make use of sendmsg() flags.

qio_channel_socket_writev() contents were moved to a helper function
qio_channel_socket_writev_flags() which accepts an extra argument for flags.
(This argument is passed directly to sendmsg().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-socket.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..b57a27bf91 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -520,12 +520,13 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
     return ret;
 }
 
-static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
-                                         const struct iovec *iov,
-                                         size_t niov,
-                                         int *fds,
-                                         size_t nfds,
-                                         Error **errp)
+static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
+                                               const struct iovec *iov,
+                                               size_t niov,
+                                               int *fds,
+                                               size_t nfds,
+                                               int flags,
+                                               Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t ret;
@@ -558,7 +559,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
 
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, flags);
     if (ret <= 0) {
         if (errno == EAGAIN) {
             return QIO_CHANNEL_ERR_BLOCK;
@@ -572,6 +573,17 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
     return ret;
 }
+
+static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
+                                         const struct iovec *iov,
+                                         size_t niov,
+                                         int *fds,
+                                         size_t nfds,
+                                         Error **errp)
+{
+    return qio_channel_socket_writev_flags(ioc, iov, niov, fds, nfds, 0, errp);
+}
+
 #else /* WIN32 */
 static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         const struct iovec *iov,
-- 
2.33.1


