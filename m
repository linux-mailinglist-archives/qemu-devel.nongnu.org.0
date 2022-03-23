Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19B4E50DB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:01:22 +0100 (CET)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyjx-00027u-2L
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:01:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeO-00044T-6s
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeM-00027d-Qp
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwIHZpkdTsSkXstcK0Ye4twQkdM4TafApr85+wPyYso=;
 b=coCRd33H63HUV5VfV3vQKuiA1JpUEs43O3AZXow965Iva8CrERfkqLQCbwGa+I1CUnok28
 uIcCj6VewGksuJcWqKu4cikhrfIRgRUCrx8RIZvvmYh725jsLvt12KCstmR0BntxSwDJsI
 hu7p5YvMz8d3QKkOQVm+CjcLFWXfGlE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-1mQ9-junMo2__tuXOs_m5Q-1; Wed, 23 Mar 2022 06:55:30 -0400
X-MC-Unique: 1mQ9-junMo2__tuXOs_m5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A425D382054A;
 Wed, 23 Mar 2022 10:55:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C56B40D2823;
 Wed, 23 Mar 2022 10:55:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/3] iotests/303: Check for zstd support
Date: Wed, 23 Mar 2022 11:55:22 +0100
Message-Id: <20220323105522.53660-4-hreitz@redhat.com>
In-Reply-To: <20220323105522.53660-1-hreitz@redhat.com>
References: <20220323105522.53660-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/qemu-iotests/303 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 93aa5ce9b7..40e947f26c 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -21,10 +21,12 @@
 
 import iotests
 import subprocess
-from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
+from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io, \
+        verify_qcow2_zstd_compression
 
 iotests.script_initialize(supported_fmts=['qcow2'],
                           unsupported_imgopts=['refcount_bits', 'compat'])
+verify_qcow2_zstd_compression()
 
 disk = file_path('disk')
 chunk = 1024 * 1024
-- 
2.35.1


