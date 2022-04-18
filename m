Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5E505F4E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:22:56 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYpj-0002gG-3o
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYig-0001PX-Nb
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiW-0004o6-1X
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSwo9srhyaW9iw8x79yYgGPlDSUeQthQ0hdU1dQcfd0=;
 b=NvZvlUeGIfurd6RInladMGo0eYwj9YAmz3SfspFSiNfZr3HsgYEy/+5tKVzBdTa+2vef5A
 xoqYHiKzaBHOZmZpqzZimR26X1kXRA4lQ81jyLlVWRNivAKy5DF5gHqQIxDDFLea9UnxR4
 DDX6xHrw0610C/AguZKc7WbLGAwC1Ng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-asBrDxQ-PNqADwaENfqzzw-1; Mon, 18 Apr 2022 17:15:17 -0400
X-MC-Unique: asBrDxQ-PNqADwaENfqzzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F10D811E76;
 Mon, 18 Apr 2022 21:15:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2499215CDCA;
 Mon, 18 Apr 2022 21:15:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] iotests/migration-permissions: use assertRaises()
 for qemu_io() negative test
Date: Mon, 18 Apr 2022 17:15:00 -0400
Message-Id: <20220418211504.943969-9-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify this test to use assertRaises for its negative testing of
qemu_io. If the exception raised does not match the one we tell it to
expect, we get *that* exception unhandled. If we get no exception, we
get a unittest assertion failure and the provided emsg printed to
screen.

If we get the CalledProcessError exception but the output is not what we
expect, we re-raise the original CalledProcessError.

Tidy.

(Note: Yes, you can reference "with" objects after that block ends; it
just means that ctx.__exit__(...) will have been called on it. It does
not *actually* go out of scope. unittests expects you to want to inspect
the Exception object, so they leave it defined post-exit.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 .../qemu-iotests/tests/migration-permissions  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
index c7afb1bd2c1..4e1da369c94 100755
--- a/tests/qemu-iotests/tests/migration-permissions
+++ b/tests/qemu-iotests/tests/migration-permissions
@@ -18,6 +18,8 @@
 #
 
 import os
+from subprocess import CalledProcessError
+
 import iotests
 from iotests import imgfmt, qemu_img_create, qemu_io
 
@@ -69,13 +71,12 @@ class TestMigrationPermissions(iotests.QMPTestCase):
     def test_post_migration_permissions(self):
         # Try to access the image R/W, which should fail because virtio-blk
         # has not been configured with share-rw=on
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
-        if not log.strip():
-            print('ERROR (pre-migration): qemu-io should not be able to '
-                  'access this image, but it reported no error')
-        else:
-            # This is the expected output
-            assert 'Is another process using the image' in log
+        emsg = ('ERROR (pre-migration): qemu-io should not be able to '
+                'access this image, but it reported no error')
+        with self.assertRaises(CalledProcessError, msg=emsg) as ctx:
+            qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        if 'Is another process using the image' not in ctx.exception.stdout:
+            raise ctx.exception
 
         # Now migrate the VM
         self.vm_s.qmp('migrate', uri=f'unix:{mig_sock}')
@@ -84,13 +85,12 @@ class TestMigrationPermissions(iotests.QMPTestCase):
 
         # Try the same qemu-io access again, verifying that the WRITE
         # permission remains unshared
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
-        if not log.strip():
-            print('ERROR (post-migration): qemu-io should not be able to '
-                  'access this image, but it reported no error')
-        else:
-            # This is the expected output
-            assert 'Is another process using the image' in log
+        emsg = ('ERROR (post-migration): qemu-io should not be able to '
+                'access this image, but it reported no error')
+        with self.assertRaises(CalledProcessError, msg=emsg) as ctx:
+            qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        if 'Is another process using the image' not in ctx.exception.stdout:
+            raise ctx.exception
 
 
 if __name__ == '__main__':
-- 
2.34.1


