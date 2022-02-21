Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D34BDB3D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:20:38 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCMX-0001F9-FW
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBI-00027C-Kn
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBE-0005Cn-Ft
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KG3p4apAq1N7V2RGjWaof+p3AI8s+xNNoYFSGolWTFo=;
 b=H8f4gC1FCp0iNZHLu+m6JquYgkSixmqYLBNxEFkg3+/3JIaQm+qs9AaY6Q6dXHRkSNGvKN
 ryI/6MwyKg1Kr64EN5Ew053d+85SRTKKB6vLiYs/yq144qR2lJjd2PVIc1yGBtTKsHxKuH
 HeiOwHh3XArOP2K0c2zSvqycfBkLdCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-txdP75cpO_-NIZRNDWcKeQ-1; Mon, 21 Feb 2022 12:08:53 -0500
X-MC-Unique: txdP75cpO_-NIZRNDWcKeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B77402F45;
 Mon, 21 Feb 2022 17:08:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C44477C9B;
 Mon, 21 Feb 2022 17:08:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests/303: Check for zstd support
Date: Mon, 21 Feb 2022 18:08:45 +0100
Message-Id: <20220221170845.628429-3-hreitz@redhat.com>
In-Reply-To: <20220221170845.628429-1-hreitz@redhat.com>
References: <20220221170845.628429-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

303 runs two test cases, one of which requires zstd support.
Unfortunately, given that this is not a unittest-style test, we cannot
easily skip that single case, and instead can only skip the whole test.

(Alternatively, we could split this test into a zlib and a zstd part,
but that seems excessive, given that this test is not in auto and thus
likely only run by developers who have zstd support compiled in.)

Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression type")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/303 | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 16c2e10827..5a3efb4ba3 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -21,7 +21,8 @@
 
 import iotests
 import subprocess
-from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
+from iotests import notrun, qemu_img_pipe_and_status, qemu_io, file_path, \
+        log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
                           unsupported_imgopts=['refcount_bits', 'compat'])
@@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
 
 
 def test(compression_type: str, json_output: bool) -> None:
-    qemu_img_create('-f', iotests.imgfmt,
-                    '-o', f'compression_type={compression_type}',
-                    disk, '10M')
+    opts = f'compression_type={compression_type}'
+    output, status = qemu_img_pipe_and_status('create',
+                                              '-f', iotests.imgfmt,
+                                              '-o', opts,
+                                              disk, '10M')
+    if status == 1 and \
+            "'compression-type' does not accept value 'zstd'" in output:
+        notrun('zstd compression not supported')
+
     add_bitmap(1, 0, 6, False)
     add_bitmap(2, 6, 8, True)
 
-- 
2.34.1


