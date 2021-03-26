Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0D34AA9B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:57:40 +0100 (CET)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnu7-0006IG-W4
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPnso-0004dC-Gi
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPnsl-0002Wj-FW
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lXYHYx7LYQealjtHRsx6hYEwV7O5G1hEeWdoq4AAs0=;
 b=W/k0APyjaHVEtJ2gS5yQOFkcjaC3h0yijcJm5m/hferzFeycz5tEIQ52IvixqKUffuBh+T
 bnQFzRcPpAYXWEYWvmbVccAhryTrfFJrFLLFPjAjJ1nWMCnucmhCDLk9tNE2vf4SKecrKD
 U6r3wpUeAFaghPR3g4QEtEuNjRApiBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-tuE3hKtuPpS1U3KiPfCLtw-1; Fri, 26 Mar 2021 10:56:11 -0400
X-MC-Unique: tuE3hKtuPpS1U3KiPfCLtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F39101926DCE;
 Fri, 26 Mar 2021 14:55:13 +0000 (UTC)
Received: from localhost (ovpn-113-48.ams2.redhat.com [10.36.113.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F366608BA;
 Fri, 26 Mar 2021 14:55:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] qcow2: Force preallocation with data-file-raw
Date: Fri, 26 Mar 2021 15:55:08 +0100
Message-Id: <20210326145509.163455-2-mreitz@redhat.com>
In-Reply-To: <20210326145509.163455-1-mreitz@redhat.com>
References: <20210326145509.163455-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the qcow2 data-file-raw bit means that you can ignore the
qcow2 metadata when reading from the external data file.  It does not
mean that you have to ignore it, though.  Therefore, the data read must
be the same regardless of whether you interpret the metadata or whether
you ignore it, and thus the L1/L2 tables must all be present and give a
1:1 mapping.

This patch changes 244's output: First, the qcow2 file is larger right
after creation, because of metadata preallocation.  Second, the qemu-img
map output changes: Everything that was not explicitly discarded or
zeroed is now a data area.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c              | 34 ++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/244.out |  9 ++++-----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..9920c756eb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3502,6 +3502,28 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         ret = -EINVAL;
         goto out;
     }
+    if (qcow2_opts->data_file_raw &&
+        qcow2_opts->preallocation == PREALLOC_MODE_OFF)
+    {
+        /*
+         * data-file-raw means that "the external data file can be
+         * read as a consistent standalone raw image without looking
+         * at the qcow2 metadata."  It does not say that the metadata
+         * must be ignored, though (and the qcow2 driver in fact does
+         * not ignore it), so the L1/L2 tables must be present and
+         * give a 1:1 mapping, so you get the same result regardless
+         * of whether you look at the metadata or whether you ignore
+         * it.
+         */
+        qcow2_opts->preallocation = PREALLOC_MODE_METADATA;
+
+        /*
+         * Cannot use preallocation with backing files, but giving a
+         * backing file when specifying data_file_raw is an error
+         * anyway.
+         */
+        assert(!qcow2_opts->has_backing_file);
+    }
 
     if (qcow2_opts->data_file) {
         if (version < 3) {
@@ -4237,6 +4259,18 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
             error_setg_errno(errp, -ret, "Failed to grow the L1 table");
             goto fail;
         }
+
+        if (data_file_is_raw(bs) && prealloc == PREALLOC_MODE_OFF) {
+            /*
+             * When creating a qcow2 image with data-file-raw, we enforce
+             * at least prealloc=metadata, so that the L1/L2 tables are
+             * fully allocated and reading from the data file will return
+             * the same data as reading from the qcow2 image.  When the
+             * image is grown, we must consequently preallocate the
+             * metadata structures to cover the added area.
+             */
+            prealloc = PREALLOC_MODE_METADATA;
+        }
     }
 
     switch (prealloc) {
diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
index 7269b4295a..1a3ae31dde 100644
--- a/tests/qemu-iotests/244.out
+++ b/tests/qemu-iotests/244.out
@@ -83,7 +83,7 @@ qcow2 file size after I/O: 327680
 === Standalone image with external data file (valid raw) ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 data_file=TEST_DIR/t.IMGFMT.data data_file_raw=on
-qcow2 file size before I/O: 196616
+qcow2 file size before I/O: 327680
 
 wrote 4194304/4194304 bytes at offset 1048576
 4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -93,11 +93,10 @@ wrote 3145728/3145728 bytes at offset 3145728
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
 
-[{ "start": 0, "length": 1048576, "depth": 0, "zero": true, "data": false},
-{ "start": 1048576, "length": 1048576, "depth": 0, "zero": false, "data": true, "offset": 1048576},
+[{ "start": 0, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": 0},
 { "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
-{ "start": 4194304, "length": 1048576, "depth": 0, "zero": true, "data": false, "offset": 4194304},
-{ "start": 5242880, "length": 61865984, "depth": 0, "zero": true, "data": false}]
+{ "start": 4194304, "length": 2097152, "depth": 0, "zero": true, "data": false, "offset": 4194304},
+{ "start": 6291456, "length": 60817408, "depth": 0, "zero": false, "data": true, "offset": 6291456}]
 
 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-- 
2.29.2


