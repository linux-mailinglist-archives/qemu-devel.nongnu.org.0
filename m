Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D354CA765
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:08:09 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPeB-0001Jn-Sa
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMd-0001AQ-43
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPOMY-0004SU-RW
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6fM+nMArKUdTGqyFxs+17rCL3e/udb/MebCo0XudGU=;
 b=bONzVWItw+p6fRcSlRv27Pl5fZSZ6mabtVZMrfpx4wK5dxS5EaoTQ0kMGSKQss2czu0DGB
 endD5mZ3SsliYcJ7w4qITI4BTEThCX0O5gQjc+BEoQRgwIYWze/vbS4q1XQs9bsG/c0S2W
 kDN6xk3dzgFkLtNdo7wml1yhQiOFay8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-91AfaJIUO0u6aQi21qJrjw-1; Wed, 02 Mar 2022 07:45:47 -0500
X-MC-Unique: 91AfaJIUO0u6aQi21qJrjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3197C80EDA1;
 Wed,  2 Mar 2022 12:45:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C66832B1;
 Wed,  2 Mar 2022 12:45:45 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/3] iotests.py: Add supports_qcow2_zstd_compression()
Date: Wed,  2 Mar 2022 13:45:38 +0100
Message-Id: <20220302124540.45083-2-hreitz@redhat.com>
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

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6027780180..ce60abcadc 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1377,6 +1377,27 @@ def verify_working_luks():
     if not working:
         notrun(reason)
 
+def supports_qcow2_zstd_compression() -> bool:
+    img_file = f'{test_dir}/qcow2-zstd-test.qcow2'
+    (output, status) = \
+        qemu_img_pipe_and_status('create', '-f', 'qcow2',
+                                 '-o', 'compression_type=zstd',
+                                 img_file, '0')
+    try:
+        os.remove(img_file)
+    except OSError:
+        pass
+
+    if status == 1 and \
+            "'compression-type' does not accept value 'zstd'" in output:
+        return False
+    else:
+        return True
+
+def verify_qcow2_zstd_compression():
+    if not supports_qcow2_zstd_compression():
+        notrun('zstd compression not supported')
+
 def qemu_pipe(*args: str) -> str:
     """
     Run qemu with an option to print something and exit (e.g. a help option).
-- 
2.34.1


