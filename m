Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677F3040AC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:44:07 +0100 (CET)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PZX-0008Sr-A0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDe-0000JA-FP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDV-00069Z-Jp
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbIph7g8jFj8Ognlol35njDRTxAd6wPgjwbBzz1FFco=;
 b=Sy1UO6N4elUSuphhmAc0asRUsmkji0sTGQjVWQiw+Y/yQt4Py5T9r81Ph7wo/5Uh1UaACR
 8MesQZP1y+6GS0sW+c+ajtD4BYcPEQXOP+yrGIiyQPERLG2udFmucUDQtINMjR6J+M5dVc
 bAnqExiUOW/PeBHyPkI4Hzf0GX7cMLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-lpO29kCdOsqWaUiixcNGmw-1; Tue, 26 Jan 2021 09:21:08 -0500
X-MC-Unique: lpO29kCdOsqWaUiixcNGmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39012107ACE6;
 Tue, 26 Jan 2021 14:21:02 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C58A619934;
 Tue, 26 Jan 2021 14:21:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/53] iotests/129: Do not check @busy
Date: Tue, 26 Jan 2021 15:19:42 +0100
Message-Id: <20210126142016.806073-20-mreitz@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-6-mreitz@redhat.com>
---
 tests/qemu-iotests/129 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index bd29c54af8..0f2e5418ef 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -70,7 +70,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         result = self.vm.qmp("stop")
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp("query-block-jobs")
-        self.assert_qmp(result, 'return[0]/busy', True)
+        self.assert_qmp(result, 'return[0]/status', 'running')
         self.assert_qmp(result, 'return[0]/ready', False)
 
     def test_drive_mirror(self):
-- 
2.29.2


