Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530943AD5B2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:14:01 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNgW-0001qN-1C
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY5-0006pg-2n
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXx-00066g-9y
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU56lv0ptaOX0dnDZWVeYi+Lz1zfa0Eesv0454HkdXQ=;
 b=IXcB17Gi/LPF/4VhI9C1iKJk3rQGBNsLtYXLaTGEoZWyVSKB/lYvV65C9gYTzk/hRQjwD3
 Hr624UQ0N4CpyFNikuPw0gGUjoVsG4RoHjweZEC/5D159jihRv1DijpIE6XcFMwJ3W4sOp
 U4YswjNXqr8ZftFqpUdRNjE7HOojzQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-xWTeDjgYPqGhE4dLeDPTYA-1; Fri, 18 Jun 2021 19:05:06 -0400
X-MC-Unique: xWTeDjgYPqGhE4dLeDPTYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B8F318D6A2E;
 Fri, 18 Jun 2021 23:05:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49EE11017CE5;
 Fri, 18 Jun 2021 23:05:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/72] scripts/qmp: redirect qom-xxx scripts to python/qemu/qmp/
Date: Fri, 18 Jun 2021 19:03:49 -0400
Message-Id: <20210618230455.2891199-7-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Redirect to the new qom scripts. These forwarders can be deleted
eventually when there has been more time for the dust on the Python
packaging to settle and people understand how to find these commands.

Note: You can run these by setting $PYTHONPATH in your shell and then
running "python3 -m qemu.qmp.qom", or you can install the qemu namespace
package and use the "qom" or "qom-set" scripts.

I've written how to install the package elsewhere, but for the sake of
git-blame, cd to ./python, and then do:

- pip3 install [--user] [-e] .

--user will install to your local user install (will not work inside of
  a venv), omitting this flag installs to your system-wide packages
  (outside of a venv) or to your current virtual environment (inside the
  venv).

  When installing to a venv or to your system-wide packages, "qom"
  should be in your $PATH already. If you do a user install, you may
  need to add ~/.local/bin to your $PATH if you haven't already.

-e installs in editable mode: the installed package is effectively just
 a symlink to this folder; so changes to your git working tree are
 reflected in the installed package.

Note: installing these packages to an environment outside a venv can be
dangerous: Many QEMU scripts will begin to prefer the installed version
instead of the version directly in the tree. Use with caution. editable
mode is recommended when working outside of a venv.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-get  | 66 +++------------------------------------
 scripts/qmp/qom-list | 63 +++----------------------------------
 scripts/qmp/qom-set  | 63 +++----------------------------------
 scripts/qmp/qom-tree | 74 +++-----------------------------------------
 4 files changed, 16 insertions(+), 250 deletions(-)

diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
index 666df71832..e4f3e0c013 100755
--- a/scripts/qmp/qom-get
+++ b/scripts/qmp/qom-get
@@ -1,69 +1,11 @@
 #!/usr/bin/env python3
-##
-# QEMU Object Model test tools
-#
-# Copyright IBM, Corp. 2011
-#
-# Authors:
-#  Anthony Liguori   <aliguori@us.ibm.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-# the COPYING file in the top-level directory.
-##
 
-import sys
 import os
+import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol
+from qemu.qmp.qom import QOMGet
 
-cmd, args = sys.argv[0], sys.argv[1:]
-socket_path = None
-path = None
-prop = None
 
-def usage():
-    return '''environment variables:
-    QMP_SOCKET=<path | addr:port>
-usage:
-    %s [-h] [-s <QMP socket path | addr:port>] <path>.<property>
-''' % cmd
-
-def usage_error(error_msg = "unspecified error"):
-    sys.stderr.write('%s\nERROR: %s\n' % (usage(), error_msg))
-    exit(1)
-
-if len(args) > 0:
-    if args[0] == "-h":
-        print(usage())
-        exit(0);
-    elif args[0] == "-s":
-        try:
-            socket_path = args[1]
-        except:
-            usage_error("missing argument: QMP socket path or address");
-        args = args[2:]
-
-if not socket_path:
-    if 'QMP_SOCKET' in os.environ:
-        socket_path = os.environ['QMP_SOCKET']
-    else:
-        usage_error("no QMP socket path or address given");
-
-if len(args) > 0:
-    try:
-        path, prop = args[0].rsplit('.', 1)
-    except:
-        usage_error("invalid format for path/property/value")
-else:
-    usage_error("not enough arguments")
-
-srv = QEMUMonitorProtocol(socket_path)
-srv.connect()
-
-rsp = srv.command('qom-get', path=path, property=prop)
-if type(rsp) == dict:
-    for i in rsp.keys():
-        print('%s: %s' % (i, rsp[i]))
-else:
-    print(rsp)
+if __name__ == '__main__':
+    sys.exit(QOMGet.entry_point())
diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
index 5074fd939f..7a071a54e1 100755
--- a/scripts/qmp/qom-list
+++ b/scripts/qmp/qom-list
@@ -1,66 +1,11 @@
 #!/usr/bin/env python3
-##
-# QEMU Object Model test tools
-#
-# Copyright IBM, Corp. 2011
-#
-# Authors:
-#  Anthony Liguori   <aliguori@us.ibm.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-# the COPYING file in the top-level directory.
-##
 
-import sys
 import os
+import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol
+from qemu.qmp.qom import QOMList
 
-cmd, args = sys.argv[0], sys.argv[1:]
-socket_path = None
-path = None
-prop = None
 
