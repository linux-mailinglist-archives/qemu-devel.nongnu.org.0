Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBED5522B1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:21:17 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3L5Q-000727-Lv
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3L4N-0006Et-SY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3L4J-0004yZ-E7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655745605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8MM1F5zljeRQ+U3Ch5TrTv0K0ZyJWMJAdFueDvu5fqA=;
 b=ayACnVc8ORvWkn+CgNcm7z6E3HZF++lol3pfnQqGM2ikwki/SAt/SfY+30c2DLZRLi8Tml
 iLs/UOXfLfROYMxGm4aB0YA/IVRO8pi7QDKQMHTwxzB3N83p1snkgQOWVbMX1pjjBMBucV
 1Xh57Vy3tSF3BMaqhBlhUr/hT7rR98M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-N4bk5embOgKGAp6I3jU4dg-1; Mon, 20 Jun 2022 13:20:04 -0400
X-MC-Unique: N4bk5embOgKGAp6I3jU4dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8EC085A581
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 17:20:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77CA91121314;
 Mon, 20 Jun 2022 17:20:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: libvir-list@redhat.com
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [libvirt PATCH v2] tools: add virt-qmp-proxy for proxying QMP clients
 to libvirt QEMU guests
Date: Mon, 20 Jun 2022 18:19:50 +0100
Message-Id: <20220620171950.1416742-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

Libvirt provides QMP passthrough APIs for the QEMU driver and these are
exposed in virsh. It is not especially pleasant, however, using the raw
QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
exposes a human friendly interactive shell. It is not possible to use
this with libvirt managed guest, however, since only one client can
attach to he QMP socket at any point in time.

The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
socket and listens for incoming client connections, speaking QMP on
the connected socket. It will forward any QMP commands received onto
the running libvirt QEMU guest, and forward any replies back to the
QMP client.

  $ virsh start demo
  $ virt-qmp-proxy demo demo.qmp &
  $ qmp-shell demo.qmp
  Welcome to the QMP low-level shell!
  Connected to QEMU 6.2.0

  (QEMU) query-kvm
  {
      "return": {
          "enabled": true,
          "present": true
      }
  }

Note this tool of course has the same risks as the raw libvirt
QMP passthrough. It is safe to run query commands to fetch information
but commands which change the QEMU state risk disrupting libvirt's
management of QEMU, potentially resulting in data loss/corruption in
the worst case.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

Changed in v2:

 - Rewrote to not be such a gross hack, specifically
      - Wired up usage of libvirt event loop for sock I/O
      - Register with libvirt for QMP events
      - Incrementally read from socket & try json parsing
        until we get a full command, instead of assuming
        a full command in one read
      - Forwarding of passed FDs in both directions
        (libvirt -> client untested, since AFAIK, no
        QMP cmd returns FDs currently)


Other thought....

This patch is against libvirt.git but has a dependancy on the
libvirt-python.git APIs. If we put this in libvirt-client RPM
then we get a new dep on python.

Perhaps better to have this live in libvirt-python.git/examples,
though I would like it present as a standard tool ? Another
option is to bundle with virt-install which is a python app
commonly present on virt hosts ?

 docs/manpages/meson.build        |   1 +
 docs/manpages/virt-qmp-proxy.rst | 120 +++++++++++
 tools/meson.build                |   5 +
 tools/virt-qmp-proxy             | 360 +++++++++++++++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 docs/manpages/virt-qmp-proxy.rst
 create mode 100755 tools/virt-qmp-proxy

