Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAB50E2B8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:10:46 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizQL-0008Cw-4F
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOA-0004a5-Vy
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizO8-0001wg-Vm
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMpmtBUZ4GsE1yHpzmq7QSPVHcBMzsV5vtN+UoqtwIQ=;
 b=OlzX51m/FRMDvFGrRH6CWvOilEUYc3H5vTOvpLbipMNgCt771AmrHN2u4oteOMUTsqXY1q
 OuTIBUCXzBXx5xK2wcFJwFIigXNayVWdTzf+ZHov0U/q+z6MQ78y0PVl3kHiUvPV5rFkXf
 w/Rrl5DJKWR2vqE1Pg1z51qMCUkzfN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-2NQz6THZPIa_LkjP-cn1AQ-1; Mon, 25 Apr 2022 10:08:26 -0400
X-MC-Unique: 2NQz6THZPIa_LkjP-cn1AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9DA811E80;
 Mon, 25 Apr 2022 14:08:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 376C120296A2;
 Mon, 25 Apr 2022 14:08:26 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/14] iotests: replace calls to log(qemu_io(...)) with
 qemu_io_log()
Date: Mon, 25 Apr 2022 16:08:09 +0200
Message-Id: <20220425140821.957511-3-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This makes these callsites a little simpler, but the real motivation is
a forthcoming commit will change the return type of qemu_io(), so removing
users of the return value now is helpful.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-2-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
index 40e947f26c..a8cc6a23df 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -21,7 +21,7 @@
 
 import iotests
 import subprocess
-from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io, \
+from iotests import qemu_img_create, qemu_io_log, file_path, log, \
         verify_qcow2_zstd_compression
 
 iotests.script_initialize(supported_fmts=['qcow2'],
@@ -45,7 +45,7 @@ def create_bitmap(bitmap_number, disabled):
 
 def write_to_disk(offset, size):
     write = f'write {offset} {size}'
-    log(qemu_io('-c', write, disk), filters=[filter_qemu_io])
+    qemu_io_log('-c', write, disk)
 
 
 def add_bitmap(num, begin, end, disabled):
-- 
2.35.1


