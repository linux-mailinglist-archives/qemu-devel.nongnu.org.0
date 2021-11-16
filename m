Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699FE4532D4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:25:55 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyTA-0007Y8-36
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:25:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyB1-0004Xx-2G
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAs-00078q-Al
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JG+u721JF9Ria9WIhvrdWi7pqQoJBDTN5jcN3oE+g/c=;
 b=aljH+u5qXLEmDwyWpdoGPDshIbZSwVFuKyIDwywPPvuNN2nEnZvIN7S2b9IZxmXFybY2/E
 2Zl4CljROWtbjLV/mmTEZKGAStNIMqMvVsIhF3QYfRHwife3Ft3bmS3IXXOa04VBzwrWXv
 i96nc5jIPIZiIUk4peGR/Oj21yxS0jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ac7QsJ96NjCq91KGfKRXHQ-1; Tue, 16 Nov 2021 08:06:54 -0500
X-MC-Unique: ac7QsJ96NjCq91KGfKRXHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C5A1054F98;
 Tue, 16 Nov 2021 13:06:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9571C101E692;
 Tue, 16 Nov 2021 13:06:47 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 10/13] iotests/030: Unthrottle parallel jobs in reverse
Date: Tue, 16 Nov 2021 14:06:15 +0100
Message-Id: <20211116130618.700441-11-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

See the comment for why this is necessary.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211111120829.81329-11-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-11-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/030 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 5fb65b4bef..567bf1da67 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -251,7 +251,16 @@ class TestParallelOps(iotests.QMPTestCase):
                                  speed=1024)
             self.assert_qmp(result, 'return', {})
 
-        for job in pending_jobs:
+        # Do this in reverse: After unthrottling them, some jobs may finish
+        # before we have unthrottled all of them.  This will drain their
+        # subgraph, and this will make jobs above them advance (despite those
+        # jobs on top being throttled).  In the worst case, all jobs below the
+        # top one are finished before we can unthrottle it, and this makes it
+        # advance so far that it completes before we can unthrottle it - which
+        # results in an error.
+        # Starting from the top (i.e. in reverse) does not have this problem:
+        # When a job finishes, the ones below it are not advanced.
+        for job in reversed(pending_jobs):
             result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
             self.assert_qmp(result, 'return', {})
 
-- 
2.33.1


