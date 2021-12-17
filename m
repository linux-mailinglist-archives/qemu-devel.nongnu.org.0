Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEF47833B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:38:29 +0100 (CET)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my38e-0005xz-Ml
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30O-00015M-8d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30L-0000Zr-ER
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nu5up76oMJQQbI901PH/UzeQvJpkJr5BaE+cQZfGKfw=;
 b=bIENO6SAZ/FNeprGQ2sO6XDKgxYSJcQWyX9LHGChKGpSYlR7eq5sRHJEmH8/XfFGLCMznO
 G33UeO/7LlDweIH0PVxRp1PfMlPLlzIm+KDYGBhUFCDhGr8PEDJXl1//mFAeRsZe2Ti4gJ
 GRzEHdXqeD5/QQo9iSShw3YI1RcmHNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-xe_qQBlpMLaeqtnPPC_bOA-1; Thu, 16 Dec 2021 21:29:49 -0500
X-MC-Unique: xe_qQBlpMLaeqtnPPC_bOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73155F9CA;
 Fri, 17 Dec 2021 02:29:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AF5522DF6;
 Fri, 17 Dec 2021 02:29:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/9] scripts: remove sys.path hacks for qemu/qemu.qmp
Date: Thu, 16 Dec 2021 21:29:36 -0500
Message-Id: <20211217022939.279559-7-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu.qmp can be found via the package index now. Direct the user to just
install the package. When utilities from 'qemu' are needed, direct the
user to install the package from that directory instead, which will pull
in the 'qemu.qmp' package as a dependency.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/device-crash-test              | 11 ++++++++---
 scripts/render_block_graph.py          | 13 ++++++++++---
 scripts/simplebench/bench_block_job.py | 11 ++++++++---
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 4bfc68c008..5d21b6dfb1 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -34,9 +34,14 @@ import random
 import argparse
 from itertools import chain
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.qmp import ConnectError
+try:
+    from qemu.machine import QEMUMachine
+    from qemu.qmp import ConnectError
+except ModuleNotFoundError:
+    target = os.path.realpath(__file__ + '/../../python')
+    print("script dependencies not found.")
+    print(f'try: pushd "{target}" && pip3 install [--user] . && popd')
+    sys.exit(1)
 
 logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index 26f43fef27..e7b89314ff 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -24,9 +24,16 @@
 import json
 from graphviz import Digraph
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.qmp import QMPError
-from qemu.qmp.legacy import QEMUMonitorProtocol
+try:
+    from qemu.qmp import QMPError
+    from qemu.qmp.legacy import QEMUMonitorProtocol
+except ModuleNotFoundError:
+    print(
+        "qemu.qmp python package not found.",
+        "try: pip3 install [--user] qemu.qmp",
+        sep='\n', file=sys.stderr
+    )
+    sys.exit(1)
 
 
 def perm(arr):
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 56191db44b..ccb2f9ded1 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -25,9 +25,14 @@
 import socket
 import json
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.qmp import ConnectError
+try:
+    from qemu.machine import QEMUMachine
+    from qemu.qmp import ConnectError
+except ModuleNotFoundError:
+    target = os.path.realpath(__file__ + '/../../../python')
+    print("script dependencies not found.")
+    print(f'try: pushd "{target}" && pip3 install [--user] . && popd')
+    sys.exit(1)
 
 
 def bench_block_job(cmd, cmd_args, qemu_args):
-- 
2.31.1