diff --git a/docs/manpages/meson.build b/docs/manpages/meson.build
index ba673cf472..4162a9969a 100644
--- a/docs/manpages/meson.build
+++ b/docs/manpages/meson.build
@@ -18,6 +18,7 @@ docs_man_files = [
   { 'name': 'virt-pki-query-dn', 'section': '1', 'install': true },
   { 'name': 'virt-pki-validate', 'section': '1', 'install': true },
   { 'name': 'virt-qemu-run', 'section': '1', 'install': conf.has('WITH_QEMU') },
+  { 'name': 'virt-qmp-proxy', 'section': '1', 'install': conf.has('WITH_QEMU') },
   { 'name': 'virt-xml-validate', 'section': '1', 'install': true },
 
   { 'name': 'libvirt-guests', 'section': '8', 'install': conf.has('WITH_LIBVIRTD') },
diff --git a/docs/manpages/virt-qmp-proxy.rst b/docs/manpages/virt-qmp-proxy.rst
new file mode 100644
index 0000000000..30b9f6699d
--- /dev/null
+++ b/docs/manpages/virt-qmp-proxy.rst
@@ -0,0 +1,120 @@
+==============
+virt-qmp-proxy
+==============
+
+--------------------------------------------------
+Expose a QMP proxy server for a libvirt QEMU guest
+--------------------------------------------------
+
+:Manual section: 1
+:Manual group: Virtualization Support
+
+.. contents::
+
+
+SYNOPSIS
+========
+
+``virt-qmp-proxy`` [*OPTION*]... *DOMAIN* *QMP-SOCKET-PATH*
+
+
+DESCRIPTION
+===========
+
+This tool provides a way to expose a QMP proxy server that communicates
+with a QEMU guest managed by libvirt. This enables standard QMP client
+tools to interact with libvirt managed guests.
+
+**NOTE: use of this tool will result in the running QEMU guest being
+marked as tainted.** It is strongly recommended that this tool *only be
+used to send commands which query information* about the running guest.
+If this tool is used to make changes to the state of the guest, this
+may have negative interactions with the QEMU driver, resulting in an
+inability to manage the guest operation thereafter, and in the worst
+case **potentially lead to data loss or corruption**.
+
+The ``virt-qmp-proxy`` program will listen on a UNIX socket for incoming
+client connections, and run the QMP protocol over the connection. Any
+commands received will be sent to the running libvirt guest, and replies
+sent back.
+
+The ``virt-qemu-proxy`` program may be interrupted (eg Ctrl-C) when it
+is no longer required. The libvirt QEMU guest will continue running.
+
+
+OPTIONS
+=======
+
+*DOMAIN*
+
+The ID or UUID or Name of the libvirt QEMU guest.
+
+*QMP-SOCKET-PATH*
+
+The filesystem path at which to run the QMP server, listening for
+incoming connections.
+
+``-c`` *CONNECTION-URI*
+``--connect``\ =\ *CONNECTION-URI*
+
+The URI for the connection to the libvirt QEMU driver. If omitted,
+a URI will be auto-detected.
+
+``-v``, ``--verbose``
+
+Run in verbose mode, printing all QMP commands and replies that
+are handled.
+
+``-h``, ``--help``
+
+Display the command line help.
+
+
+EXIT STATUS
+===========
+
+Upon successful shutdown, an exit status of 0 will be set. Upon
+failure a non-zero status will be set.
+
+
+AUTHOR
+======
+
+Daniel P. Berrangé
+
+
+BUGS
+====
+
+Please report all bugs you discover.  This should be done via either:
+
+#. the mailing list
+
+   `https://libvirt.org/contact.html <https://libvirt.org/contact.html>`_
+
+#. the bug tracker
+
+   `https://libvirt.org/bugs.html <https://libvirt.org/bugs.html>`_
+
+Alternatively, you may report bugs to your software distributor / vendor.
+
+COPYRIGHT
+=========
+
+Copyright (C) 2022 by Red Hat, Inc.
+
+
+LICENSE
+=======
+
+``virt-qemu-proxy`` is distributed under the terms of the GNU LGPL v2+.
+This is free software; see the source for copying conditions. There
+is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
+PURPOSE
+
+
+SEE ALSO
+========
+
+virsh(1), `https://libvirt.org/ <https://libvirt.org/>`_,
+`QMP reference <https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html>`_
diff --git a/tools/meson.build b/tools/meson.build
index bb28a904dc..4e959ecf0b 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -320,6 +320,11 @@ if conf.has('WITH_LIBVIRTD')
   endif
 endif
 
+if conf.has('WITH_QEMU')
+    install_data('virt-qmp-proxy',
+                 install_dir: bindir)
+endif
+
 if bash_completion_dep.found()
   subdir('bash-completion')
 endif
diff --git a/tools/virt-qmp-proxy b/tools/virt-qmp-proxy
new file mode 100755
index 0000000000..d85342bd2b
--- /dev/null
+++ b/tools/virt-qmp-proxy
@@ -0,0 +1,360 @@
+#!/usr/bin/env python3
+
+import argparse
+import array
+import libvirt
+import libvirt_qemu
+import os
+import re
+import socket
+import sys
+import traceback
+import json
+import fcntl
+
+
+debug = False
+
+def get_domain(uri, domstr):
+    conn = libvirt.open(uri)
+
+    dom = None
+    saveex = None
+
+    def try_lookup(cb):
+        try:
+            return cb()
+        except libvirt.libvirtError as ex:
+            nonlocal saveex
+            if saveex is None:
+                saveex = ex
+
+    if re.match(r'^\d+$', domstr):
+        dom = try_lookup(lambda: conn.lookupByID(int(domstr)))
+
+    if dom is None and re.match(r'^[-a-f0-9]{36}|[a-f0-9]{32}$', domstr):
+        dom = try_lookup(lambda: conn.lookupByUUIDString(domstr))
+
+    if dom is None:
+        dom = try_lookup(lambda: conn.lookupByName(domstr))
+
+    if dom is None:
+        raise saveex
+
+    if not dom.isActive():
+        raise Exception("Domain must be running to use QMP")
+
+    return conn, dom
+
+
+class QMPProxy(object):
+
+    def __init__(self, conn, dom, serversock, verbose):
+        self.conn = conn
+        self.dom = dom
+        self.verbose = verbose
+
+        self.serversock = serversock
+        self.serverwatch = 0
+
+        self.clientsock = None
+        self.clientwatch = 0
+
+        self.api2sock = bytes([])
+        self.api2sockfds = []
+
+        self.sock2api = bytes([])
+        self.sock2apifds = []
+
+        self.serverwatch = libvirt.virEventAddHandle(
+            self.serversock.fileno(), libvirt.VIR_EVENT_HANDLE_READABLE,
+            self.handle_server_io, self)
+
+        libvirt_qemu.qemuMonitorEventRegister(self.conn, self.dom,
+                                              None,
+                                              self.handle_qmp_event,
+                                              self)
+
+
+    @staticmethod
+    def handle_qmp_event(conn, dom, event, secs, usecs, details, self):
+        evdoc = {
+            "event": event,
+            "timestamp": {"seconds": secs, "microseconds": usecs }
+        }
+        if details is not None:
+            evdoc["data"] = details
+
+        ev = json.dumps(evdoc)
+        if self.verbose:
+            print(ev)
+        ev += "\r\n"
+        self.api2sock += ev.encode("utf-8")
+        self.update_client_events()
+
+
+    def recv_with_fds(self):
+        # Match VIR_NET_MESSAGE_NUM_FDS_MAX in virnetprotocol.x
+        maxfds = 32
+        fds = array.array('i')
+        cmsgdatalen = socket.CMSG_LEN(maxfds * fds.itemsize)
+
+        data, cmsgdata, flags, addr = self.clientsock.recvmsg(1024,
+                                                              cmsgdatalen)
+        for cmsg_level, cmsg_type, cmsg_data in cmsgdata:
+            if (cmsg_level == socket.SOL_SOCKET and
+                cmsg_type == socket.SCM_RIGHTS):
+                fds.frombytes(cmsg_data[:len(cmsg_data) -
+                                         (len(cmsg_data) % fds.itemsize)])
+            else:
+                raise Exception("Unexpected CMSGDATA level %d type %d" % (
+                    cmsg_level, cmsg_type))
+
+        return data, [self.make_file(fd) for fd in fds]
+
+
+    def send_with_fds(self, data, fds):
+        cfds = [fd.fileno() for fd in fds]
+
+        cmsgdata = [(socket.SOL_SOCKET, socket.SCM_RIGHTS,
+                     array.array("i", cfds))]
+
+        return self.clientsock.sendmsg([data], cmsgdata)
+
+
+    @staticmethod
+    def make_file(fd):
+        flags = fcntl.fcntl(fd, fcntl.F_GETFL)
+
+        mask = os.O_RDONLY | os.O_WRONLY | os.O_RDWR | os.O_APPEND
+        flags = flags & mask
+        mode = ""
+        if flags == os.O_RDONLY:
+            mode = "rb"
+        elif flags == os.O_WRONLY:
+            mode = "wb"
+        elif flags == os.O_RDWR:
+            mode = "r+b"
+        elif flags == (os.O_WRONLY | os.O_APPEND):
+            mode = "ab"
+        elif flags == (os.O_RDWR | os.O_APPEND):
+            mode = "a+b"
+
+        return os.fdopen(fd, mode)
+
+
+    def add_client(self, sock):
+        ver = self.conn.getVersion()
+        major = int(ver / 1000000) % 1000
+        minor = int(ver / 1000) % 1000
+        micro = ver % 1000
+
+        greetingobj = {
+            "QMP": {
+                "version": {
+                    "qemu": {
+                        "major": major,
+                        "minor": minor,
+                        "micro": micro,
+                    },
+                    "package": f"qemu-{major}.{minor}.{micro}",
+                },
+                "capabilities": [
+                    "oob"
+                ],
+            }
+        }
+        greeting = json.dumps(greetingobj)
+        if self.verbose:
+            print(greeting)
+        greeting += "\r\n"
+
+        self.clientsock = sock
+        self.clientwatch = libvirt.virEventAddHandle(
+            self.clientsock.fileno(), libvirt.VIR_EVENT_HANDLE_WRITABLE,
+            self.handle_client_io, self)
+        self.api2sock += greeting.encode("utf-8")
+        self.update_server_events()
+
+
+    def remove_client(self):
+        libvirt.virEventRemoveHandle(self.clientwatch)
+        self.clientsock.close()
+        self.clientsock = None
+        self.clientwatch = 0
+        self.update_server_events()
+
+        self.api2sock = bytes([])
+        self.api2sockfds = []
+
+        self.sock2api = bytes([])
+        self.sock2apifds = []
+
+
+    def update_client_events(self):
+        # For simplicity of tracking distinct QMP cmds and their passed FDs
+        # we don't try to support "pipelining", only a single cmd may be
+        # inflight
+        if len(self.api2sock) > 0:
+            events = libvirt.VIR_EVENT_HANDLE_WRITABLE
+        else:
+            events = libvirt.VIR_EVENT_HANDLE_READABLE
+
+        libvirt.virEventUpdateHandle(self.clientwatch, events)
+
+
+    def update_server_events(self):
+        if self.clientsock is not None:
+            libvirt.virEventUpdateHandle(self.serverwatch, 0)
+        else:
+            libvirt.virEventUpdateHandle(self.serverwatch,
+                                         libvirt.VIR_EVENT_HANDLE_READABLE)
+
+
+    def try_command(self):
+        try:
+            cmdstr = self.sock2api.decode("utf-8")
+            cmd = json.loads(cmdstr)
+
+            if self.verbose:
+                cmdstr = cmdstr.strip()
+                print(cmdstr)
+        except Exception as ex:
+            if debug:
+                print("Incomplete %s: %s" % ( self.sock2api, ex))
+            return
+
+        id = None
+        if "id" in cmd:
+            id = cmd["id"]
+            del cmd["id"]
+
+        if cmd.get("execute", "") == "qmp_capabilities":
+            resobj = {
+                "return": {},
+            }
+            resfds = []
+        else:
+            if hasattr(libvirt_qemu, "qemuMonitorCommandWithFiles"):
+                res, resfds = libvirt_qemu.qemuMonitorCommandWithFiles(
+                    self.dom, json.dumps(cmd), [f.fileno() for f in self.sock2apifds])
+                resobj = json.loads(res)
+            else:
+                if len(self.sock2apifds) > 0:
+                    raise Exception("FD passing not supported")
+                res = libvirt_qemu.qemuMonitorCommand(
+                    self.dom, json.dumps(cmd))
+                resfds = []
+                resobj = json.loads(res)
+
+        if "id" in resobj:
+            del resobj["id"]
+        if id is not None:
+            resobj["id"] = id
+
+        res = json.dumps(resobj)
+        if self.verbose:
+            print(res)
+        res += "\r\n"
+
+        self.sock2api = bytes([])
+        self.sock2apifds = []
+        self.api2sock += res.encode("utf-8")
+        self.api2sockfds = resfds
+
+
+    @staticmethod
+    def handle_client_io(watch, fd, events, self):
+        error = False
+        try:
+            if events & libvirt.VIR_EVENT_HANDLE_WRITABLE:
+                done = self.send_with_fds(self.api2sock, self.api2sockfds)
+                if done > 0:
+                    self.api2sock = self.api2sock[done:]
+                    self.api2sockfds = []
+            elif events & libvirt.VIR_EVENT_HANDLE_READABLE:
+                data, fds = self.recv_with_fds()
+                if len(data) == 0:
+                    error = True
+                else:
+                    self.sock2api += data
+                    if len(fds):
+                        self.sock2apifds += fds
+
+                    self.try_command()
+            else:
+                error = True
+        except Exception as e:
+            global debug
+            if debug:
+                print("%s: %s" % (sys.argv[0], str(e)))
+                print(traceback.format_exc())
+            error = True
+
+        if error:
+            self.remove_client()
+        else:
+            self.update_client_events()
+
+
+    @staticmethod
+    def handle_server_io(watch, fd, events, self):
+        if self.clientsock is None:
+            sock, addr = self.serversock.accept()
+            self.add_client(sock)
+        else:
+            self.update_server_events()
+
+
+def parse_commandline():
+    parser = argparse.ArgumentParser(description="Libvirt QMP proxy")
+    parser.add_argument("--connect", "-c",
+                        help="Libvirt QEMU driver connection URI")
+    parser.add_argument("--debug", "-d", action='store_true',
+                        help="Display debugging information")
+    parser.add_argument("--verbose", "-v", action='store_true',
+                        help="Display QMP traffic")
+    parser.add_argument("domain", metavar="DOMAIN",
+                        help="Libvirt guest domain ID/UUID/Name")
+    parser.add_argument("sockpath", metavar="QMP-SOCK-PATH",
+                        help="UNIX socket path for QMP server")
+
+    return parser.parse_args()
+
+
+def main():
+    args = parse_commandline()
+    global debug
+    debug = args.debug
+
+    if not debug:
+        libvirt.registerErrorHandler(lambda opaque, error: None, None)
+
+    libvirt.virEventRegisterDefaultImpl()
+
+    conn, dom = get_domain(args.connect, args.domain)
+
+    if conn.getType() != "QEMU":
+        raise Exception("QMP proxy requires a QEMU driver connection not %s" %
+                        conn.getType())
+
+    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+    if os.path.exists(args.sockpath):
+        os.unlink(args.sockpath)
+    sock.bind(args.sockpath)
+    sock.listen(1)
+
+    proxy = QMPProxy(conn, dom, sock, args.verbose)
+
+    while True:
+        libvirt.virEventRunDefaultImpl()
+
+
+try:
+    main()
+    sys.exit(0)
+except Exception as e:
+    print("%s: %s" % (sys.argv[0], str(e)))
+    if debug:
+        print(traceback.format_exc())
+    sys.exit(1)
-- 
2.36.1


