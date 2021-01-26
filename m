Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60325304020
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:23:22 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PFZ-00012f-CN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCm-0007Wl-HY
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCj-0005oD-QV
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0q9n7Dcqad7SM+BAxb4YuHrYKeEXkNfbBywt2M/+XVM=;
 b=YBJTSRkMgdNkeA8utmXY3XgMuWme2Tpu/hsYh0ndsGKqHmG7Yw3iio63T/8LtNm7IqCI/E
 tZgiS1IvBqutpJ1S2bMgvAx6JkBsXjDb6VpeZez84+byZypMbdq17Hghky3QwYkFvtqEXt
 td6ZJUxGBHBF1JW7WoWZ3diS8xNdNNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-cdNTI-j9OI2Y1mGw53gmHQ-1; Tue, 26 Jan 2021 09:20:22 -0500
X-MC-Unique: cdNTI-j9OI2Y1mGw53gmHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0317101F001;
 Tue, 26 Jan 2021 14:20:20 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F372722E3;
 Tue, 26 Jan 2021 14:20:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/53] iotests: fix _check_o_direct
Date: Tue, 26 Jan 2021 15:19:24 +0100
Message-Id: <20210126142016.806073-2-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Unfortunately commit "iotests: handle tmpfs" breaks running iotests
with -nbd -nocache, as _check_o_direct tries to create
$TEST_IMG.test_o_direct, but in case of nbd TEST_IMG is something like
nbd+unix:///... , and test fails with message

  qemu-img: nbd+unix:///?socket[...]test_o_direct: Protocol driver
    'nbd' does not support image creation, and opening the image
    failed: Failed to connect to '/tmp/tmp.[...]/nbd/test_o_direct': No
    such file or directory

Use TEST_DIR instead.

Fixes: cfdca2b9f9d4ca26bb2b2dfe8de3149092e39170
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201218182012.47607-1-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 29354654cc..297acf9b6a 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -821,9 +821,10 @@ _supported_cache_modes()
 # Check whether the filesystem supports O_DIRECT
 _check_o_direct()
 {
-    $QEMU_IMG create -f raw "$TEST_IMG".test_o_direct 1M > /dev/null
-    out=$($QEMU_IO -f raw -t none -c quit "$TEST_IMG".test_o_direct 2>&1)
-    rm -f "$TEST_IMG".test_o_direct
+    testfile="$TEST_DIR"/_check_o_direct
+    $QEMU_IMG create -f raw "$testfile" 1M > /dev/null
+    out=$($QEMU_IO -f raw -t none -c quit "$testfile" 2>&1)
+    rm -f "$testfile"
 
     [[ "$out" != *"O_DIRECT"* ]]
 }
-- 
2.29.2


