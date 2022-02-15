Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBD4B7A80
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:35:42 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Q9-0004nt-BW
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60W-00044J-3X
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60T-0006MK-G1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644962949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CC5RwmrM3Z6fneyx6TO6ECM2diqtgSXOfmp8OB/JxV8=;
 b=gFUqhHJ/6Wty7saCUdig8l96lZ9r79sovoZ9b2yHkTQou3kW8kq9ojelFBQD6CRtmnJbkC
 8SXW1p5LZ+ENMwqMWAOP4RPwUc+5JHKfTCHJI9xU+RCxo7xczBSHL2pshFAgpQ5oOH4ZZc
 YjFSvj/7UO4GPSBKRc0DIUrvxSXz06w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-VkpGZJ_PPLeaf1mgARUj_Q-1; Tue, 15 Feb 2022 17:09:01 -0500
X-MC-Unique: VkpGZJ_PPLeaf1mgARUj_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 031B81091DA3;
 Tue, 15 Feb 2022 22:09:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F1D1059A77;
 Tue, 15 Feb 2022 22:08:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] iotests: add VerboseProcessError
Date: Tue, 15 Feb 2022 17:08:51 -0500
Message-Id: <20220215220853.4179173-3-jsnow@redhat.com>
In-Reply-To: <20220215220853.4179173-1-jsnow@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds an Exception that extends the garden variety
subprocess.CalledProcessError. When this exception is raised, it will
still be caught when selecting for the stdlib variant.

The difference is that the str() method of this Exception also adds the
stdout/stderr logs. In effect, if this exception goes unhandled, Python
will print the output in a nice, highlighted box to the terminal so that
it's easy to spot.

This should save some headache from having to re-run test suites with
debugging enabled if we augment the exceptions we print more information
in the default case.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ffe..7df393df2c3 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -30,6 +30,7 @@
 import struct
 import subprocess
 import sys
+import textwrap
 import time
 from typing import (Any, Callable, Dict, Iterable, Iterator,
                     List, Optional, Sequence, TextIO, Tuple, Type, TypeVar)
@@ -39,6 +40,7 @@
 
 from qemu.machine import qtest
 from qemu.qmp import QMPMessage
+from qemu.utils import enboxify
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
@@ -117,6 +119,38 @@
 sample_img_dir = os.environ['SAMPLE_IMG_DIR']
 
 
+class VerboseProcessError(subprocess.CalledProcessError):
+    """
+    The same as CalledProcessError, but more verbose.
+
+    This is useful for debugging failed calls during test executions.
+    The return code, signal (if any), and terminal output will be displayed
+    on unhandled exceptions.
+    """
+    def summary(self) -> str:
+        return super().__str__()
+
+    def __str__(self) -> str:
+        lmargin = '  '
+        width = shutil.get_terminal_size()[0] - len(lmargin)
+        sections = []
+
+        if self.stdout:
+            name = 'output' if self.stderr is None else 'stdout'
+            sections.append(enboxify(self.stdout, width, name))
+        else:
+            sections.append(f"{name}: N/A")
+
+        if self.stderr:
+            sections.append(enboxify(self.stderr, width, 'stderr'))
+        elif self.stderr is not None:
+            sections.append("stderr: N/A")
+
+        return os.linesep.join((
+            self.summary(),
+            textwrap.indent(os.linesep.join(sections), prefix=lmargin),
+        ))
+
 @contextmanager
 def change_log_level(
         logger_name: str, level: int = logging.CRITICAL) -> Iterator[None]:
-- 
2.34.1


