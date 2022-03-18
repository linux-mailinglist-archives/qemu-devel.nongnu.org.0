Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C984DE2A9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:40:36 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJOl-0007kL-6T
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:40:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLQ-0002Wx-Fx
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLL-0005Zb-OP
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/qldgWi4lnWYA2nvmDxAvwHKsTQwe81x73WtjYyKX0=;
 b=QrihKP0vooZevZp3SPHvG9doc/o+t4ScVdpuSY/qYmvPdqRYvmASY9lQRjuM9AGo6u2bnP
 +AAfmQiajUDQ5TCQbFMPx0f+hJW1UZtYWOu6D/OeY3bQK6QfzyeKHHrvByEfJYYQ+ajyp+
 e0+LIhfp1d8oB2+15g9R92JScthd15Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-eTJxuFi8NbivNBVBi8htTQ-1; Fri, 18 Mar 2022 16:37:00 -0400
X-MC-Unique: eTJxuFi8NbivNBVBi8htTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7744B811E75;
 Fri, 18 Mar 2022 20:36:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA98403373;
 Fri, 18 Mar 2022 20:36:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] iotests/migration-permissions: fixup
Date: Fri, 18 Mar 2022 16:36:51 -0400
Message-Id: <20220318203655.676907-12-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Merge into prior commit)

Note, this is a quick hack band-aid, but a follow-up patch spends the
time to refactor it a bit. This is just the quick stop-gap to prevent
bisection failures.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/migration-permissions | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
index 6be02581c7..c7afb1bd2c 100755
--- a/tests/qemu-iotests/tests/migration-permissions
+++ b/tests/qemu-iotests/tests/migration-permissions
@@ -69,7 +69,7 @@ class TestMigrationPermissions(iotests.QMPTestCase):
     def test_post_migration_permissions(self):
         # Try to access the image R/W, which should fail because virtio-blk
         # has not been configured with share-rw=on
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
         if not log.strip():
             print('ERROR (pre-migration): qemu-io should not be able to '
                   'access this image, but it reported no error')
@@ -84,7 +84,7 @@ class TestMigrationPermissions(iotests.QMPTestCase):
 
         # Try the same qemu-io access again, verifying that the WRITE
         # permission remains unshared
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
         if not log.strip():
             print('ERROR (post-migration): qemu-io should not be able to '
                   'access this image, but it reported no error')
-- 
2.34.1


