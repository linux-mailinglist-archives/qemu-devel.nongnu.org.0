Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23037AF54
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:30:04 +0200 (CEST)
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgY4x-0001p4-Rn
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgY3H-0007y3-4A
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgY3F-0000hg-9X
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620761296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTD0kmZoerFXgqG0MHWGgVEGzIhqMHypAWGpGBgDxv4=;
 b=aikbEhxEXEAFxC2g0Wm3Cd2v1uvOV33E5IzM/fCIAVlUaeqdrV/VeC4R3NkzV311FVwhGj
 Owcau3PIzKae+zG4/f/BUgZj97uCg+b+uglA6mrN52aS4wL+2voS0EMetzgdDOyTlcyhL5
 MZzMhdAFQYheB0gxH9Q5TPDyUWRLvDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-8EjBPGNMMDGnjdmozPbLCg-1; Tue, 11 May 2021 15:28:12 -0400
X-MC-Unique: 8EjBPGNMMDGnjdmozPbLCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3FAB81870C;
 Tue, 11 May 2021 19:28:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9559F5D9D7;
 Tue, 11 May 2021 19:28:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Date: Tue, 11 May 2021 14:28:02 -0500
Message-Id: <20210511192802.552706-2-eblake@redhat.com>
In-Reply-To: <20210511192802.552706-1-eblake@redhat.com>
References: <20210511192802.552706-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-stable@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

socket_get_fd() fails with the error "socket_get_fd: too many
connections" if the given listen backlog value is not 1.

Not all callers set the backlog to 1. For example, commit
582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
socket listen() backlog") uses SOMAXCONN. This will always fail with in
socket_get_fd().

This patch calls listen(2) on the fd to update the backlog value. The
socket may already be in the listen state. I have tested that this works
on Linux 5.10 and macOS Catalina.

As a bonus this allows us to detect when the fd cannot listen. Now we'll
be able to catch unbound or connected fds in socket_listen().

Drop the num argument from socket_get_fd() since this function is also
called by socket_connect() where a listen backlog value does not make
sense.

Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210310173004.420190-1-stefanha@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15c6..2463c49773ea 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1116,14 +1116,10 @@ fail:
     return NULL;
 }

-static int socket_get_fd(const char *fdstr, int num, Error **errp)
+static int socket_get_fd(const char *fdstr, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
     int fd;
-    if (num != 1) {
-        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
-        return -1;
-    }
     if (cur_mon) {
         fd = monitor_get_fd(cur_mon, fdstr, errp);
         if (fd < 0) {
@@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
         break;

     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, 1, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
         break;

     case SOCKET_ADDRESS_TYPE_VSOCK:
@@ -1187,7 +1183,26 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
         break;

     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, num, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
+        if (fd < 0) {
+            return -1;
+        }
+
+        /*
+         * If the socket is not yet in the listen state, then transition it to
+         * the listen state now.
+         *
+         * If it's already listening then this updates the backlog value as
+         * requested.
+         *
+         * If this socket cannot listen because it's already in another state
+         * (e.g. unbound or connected) then we'll catch the error here.
+         */
+        if (listen(fd, num) != 0) {
+            error_setg_errno(errp, errno, "Failed to listen on fd socket");
+            closesocket(fd);
+            return -1;
+        }
         break;

     case SOCKET_ADDRESS_TYPE_VSOCK:
-- 
2.31.1


