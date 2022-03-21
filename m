Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41094E31A5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:23:08 +0100 (CET)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOYV-00082O-Oo
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:23:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS4-0005xy-PN
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS0-0001iU-TD
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ga0SGrot5kYXt2x+/A3lovIZrXy8ACIW/eVTfASYnek=;
 b=VJYGHOt1WtGdt538lkJEURE/Cmb2t9dk2omHtBA5VsT6jzO+Uj/Dwxv/umYWnOwWiQvf8h
 2NteW/BRlNR1jRUN9szqj5X8/yaFVdcoZRcKSfmjpLFNCkBclV70TsMSjY4KbTRSPGt37D
 kRr98CIgj5ZGW6WYGVsp7MHzIYRxm+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-3DuOoKhANTuLsrhb4898LA-1; Mon, 21 Mar 2022 16:16:22 -0400
X-MC-Unique: 3DuOoKhANTuLsrhb4898LA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96CEB85A5BC;
 Mon, 21 Mar 2022 20:16:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469B7454D65;
 Mon, 21 Mar 2022 20:16:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/18] iotests: add qemu_img_info()
Date: Mon, 21 Mar 2022 16:16:08 -0400
Message-Id: <20220321201618.903471-9-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add qemu_img_info() by analogy with qemu_img_measure() and
qemu_img_check(). Modify image_size() to use this function instead to
take advantage of the better diagnostic information on failure provided
(ultimately) by qemu_img().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065        |  5 ++---
 tests/qemu-iotests/242        |  5 ++---
 tests/qemu-iotests/iotests.py | 15 +++++++++++----
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index f7c1b68dad..9466ce7df4 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_pipe
+from iotests import qemu_img, qemu_img_info, qemu_img_pipe
 import unittest
 
 test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -49,8 +49,7 @@ class TestQemuImgInfo(TestImageInfoSpecific):
     human_compare = None
 
     def test_json(self):
-        data = json.loads(qemu_img_pipe('info', '--output=json', test_img))
-        data = data['format-specific']
+        data = qemu_img_info(test_img)['format-specific']
         self.assertEqual(data['type'], iotests.imgfmt)
         self.assertEqual(data['data'], self.json_compare)
 
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 96a30152b0..547bf382e3 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -22,7 +22,7 @@
 import iotests
 import json
 import struct
-from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
+from iotests import qemu_img_create, qemu_io, qemu_img_info, \
     file_path, img_info_log, log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
@@ -39,8 +39,7 @@ flag_offset = 0x5000f
 def print_bitmap(extra_args):
     log('qemu-img info dump:\n')
     img_info_log(disk, extra_args=extra_args)
-    result = json.loads(qemu_img_pipe('info', '--force-share',
-                                      '--output=json', disk))
+    result = qemu_img_info('--force-share', disk)
     if 'bitmaps' in result['format-specific']['data']:
         bitmaps = result['format-specific']['data']['bitmaps']
         log('The same bitmaps in JSON format:')
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4725313150..2a1c589b76 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -315,6 +315,9 @@ def qemu_img_measure(*args: str) -> Any:
 def qemu_img_check(*args: str) -> Any:
     return qemu_img_json("check", "--output", "json", *args)
 
+def qemu_img_info(*args: str) -> Any:
+    return qemu_img_json('info', "--output", "json", *args)
+
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
     return qemu_img_pipe_and_status(*args)[0]
@@ -565,10 +568,14 @@ def create_image(name, size):
             file.write(sector)
             i = i + 512
 
-def image_size(img):
-    '''Return image's virtual size'''
-    r = qemu_img_pipe('info', '--output=json', '-f', imgfmt, img)
-    return json.loads(r)['virtual-size']
+def image_size(img: str) -> int:
+    """Return image's virtual size"""
+    value = qemu_img_info('-f', imgfmt, img)['virtual-size']
+    if not isinstance(value, int):
+        type_name = type(value).__name__
+        raise TypeError("Expected 'int' for 'virtual-size', "
+                        f"got '{value}' of type '{type_name}'")
+    return value
 
 def is_str(val):
     return isinstance(val, str)
-- 
2.34.1


