Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC73AD5AD
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:11:49 +0200 (CEST)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNeO-0004aA-Ry
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY6-0006qT-Gi
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY4-000698-Br
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3JoV4/anRIaOT8jUQIDAeTqTKxjpvve+9HrE6wm3hA=;
 b=NqxsYKU8+WOC/BwshujTFzv0UAOqAxpyXnJ7TvD7mPzuTF4BkG7hiBmueAF7lih6l06nFE
 pY6OmAtIgBSGT3xOY9YCBE7eX15DtYIAB2I0piy3hScsHFr/MULpf55MAcauyIThikcky7
 jdbAu5VJA8vaxZy+FIDjlITSZ7YTlbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-ZFaRUdudNGmhXQpnBxFX8A-1; Fri, 18 Jun 2021 19:05:13 -0400
X-MC-Unique: ZFaRUdudNGmhXQpnBxFX8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D07DC18D6A2C;
 Fri, 18 Jun 2021 23:05:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD8511017CE5;
 Fri, 18 Jun 2021 23:05:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/72] scripts/qom-fuse: Convert to QOMCommand
Date: Fri, 18 Jun 2021 19:03:55 -0400
Message-Id: <20210618230455.2891199-13-jsnow@redhat.com>
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

Move qom-fuse onto the QOMCommand base established in
python/qemu/qmp/qom_common.py. The interface doesn't change
incompatibly, "qom-fuse mountpoint" still works as an invocation, and
QMP_SOCKET is still used as the environment variable.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210603003719.1321369-13-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 59 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 1fb3008a16..1676fb78d9 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -7,11 +7,19 @@ may be browsed, queried and edited using traditional shell tooling.
 
 This script requires the 'fusepy' python package.
 
-ENV:
-    QMP_SOCKET: Path to the QMP server socket
 
-Usage:
-    qom-fuse /mount/to/here
+usage: qom-fuse [-h] [--socket SOCKET] <mount>
+
+Mount a QOM tree as a FUSE filesystem
+
+positional arguments:
+  <mount>               Mount point
+
+optional arguments:
+  -h, --help            show this help message and exit
+  --socket SOCKET, -s SOCKET
+                        QMP socket path or address (addr:port). May also be
+                        set via QMP_SOCKET environment variable.
 """
 ##
 # Copyright IBM, Corp. 2012
@@ -25,30 +33,56 @@ Usage:
 # See the COPYING file in the top-level directory.
 ##
 
+import argparse
 from errno import ENOENT, EPERM
 import os
 import stat
 import sys
+from typing import Dict
 
 import fuse
 from fuse import FUSE, FuseOSError, Operations
 
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol, QMPResponseError
+from qemu.qmp import QMPResponseError
+from qemu.qmp.qom_common import QOMCommand
 
 
 fuse.fuse_python_api = (0, 2)
 
 
-class QOMFS(Operations):
-    """QOMFS implements fuse.Operations to provide a QOM filesystem."""
-    def __init__(self, qmp):
-        self.qmp = qmp
-        self.qmp.connect()
-        self.ino_map = {}
+class QOMFuse(QOMCommand, Operations):
+    """
+    QOMFuse implements both fuse.Operations and QOMCommand.
+
+    Operations implements the FS, and QOMCommand implements the CLI command.
+    """
+    name = 'fuse'
+    help = 'Mount a QOM tree as a FUSE filesystem'
+    fuse: FUSE
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        super().configure_parser(parser)
+        parser.add_argument(
+            'mount',
+            metavar='<mount>',
+            action='store',
+            help="Mount point",
+        )
+
+    def __init__(self, args: argparse.Namespace):
+        super().__init__(args)
+        self.mount = args.mount
+        self.ino_map: Dict[str, int] = {}
         self.ino_count = 1
 
+    def run(self) -> int:
+        print(f"Mounting QOMFS to '{self.mount}'", file=sys.stderr)
+        self.fuse = FUSE(self, self.mount, foreground=True)
+        return 0
+
     def get_ino(self, path):
         """Get an inode number for a given QOM path."""
         if path in self.ino_map:
@@ -171,5 +205,4 @@ class QOMFS(Operations):
 
 
 if __name__ == '__main__':
-    fuse = FUSE(QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET'])),
-                sys.argv[1], foreground=True)
+    sys.exit(QOMFuse.entry_point())
-- 
2.31.1


