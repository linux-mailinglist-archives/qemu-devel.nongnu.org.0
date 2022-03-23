Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D04E50D7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:58:56 +0100 (CET)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyhb-0007Xu-T3
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:58:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeJ-00042w-7Z
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeH-00026L-6L
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rg/O0JqzJP4qAmCIkxmC5p4YO/1sEThHgg6yLdu0SbE=;
 b=Y6fC2RAQSGLrT7/0HOPpdcTKkYy7aFzO/F5MWVp5mCfUPoLAhba8PD+7JxvZp2vHExlM4s
 P5A3P5I+3UJ8oSLS7nj1lRjIYoW9faPuobOVPR80/5yvgAOXcAaiYZBI+m6vE5gRh8lVWT
 Iyd+jHS97X+EIei/OSiln7aaI3tTur4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-GcI-TyjHOh6z61olD8EhhA-1; Wed, 23 Mar 2022 06:55:26 -0400
X-MC-Unique: GcI-TyjHOh6z61olD8EhhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D2421C07823;
 Wed, 23 Mar 2022 10:55:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D98F953D8;
 Wed, 23 Mar 2022 10:55:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/3] iotests.py: Add supports_qcow2_zstd_compression()
Date: Wed, 23 Mar 2022 11:55:20 +0100
Message-Id: <20220323105522.53660-2-hreitz@redhat.com>
In-Reply-To: <20220323105522.53660-1-hreitz@redhat.com>
References: <20220323105522.53660-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


