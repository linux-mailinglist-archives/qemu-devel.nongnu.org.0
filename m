Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1A4CA559
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:58:25 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOYi-0007mF-TU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMg-0001EK-9e
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMe-0004U0-C5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6O0ZuWSJgBzFxkS5WV1UQem+X06cCzjAq4DPSwQ3ddo=;
 b=FQMzrkAKJSlnovAwOA0lOooJl64cuC1uep4n76AFciHvEspqRSwtUvBNM8degolQqLqFIW
 va/6Hn93hp2UbiA/RnSxc1PcXDKAODD8ZUSvEU5mJek1PVXVpFN7Ok1fnmFQmBKFPDDPWR
 L+d8WTZgdiP7FNUfNy7MUoDsaCR2UW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-LSKQqEXDO2SGUt4kGWwrxg-1; Wed, 02 Mar 2022 07:45:51 -0500
X-MC-Unique: LSKQqEXDO2SGUt4kGWwrxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DDD11854E27;
 Wed,  2 Mar 2022 12:45:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 201828328D;
 Wed,  2 Mar 2022 12:45:49 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/3] iotests/303: Check for zstd support
Date: Wed,  2 Mar 2022 13:45:40 +0100
Message-Id: <20220302124540.45083-4-hreitz@redhat.com>
In-Reply-To: <20220302124540.45083-1-hreitz@redhat.com>
References: <20220302124540.45083-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
 tests/qemu-iotests/303 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 16c2e10827..25c3e7eaaa 100755
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
2.34.1


