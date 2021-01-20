Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8552FCDCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:23:15 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Adu-0003ZI-MD
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2AcM-0002Gw-6J
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2AcE-0007FH-QL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611138088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLj9OigOBgpczQGZgc9xtca9KI/QXMgFrVGm6F3ieFY=;
 b=en59QyEIfpqHGHYpYlGqIKkHdsoNLrolggT1gCNEci/5VVvSdHbEkqVE1IA+1L0B2GDcJ1
 1dSlUDCnryKOWGBxVzzeZbQuj5c4+Jh0zUFErRDba6+/qXMh8ig1KPnCbFAytvYqUtPpXx
 h/s+95yUOJ57UsfLzjHQCdZlwK9IguE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-QT1yphoQMDC_w6KFcgB9HQ-1; Wed, 20 Jan 2021 05:20:46 -0500
X-MC-Unique: QT1yphoQMDC_w6KFcgB9HQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B565B802B40;
 Wed, 20 Jan 2021 10:20:45 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1770727CAD;
 Wed, 20 Jan 2021 10:20:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11.5/23] iotests/129: Limit backup's max-chunk/max-workers
Date: Wed, 20 Jan 2021 11:20:43 +0100
Message-Id: <20210120102043.28346-1-mreitz@redhat.com>
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, this does not change anything, because backup ignores
max-chunk and max-workers.  However, as soon as backup is switched over
to block-copy for the background copying process, we will need it to
keep 129 passing.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
Hi Vladimir, would you be OK with this?
---
 tests/qemu-iotests/129 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 9a56217bf8..2ac7e7a24d 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -70,9 +70,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
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


