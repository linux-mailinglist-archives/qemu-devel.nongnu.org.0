Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CFA124510
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 11:50:48 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihWul-00083M-Dt
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 05:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ihWt6-0006dV-3k
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ihWt4-00006G-Vv
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55666
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ihWt4-00004t-RK
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576666142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Gqvng08FOpstnkGhLB5kE/YnUntbiNALGDnHLmboYM=;
 b=CPIX8gai7uCWAw5ddm7gZtI6O10uYHhNe9uExGQn9mVmUsvv3cqq6zs/2vGUMGnnnw8D2q
 y9qmOmVJyVdRi4DozwQEujkF8JRziLy0gcvMqwsM3AJAkPaaIwzzRxzJsaZdGCXnVdZHg8
 s+Z4I6iRx+QUJmt8nCnk6tiAxch6FJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-q4SdjB4YOe-s5jZ1wQh8ag-1; Wed, 18 Dec 2019 05:49:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20785477;
 Wed, 18 Dec 2019 10:49:00 +0000 (UTC)
Received: from localhost (ovpn-205-177.brq.redhat.com [10.40.205.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD33726DC6;
 Wed, 18 Dec 2019 10:48:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests/273: Filter format-specific information
Date: Wed, 18 Dec 2019 11:48:54 +0100
Message-Id: <20191218104855.42566-2-mreitz@redhat.com>
In-Reply-To: <20191218104855.42566-1-mreitz@redhat.com>
References: <20191218104855.42566-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: q4SdjB4YOe-s5jZ1wQh8ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doing this allows running this test with e.g. -o compat=3D0.10 or
-o compat=3Drefcount_bits=3D1.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/273     |  3 ++-
 tests/qemu-iotests/273.out | 27 ---------------------------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/tests/qemu-iotests/273 b/tests/qemu-iotests/273
index c355e9af47..00ff79bcf8 100755
--- a/tests/qemu-iotests/273
+++ b/tests/qemu-iotests/273
@@ -51,7 +51,8 @@ do_run_qemu()
 run_qemu()
 {
     do_run_qemu "$@" 2>&1 | _filter_testdir | _filter_qemu | _filter_qmp |
-        _filter_generated_node_ids | _filter_imgfmt | _filter_actual_image=
_size
+        _filter_generated_node_ids | _filter_imgfmt |
+        _filter_actual_image_size | _filter_img_info
 }
=20
 TEST_IMG=3D"$TEST_IMG.base" _make_test_img 64M
diff --git a/tests/qemu-iotests/273.out b/tests/qemu-iotests/273.out
index c410fee5c4..684b8d6f77 100644
--- a/tests/qemu-iotests/273.out
+++ b/tests/qemu-iotests/273.out
@@ -38,15 +38,6 @@ Testing: -blockdev file,node-name=3Dbase,filename=3DTEST=
_DIR/t.IMGFMT.base -blockdev
                     "cluster-size": 65536,
                     "format": "IMGFMT",
                     "actual-size": SIZE,
-                    "format-specific": {
-                        "type": "IMGFMT",
-                        "data": {
-                            "compat": "1.1",
-                            "lazy-refcounts": false,
-                            "refcount-bits": 16,
-                            "corrupt": false
-                        }
-                    },
                     "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
                     "backing-filename": "TEST_DIR/t.IMGFMT.base",
                     "dirty-flag": false
@@ -57,15 +48,6 @@ Testing: -blockdev file,node-name=3Dbase,filename=3DTEST=
_DIR/t.IMGFMT.base -blockdev
                 "cluster-size": 65536,
                 "format": "IMGFMT",
                 "actual-size": SIZE,
-                "format-specific": {
-                    "type": "IMGFMT",
-                    "data": {
-                        "compat": "1.1",
-                        "lazy-refcounts": false,
-                        "refcount-bits": 16,
-                        "corrupt": false
-                    }
-                },
                 "full-backing-filename": "TEST_DIR/t.IMGFMT.mid",
                 "backing-filename": "TEST_DIR/t.IMGFMT.mid",
                 "dirty-flag": false
@@ -136,15 +118,6 @@ Testing: -blockdev file,node-name=3Dbase,filename=3DTE=
ST_DIR/t.IMGFMT.base -blockdev
                 "cluster-size": 65536,
                 "format": "IMGFMT",
                 "actual-size": SIZE,
-                "format-specific": {
-                    "type": "IMGFMT",
-                    "data": {
-                        "compat": "1.1",
-                        "lazy-refcounts": false,
-                        "refcount-bits": 16,
-                        "corrupt": false
-                    }
-                },
                 "full-backing-filename": "TEST_DIR/t.IMGFMT.base",
                 "backing-filename": "TEST_DIR/t.IMGFMT.base",
                 "dirty-flag": false
--=20
2.23.0


