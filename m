Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EA34DE2BA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:45:46 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJTl-0000nW-T4
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:45:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0002Hd-No
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLI-0005Vw-3w
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJi/hAHtjTJ13G/8h6HfB1RO/hsylA4JEFGSo3I3dRI=;
 b=Bk8TGEQ2yTMi3IT3Z67aUQqAMnaC9V4S7Krra5ifRlUtHwOJKbHUoLSfAJd9sB3eZT0pxr
 KC+Nh+zDW33C80OW7k+X/dg2ty5i4f9Zk13/0Hq/fk5+1NOq+YZzREvH0PvdfvnOC8lupN
 PvDWpyf1qfVnrYubQS1acTZssTFPzhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474--aIWP6UXMNmmZA3DU0w9WA-1; Fri, 18 Mar 2022 16:36:56 -0400
X-MC-Unique: -aIWP6UXMNmmZA3DU0w9WA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1876785A5BC;
 Fri, 18 Mar 2022 20:36:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC34E4292C7;
 Fri, 18 Mar 2022 20:36:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] iotests: replace calls to log(qemu_io(...)) with
 qemu_io_log()
Date: Fri, 18 Mar 2022 16:36:41 -0400
Message-Id: <20220318203655.676907-2-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This makes these callsites a little simpler, but the real motivation is
a forthcoming commit will change the return type of qemu_io(), so removing
users of the return value now is helpful.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/242 | 2 +-
 tests/qemu-iotests/255 | 4 +---
 tests/qemu-iotests/303 | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index b3afd36d72..4b7ec16af6 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -61,7 +61,7 @@ def add_bitmap(bitmap_number, persistent, disabled):
 
 def write_to_disk(offset, size):
     write = 'write {} {}'.format(offset, size)
-    log(qemu_io('-c', write, disk), filters=[filter_qemu_io])
+    qemu_io_log('-c', write, disk)
 
 
 def toggle_flag(offset):
diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index f86fa851b6..88b29d64b4 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -95,9 +95,7 @@ with iotests.FilePath('src.qcow2') as src_path, \
     iotests.qemu_img_create('-f', iotests.imgfmt, src_path, size_str)
     iotests.qemu_img_create('-f', iotests.imgfmt, dst_path, size_str)
 
-    iotests.log(iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 1M',
-                                src_path),
-                filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
+    iotests.qemu_io_log('-f', iotests.imgfmt, '-c', 'write 0 1M', src_path),
 
     vm.add_object('throttle-group,x-bps-read=4096,id=throttle0')
 
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 93aa5ce9b7..32128b1d32 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -21,7 +21,7 @@
 
 import iotests
 import subprocess
-from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
+from iotests import qemu_img_create, qemu_io_log, file_path, log
 
 iotests.script_initialize(supported_fmts=['qcow2'],
                           unsupported_imgopts=['refcount_bits', 'compat'])
@@ -43,7 +43,7 @@ def create_bitmap(bitmap_number, disabled):
 
 def write_to_disk(offset, size):
     write = f'write {offset} {size}'
-    log(qemu_io('-c', write, disk), filters=[filter_qemu_io])
+    qemu_io_log('-c', write, disk)
 
 
 def add_bitmap(num, begin, end, disabled):
-- 
2.34.1


