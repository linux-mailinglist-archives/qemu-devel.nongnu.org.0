Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EA3AD620
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:48:41 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOE4-0008IQ-4P
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZF-0000LI-8e
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZA-0006ou-KW
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KN81otM3xJvQCxK733cHXmgr0gjkIJVyUkHMr+PAUgE=;
 b=UUcvj/Zj6GbCMQjbrNGc0NKqWw+0JQU0aAThIOyOkUcMW9TXX4iR0D0H0Ic9X/tsz+q8pB
 hD+IRUaXcPVnTYjVQbmVtbySty5Icz+kvfLPJg4MhRP+tkQQ45vJcIACpmbTEgHFMQRx+s
 ASiRU8ZGCnbn8VkazHQ5VupBf/69X7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-BbSYJ5JWPgqNXLKiF9T9Cw-1; Fri, 18 Jun 2021 19:06:18 -0400
X-MC-Unique: BbSYJ5JWPgqNXLKiF9T9Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A30DC15346;
 Fri, 18 Jun 2021 23:06:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01761000358;
 Fri, 18 Jun 2021 23:06:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 61/72] scripts/qmp-shell: Use context manager instead of atexit
Date: Fri, 18 Jun 2021 19:04:44 -0400
Message-Id: <20210618230455.2891199-62-jsnow@redhat.com>
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

We can invoke the shell history writing when we leave the QMPShell scope
instead of relying on atexit. Doing so may be preferable to avoid global
state being registered from within a class instead of from the
application logic directly.

Use QMP's context manager to hook this history saving at close time,
which gets invoked when we leave the context block.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-32-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index f14fe211cc..ec028d662e 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -66,7 +66,6 @@
 # sent to QEMU, which is useful for debugging and documentation generation.
 import argparse
 import ast
-import atexit
 import json
 import os
 import re
@@ -142,6 +141,11 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self.pretty = pretty
         self.verbose = verbose
 
+    def close(self) -> None:
+        # Hook into context manager of parent to save shell history.
+        self._save_history()
+        super().close()
+
     def _fill_completion(self) -> None:
         cmds = self.cmd('query-commands')
         if 'error' in cmds:
@@ -164,9 +168,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             pass
         except IOError as err:
             print(f"Failed to read history '{self._histfile}': {err!s}")
-        atexit.register(self.__save_history)
 
-    def __save_history(self) -> None:
+    def _save_history(self) -> None:
         try:
             readline.write_history_file(self._histfile)
         except IOError as err:
@@ -448,25 +451,25 @@ def main() -> None:
         parser.error("QMP socket or TCP address must be specified")
 
     shell_class = HMPShell if args.hmp else QMPShell
+
     try:
         address = shell_class.parse_address(args.qmp_server)
     except qmp.QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
-    qemu = shell_class(address, args.pretty, args.verbose)
+    with shell_class(address, args.pretty, args.verbose) as qemu:
+        try:
+            qemu.connect(negotiate=not args.skip_negotiation)
+        except qmp.QMPConnectError:
+            die("Didn't get QMP greeting message")
+        except qmp.QMPCapabilitiesError:
+            die("Couldn't negotiate capabilities")
+        except OSError as err:
+            die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
-    try:
-        qemu.connect(negotiate=not args.skip_negotiation)
-    except qmp.QMPConnectError:
-        die("Didn't get QMP greeting message")
-    except qmp.QMPCapabilitiesError:
-        die("Couldn't negotiate capabilities")
-    except OSError as err:
-        die(f"Couldn't connect to {args.qmp_server}: {err!s}")
-
-    for _ in qemu.repl():
-        pass
+        for _ in qemu.repl():
+            pass
 
 
 if __name__ == '__main__':
-- 
2.31.1


