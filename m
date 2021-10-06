Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD7423E64
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:06:28 +0200 (CEST)
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6ct-0008VQ-I7
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YT-0004lE-H4
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YP-00058P-OQ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633525308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Y3nLX6CO4IW3BVz2wG2uQOPDJRPzSW+K+iLfFDrg3E=;
 b=bc/DILN0UnVOgI6E4eIS4DvGCu6Y8x5E9Q6RbOmwuCBeuL34IWYgduanofcwWgnYpUoD59
 qfL/HrwS1Iz5KbAsKe+4FoHkdZhbZ+8ko62O9x7SG03VOTbf7ElpBWOihZg1L8svpiLCvk
 R4JKLWtnrC1bi4bkUmQGlnlYw2DtHQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-0YTXZYsMO0-x1yha3eRHpQ-1; Wed, 06 Oct 2021 09:01:47 -0400
X-MC-Unique: 0YTXZYsMO0-x1yha3eRHpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38D6E101AFAB;
 Wed,  6 Oct 2021 13:01:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81C3F60C9F;
 Wed,  6 Oct 2021 13:01:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] qemu-iotests: fix image-fleecing pylint errors
Date: Wed,  6 Oct 2021 09:01:00 -0400
Message-Id: <20211006130100.389521-3-eesposit@redhat.com>
In-Reply-To: <20211006130100.389521-1-eesposit@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem here is that some variables are formatted with
unnecessary spaces to make it prettier and easier to read.

However, pylint complains about those additional spaces.
A solution is to transform them as string with arbitrary spaces,
and then convert it back into a tuple.

Removing the spaces makes it a little bit ugly, and directly
using the string forces us to change the test reference output
accordingly, which will 1) contain ugly weird formatted strings,
2) is not portable if somebody changes the formatting in the test
string.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 43 +++++++++++++++----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 8c5472f421..9709ecbba1 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -30,23 +30,27 @@ iotests.script_initialize(
     supported_platforms=['linux'],
 )
 
-patterns = [('0x5d', '0',         '64k'),
-            ('0xd5', '1M',        '64k'),
-            ('0xdc', '32M',       '64k'),
-            ('0xcd', '0x3ff0000', '64k')]  # 64M - 64K
-
-overwrite = [('0xab', '0',         '64k'), # Full overwrite
-             ('0xad', '0x00f8000', '64k'), # Partial-left (1M-32K)
-             ('0x1d', '0x2008000', '64k'), # Partial-right (32M+32K)
-             ('0xea', '0x3fe0000', '64k')] # Adjacent-left (64M - 128K)
-
-zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
-          ('0', '0x2010000', '32k'), # Right-end of partial-right (32M+64K)
-          ('0', '0x3fe0000', '64k')] # overwrite[3]
-
-remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
-             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
-             ('0xcd', '0x3ff0000', '64k')] # patterns[3]
+# Each string in patterns, overwrite and remainder is formatted in such way
+# for readability. Using a 3-tuple will make pylint trigger
+# "bad-whitespace" when we try to format it in the same way
+# The testing code will take care of splitting it properly.
+patterns = ['0x5d 0         64k',
+            '0xd5 1M        64k',
+            '0xdc 32M       64k',
+            '0xcd 0x3ff0000 64k']  # 64M - 64K
+
+overwrite = ['0xab 0         64k', # Full overwrite
+             '0xad 0x00f8000 64k', # Partial-left (1M-32K)
+             '0x1d 0x2008000 64k', # Partial-right (32M+32K)
+             '0xea 0x3fe0000 64k'] # Adjacent-left (64M - 128K)
+
+zeroes = ['0 0x00f8000 32k', # Left-end of partial-left (1M-32K)
+          '0 0x2010000 32k', # Right-end of partial-right (32M+64K)
+          '0 0x3fe0000 64k'] # overwrite[3]
+
+remainder = ['0xd5 0x108000  32k', # Right-end of partial-left [1]
+             '0xdc 32M       32k', # Left-end of partial-right [2]
+             '0xcd 0x3ff0000 64k'] # patterns[3]
 
 def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
@@ -56,6 +60,7 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
+        p = tuple(p.split())
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
 
@@ -124,6 +129,7 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
     for p in patterns + zeroes:
+        p = tuple(p.split())
         cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -133,6 +139,7 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
     for p in overwrite:
+        p = tuple(p.split())
         cmd = 'write -P%s %s %s' % p
         log(cmd)
         log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
@@ -142,6 +149,7 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
     for p in patterns + zeroes:
+        p = tuple(p.split())
         cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -168,6 +176,7 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
     for p in overwrite + remainder:
+        p = tuple(p.split())
         cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
-- 
2.27.0


