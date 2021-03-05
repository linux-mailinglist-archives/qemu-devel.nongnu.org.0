Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1F32F08D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:03:16 +0100 (CET)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDr5-0005Hl-4o
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkD-0006sg-T6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDjz-0007AB-Bq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNkuWjOrI8SckSnRLnxx+FN4aL9raBAHm2X/LISDeaE=;
 b=bbex7f/PMO/gYYtlyFfLeL+wufXkWDifji2/TqeZSzpnAvwZE9+GZ8POeL792QLKF2i4sk
 wYHk9yJeIQhAKDyNu9P5gDDlo/LgRzAqw5Z+4XOo95JjoFmHlgHAEOmXglDRAUBAEzbQhk
 /umgZM4c1bVnIHZk1MqHA1pekyrgJ1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-rJQGhuAxN6CpmPnMHuqXeQ-1; Fri, 05 Mar 2021 11:55:44 -0500
X-MC-Unique: rJQGhuAxN6CpmPnMHuqXeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C03410059D7;
 Fri,  5 Mar 2021 16:55:21 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDF460BF3;
 Fri,  5 Mar 2021 16:55:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/31] docs: show how to spawn qemu-storage-daemon with fd
 passing
Date: Fri,  5 Mar 2021 17:54:33 +0100
Message-Id: <20210305165454.356840-11-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The QMP monitor, NBD server, and vhost-user-blk export all support file
descriptor passing. This is a useful technique because it allows the
parent process to spawn and wait for qemu-storage-daemon without busy
waiting, which may delay startup due to arbitrary sleep() calls.

This Python example is inspired by the test case written for libnbd by
Richard W.M. Jones <rjones@redhat.com>:
https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1cbe07a04543

Thanks to Daniel P. Berrangé <berrange@redhat.com> for suggestions on
how to get this working. Now let's document it!

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210301172728.135331-2-stefanha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst | 42 ++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 6ce85f2f7d..5714794775 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -101,10 +101,12 @@ Standard options:
 
 .. option:: --nbd-server addr.type=inet,addr.host=<host>,addr.port=<port>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
   --nbd-server addr.type=unix,addr.path=<path>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
+  --nbd-server addr.type=fd,addr.str=<fd>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
 
   is a server for NBD exports. Both TCP and UNIX domain sockets are supported.
-  TLS encryption can be configured using ``--object`` tls-creds-* and authz-*
-  secrets (see below).
+  A listen socket can be provided via file descriptor passing (see Examples
+  below). TLS encryption can be configured using ``--object`` tls-creds-* and
+  authz-* secrets (see below).
 
   To configure an NBD server on UNIX domain socket path ``/tmp/nbd.sock``::
 
@@ -141,6 +143,42 @@ QMP commands::
       --chardev socket,path=qmp.sock,server=on,wait=off,id=char1 \
       --monitor chardev=char1
 
+Launch the daemon from Python with a QMP monitor socket using file descriptor
+passing so there is no need to busy wait for the QMP monitor to become
+available::
+
+  #!/usr/bin/env python3
+  import subprocess
+  import socket
+
+  sock_path = '/var/run/qmp.sock'
+
+  with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as listen_sock:
+      listen_sock.bind(sock_path)
+      listen_sock.listen()
+
+      fd = listen_sock.fileno()
+
+      subprocess.Popen(
+          ['qemu-storage-daemon',
+           '--chardev', f'socket,fd={fd},server=on,id=char1',
+           '--monitor', 'chardev=char1'],
+          pass_fds=[fd],
+      )
+
+  # listen_sock was automatically closed when leaving the 'with' statement
+  # body. If the daemon process terminated early then the following connect()
+  # will fail with "Connection refused" because no process has the listen
+  # socket open anymore. Launch errors can be detected this way.
+
+  qmp_sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+  qmp_sock.connect(sock_path)
+  ...QMP interaction...
+
+The same socket spawning approach also works with the ``--nbd-server
+addr.type=fd,addr.str=<fd>`` and ``--export
+type=vhost-user-blk,addr.type=fd,addr.str=<fd>`` options.
+
 Export raw image file ``disk.img`` over NBD UNIX domain socket ``nbd.sock``::
 
   $ qemu-storage-daemon \
-- 
2.29.2


