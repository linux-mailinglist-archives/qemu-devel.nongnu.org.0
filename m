Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315DF4CA634
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:43:07 +0100 (CET)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPFx-0003CZ-Un
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMe-0001Bt-VK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMc-0004T3-Pn
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/mEveQGhuLRyrWRL5vGNIHLHFEUh09Q/fTdjPNZbRA=;
 b=QfSV6/oLqclMK6ve7Tj7ajOa+qonZqux0meHFtkiUAb8PpCeQ/beaV2qtAb3qRxYbwGAvr
 IzzRTicitRZd94whE/rVsZF6yhQ2ALNX3+uqdK9LwhQzCs32C3RvIw1mC3RkhgHryAdHTN
 50Yr9UMQPjfutfYEmdkxQjjxl4V3Afg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-ut34EV9iPS213dZF8DHmgA-1; Wed, 02 Mar 2022 07:45:49 -0500
X-MC-Unique: ut34EV9iPS213dZF8DHmgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AEF71006AA6;
 Wed,  2 Mar 2022 12:45:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE520842D7;
 Wed,  2 Mar 2022 12:45:47 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/3] iotests/065: Check for zstd support
Date: Wed,  2 Mar 2022 13:45:39 +0100
Message-Id: <20220302124540.45083-3-hreitz@redhat.com>
In-Reply-To: <20220302124540.45083-1-hreitz@redhat.com>
References: <20220302124540.45083-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
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
index f7c1b68dad..d1a72923c9 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_pipe
+from iotests import qemu_img, qemu_img_pipe, supports_qcow2_zstd_compression
 import unittest
 
 test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -96,11 +96,17 @@ class TestQCow2(TestQemuImgInfo):
 
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
 
@@ -127,11 +133,17 @@ class TestQCow3NotLazyQMP(TestQMP):
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
2.34.1


