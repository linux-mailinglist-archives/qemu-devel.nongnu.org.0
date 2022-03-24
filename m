Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE54E68CE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:42:42 +0100 (CET)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSPx-0002bL-PI
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:42:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSED-0000Dh-7S
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSE8-0005dS-90
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GGrkTKfqYd+1jFxiYFBuJMTzDmrOxFlv8f3cfLKoOk=;
 b=jPXoR4vrlOHbxkcEuHTepaoVsao4chauVZoFGxIW9tNEHdkPKLgahNIV0O0l94drmg8zfN
 TfP1fOqpWTEWhAMIfgVI6WVUntw6Fm7ccoaL3DbjyHQ4XgIQpudTrTUWjJJvVgiv+Eowh5
 RTUTY2Qi8F3IGH4+tJY4gz5hggMY53c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-zWbOa-9xPC2-Wa5kMVxPIw-1; Thu, 24 Mar 2022 14:30:23 -0400
X-MC-Unique: zWbOa-9xPC2-Wa5kMVxPIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A863802803;
 Thu, 24 Mar 2022 18:30:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B4E0C26EA0;
 Thu, 24 Mar 2022 18:30:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/17] iotests: replace calls to log(qemu_io(...)) with
 qemu_io_log()
Date: Thu, 24 Mar 2022 14:30:02 -0400
Message-Id: <20220324183018.2476551-2-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes these callsites a little simpler, but the real motivation is
a forthcoming commit will change the return type of qemu_io(), so removing
users of the return value now is helpful.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/242 | 6 +++---
 tests/qemu-iotests/255 | 4 +---
 tests/qemu-iotests/303 | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index b3afd36d72..c89f0c6cb3 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -22,8 +22,8 @@
 import iotests
 import json
 import struct
-from iotests import qemu_img_create, qemu_io, qemu_img_info, \
-    file_path, img_info_log, log, filter_qemu_io
+from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \
+    file_path, img_info_log, log
 
 iotests.script_initialize(supported_fmts=['qcow2'],
                           supported_protocols=['file'],
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


