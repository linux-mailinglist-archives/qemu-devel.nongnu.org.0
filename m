Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95B372286
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:39:11 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgHW-0007RI-KS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEm-0006LY-Ne
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEf-0005Ig-Ar
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620077770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/EVa/TvTqAxA9A7X2/btTeN1Dt9Ba0iSaPg9N/2owg=;
 b=eVeCVZJ9QZ8r6zZjum35uGOfHXJYpRe9OlGzAEsgjjVfRF2fmwHO8jV4mopJQW4wx6zE8J
 EfDRm45LiUKnsEeixl/OMaxHxVYs9Vt9RQZD0PcDc1C3GGCqioXW3pU6ztEp967yQqTs9t
 xrDhpYgvypJWQFjmaSp/1C7kO0aG994=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-1YgcEyQlOVGdKmdWk4SuKg-1; Mon, 03 May 2021 17:36:09 -0400
X-MC-Unique: 1YgcEyQlOVGdKmdWk4SuKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CCC918B9ECB;
 Mon,  3 May 2021 21:36:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCAF960C05;
 Mon,  3 May 2021 21:36:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qcow2: Prohibit backing file changes in 'qemu-img amend'
Date: Mon,  3 May 2021 16:35:59 -0500
Message-Id: <20210503213600.569128-2-eblake@redhat.com>
In-Reply-To: <20210503213600.569128-1-eblake@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 "open list:qcow2" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was deprecated back in bc5ee6da7 (qcow2: Deprecate use of
qemu-img amend to change backing file), and no one in the meantime has
given any reasons why it should be supported.  Time to make change
attempts a hard error (but for convenience, specifying the _same_
backing chain is not forbidden).  Update a couple of iotests to match.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/system/deprecated.rst       | 12 ------------
 docs/system/removed-features.rst | 12 ++++++++++++
 block/qcow2.c                    | 13 ++++---------
 tests/qemu-iotests/061           |  3 +++
 tests/qemu-iotests/061.out       |  3 ++-
 tests/qemu-iotests/082.out       |  6 ++++--
 6 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae862528a..9ec1a9d0e03e 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -315,18 +315,6 @@ this CPU is also deprecated.
 Related binaries
 ----------------

-qemu-img amend to adjust backing file (since 5.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''
-
-The use of ``qemu-img amend`` to modify the name or format of a qcow2
-backing image is deprecated; this functionality was never fully
-documented or tested, and interferes with other amend operations that
-need access to the original backing image (such as deciding whether a
-v3 zero cluster may be left unallocated when converting to a v2
-image).  Rather, any changes to the backing chain should be performed
-with ``qemu-img rebase -u`` either before or after the remaining
-changes being performed by amend, as appropriate.
-
 qemu-img backing file without format (since 5.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 29e90601a51a..28b5df757d35 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -454,6 +454,18 @@ topologies described with -smp include all possible cpus, i.e.
 The ``enforce-config-section`` property was replaced by the
 ``-global migration.send-configuration={on|off}`` option.

+qemu-img amend to adjust backing file (removed in 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The use of ``qemu-img amend`` to modify the name or format of a qcow2
+backing image was never fully documented or tested, and interferes
+with other amend operations that need access to the original backing
+image (such as deciding whether a v3 zero cluster may be left
+unallocated when converting to a v2 image).  Any changes to the
+backing chain should be performed with ``qemu-img rebase -u`` either
+before or after the remaining changes being performed by amend, as
+appropriate.
+
 Block devices
 -------------

diff --git a/block/qcow2.c b/block/qcow2.c
index 9727ae8fe341..898c4fc4464c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5620,15 +5620,10 @@ static int qcow2_amend_options(BlockDriverState *bs, QemuOpts *opts,
     if (backing_file || backing_format) {
         if (g_strcmp0(backing_file, s->image_backing_file) ||
             g_strcmp0(backing_format, s->image_backing_format)) {
-            warn_report("Deprecated use of amend to alter the backing file; "
-                        "use qemu-img rebase instead");
-        }
-        ret = qcow2_change_backing_file(bs,
-                    backing_file ?: s->image_backing_file,
-                    backing_format ?: s->image_backing_format);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "Failed to change the backing file");
-            return ret;
+            error_setg(errp, "Cannot amend the backing file");
+            error_append_hint(errp,
+                              "You can use 'qemu-img rebase' instead.\n");
+            return -EINVAL;
         }
     }

diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index e26d94a0df31..9507c223bda4 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -167,6 +167,9 @@ _make_test_img -o "compat=1.1" 64M
 TEST_IMG="$TEST_IMG.base" _make_test_img -o "compat=1.1" 64M
 $QEMU_IO -c "write -P 0x2a 0 128k" "$TEST_IMG.base" | _filter_qemu_io
 $QEMU_IO -c "read -P 0 0 128k" "$TEST_IMG" | _filter_qemu_io
+$QEMU_IMG amend -o "backing_file=$TEST_IMG.base,backing_fmt=qcow2" \
+	  "$TEST_IMG" && echo "unexpected pass"
+$QEMU_IMG rebase -u -b "$TEST_IMG.base" -F qcow2 "$TEST_IMG"
 $QEMU_IMG amend -o "backing_file=$TEST_IMG.base,backing_fmt=qcow2" "$TEST_IMG"
 $QEMU_IO -c "read -P 0x2a 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index ee30da266514..7ecbd4dea875 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -370,7 +370,8 @@ wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead
+qemu-img: Cannot amend the backing file
+You can use 'qemu-img rebase' instead.
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index b70c12c1393d..077ed0f2c7d9 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -808,12 +808,14 @@ Amend options for 'qcow2':
   size=<size>            - Virtual disk size

 Testing: amend -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,help TEST_DIR/t.qcow2
-qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead
+qemu-img: Cannot amend the backing file
+You can use 'qemu-img rebase' instead.

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

 Testing: amend -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,? TEST_DIR/t.qcow2
-qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead
+qemu-img: Cannot amend the backing file
+You can use 'qemu-img rebase' instead.

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

-- 
2.31.1


