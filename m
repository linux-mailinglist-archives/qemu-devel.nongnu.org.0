Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0743FDEAE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:30:20 +0200 (CEST)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSBv-0005ea-6X
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyu-0003cc-Ec
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRys-0003Li-99
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sh6ny78MxCS8p1zcfkl8MHFzVS565tvTjjayif6A9hU=;
 b=DlzE2Hs8bFtdfekDXjdT56q6JPoqBxtvZtw7vlt5yeqNPemKua2d67mKwyoVLRouraFMgy
 KkUvU0S763GYAQ8EwMzGR6Qsco1NO48CZBfP+WqrGqiDWqt8WaXWdKFEUrrdVUoGd+i6nM
 Tt3ffCEslBKPmRisCK/aTEMEujIBn1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-OZhXQODwMl6bGb4vagubQA-1; Wed, 01 Sep 2021 11:16:48 -0400
X-MC-Unique: OZhXQODwMl6bGb4vagubQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4BA80198A;
 Wed,  1 Sep 2021 15:16:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6AA25D9DC;
 Wed,  1 Sep 2021 15:16:46 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/56] qemu-iotests: allow valgrind to read/delete the
 generated log file
Date: Wed,  1 Sep 2021 17:15:35 +0200
Message-Id: <20210901151619.689075-13-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

When using -valgrind on the script tests, it generates a log file
in $TEST_DIR that is either read (if valgrind finds problems) or
otherwise deleted. Provide the same exact behavior when using
-valgrind on the python tests.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210809090114.64834-13-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 26c580f9e7..85d8c0abbb 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -598,6 +598,17 @@ def __init__(self, path_suffix=''):
                          sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
+    def _post_shutdown(self) -> None:
+        super()._post_shutdown()
+        if not qemu_valgrind or not self._popen:
+            return
+        valgrind_filename =  f"{test_dir}/{self._popen.pid}.valgrind"
+        if self.exitcode() == 99:
+            with open(valgrind_filename) as f:
+                print(f.read())
+        else:
+            os.remove(valgrind_filename)
+
     def add_object(self, opts):
         self._args.append('-object')
         self._args.append(opts)
-- 
2.31.1


