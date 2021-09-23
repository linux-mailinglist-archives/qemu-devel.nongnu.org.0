Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F941651B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:18:09 +0200 (CEST)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTIM-00014J-Qg
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8M-0005QJ-Lj
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT87-0003V7-RP
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632420450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H5gJnGpF/udpFAg+KQlGrwNrJo5CCs9ITulO7bn3W0=;
 b=LxvZyn9NNp/0RxbKgigymfBobmIe/v5yQfZkefxsfLx2bF5ybtmk8zrJcwxIVVQOOq628Z
 p9m7sg4bg1CJYa0z6/FacxK7Y1G7AVKNsKfAzJi8AFuxrleIJRDYTbFs9Bzdc188NIxwng
 +ZzXhtKqV/Q+pDq8Xj9eU5Y98ceTfuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-9RGM_TMiPfGWlt35GiA0HA-1; Thu, 23 Sep 2021 14:07:28 -0400
X-MC-Unique: 9RGM_TMiPfGWlt35GiA0HA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50394802B9F;
 Thu, 23 Sep 2021 18:07:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4650760BE5;
 Thu, 23 Sep 2021 18:07:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] iotests: add warning for rogue 'qemu' packages
Date: Thu, 23 Sep 2021 14:07:11 -0400
Message-Id: <20210923180715.4168522-3-jsnow@redhat.com>
In-Reply-To: <20210923180715.4168522-1-jsnow@redhat.com>
References: <20210923180715.4168522-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a warning for when 'iotests' runs against a qemu namespace that
isn't the one in the source tree. This might occur if you have
(accidentally) installed the Python namespace package to your local
packages.

(I'm not going to say that this is because I bit myself with this,
but you can fill in the blanks.)

In the future, we will pivot to always preferring a specific installed
instance of qemu python packages managed directly by iotests. For now
simply warn if there is an ambiguity over which instance that iotests
might use.

Example: If a user has navigated to ~/src/qemu/python and executed
`pip install .`, you will see output like this when running `./check`:

WARNING: 'qemu' python packages will be imported from outside the source tree ('/home/jsnow/src/qemu/python')
         Importing instead from '/home/jsnow/.local/lib/python3.9/site-packages/qemu'

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 99a57a69f3a..1c0f6358538 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -16,6 +16,8 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import importlib.util
+import logging
 import os
 import sys
 import tempfile
@@ -112,6 +114,27 @@ def init_directories(self) -> None:
         # Path where qemu goodies live in this source tree.
         qemu_srctree_path = Path(__file__, '../../../python').resolve()
 
+        # Warn if we happen to be able to find qemu namespace packages
+        # (using qemu.qmp as a bellwether) from an unexpected location.
+        # i.e. the package is already installed in the user's environment.
+        try:
+            qemu_spec = importlib.util.find_spec('qemu.qmp')
+        except ModuleNotFoundError:
+            qemu_spec = None
+
+        if qemu_spec and qemu_spec.origin:
+            spec_path = Path(qemu_spec.origin)
+            try:
+                _ = spec_path.relative_to(qemu_srctree_path)
+            except ValueError:
+                self._logger.warning(
+                    "WARNING: 'qemu' python packages will be imported from"
+                    " outside the source tree ('%s')",
+                    qemu_srctree_path)
+                self._logger.warning(
+                    "         Importing instead from '%s'",
+                    spec_path.parents[1])
+
         self.pythonpath = os.pathsep.join(filter(None, (
             self.source_iotests,
             str(qemu_srctree_path),
@@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
+        self._logger = logging.getLogger('qemu.iotests')
         self.init_directories()
         self.init_binaries()
 
-- 
2.31.1


