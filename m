Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE73B45B2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:36:40 +0200 (CEST)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmwh-0001La-5g
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmjx-0006Jt-8A
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmjt-0005T8-Fx
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624631004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+yT5ZMU1XZ/9fjD7v25uVb3Bjwi4nmyO4pvaq8wz0s=;
 b=eMUEFteTJvYM+ZFXMBUuf4qE3aRhglrIIAU0OxJt/TB39fQD2HHUb25BRJPe/SV1q2SnhS
 FPChqI0l+QzLj+WhzQ1bJ0FGjxwTx3M8+wsscSmX6v1TV+gpjOpEW4WEteotmFBaGU10WW
 zhDXHkOh92Vd4fhHiTZcg+30zLvlxf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-vAJ65bd0PuqXE0bC-rXqfA-1; Fri, 25 Jun 2021 10:23:23 -0400
X-MC-Unique: vAJ65bd0PuqXE0bC-rXqfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0524E36311;
 Fri, 25 Jun 2021 14:23:22 +0000 (UTC)
Received: from localhost (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E9255D9C6;
 Fri, 25 Jun 2021 14:23:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/6] export/fuse: Pass default_permissions for mount
Date: Fri, 25 Jun 2021 16:23:12 +0200
Message-Id: <20210625142317.271673-2-mreitz@redhat.com>
In-Reply-To: <20210625142317.271673-1-mreitz@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not do any permission checks in fuse_open(), so let the kernel do
them.  We already let fuse_getattr() report the proper UNIX permissions,
so this should work the way we want.

This causes a change in 308's reference output, because now opening a
non-writable export with O_RDWR fails already, instead of only actually
attempting to write to it.  (That is an improvement.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
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


