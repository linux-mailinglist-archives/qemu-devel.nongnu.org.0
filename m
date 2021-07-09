Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7F3C23FE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qEx-0007Nk-PV
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzD-0004t1-Jh
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz8-0003ha-Lp
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSXNHILW/qBUG/dPxo/gOm7WMfFws04S25zf9ANw4QI=;
 b=UXjq3C31Q2IsTCY3CSdmpF4iqEyKVkZkNuqcAR5AZRLC1LBsE065po6DbCGlanQqJUUZFJ
 eMUuFmVaHorSJBsdJ6LgUbi/3xawyZZBgPASqD1JQSBOCYRiRekAI+V23quF6BUXdWDY86
 SyG+j54rtLC7xMu/eiRCpngd5t1E9dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-PZau7TUCMpCu6IK1r_b0MA-1; Fri, 09 Jul 2021 08:51:59 -0400
X-MC-Unique: PZau7TUCMpCu6IK1r_b0MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A441084F40;
 Fri,  9 Jul 2021 12:51:58 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDB760854;
 Fri,  9 Jul 2021 12:51:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/28] qcow2: Prohibit backing file changes in 'qemu-img amend'
Date: Fri,  9 Jul 2021 14:50:27 +0200
Message-Id: <20210709125035.191321-21-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

This was deprecated back in bc5ee6da7 (qcow2: Deprecate use of
qemu-img amend to change backing file), and no one in the meantime has
given any reasons why it should be supported.  Time to make change
attempts a hard error (but for convenience, specifying the _same_
backing chain is not forbidden).  Update a couple of iotests to match.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210503213600.569128-2-eblake@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/deprecated.rst       | 12 ------------
 docs/system/removed-features.rst | 12 ++++++++++++
 block/qcow2.c                    | 13 ++++---------
 tests/qemu-iotests/061           |  3 +++
 tests/qemu-iotests/061.out       |  3 ++-
 tests/qemu-iotests/082.out       |  6 ++++--
 6 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 70e08baff6..9626a1fb57 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -282,18 +282,6 @@ this CPU is also deprecated.
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
index 2b21bd39ab..b64ea55194 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -491,6 +491,18 @@ topologies described with -smp include all possible cpus, i.e.
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
index ee4530cdbd..0cac2eda36 100644
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
index e26d94a0df..9507c223bd 100755
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
index ee30da2665..7ecbd4dea8 100644
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
index b70c12c139..077ed0f2c7 100644
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


