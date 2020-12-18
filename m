Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359582DE29B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:16:40 +0100 (CET)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEgZ-0007CS-7D
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb6-0001hd-JC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb2-0001cI-Nd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/b18CKbvndxJjxomILQZwK1m781skeruMSUzJF/HYQ=;
 b=HQbIPADybCTgttJ/aMy1Ak7F4vLSzAJNrn3YEeGrpBWMUwEIazEI6sSjQNX8V7/MyBAuYA
 1RNOILNoSssUbEf7oTjGudFSYVQP2VUwrdal4o7vIh46azvvpRCA9Exq2aAebWtp+nVgms
 QULO1jRI5xc+qCdEv49098GlUaFCUQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ELgbNRBeMvuz2mu-0KKfFw-1; Fri, 18 Dec 2020 07:10:54 -0500
X-MC-Unique: ELgbNRBeMvuz2mu-0KKfFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC391005504;
 Fri, 18 Dec 2020 12:10:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C1F60C15;
 Fri, 18 Dec 2020 12:10:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/17] docs: add qemu-storage-daemon(1) man page
Date: Fri, 18 Dec 2020 13:10:29 +0100
Message-Id: <20201218121041.299788-6-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Document the qemu-storage-daemon tool. Most of the command-line options
are identical to their QEMU counterparts. Perhaps Sphinx hxtool
integration could be extended to extract documentation for individual
command-line options so they can be shared. For now the
qemu-storage-daemon simply refers to the qemu(1) man page where the
command-line options are identical.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201209103802.350848-3-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/conf.py                 |   2 +
 docs/tools/index.rst               |   1 +
 docs/tools/qemu-storage-daemon.rst | 148 +++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 docs/tools/qemu-storage-daemon.rst

