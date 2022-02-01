Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35794A60F0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:04:16 +0100 (CET)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvdf-0000Hp-46
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRW-0002n0-K8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRL-00030f-3r
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeCkWUDsPMReqX8PROPWTVA1UQcsZbz/ulfWY0PXodM=;
 b=Sq18lulGCcNGs9UJy/QNIER0XxqPDrvSyldPORC5VtBwZlgtpyV5Z3ZpIzqFq+mAnmyJiG
 mKFt/0so3IccZUxUn9KFgBH0MV9uXSh96MLrbma9vPcG/167+bDXgsOl8+LPzacd8yzEX4
 jihGwQ+GT0XMMRb2rIcTvFLuzvGIG1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Wm6Y0iN1NHmgNh9fVXHfFA-1; Tue, 01 Feb 2022 09:43:47 -0500
X-MC-Unique: Wm6Y0iN1NHmgNh9fVXHfFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471D764093;
 Tue,  1 Feb 2022 14:43:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B91C74E89;
 Tue,  1 Feb 2022 14:43:38 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/24] iotest 302: use img_info_log() helper
Date: Tue,  1 Feb 2022 15:42:22 +0100
Message-Id: <20220201144233.617021-14-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Instead of qemu_img_log("info", ..) use generic helper img_info_log().

img_info_log() has smarter logic. For example it use filter_img_info()
to filter output, which in turns filter a compression type. So it will
help us in future when we implement a possibility to use zstd
compression by default (with help of some runtime config file or maybe
build option). For now to test you should recompile qemu with a small
addition into block/qcow2.c before
"if (qcow2_opts->has_compression_type":

    if (!qcow2_opts->has_compression_type && version >= 3) {
        qcow2_opts->has_compression_type = true;
        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
    }

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20211223160144.1097696-12-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/302     | 4 +++-
 tests/qemu-iotests/302.out | 7 +++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
index 5695af4914..a6d79e727b 100755
--- a/tests/qemu-iotests/302
+++ b/tests/qemu-iotests/302
@@ -34,6 +34,7 @@ from iotests import (
     qemu_img_measure,
     qemu_io,
     qemu_nbd_popen,
+    img_info_log,
 )
 
 iotests.script_initialize(supported_fmts=["qcow2"])
@@ -88,6 +89,7 @@ with tarfile.open(tar_file, "w") as tar:
             tar_file):
 
         iotests.log("=== Target image info ===")
+        # Not img_info_log as it enforces imgfmt, but now we print info on raw
         qemu_img_log("info", nbd_uri)
 
         qemu_img(
@@ -99,7 +101,7 @@ with tarfile.open(tar_file, "w") as tar:
             nbd_uri)
 
         iotests.log("=== Converted image info ===")
-        qemu_img_log("info", nbd_uri)
+        img_info_log(nbd_uri)
 
         iotests.log("=== Converted image check ===")
         qemu_img_log("check", nbd_uri)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index e2f6077e83..3e7c281b91 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 
 === Converted image info ===
-image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-file format: qcow2
+image: TEST_IMG
+file format: IMGFMT
 virtual size: 1 GiB (1073741824 bytes)
-disk size: unavailable
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
-- 
2.34.1


