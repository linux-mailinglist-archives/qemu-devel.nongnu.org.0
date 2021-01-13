Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7B2F4CDA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:13:17 +0100 (CET)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgtg-0008Ns-Lb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnM-0002y1-S0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnG-0003ZB-TQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Y9Axb2/w9Sf1lBLoEHvWI9yKL+jc0UFxsfSkVeoCNA=;
 b=eRYccPQx4w3Z96qsAQe3yfaLbtM8vpxJ2UXd5WJBmFqT2mMq0DQwLYt/ZO2Mhei0ngDKjr
 A4naNlURDifI3pthvHH/ulNBk8kVedGFjHwXN0TAxWd+I83siKrsxyqwobVel9VUzUK5MQ
 S3uRRjCG5pQ/0qifzCTT2kFG0NAha60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-5Ayo7PRCNcOqLze2KXT2vg-1; Wed, 13 Jan 2021 09:06:25 -0500
X-MC-Unique: 5Ayo7PRCNcOqLze2KXT2vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAADE806662;
 Wed, 13 Jan 2021 14:06:24 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76AE010016F6;
 Wed, 13 Jan 2021 14:06:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/7] iotests/129: Do not check @busy
Date: Wed, 13 Jan 2021 15:06:12 +0100
Message-Id: <20210113140616.150283-4-mreitz@redhat.com>
In-Reply-To: <20210113140616.150283-1-mreitz@redhat.com>
References: <20210113140616.150283-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@busy is false when the job is paused, which happens all the time
because that is how jobs yield (e.g. for mirror at least since commit
565ac01f8d3).

Back when 129 was added (2015), perhaps there was no better way of
checking whether the job was still actually running.  Now we have the
@status field (as of 58b295ba52c, i.e. 2018), which can give us exactly
that information.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/129 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 2fc65ada6a..dd23bb2e5a 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -69,7 +69,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         result = self.vm.qmp("stop")
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp("query-block-jobs")
-        self.assert_qmp(result, 'return[0]/busy', True)
+        self.assert_qmp(result, 'return[0]/status', 'running')
         self.assert_qmp(result, 'return[0]/ready', False)
 
     def test_drive_mirror(self):
-- 
2.29.2


