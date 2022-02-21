Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0FC4BDB3E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:21:38 +0100 (CET)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCNV-0003co-Ba
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBG-00022x-6P
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBE-0005CO-9d
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t04IO0OH8XOKmbgrhkpOFSCNSmGnl3U4eQbY3eOdvg=;
 b=YXzufYXj1lf9H/2eVLICQCFrwYzpAn+JySRMuJ3rb8HovX5SUBk129+X1xGKIUSTPVEXGr
 12HRrQsAjw8ZuZPmUX49k5vCez7t43GbrTPpJvwp1zSnZ6TmzgLyef82AWphPSv8hPjVbP
 kllfQILIZ/6Lfa3MzxthtJTmOvtVOpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-7tbqXrZDNGqOJz11P0iyjw-1; Mon, 21 Feb 2022 12:08:51 -0500
X-MC-Unique: 7tbqXrZDNGqOJz11P0iyjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DFDF18460E5;
 Mon, 21 Feb 2022 17:08:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 217FB77CAA;
 Mon, 21 Feb 2022 17:08:49 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests/065: Check for zstd support
Date: Mon, 21 Feb 2022 18:08:44 +0100
Message-Id: <20220221170845.628429-2-hreitz@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

Some test cases run in iotest 065 require zstd support.  Skip them if
qemu-img reports it not to be available.

Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065 | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index f7c1b68dad..b68df84642 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_pipe
+from iotests import qemu_img_pipe, qemu_img_pipe_and_status
 import unittest
 
 test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -35,8 +35,13 @@ class TestImageInfoSpecific(iotests.QMPTestCase):
     def setUp(self):
         if self.img_options is None:
             self.skipTest('Skipping abstract test class')
-        qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,
-                 test_img, '128K')
+        output, status = qemu_img_pipe_and_status('create',
+                                                  '-f', iotests.imgfmt,
+                                                  '-o', self.img_options,
+                                                  test_img, '128K')
+        if status == 1 and \
+                "'compression-type' does not accept value 'zstd'" in output:
+            self.case_skip('zstd compression not supported')
 
     def tearDown(self):
         os.remove(test_img)
-- 
2.34.1


