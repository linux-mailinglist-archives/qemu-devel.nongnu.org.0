Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449238097F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:29:17 +0200 (CEST)
Received: from localhost ([::1]:38278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWwO-0003M6-9L
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjq-00015u-KR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjd-0005BG-1w
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cjNEe0Ie8oBRIjqHrPIm4Ve53eJLvdLKvseQ78mcfw=;
 b=i/Wsod6yJ+ZzqMUQXQc6iKlp23mBHxTL8N0wRS9FrvKX/HAWl0U9+PID853xHtLGiuwNnR
 BqDkb8j9shB8HbWIP4uQLumyWWg9T+dkzSnEsJMCve+tFFzl57BKXBLiuVcOQA2MPAs55u
 EwnMdXg+yLl+QyXf2S1rTlp38hFvFBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Q4eD961OOQG7LxxaShgIpw-1; Fri, 14 May 2021 08:16:01 -0400
X-MC-Unique: Q4eD961OOQG7LxxaShgIpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A4429F932;
 Fri, 14 May 2021 12:15:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EBB16060F;
 Fri, 14 May 2021 12:15:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/20] tests/qtest/ahci-test.c: Calculate iso_size with 64-bit
 arithmetic
Date: Fri, 14 May 2021 14:15:07 +0200
Message-Id: <20210514121518.832729-10-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity notes that when calculating the 64-bit iso_size value in
ahci_test_cdrom() we actually only do it with 32-bit arithmetic.
This doesn't matter for the current test code because nsectors is
always small; but adding the cast avoids the coverity complaints.

Fixes: Coverity CID 1432343
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20210506194358.3925-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ahci-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 5e1954852e..8073ccc205 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1491,14 +1491,14 @@ static void ahci_test_cdrom(int nsectors, bool dma, uint8_t cmd,
     char *iso;
     int fd;
     AHCIOpts opts = {
-        .size = (ATAPI_SECTOR_SIZE * nsectors),
+        .size = ((uint64_t)ATAPI_SECTOR_SIZE * nsectors),
         .atapi = true,
         .atapi_dma = dma,
         .post_cb = ahci_cb_cmp_buff,
         .set_bcl = override_bcl,
         .bcl = bcl,
     };
-    uint64_t iso_size = ATAPI_SECTOR_SIZE * (nsectors + 1);
+    uint64_t iso_size = (uint64_t)ATAPI_SECTOR_SIZE * (nsectors + 1);
 
     /* Prepare ISO and fill 'tx' buffer */
     fd = prepare_iso(iso_size, &tx, &iso);
-- 
2.27.0


