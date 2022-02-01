Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD24A6109
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:11:20 +0100 (CET)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvkV-00018k-GB
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSR-0003BN-CY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSI-0004FV-S7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSh4zOXvrhCyumhwKxB2mA8+eJshbq5iDJRQTAIVKKw=;
 b=VNGjmyuCxd93qj0TqnsDCmUce04UX4nv4DzyNb5yNUw/jbTl0texdAIf5p3Fqul++ekGUX
 og9JPZw1xdECs5MXuqt7xUlJdBiAOc9fLDMJD0e2LfNOIeNGB1RHUsT+WxLSQZo0aDzdHn
 wdGaBilgbDQRH+h2oeoZGoP6M+FqYJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-n7e55KD0ObCaKp-GLwzJgA-1; Tue, 01 Feb 2022 09:43:20 -0500
X-MC-Unique: n7e55KD0ObCaKp-GLwzJgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F028143F2;
 Tue,  1 Feb 2022 14:43:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C847DE23;
 Tue,  1 Feb 2022 14:43:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/24] iotests.py: implement unsupported_imgopts
Date: Tue,  1 Feb 2022 15:42:13 +0100
Message-Id: <20220201144233.617021-5-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to support some addition IMGOPTS in python iotests like
in bash iotests. Similarly to bash iotests, we want a way to skip some
tests which can't work with specific IMGOPTS.

Globally for python iotests we will not support things like
'data_file=$TEST_IMG.ext_data_file' in IMGOPTS, so, forbid this
globally in iotests.py.

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-3-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 30a8837ea2..2fa5dcba76 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1226,6 +1226,17 @@ def _verify_virtio_scsi_pci_or_ccw() -> None:
         notrun('Missing virtio-scsi-pci or virtio-scsi-ccw in QEMU binary')
 
 
+def _verify_imgopts(unsupported: Sequence[str] = ()) -> None:
+    imgopts = os.environ.get('IMGOPTS')
+    # One of usage examples for IMGOPTS is "data_file=$TEST_IMG.ext_data_file"
+    # but it supported only for bash tests. We don't have a concept of global
+    # TEST_IMG in iotests.py, not saying about somehow parsing $variables.
+    # So, for simplicity let's just not support any IMGOPTS with '$' inside.
+    unsup = list(unsupported) + ['$']
+    if imgopts and any(x in imgopts for x in unsup):
+        notrun(f'not suitable for this imgopts: {imgopts}')
+
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
 
@@ -1402,7 +1413,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = (),
                          supported_protocols: Sequence[str] = (),
                          unsupported_protocols: Sequence[str] = (),
-                         required_fmts: Sequence[str] = ()) -> bool:
+                         required_fmts: Sequence[str] = (),
+                         unsupported_imgopts: Sequence[str] = ()) -> bool:
     """
     Perform necessary setup for either script-style or unittest-style tests.
 
@@ -1422,6 +1434,7 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     _verify_aio_mode(supported_aio_modes)
     _verify_formats(required_fmts)
     _verify_virtio_blk()
+    _verify_imgopts(unsupported_imgopts)
 
     return debug
 
-- 
2.34.1


