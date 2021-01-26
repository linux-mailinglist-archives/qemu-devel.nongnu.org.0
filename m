Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B873040C5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:47:12 +0100 (CET)
Received: from localhost ([::1]:42510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pcd-0003TA-Tr
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE5-00010l-Ff
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE3-0006ST-OB
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6yegy0NiEWydqKWh0MGf2cEd+kPPYlN/qwvN8qMvxU=;
 b=W2LAUGHu1/6t/hJYYUgP48XpzwlnRxoo4Cj1GZQS7w5W2tYEMRVzB+pll6mYJ4CH+iBVXd
 vaHxBJuGB7NY/OJNXjerza0i2gpgobP5kGSyOxeck9a+qHwalHCSsnU7Uz/X6TEk4rhX6A
 inAqjowhW9g3ZRqbcgi6gNkvoD9xVX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-BlZw3h9APjW_EiU-bLW-Mg-1; Tue, 26 Jan 2021 09:21:45 -0500
X-MC-Unique: BlZw3h9APjW_EiU-bLW-Mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D30ED1005504;
 Tue, 26 Jan 2021 14:21:42 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7646319D6C;
 Tue, 26 Jan 2021 14:21:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 37/53] iotests/129: Limit backup's max-chunk/max-workers
Date: Tue, 26 Jan 2021 15:20:00 +0100
Message-Id: <20210126142016.806073-38-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Right now, this does not change anything, because backup ignores
max-chunk and max-workers.  However, as soon as backup is switched over
to block-copy for the background copying process, we will need it to
keep 129 passing.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210120102043.28346-1-mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/129 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 2f7b28d4a0..5251e2669e 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -71,9 +71,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
                           sync="full", buf_size=65536)
 
     def test_drive_backup(self):
+        # Limit max-chunk and max-workers so that block-copy will not
+        # launch so many workers working on so much data each that
+        # stop's bdrv_drain_all() would finish the job
         self.do_test_stop("drive-backup", device="drive0",
                           target=self.target_img, format=iotests.imgfmt,
-                          sync="full")
+                          sync="full",
+                          x_perf={ 'max-chunk': 65536,
+                                   'max-workers': 8 })
 
     def test_block_commit(self):
         # Add overlay above the source node so that we actually use a
-- 
2.29.2


