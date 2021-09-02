Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3FE3FEB7A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:43:12 +0200 (CEST)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjFX-00053D-Ty
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjD0-00028J-TX
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCx-0008Im-RG
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIoSV2XvZaVQChmCu4JJ9shFsJvKu7OIDT0fBbhKbkY=;
 b=d+tbpdRfbsCbFOizFMjZWIHfy8Swmrz6G2pT0Rr3c6HQVGETPsbQWv1J+/LwBHnYg1L3NY
 zgRmNMaKY3JMQ8yaBBBinjd3ar6FpH+TaDASwT8pz4IAEOrMyVD9w1UVbLHsse1/Yu3DHC
 jqjT/mFtepggmWl1Z7CzeNnKzatoEnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-0p1URKvEMZmKtpYKaF0FBQ-1; Thu, 02 Sep 2021 05:40:29 -0400
X-MC-Unique: 0p1URKvEMZmKtpYKaF0FBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030C0824FA7;
 Thu,  2 Sep 2021 09:40:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C889F69CAD;
 Thu,  2 Sep 2021 09:40:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 4/5] mirror-top-perms: Fix AbnormalShutdown path
Date: Thu,  2 Sep 2021 11:40:16 +0200
Message-Id: <20210902094017.32902-5-hreitz@redhat.com>
In-Reply-To: <20210902094017.32902-1-hreitz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AbnormalShutdown exception class is not in qemu.machine, but in
qemu.machine.machine.  (qemu.machine.AbnormalShutdown was enough for
Python to find it in order to run this test, but pylint complains about
it.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 451a0666f8..2fc8dd66e0 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -47,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
     def tearDown(self):
         try:
             self.vm.shutdown()
-        except qemu.machine.AbnormalShutdown:
+        except qemu.machine.machine.AbnormalShutdown:
             pass
 
         if self.vm_b is not None:
-- 
2.31.1