-def usage():
-    return '''environment variables:
-    QMP_SOCKET=<path | addr:port>
-usage:
-    %s [-h] [-s <QMP socket path | addr:port>] [<path>]
-''' % cmd
-
-def usage_error(error_msg = "unspecified error"):
-    sys.stderr.write('%s\nERROR: %s\n' % (usage(), error_msg))
-    exit(1)
-
-if len(args) > 0:
-    if args[0] == "-h":
-        print(usage())
-        exit(0);
-    elif args[0] == "-s":
-        try:
-            socket_path = args[1]
-        except:
-            usage_error("missing argument: QMP socket path or address");
-        args = args[2:]
-
-if not socket_path:
-    if 'QMP_SOCKET' in os.environ:
-        socket_path = os.environ['QMP_SOCKET']
-    else:
-        usage_error("no QMP socket path or address given");
-
-srv = QEMUMonitorProtocol(socket_path)
-srv.connect()
-
-if len(args) == 0:
-    print('/')
-    sys.exit(0)
-
-for item in srv.command('qom-list', path=args[0]):
-    if item['type'].startswith('child<'):
-        print('%s/' % item['name'])
-    elif item['type'].startswith('link<'):
-        print('@%s/' % item['name'])
-    else:
-        print('%s' % item['name'])
+if __name__ == '__main__':
+    sys.exit(QOMList.entry_point())
diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
index 240a78187f..9ca9e2ba10 100755
--- a/scripts/qmp/qom-set
+++ b/scripts/qmp/qom-set
@@ -1,66 +1,11 @@
 #!/usr/bin/env python3
-##
-# QEMU Object Model test tools
-#
-# Copyright IBM, Corp. 2011
-#
-# Authors:
-#  Anthony Liguori   <aliguori@us.ibm.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-# the COPYING file in the top-level directory.
-##
 
-import sys
 import os
+import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol
+from qemu.qmp.qom import QOMSet
 
-cmd, args = sys.argv[0], sys.argv[1:]
-socket_path = None
-path = None
-prop = None
-value = None
 
-def usage():
-    return '''environment variables:
-    QMP_SOCKET=<path | addr:port>
-usage:
-    %s [-h] [-s <QMP socket path | addr:port>] <path>.<property> <value>
-''' % cmd
-
-def usage_error(error_msg = "unspecified error"):
-    sys.stderr.write('%s\nERROR: %s\n' % (usage(), error_msg))
-    exit(1)
-
-if len(args) > 0:
-    if args[0] == "-h":
-        print(usage())
-        exit(0);
-    elif args[0] == "-s":
-        try:
-            socket_path = args[1]
-        except:
-            usage_error("missing argument: QMP socket path or address");
-        args = args[2:]
-
-if not socket_path:
-    if 'QMP_SOCKET' in os.environ:
-        socket_path = os.environ['QMP_SOCKET']
-    else:
-        usage_error("no QMP socket path or address given");
-
-if len(args) > 1:
-    try:
-        path, prop = args[0].rsplit('.', 1)
-    except:
-        usage_error("invalid format for path/property/value")
-    value = args[1]
-else:
-    usage_error("not enough arguments")
-
-srv = QEMUMonitorProtocol(socket_path)
-srv.connect()
-
-print(srv.command('qom-set', path=path, property=prop, value=value))
+if __name__ == '__main__':
+    sys.exit(QOMSet.entry_point())
diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index 25b0781323..7d0ccca3a4 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -1,77 +1,11 @@
 #!/usr/bin/env python3
-##
-# QEMU Object Model test tools
-#
-# Copyright IBM, Corp. 2011
-# Copyright (c) 2013 SUSE LINUX Products GmbH
-#
-# Authors:
-#  Anthony Liguori   <aliguori@amazon.com>
-#  Andreas Faerber   <afaerber@suse.de>
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-# the COPYING file in the top-level directory.
-##
 
-import sys
 import os
+import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol
+from qemu.qmp.qom import QOMTree
 
-cmd, args = sys.argv[0], sys.argv[1:]
-socket_path = None
-path = None
-prop = None
 
-def usage():
-    return '''environment variables:
-    QMP_SOCKET=<path | addr:port>
-usage:
-    %s [-h] [-s <QMP socket path | addr:port>] [<path>]
-''' % cmd
-
-def usage_error(error_msg = "unspecified error"):
-    sys.stderr.write('%s\nERROR: %s\n' % (usage(), error_msg))
-    exit(1)
-
-if len(args) > 0:
-    if args[0] == "-h":
-        print(usage())
-        exit(0);
-    elif args[0] == "-s":
-        try:
-            socket_path = args[1]
-        except:
-            usage_error("missing argument: QMP socket path or address");
-        args = args[2:]
-
-if not socket_path:
-    if 'QMP_SOCKET' in os.environ:
-        socket_path = os.environ['QMP_SOCKET']
-    else:
-        usage_error("no QMP socket path or address given");
-
-srv = QEMUMonitorProtocol(socket_path)
-srv.connect()
-
-def list_node(path):
-    print('%s' % path)
-    items = srv.command('qom-list', path=path)
-    for item in items:
-        if not item['type'].startswith('child<'):
-            try:
-                print('  %s: %s (%s)' % (item['name'], srv.command('qom-get', path=path, property=item['name']), item['type']))
-            except:
-                print('  %s: <EXCEPTION> (%s)' % (item['name'], item['type']))
-    print('')
-    for item in items:
-        if item['type'].startswith('child<'):
-            list_node((path if (path != '/') else '')  + '/' + item['name'])
-
-if len(args) == 0:
-    path = '/'
-else:
-    path = args[0]
-
-list_node(path)
+if __name__ == '__main__':
+    sys.exit(QOMTree.entry_point())
-- 
2.31.1


