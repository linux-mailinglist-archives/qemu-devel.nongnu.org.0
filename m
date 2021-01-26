Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA3304125
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:58:51 +0100 (CET)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pnu-0003ES-MU
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE4-0000wJ-0j
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE1-0006Rx-Bn
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2hBxJLDVhLTHrxMTT8w9JaHukTVWTjYizBLyRgIKVk=;
 b=BEZCFCagllXoFV+OIMvufXut+bIlFwUCdyHos94ONhY5XFaaDZ4tsZFqySZnDir78oz1F8
 MIP+vlpBGftOkpZFatSSolbJFz5AeZzyLc4hZQpfos+7BfpNe3HkD0bcMJVABsqyV5tp6D
 /IHcK6dMp93vNQaKLbdipzlP9FtwyF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-VAA135ZmPfe7nw2-qHbWww-1; Tue, 26 Jan 2021 09:21:41 -0500
X-MC-Unique: VAA135ZmPfe7nw2-qHbWww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD8559;
 Tue, 26 Jan 2021 14:21:40 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 528EB5D9C2;
 Tue, 26 Jan 2021 14:21:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 36/53] iotests: 56: prepare for backup over block-copy
Date: Tue, 26 Jan 2021 15:19:59 +0100
Message-Id: <20210126142016.806073-37-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

After introducing parallel async copy requests instead of plain
cluster-by-cluster copying loop, we'll have to wait for paused status,
as we need to wait for several parallel request. So, let's gently wait
instead of just asserting that job already paused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-12-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/056 | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index 0e6b8591e7..b459a3f1e8 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -308,8 +308,13 @@ class BackupTest(iotests.QMPTestCase):
         event = self.vm.event_wait(name="BLOCK_JOB_ERROR",
                                    match={'data': {'device': 'drive0'}})
         self.assertNotEqual(event, None)
-        # OK, job should be wedged
-        res = self.vm.qmp('query-block-jobs')
+        # OK, job should pause, but it can't do it immediately, as it can't
+        # cancel other parallel requests (which didn't fail)
+        with iotests.Timeout(60, "Timeout waiting for backup actually paused"):
+            while True:
+                res = self.vm.qmp('query-block-jobs')
+                if res['return'][0]['status'] == 'paused':
+                    break
         self.assert_qmp(res, 'return[0]/status', 'paused')
         res = self.vm.qmp('block-job-dismiss', id='drive0')
         self.assert_qmp(res, 'error/desc',
-- 
2.29.2


