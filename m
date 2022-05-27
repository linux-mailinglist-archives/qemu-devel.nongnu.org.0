Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FEB535DA8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 11:53:45 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuWfA-0004GZ-Dk
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 05:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuWZl-0000IR-Tt
 for qemu-devel@nongnu.org; Fri, 27 May 2022 05:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuWZi-0006ni-3T
 for qemu-devel@nongnu.org; Fri, 27 May 2022 05:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653644884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CXwycN7FStxi5TgIh/0kR0J3iaMwdG+ahAqcAVI/XKA=;
 b=SbkTgv+XItmLIeZMGMv3NQFHNITyzsuV+EVZPZHz/OVZUOhnXc/5gGv8FF/wTC0dXM23Jv
 fMsyeKopj7mr3PuVimqe52I2f5puh9oa9LAuY7u6WvJm2Vw5TDma7j3SffC371KB3VgNOO
 ZMYInq6MGBZfSFrMYs915zTMywR9LvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-vXvHvMZQNMKuTuTH5ezq9g-1; Fri, 27 May 2022 05:48:03 -0400
X-MC-Unique: vXvHvMZQNMKuTuTH5ezq9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9962101A56C
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:02 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A0F31678F;
 Fri, 27 May 2022 09:48:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: libvir-list@redhat.com
Cc: John Snow <jsnow@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP clients to
 libvirt QEMU guests
Date: Fri, 27 May 2022 10:47:58 +0100
Message-Id: <20220527094758.604621-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

CC'ing QEMU since this is likely of interest to maintainers and users
who work with QEMU and libvirt

Note this impl is fairly crude in that it assumes it is receiving
the QMP commands linewise one at a time. None the less it is good
enough to work with qmp-shell already, so I figured it was worth
exposing to the world. It also lacks support for forwarding events
back to the QMP client.

 docs/manpages/meson.build        |   1 +
 docs/manpages/virt-qmp-proxy.rst | 123 ++++++++++++++++++++++++++++
 tools/meson.build                |   5 ++
 tools/virt-qmp-proxy             | 133 +++++++++++++++++++++++++++++++
 4 files changed, 262 insertions(+)
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
index 0000000000..94679406ab
--- /dev/null
+++ b/docs/manpages/virt-qmp-proxy.rst
@@ -0,0 +1,123 @@
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
+NOTE: at this time there is no support for forwarding QMP events back
+to the clients
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
index 0000000000..57f9759fab
--- /dev/null
+++ b/tools/virt-qmp-proxy
@@ -0,0 +1,133 @@
+#!/usr/bin/env python3
+
+import argparse
+import libvirt
+import libvirt_qemu
+import os
+import re
+import socket
+import sys
+import json
+
+
+def get_domain(uri, domstr):
+    conn = libvirt.open(uri)
+
+    dom = None
+    if re.match(r'^\d+$', domstr):
+        dom = conn.lookupByID(int(domstr))
+    elif re.match(r'^[+a-f0-9]+$', domstr):
+        dom = conn.lookupByUUIDString(domstr)
+    else:
+        dom = conn.lookupByName(domstr)
+
+    if not dom.isActive():
+        raise Exception(
+            "Domain must be running to validate measurement")
+
+    return conn, dom
+
+
+def qmp_server(conn, dom, client, verbose):
+    ver = conn.getVersion()
+    major = int(ver / 1000000) % 1000
+    minor = int(ver / 1000) % 1000
+    micro = ver % 1000
+
+    greetingobj = {
+        "QMP": {
+            "version": {
+                "qemu": {
+                    "major": major,
+                    "minor": minor,
+                    "micro": micro,
+                },
+                "package": f"qemu-{major}.{minor}.{micro}",
+            },
+            "capabilities": [
+                "oob"
+            ],
+        }
+    }
+    greeting = json.dumps(greetingobj) + "\r\n"
+    if verbose:
+        print(greeting, end='')
+    client.send(greeting.encode("utf-8"))
+
+    while True:
+        # XXX shouldn't blindly assume this one read
+        # will fully capture one-and-only-one cmd
+        cmd = client.recv(1024).decode('utf8')
+        if verbose:
+            print(cmd)
+
+        if cmd == "":
+            break
+
+        if "qmp_capabilities" in cmd:
+            capabilitiesobj = {
+                "return": {},
+            }
+            capabilities = json.dumps(capabilitiesobj) + "\r\n"
+            if verbose:
+                print(capabilities, end='')
+            client.send(capabilities.encode("utf-8"))
+            continue
+
+        id = None
+        if "id" in cmd:
+            id = cmd[id]
+
+        res = libvirt_qemu.qemuMonitorCommand(dom, cmd, 0)
+
+        resobj = json.loads(res)
+        del resobj["id"]
+        if id is not None:
+            resobj["id"] = id
+        res = json.dumps(resobj) + "\r\n"
+        if verbose:
+            print(res, end='')
+
+        client.send(res.encode('utf8'))
+
+
+def parse_commandline():
+    parser = argparse.ArgumentParser(description="Libvirt QMP proxy")
+    parser.add_argument("--connect", "-c",
+                        help="Libvirt QEMU driver connection URI")
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
+    while True:
+        client, peeraddr = sock.accept()
+        qmp_server(conn, dom, client, args.verbose)
+
+
+try:
+    main()
+    sys.exit(0)
+except Exception as e:
+    print("%s: %s" % (sys.argv[0], str(e)))
+    sys.exit(1)
-- 
2.36.1


