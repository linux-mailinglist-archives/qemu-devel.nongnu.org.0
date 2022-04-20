Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F67508874
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:48:06 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9kb-0003hP-Tk
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e3-0002Dl-4E
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e1-000455-CH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcGgb7YudwgqGCPiPOi1JwHbHd51sPSxbL0UOVRL7e8=;
 b=fWys51Bdh9nzDltJUIhO0s5obSpqLwOUtfWkYPYxH+2/4tI7APBaGUBaZ3SxbwnjQcZSCP
 u6N462KMv6iKl9lePlLX2Mn7hDxpMUjp3tuleG1Ti61XIZ58RhHQG5lFPshAksCo0oQ/a+
 Dl08WRQSO5NbZl7rsOeisOfV7HjijQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-OHdpYEecPaOwJXGV3-Et9Q-1; Wed, 20 Apr 2022 08:41:13 -0400
X-MC-Unique: OHdpYEecPaOwJXGV3-Et9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F151F89C5D7;
 Wed, 20 Apr 2022 12:41:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC79E2024CB6;
 Wed, 20 Apr 2022 12:41:11 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/8] iotests/065: Check for zstd support
Date: Wed, 20 Apr 2022 14:41:00 +0200
Message-Id: <20220420124104.795836-5-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some test cases run in iotest 065 want to run with zstd compression just
for added coverage.  Run them with zlib if there is no zstd support
compiled in.

Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220323105522.53660-3-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
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


