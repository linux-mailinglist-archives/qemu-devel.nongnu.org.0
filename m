Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60CA3C23D8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:58:41 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q5Y-0001Hz-Ns
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyV-0003gU-8h
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyS-0003S7-Hs
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XnMxk5BiUW3bAyVahjvHzD4sZnncqjXAf3PeEQZmB0=;
 b=PocHlnDAqPKl7JOWl/zZPR2PcUUQC9FhkK0UJarxBUVG2l/tsNGw8eF0X3rXMDCT+051kF
 4ta8GnfTYuKIymrszaM+UvAaluZZEI9nrE6FBOSZWT5OarVlcv73UZwJst74CZc9LxneBo
 FstmIrfKztHb3lXzYXwqUvyiA+r3EHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-dY_dTclzNL-XnClCjKajIA-1; Fri, 09 Jul 2021 08:51:18 -0400
X-MC-Unique: dY_dTclzNL-XnClCjKajIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76F53804140;
 Fri,  9 Jul 2021 12:51:17 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8129D60843;
 Fri,  9 Jul 2021 12:51:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/28] export/fuse: Pass default_permissions for mount
Date: Fri,  9 Jul 2021 14:50:17 +0200
Message-Id: <20210709125035.191321-11-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

We do not do any permission checks in fuse_open(), so let the kernel do
them.  We already let fuse_getattr() report the proper UNIX permissions,
so this should work the way we want.

This causes a change in 308's reference output, because now opening a
non-writable export with O_RDWR fails already, instead of only actually
attempting to write to it.  (That is an improvement.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210625142317.271673-2-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c        | 8 ++++++--
 tests/qemu-iotests/308     | 3 ++-
 tests/qemu-iotests/308.out | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 38f74c94da..d0b88e8f80 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -153,8 +153,12 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
     struct fuse_args fuse_args;
     int ret;
 
-    /* Needs to match what fuse_init() sets.  Only max_read must be supplied. */
-    mount_opts = g_strdup_printf("max_read=%zu", FUSE_MAX_BOUNCE_BYTES);
+    /*
+     * max_read needs to match what fuse_init() sets.
+     * max_write need not be supplied.
+     */
+    mount_opts = g_strdup_printf("max_read=%zu,default_permissions",
+                                 FUSE_MAX_BOUNCE_BYTES);
 
     fuse_argv[0] = ""; /* Dummy program name */
     fuse_argv[1] = "-o";
diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index f122065d0f..11c28a75f2 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -215,7 +215,8 @@ echo '=== Writable export ==='
 fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP', 'writable': true"
 
 # Check that writing to the read-only export fails
-$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" | _filter_qemu_io
+$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" 2>&1 \
+    | _filter_qemu_io | _filter_testdir | _filter_imgfmt
 
 # But here it should work
 $QEMU_IO -f raw -c 'write -P 42 1M 64k' "$EXT_MP" | _filter_qemu_io
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
index 466e7e0267..0e9420645f 100644
--- a/tests/qemu-iotests/308.out
+++ b/tests/qemu-iotests/308.out
@@ -91,7 +91,7 @@ virtual size: 0 B (0 bytes)
               'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
           } }
 {"return": {}}
-write failed: Permission denied
+qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'TEST_DIR/t.IMGFMT': Permission denied
 wrote 65536/65536 bytes at offset 1048576
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1048576
-- 
2.31.1


