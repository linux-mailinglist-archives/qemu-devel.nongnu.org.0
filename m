Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64D4C6EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:55:38 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgUy-0008CN-TM
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg63-0007Tu-IO
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg62-00033f-44
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK1EbScxthZc/85ABmAn6AlKV4YEYrV+3TwYsqReLj8=;
 b=L4d0dBct7InbuwttG3lboJuqV3m/ShEq1rBQd01BPQDWCcPyGIkleRVwFgvJKTGWzrZggV
 u+gv75ny4ISgWwci0S5jwuJ4Ke4KczzQBJjrGqZewP3EiguTsn/my56Hv6td4XyZKyXDtT
 t1XnSlF8qhEt6kyKN3+owheRep0Ca5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-p3lIWf50MCaDH_XpCsAdXA-1; Mon, 28 Feb 2022 08:29:48 -0500
X-MC-Unique: p3lIWf50MCaDH_XpCsAdXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F3C8FC80;
 Mon, 28 Feb 2022 13:29:47 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D7427B61E;
 Mon, 28 Feb 2022 13:29:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] tests/avocado/machine_s390_ccw_virtio: Adapt test to new
 default resolution
Date: Mon, 28 Feb 2022 14:29:32 +0100
Message-Id: <20220228132936.1411176-3-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
References: <20220228132936.1411176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU's default screen resolution recently changed to 1280x800, so the
resolution in the screen shot header changed of course, too.

Fixes: de72c4b7cd ("edid: set default resolution to 1280x800 (WXGA)")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220221101933.307525-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_s390_ccw_virtio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
index bd03d7160b..438a6f4321 100644
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -248,7 +248,7 @@ def test_s390x_fedora(self):
             line = ppmfile.readline()
             self.assertEqual(line, b"P6\n")
             line = ppmfile.readline()
-            self.assertEqual(line, b"1024 768\n")
+            self.assertEqual(line, b"1280 800\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"255\n")
             line = ppmfile.readline(256)
-- 
2.27.0


