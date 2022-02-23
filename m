Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883F4C12FB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:42:20 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqyJ-0001eA-6O
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMqnx-0007ST-Px
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMqnt-0005Nu-Sy
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645619492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XReTaZSe6iYb4WKPjbSanvdhr7cx2lsiykUr70W6zKk=;
 b=IE0TvgAnsR60X+YL7y8/iOAIg/P/qmS1Qpq2r4WMPeshA2EA+7YWHSMjHgWLZnCuds6/5L
 l8BvTTAQRzQUVhgsTYYIT/sVMBWxOqw24tQT6jCeT1WpD3NdaVv75M+O1doQNetakgKaOb
 y1CexE0jdgcoXLHmsW/CIhRZHgOf9Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-y8eitTAwNiW0ZLsbyxIX1A-1; Wed, 23 Feb 2022 07:31:31 -0500
X-MC-Unique: y8eitTAwNiW0ZLsbyxIX1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D206804B65;
 Wed, 23 Feb 2022 12:31:30 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 759927BCC9;
 Wed, 23 Feb 2022 12:31:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] tests/qemu-iotests/040: Skip TestCommitWithFilters without
 'throttle'
Date: Wed, 23 Feb 2022 13:31:27 +0100
Message-Id: <20220223123127.3206042-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iotest 040 already has some checks for the availability of the 'throttle'
driver, but some new code has been added in the course of time that
depends on 'throttle' but does not check for its availability. Add
a check to the TestCommitWithFilters class so that this iotest now
also passes again if 'throttle' has not been enabled in the QEMU
binaries.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/040 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 6af5ab9e76..0e1cfd7e49 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -744,6 +744,7 @@ class TestCommitWithFilters(iotests.QMPTestCase):
                              pattern_file)
             self.assertFalse('Pattern verification failed' in result)
 
+    @iotests.skip_if_unsupported(['throttle'])
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, self.img0, '64M')
         qemu_img('create', '-f', iotests.imgfmt, self.img1, '64M')
-- 
2.27.0


