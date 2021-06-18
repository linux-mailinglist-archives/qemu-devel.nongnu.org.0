Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838A3AD5E0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:30:01 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNw0-0008Pl-5X
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYl-0007lt-CE
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYi-0006Wv-GO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfFX9EmQwVzqYru6jM1I8EAEugbbmE3RUp7sP9/1HS4=;
 b=PlvnVjba8q6U0W7v474ok9j8WWXBm5D0aiEzxMhmQ8LfHihUJITP4iKoTCxM7AsQzxygV1
 GbMVgOoVT8M0Sfs5U0quvVBI+t6eSFt+oWryVSGFmpGxKcZNWfJ+plZp8PUaY2HbvEblVT
 rb5+dN58x76Vf0J37oW/vclY3aEXg/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-Md_LdmlVN2KTEI0LxZSN0w-1; Fri, 18 Jun 2021 19:05:52 -0400
X-MC-Unique: Md_LdmlVN2KTEI0LxZSN0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8170B1084F4B;
 Fri, 18 Jun 2021 23:05:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 678F91000358;
 Fri, 18 Jun 2021 23:05:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/72] scripts/qmp-shell: use argparse
Date: Fri, 18 Jun 2021 19:04:30 -0400
Message-Id: <20210618230455.2891199-48-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use argparse instead of an open-coded CLI parser, for consistency with
everything else.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-18-jsnow@redhat.com
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


