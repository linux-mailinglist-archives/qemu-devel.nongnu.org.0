Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83D3A693A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:47:08 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnrn-0007Nb-CY
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnpD-0003Uj-QC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp8-0004R3-23
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xf0/ioP3sTr0iCG52PRwvJkqbB8YsZ+UFruvhZnKsn8=;
 b=LUPYMYY7cylLL7cYmaSUTGCXGSdBshqVcatZCV5W5Ft7M1LwpWUEw7WVMlaOcCE0Sdok6Y
 VyFDymAZ1jW9UhNxZfhgXxSj/yNtQQmpkKXRest0NMY+cb0iqve/VducSPDiuV+ze6o/F4
 GX+iS0oM/YJhsAse4RZ0D70kNJG+eQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-cUkNODoOPCCfTdqiqjfM0A-1; Mon, 14 Jun 2021 10:44:19 -0400
X-MC-Unique: cUkNODoOPCCfTdqiqjfM0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2309C8015D0;
 Mon, 14 Jun 2021 14:44:18 +0000 (UTC)
Received: from localhost (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 952A15D9CA;
 Mon, 14 Jun 2021 14:44:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/4] iotests/308: Test allow-other
Date: Mon, 14 Jun 2021 16:44:07 +0200
Message-Id: <20210614144407.134243-5-mreitz@redhat.com>
In-Reply-To: <20210614144407.134243-1-mreitz@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot reasonably test the main point of allow-other, which is to
allow users other than the current one to access the FUSE export,
because that would require access to sudo, which this test most likely
will not have.  (Also, we would need to figure out some user/group that
is on the machine and that is not the current user/group, which may
become a bit hairy.)

But we can test some byproducts: First, whether changing permissions
works (our FUSE code only allows so for allow-other=true), and second,
whether the kernel applies permission checks with allow-other=true
(because that implies default_permissions).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/308     | 91 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out | 47 ++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index f122065d0f..1b2f908947 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -334,6 +334,97 @@ echo '=== Compare copy with original ==='
 
 $QEMU_IMG compare -f raw -F $IMGFMT "$COPIED_IMG" "$TEST_IMG"
 
+echo
+echo '=== Test permissions ==='
+
+# Test that you can only change permissions on the export with allow-other=true.
+# We cannot really test the primary reason behind allow-other (i.e. to allow
+# users other than the current one access to the export), because for that we
+# would need sudo, which realistically nobody will allow this test to use.
+# What we can do is test that allow-other=true also enables default_permissions,
+# i.e. whether we can still read from the file if we remove the read permission.
+
+# $1: allow-other value ('true' or 'false')
+run_permission_test()
+{
+    # Below, we want to test permission checks on the export.  To do that
+    # properly, we need to ensure that those checks are not bypassed, so we have
+    # to drop cap_dac_override.
+    # (Note that cap_dac_read_search bypasses read permission checks, which is
+    # why we try to open the file R/W below, so we do not have to care about
+    # cap_dac_read_search here.)
+    # $capsh is effectively a shell command, i.e. can be used like:
+    #   $capsh -c "$command $args..."
+    # By default it is just bash.
+    capsh='/usr/bin/env bash'
+    if type -p capsh > /dev/null; then
+        if ! capsh --has-p=cap_dac_override 2>/dev/null; then
+            # No cap_dac_override, we are good to go
+            true # pass
+        elif capsh --has-p=cap_setpcap 2>/dev/null; then
+            # We will need to drop cap_dac_override, but doing so requires
+            # cap_setpcap in turn
+            capsh='capsh --drop=cap_dac_override --'
+        else
+            # Hopefully a rare case
+            _notrun 'CAP_DAC_OVERRIDE must be dropped, but this cannot be' \
+                    'done without CAP_SETPCAP'
+        fi
+    elif [ "$(id -u)" -ne 0 ]; then
+        # Non-root users probably do not have those capabilities, so try to get
+        # by without capsh
+        true # pass
+    else
+        # Running this test as root without capsh on the system should be a rare
+        # case...
+        _notrun 'No capsh found while run as root'
+    fi
+
+    _launch_qemu \
+        -blockdev \
+        "$IMGFMT,node-name=node-format,file.driver=file,file.filename=$TEST_IMG"
+
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'qmp_capabilities'}" \
+        'return'
+
+    # Writable so we can open it R/W below
+    fuse_export_add 'export' \
+        "'mountpoint': '$EXT_MP',
+         'writable': true,
+         'allow-other': $1"
+
+    echo '(Invoking chmod)'
+    chmod 666 "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+    stat -c 'Permissions post-chmod: %a' "$EXT_MP"
+
+    echo '(Removing all permissions)'
+    chmod 000 "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+
+    # We want a permission denied here (with allow-other=true)
+    # (Use $QEMU_IO_PROG, because $capsh will not know the wrapper that is
+    # $QEMU_IO)
+    # Use blkdebug to force-take the WRITE permission so this will definitely
+    # try to open the export with O_RDWR.
+    imgopts="driver=blkdebug,take-child-perms.0=write,"
+    imgopts+="image.driver=file,image.filename=$EXT_MP"
+    $capsh -c "$QEMU_IO_PROG -c quit --image-opts '$imgopts'" 2>&1 \
+        | _filter_qemu_io | _filter_testdir | _filter_imgfmt
+
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'quit'}" \
+        'return'
+
+    wait=yes _cleanup_qemu
+}
+
+for ao in 'false' 'true'; do
+    echo
+    echo "--- allow-other=$ao ---"
+
+    run_permission_test "$ao"
+done
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
index 466e7e0267..4620efbb0d 100644
--- a/tests/qemu-iotests/308.out
+++ b/tests/qemu-iotests/308.out
@@ -167,4 +167,51 @@ OK: Post-truncate image size is as expected
 
 === Compare copy with original ===
 Images are identical.
+
+=== Test permissions ===
+
+--- allow-other=false ---
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'block-export-add',
+          'arguments': {
+              'type': 'fuse',
+              'id': 'export',
+              'node-name': 'node-format',
+              'mountpoint': 'TEST_DIR/t.IMGFMT.fuse',
+         'writable': true,
+         'allow-other': false
+          } }
+{"return": {}}
+(Invoking chmod)
+chmod: changing permissions of 'TEST_DIR/t.IMGFMT.fuse': Operation not supported
+Permissions post-chmod: 600
+(Removing all permissions)
+chmod: changing permissions of 'TEST_DIR/t.IMGFMT.fuse': Operation not supported
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
+
+--- allow-other=true ---
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'block-export-add',
+          'arguments': {
+              'type': 'fuse',
+              'id': 'export',
+              'node-name': 'node-format',
+              'mountpoint': 'TEST_DIR/t.IMGFMT.fuse',
+         'writable': true,
+         'allow-other': true
+          } }
+{"return": {}}
+(Invoking chmod)
+Permissions post-chmod: 666
+(Removing all permissions)
+qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT.fuse': Permission denied
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
 *** done
-- 
2.31.1


