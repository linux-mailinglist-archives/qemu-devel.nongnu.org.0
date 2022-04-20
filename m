Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4A508875
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:48:14 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9kj-00041o-BQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e0-0002BT-KD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9dy-00043q-Qd
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URyTzH693l8cpHBjASSKF6GjzautDHhirWhdMg4qe5A=;
 b=CDrLQrwQ52xAxPond5cx2hw/jN7WZar8frK8VwEuYSvPhuZU+V1gU5XlYKJKtYobebjO/6
 6QmtkbGEtw6j+BVN7y7m+JwBor8QgWYOf5RlLSNPvsUjq0J0L7P4cJkMurwJTK+tPZvPBa
 yILKlkouvSbY0jk3ibofXvK7BmoHroI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-nXSMSj0rMjaGiFg7rlwqBg-1; Wed, 20 Apr 2022 08:41:12 -0400
X-MC-Unique: nXSMSj0rMjaGiFg7rlwqBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48F001066567;
 Wed, 20 Apr 2022 12:41:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 001B340EC005;
 Wed, 20 Apr 2022 12:41:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/8] iotests.py: Add supports_qcow2_zstd_compression()
Date: Wed, 20 Apr 2022 14:40:59 +0200
Message-Id: <20220420124104.795836-4-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220323105522.53660-2-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fcec3e51e5..fe10a6cf05 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1471,6 +1471,26 @@ def verify_working_luks():
     if not working:
         notrun(reason)
 
+def supports_qcow2_zstd_compression() -> bool:
+    img_file = f'{test_dir}/qcow2-zstd-test.qcow2'
+    res = qemu_img('create', '-f', 'qcow2', '-o', 'compression_type=zstd',
+                   img_file, '0',
+                   check=False)
+    try:
+        os.remove(img_file)
+    except OSError:
+        pass
+
+    if res.returncode == 1 and \
+            "'compression-type' does not accept value 'zstd'" in res.stdout:
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
2.35.1


