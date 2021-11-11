Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C597244D67B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:17:31 +0100 (CET)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml91G-0006R7-Tz
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8tG-0000T2-K1
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8tE-0003A4-NZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shVN2QICfYZ2g0c6Fg0kFCLqBxPQx2O4ZEwnCnj642E=;
 b=HCcQ6xgQ8dn3o9t7ruEKwWnKeaxvDK2tMmDVyq87lQk2jY22V6TeSnKb2RsUejjr3v6yf3
 93HBBbdUmn+obiOpS3BmCbqoa5TOwggC39rfBmDRfaTVqMmBhlTGpa44jeJp70ujzJ3zas
 aLx/IM0NYowHfv8BRN1xLz4LcQmEEB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-ksdD1x2XN8O9tQiebYt8IA-1; Thu, 11 Nov 2021 07:09:09 -0500
X-MC-Unique: ksdD1x2XN8O9tQiebYt8IA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2247E1017968;
 Thu, 11 Nov 2021 12:09:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5AC19C59;
 Thu, 11 Nov 2021 12:09:06 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 10/10] iotests/030: Unthrottle parallel jobs in reverse
Date: Thu, 11 Nov 2021 13:08:29 +0100
Message-Id: <20211111120829.81329-11-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See the comment for why this is necessary.

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


