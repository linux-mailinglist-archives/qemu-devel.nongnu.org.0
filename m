Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6E3152D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:31:37 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UzI-00070r-J2
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uw0-0005R4-Rw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uvx-0003rT-Ct
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDFDY261wZp/LgJ4CqOOWZztGEFUiZcwKglFLBxC7p0=;
 b=S6CF8L3glKQpwGtyeD/Iu+tRU12h4txPruMsGDhqIjYFDKLWVxZMj9l/wXyNuvRpAtRqug
 if4w19Min+levdaTWsrrKLaiQMZTd0V91vvEjv1BeaI2EBlsjD0NV++V84gF4OB2nn84pq
 ViQAv29s162s3YQljmm2SXjwGmY2VuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-lgVL6X03PwKyW4ILcWGmYA-1; Tue, 09 Feb 2021 10:28:06 -0500
X-MC-Unique: lgVL6X03PwKyW4ILcWGmYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE658107ACE6;
 Tue,  9 Feb 2021 15:28:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E59D95D730;
 Tue,  9 Feb 2021 15:28:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
Date: Tue,  9 Feb 2021 09:27:58 -0600
Message-Id: <20210209152759.209074-2-eblake@redhat.com>
In-Reply-To: <20210209152759.209074-1-eblake@redhat.com>
References: <20210209152759.209074-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com, qemu-block@nongnu.org,
 rjones@redhat.com, qemu-stable@nongnu.org, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our default of a backlog of 1 connection is rather puny; it gets in
the way when we are explicitly allowing multiple clients (such as
qemu-nbd -e N [--shared], or nbd-server-start with its default
"max-connections":0 for unlimited), but is even a problem when we
stick to qemu-nbd's default of only 1 active client but use -t
[--persistent] where a second client can start using the server once
the first finishes.  While the effects are less noticeable on TCP
sockets (since the client can poll() to learn when the server is ready
again), it is definitely observable on Unix sockets, where on Unix, a
client will fail with EAGAIN and no recourse but to sleep an arbitrary
amount of time before retrying if the server backlog is already full.

Since QMP nbd-server-start is always persistent, it now always
requests a backlog of SOMAXCONN; meanwhile, qemu-nbd will request
SOMAXCONN if persistent, otherwise its backlog should be based on the
expected number of clients.

See https://bugzilla.redhat.com/1925045 for a demonstration of where
our low backlog prevents libnbd from connecting as many parallel
clients as it wants.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
CC: qemu-stable@nongnu.org
---
 blockdev-nbd.c |  7 ++++++-
 qemu-nbd.c     | 10 +++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index d8443d235b73..b264620b98d8 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -134,7 +134,12 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
     qio_net_listener_set_name(nbd_server->listener,
                               "nbd-listener");

-    if (qio_net_listener_open_sync(nbd_server->listener, addr, 1, errp) < 0) {
+    /*
+     * Because this server is persistent, a backlog of SOMAXCONN is
+     * better than trying to size it to max_connections.
+     */
+    if (qio_net_listener_open_sync(nbd_server->listener, addr, SOMAXCONN,
+                                   errp) < 0) {
         goto error;
     }

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 608c63e82a25..1a340ea4858d 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -964,8 +964,16 @@ int main(int argc, char **argv)

     server = qio_net_listener_new();
     if (socket_activation == 0) {
+        int backlog;
+
+        if (persistent) {
+            backlog = SOMAXCONN;
+        } else {
+            backlog = MIN(shared, SOMAXCONN);
+        }
         saddr = nbd_build_socket_address(sockpath, bindto, port);
-        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
+        if (qio_net_listener_open_sync(server, saddr, backlog,
+                                       &local_err) < 0) {
             object_unref(OBJECT(server));
             error_report_err(local_err);
             exit(EXIT_FAILURE);
-- 
2.30.0