diff --git a/docs/tools/conf.py b/docs/tools/conf.py
index 4760d36ff2..7072d99324 100644
--- a/docs/tools/conf.py
+++ b/docs/tools/conf.py
@@ -20,6 +20,8 @@ html_theme_options['description'] = \
 man_pages = [
     ('qemu-img', 'qemu-img', u'QEMU disk image utility',
      ['Fabrice Bellard'], 1),
+    ('qemu-storage-daemon', 'qemu-storage-daemon', u'QEMU storage daemon',
+     [], 1),
     ('qemu-nbd', 'qemu-nbd', u'QEMU Disk Network Block Device Server',
      ['Anthony Liguori <anthony@codemonkey.ws>'], 8),
     ('qemu-pr-helper', 'qemu-pr-helper', 'QEMU persistent reservation helper',
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index b99f86c7c6..3a5829c17a 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -11,6 +11,7 @@ Contents:
    :maxdepth: 2
 
    qemu-img
+   qemu-storage-daemon
    qemu-nbd
    qemu-pr-helper
    qemu-trace-stap
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
new file mode 100644
index 0000000000..f63627eaf6
--- /dev/null
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -0,0 +1,148 @@
+QEMU Storage Daemon
+===================
+
+Synopsis
+--------
+
+**qemu-storage-daemon** [options]
+
+Description
+-----------
+
+qemu-storage-daemon provides disk image functionality from QEMU, qemu-img, and
+qemu-nbd in a long-running process controlled via QMP commands without running
+a virtual machine. It can export disk images, run block job operations, and
+perform other disk-related operations. The daemon is controlled via a QMP
+monitor and initial configuration from the command-line.
+
+The daemon offers the following subset of QEMU features:
+
+* Block nodes
+* Block jobs
+* Block exports
+* Throttle groups
+* Character devices
+* Crypto and secrets
+* QMP
+* IOThreads
+
+Commands can be sent over a QEMU Monitor Protocol (QMP) connection. See the
+:manpage:`qemu-storage-daemon-qmp-ref(7)` manual page for a description of the
+commands.
+
+The daemon runs until it is stopped using the ``quit`` QMP command or
+SIGINT/SIGHUP/SIGTERM.
+
+**Warning:** Never modify images in use by a running virtual machine or any
+other process; this may destroy the image. Also, be aware that querying an
+image that is being modified by another process may encounter inconsistent
+state.
+
+Options
+-------
+
+.. program:: qemu-storage-daemon
+
+Standard options:
+
+.. option:: -h, --help
+
+  Display help and exit
+
+.. option:: -V, --version
+
+  Display version information and exit
+
+.. option:: -T, --trace [[enable=]PATTERN][,events=FILE][,file=FILE]
+
+  .. include:: ../qemu-option-trace.rst.inc
+
+.. option:: --blockdev BLOCKDEVDEF
+
+  is a block node definition. See the :manpage:`qemu(1)` manual page for a
+  description of block node properties and the :manpage:`qemu-block-drivers(7)`
+  manual page for a description of driver-specific parameters.
+
+.. option:: --chardev CHARDEVDEF
+
+  is a character device definition. See the :manpage:`qemu(1)` manual page for
+  a description of character device properties. A common character device
+  definition configures a UNIX domain socket::
+
+  --chardev socket,id=char1,path=/tmp/qmp.sock,server,nowait
+
+.. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
+  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
+  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
+
+  is a block export definition. ``node-name`` is the block node that should be
+  exported. ``writable`` determines whether or not the export allows write
+  requests for modifying data (the default is off).
+
+  The ``nbd`` export type requires ``--nbd-server`` (see below). ``name`` is
+  the NBD export name. ``bitmap`` is the name of a dirty bitmap reachable from
+  the block node, so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
+  metadata context name "qemu:dirty-bitmap:BITMAP" to inspect the bitmap.
+
+  The ``vhost-user-blk`` export type takes a vhost-user socket address on which
+  it accept incoming connections. Both
+  ``addr.type=unix,addr.path=<socket-path>`` for UNIX domain sockets and
+  ``addr.type=fd,addr.str=<fd>`` for file descriptor passing are supported.
+  ``logical-block-size`` sets the logical block size in bytes (the default is
+  512). ``num-queues`` sets the number of virtqueues (the default is 1).
+
+.. option:: --monitor MONITORDEF
+
+  is a QMP monitor definition. See the :manpage:`qemu(1)` manual page for
+  a description of QMP monitor properties. A common QMP monitor definition
+  configures a monitor on character device ``char1``::
+
+  --monitor chardev=char1
+
+.. option:: --nbd-server addr.type=inet,addr.host=<host>,addr.port=<port>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
+  --nbd-server addr.type=unix,addr.path=<path>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
+
+  is a server for NBD exports. Both TCP and UNIX domain sockets are supported.
+  TLS encryption can be configured using ``--object`` tls-creds-* and authz-*
+  secrets (see below).
+
+  To configure an NBD server on UNIX domain socket path ``/tmp/nbd.sock``::
+
+  --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock
+
+.. option:: --object help
+  --object <type>,help
+  --object <type>[,<property>=<value>...]
+
+  is a QEMU user creatable object definition. List object types with ``help``.
+  List object properties with ``<type>,help``. See the :manpage:`qemu(1)`
+  manual page for a description of the object properties.
+
+Examples
+--------
+Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
+QMP commands::
+
+  $ qemu-storage-daemon \
+      --chardev socket,path=qmp.sock,server,nowait,id=char1 \
+      --monitor chardev=char1
+
+Export raw image file ``disk.img`` over NBD UNIX domain socket ``nbd.sock``::
+
+  $ qemu-storage-daemon \
+      --blockdev driver=file,node-name=disk,filename=disk.img \
+      --nbd-server addr.type=unix,addr.path=nbd.sock \
+      --export type=nbd,id=export,node-name=disk,writable=on
+
+Export a qcow2 image file ``disk.qcow2`` as a vhosts-user-blk device over UNIX
+domain socket ``vhost-user-blk.sock``::
+
+  $ qemu-storage-daemon \
+      --blockdev driver=file,node-name=file,filename=disk.qcow2 \
+      --blockdev driver=qcow2,node-name=qcow2,file=file \
+      --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=vhost-user-blk.sock,node-name=qcow2
+
+See also
+--------
+
+:manpage:`qemu(1)`, :manpage:`qemu-block-drivers(7)`, :manpage:`qemu-storage-daemon-qmp-ref(7)`
-- 
2.29.2


