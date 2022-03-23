Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312494E50D6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:58:50 +0100 (CET)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyhV-0007AC-9G
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:58:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeL-00043Q-8t
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeI-00026u-Vd
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLRw/ypMBLIUO7Ubyf8p14rwt3IXObDz9fr79CRGGgw=;
 b=afd+6KbBm4leaSjDGaHT5SBzqmML1H7Y6LqNDcdlHqQyvIrgFE7Y7R+IshPk7j6XjkwMRt
 gNnkxxuG/ZIYi8+NQQ7xDGxIPsASWEVRyuIUk103HWqiwbN9XoqSq3RQRa9yyT1B8AD7qp
 +JsqqBkGVlGdeNqtHdFR45I8Ne6A+Jk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-EVdLlZt5MZa2BMwuK6zJHw-1; Wed, 23 Mar 2022 06:55:28 -0400
X-MC-Unique: EVdLlZt5MZa2BMwuK6zJHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4D6D866DF8;
 Wed, 23 Mar 2022 10:55:27 +0000 (UTC)
Received: from localhost (unknown [10.39.195.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A793400F72A;
 Wed, 23 Mar 2022 10:55:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/3] iotests/065: Check for zstd support
Date: Wed, 23 Mar 2022 11:55:21 +0100
Message-Id: <20220323105522.53660-3-hreitz@redhat.com>
In-Reply-To: <20220323105522.53660-1-hreitz@redhat.com>
References: <20220323105522.53660-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some test cases run in iotest 065 want to run with zstd compression just
for added coverage.  Run them with zlib if there is no zstd support
compiled in.

Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065 | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index ba94e19349..b724c89c7c 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_info
+from iotests import qemu_img, qemu_img_info, supports_qcow2_zstd_compression
 import unittest
 
 test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -95,11 +95,17 @@ class TestQCow2(TestQemuImgInfo):
 
 class TestQCow3NotLazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
+    if supports_qcow2_zstd_compression():
+        compression_type = 'zstd'
+    else:
+        compression_type = 'zlib'
+
+    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options += f',compression_type={compression_type}'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
                      'refcount-bits': 16, 'corrupt': False,
-                     'compression-type': 'zstd', 'extended-l2': False }
-    human_compare = [ 'compat: 1.1', 'compression type: zstd',
+                     'compression-type': compression_type, 'extended-l2': False }
+    human_compare = [ 'compat: 1.1', f'compression type: {compression_type}',
                       'lazy refcounts: false', 'refcount bits: 16',
                       'corrupt: false', 'extended l2: false' ]
 
@@ -126,11 +132,17 @@ class TestQCow3NotLazyQMP(TestQMP):
 class TestQCow3LazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled, opening
        with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zstd'
+    if supports_qcow2_zstd_compression():
+        compression_type = 'zstd'
+    else:
+        compression_type = 'zlib'
+
+    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options += f',compression_type={compression_type}'
     qemu_options = 'lazy-refcounts=off'
     compare = { 'compat': '1.1', 'lazy-refcounts': True,
                 'refcount-bits': 16, 'corrupt': False,
-                'compression-type': 'zstd', 'extended-l2': False }
+                'compression-type': compression_type, 'extended-l2': False }
 
 TestImageInfoSpecific = None
 TestQemuImgInfo = None
-- 
2.35.1


