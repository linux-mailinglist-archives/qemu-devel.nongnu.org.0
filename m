Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB724CFD92
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:00:32 +0100 (CET)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRC2R-0003xU-D7
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:00:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAiq-0004qq-Cm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAio-0008Da-VG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aEnlheRDJcUKdypIJS3zN9vN6FyTISJGXo6eVyEw2E=;
 b=B6bpWmEJVSWwmpU5OqNf39NnSoQXsVXHXPnlVNOvliwu9LsE3ZlWJ8tRfKkfxxp5HdhahI
 A7aMN57EIuvlhbxC9xEGH3xvKwhvbLKFkJFnkISgD6QfsQKiePu0nwVw9YtymSn7cXn6X6
 Mu+7IWtIqPlEc8sQNfRyzjNP4/dQr3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-hsXkgiyaPIqGk--eaBRbNA-1; Mon, 07 Mar 2022 05:36:07 -0500
X-MC-Unique: hsXkgiyaPIqGk--eaBRbNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE521006AA6;
 Mon,  7 Mar 2022 10:36:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB480842B2;
 Mon,  7 Mar 2022 10:36:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/23] tests/qemu-iotests/040: Skip TestCommitWithFilters
 without 'throttle'
Date: Mon,  7 Mar 2022 11:35:31 +0100
Message-Id: <20220307103549.808809-6-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

iotest 040 already has some checks for the availability of the 'throttle'
driver, but some new code has been added in the course of time that
depends on 'throttle' but does not check for its availability. Add
a check to the TestCommitWithFilters class so that this iotest now
also passes again if 'throttle' has not been enabled in the QEMU
binaries.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220223123127.3206042-1-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.34.1


