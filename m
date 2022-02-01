Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987B4A60DB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:58:59 +0100 (CET)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvYY-0005l4-FK
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuR5-0002g2-6V
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQz-0002z9-Q0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1Sr6Q+drHIUg8sjpecirbU02ibC7yPeZoah9O3blFA=;
 b=ha3NhwhVnP2fFBs9drRrLEG5v1KLsFNqhwlYv6V7fmGwo8KrBeLpuLRRz1bcEDKnu7y8rp
 U5QCzAmoZyWNEFlkVJdewthIsjHxUCM2nsXTAbVpkAvi4eemqyUh4pFvyjfjH2y42cV2VW
 uGw8iR4SD9y4oiPlwXp4Ec1rQkZR3Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-CGe8m3SoMUqc84eEDxmvGA-1; Tue, 01 Feb 2022 09:43:37 -0500
X-MC-Unique: CGe8m3SoMUqc84eEDxmvGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F538143E5;
 Tue,  1 Feb 2022 14:43:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 580FE7DE23;
 Tue,  1 Feb 2022 14:43:36 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/24] iotests.py: filter compression type out
Date: Tue,  1 Feb 2022 15:42:21 +0100
Message-Id: <20220201144233.617021-13-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type) and it's in bash.
So for now we can safely filter out compression type in all qcow2
tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-11-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/206.out    | 10 +++++-----
 tests/qemu-iotests/242.out    | 10 +++++-----
 tests/qemu-iotests/274.out    | 10 +++++-----
 tests/qemu-iotests/iotests.py |  2 ++
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index 80cd274223..7e95694777 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -18,7 +18,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -42,7 +42,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -66,7 +66,7 @@ virtual size: 32 MiB (33554432 bytes)
 cluster_size: 2097152
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 1
     corrupt: false
@@ -92,7 +92,7 @@ backing file: TEST_IMG.base
 backing file format: IMGFMT
 Format specific information:
     compat: 0.10
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     refcount bits: 16
 
 === Successful image creation (encrypted) ===
@@ -109,7 +109,7 @@ encrypted: yes
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     encrypt:
diff --git a/tests/qemu-iotests/242.out b/tests/qemu-iotests/242.out
index 3759c99284..ce231424a7 100644
--- a/tests/qemu-iotests/242.out
+++ b/tests/qemu-iotests/242.out
@@ -12,7 +12,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -34,7 +34,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -68,7 +68,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -110,7 +110,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -161,7 +161,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 1d2928e14d..1ce40d839a 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -50,7 +50,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -79,7 +79,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -114,7 +114,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -141,7 +141,7 @@ virtual size: 2 MiB (2097152 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -176,7 +176,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 65780c6098..8cdb381f2a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -497,6 +497,8 @@ def filter_img_info(output, filename):
                       'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
                       line)
         line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
+        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                      line)
         lines.append(line)
     return '\n'.join(lines)
 
-- 
2.34.1


