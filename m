Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593539E84E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:21:45 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLkm-00075B-8P
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXL-0004iK-Px
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX1-0006aM-FI
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsGdxw3HZiTGbhxjycNjoxP0LdzwfbIW6vuKmMO6JTA=;
 b=jEOL0pyfm+J/EFN+jlJv5nFk5QkqVelztv9l3tX4U1mrhZc7XQAO3FaAk/Mq3igSGuYbjO
 5p9x6ThLH5OiEogGHHQ9+kFCXbej4BjS8n3b3uX6jj3TNO6ChoV9sqxwsqIQmZduQuFGA+
 Gbh94d2YLAlA0xG6aLNZRe2XrtGBXqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-otBtEFFSN4mMmODQ9ZT0rQ-1; Mon, 07 Jun 2021 16:07:24 -0400
X-MC-Unique: otBtEFFSN4mMmODQ9ZT0rQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E8E01074641;
 Mon,  7 Jun 2021 20:07:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D71B5C1C2;
 Mon,  7 Jun 2021 20:07:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/42] scripts/qmp-shell: use argparse
Date: Mon,  7 Jun 2021 16:06:24 -0400
Message-Id: <20210607200649.1840382-18-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use argparse instead of an open-coded CLI parser, for consistency with
everything else.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 82 +++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 50 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 970f43dd00..5317dcd516 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -64,7 +64,7 @@
 # Use the -v and -p options to activate the verbose and pretty-print options,
 # which will echo back the properly formatted JSON-compliant QMP that is being
 # sent to QEMU, which is useful for debugging and documentation generation.
-
+import argparse
 import ast
 import atexit
 import json
@@ -401,65 +401,47 @@ def die(msg):
     sys.exit(1)
 
 
-def fail_cmdline(option=None):
-    if option:
-        sys.stderr.write('ERROR: bad command-line option \'%s\'\n' % option)
-    sys.stderr.write(
-        'qmp-shell [ -v ] [ -p ] [ -H ] [ -N ] '
-        '< UNIX socket path> | < TCP address:port >\n'
-    )
-    sys.stderr.write('    -v     Verbose (echo command sent and received)\n')
-    sys.stderr.write('    -p     Pretty-print JSON\n')
-    sys.stderr.write('    -H     Use HMP interface\n')
-    sys.stderr.write('    -N     Skip negotiate (for qemu-ga)\n')
-    sys.exit(1)
-
-
 def main():
-    addr = ''
-    qemu = None
-    hmp = False
-    pretty = False
-    verbose = False
-    negotiate = True
+    parser = argparse.ArgumentParser()
+    parser.add_argument('-H', '--hmp', action='store_true',
+                        help='Use HMP interface')
+    parser.add_argument('-N', '--skip-negotiation', action='store_true',
+                        help='Skip negotiate (for qemu-ga)')
+    parser.add_argument('-v', '--verbose', action='store_true',
+                        help='Verbose (echo commands sent and received)')
+    parser.add_argument('-p', '--pretty', action='store_true',
+                        help='Pretty-print JSON')
 
+    default_server = os.environ.get('QMP_SOCKET')
+    parser.add_argument('qmp_server', action='store',
+                        default=default_server,
+                        help='< UNIX socket path | TCP address:port >')
+
+    args = parser.parse_args()
+    if args.qmp_server is None:
+        parser.error("QMP socket or TCP address must be specified")
+
+    qemu: QMPShell
     try:
-        for arg in sys.argv[1:]:
-            if arg == "-H":
-                if qemu is not None:
-                    fail_cmdline(arg)
-                hmp = True
-            elif arg == "-p":
-                pretty = True
-            elif arg == "-N":
-                negotiate = False
-            elif arg == "-v":
-                verbose = True
-            else:
-                if qemu is not None:
-                    fail_cmdline(arg)
-                if hmp:
-                    qemu = HMPShell(arg)
-                else:
-                    qemu = QMPShell(arg, pretty)
-                addr = arg
-
-        if qemu is None:
-            fail_cmdline()
+        if args.hmp:
+            qemu = HMPShell(args.qmp_server)
+        else:
+            qemu = QMPShell(args.qmp_server, args.pretty)
     except qmp.QMPBadPortError:
-        die('bad port number in command-line')
+        parser.error(f"Bad port number: {args.qmp_server}")
+        return  # pycharm doesn't know error() is noreturn
 
     try:
-        qemu.connect(negotiate)
+        qemu.connect(negotiate=not args.skip_negotiation)
     except qmp.QMPConnectError:
-        die('Didn\'t get QMP greeting message')
+        die("Didn't get QMP greeting message")
     except qmp.QMPCapabilitiesError:
-        die('Could not negotiate capabilities')
-    except OSError:
-        die('Could not connect to %s' % addr)
+        die("Couldn't negotiate capabilities")
+    except OSError as err:
+        die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    qemu.set_verbosity(verbose)
+    qemu.set_verbosity(args.verbose)
     while qemu.read_exec_command(qemu.get_prompt()):
         pass
     qemu.close()
-- 
2.31.1


