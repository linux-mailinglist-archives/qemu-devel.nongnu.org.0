Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F542CD92
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:11:38 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamTJ-000660-EM
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGH-0006HW-NI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGD-0003sy-SM
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634162283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6F7EokPgG8CupzwpVYA7pJZn03fGA9vq4abIY7XobU0=;
 b=CvWXz/VPlaBhZjpZGO2JYvsdtzqyRmvjvs1rvW3RYeZhRO+qNRr2GhdezEZK9r3oTeQiqw
 go1J69VKy5O/xiw6HJ1MkZLb9vHL7N9jskXTKhd88k5IjODTZXNK/bfOakOCPithcrdbZr
 vpyv/cda8f4TnejIujqOgu4HW49X4rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-15RE_mEoMPi0AVFqFt2YVQ-1; Wed, 13 Oct 2021 17:58:00 -0400
X-MC-Unique: 15RE_mEoMPi0AVFqFt2YVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D037519067E0;
 Wed, 13 Oct 2021 21:57:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59361002D6A;
 Wed, 13 Oct 2021 21:57:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/8] iotests: Conditionally silence certain AQMP errors
Date: Wed, 13 Oct 2021 17:57:45 -0400
Message-Id: <20211013215748.2154908-6-jsnow@redhat.com>
In-Reply-To: <20211013215748.2154908-1-jsnow@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AQMP likes to be very chatty about errors it encounters. In general,
this is good because it allows us to get good diagnostic information for
otherwise complex async failures.

For example, during a failed QMP connection attempt, we might see:

+ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError
+ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session: EOFError

This might be nice in iotests output, because failure scenarios
involving the new QMP library will be spelled out plainly in the output
diffs.

For tests that are intentionally causing this scenario though, filtering
that log output could be a hassle. For now, add a context manager that
simply lets us toggle this output off during a critical region.

(Additionally, a forthcoming patch allows the use of either legacy or
async QMP to be toggled with an environment variable. In this
circumstance, we can't amend the iotest output to just always expect the
error message, either. Just suppress it for now. More rigorous log
filtering can be investigated later if/when it is deemed safe to
permanently replace the legacy QMP library.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py             | 20 +++++++++++++++++++-
 tests/qemu-iotests/tests/mirror-top-perms | 12 ++++++++----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index e5fff6ddcfc..e2f9d873ada 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -30,7 +30,7 @@
 import subprocess
 import sys
 import time
-from typing import (Any, Callable, Dict, Iterable,
+from typing import (Any, Callable, Dict, Iterable, Iterator,
                     List, Optional, Sequence, TextIO, Tuple, Type, TypeVar)
 import unittest
 
@@ -114,6 +114,24 @@
 sample_img_dir = os.environ['SAMPLE_IMG_DIR']
 
 
+@contextmanager
+def change_log_level(
+        logger_name: str, level: int = logging.CRITICAL) -> Iterator[None]:
+    """
+    Utility function for temporarily changing the log level of a logger.
+
+    This can be used to silence errors that are expected or uninteresting.
+    """
+    _logger = logging.getLogger(logger_name)
+    current_level = _logger.level
+    _logger.setLevel(level)
+
+    try:
+        yield
+    finally:
+        _logger.setLevel(current_level)
+
+
 def unarchive_sample_image(sample, fname):
     sample_fname = os.path.join(sample_img_dir, sample + '.bz2')
     with bz2.open(sample_fname) as f_in, open(fname, 'wb') as f_out:
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index a2d5c269d7a..0a51a613f39 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -26,7 +26,7 @@ from qemu.machine import machine
 from qemu.qmp import QMPConnectError
 
 import iotests
-from iotests import qemu_img
+from iotests import change_log_level, qemu_img
 
 
 image_size = 1 * 1024 * 1024
@@ -100,9 +100,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
-            self.vm_b.launch()
-            print('ERROR: VM B launched successfully, this should not have '
-                  'happened')
+            # Silence AQMP errors temporarily.
+            # TODO: Remove this and just allow the errors to be logged when
+            # AQMP fully replaces QMP.
+            with change_log_level('qemu.aqmp'):
+                self.vm_b.launch()
+                print('ERROR: VM B launched successfully, '
+                      'this should not have happened')
         except (QMPConnectError, ConnectError):
             assert 'Is another process using the image' in self.vm_b.get_log()
 
-- 
2.31.1


