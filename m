Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D53E8DFD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 12:02:42 +0200 (CEST)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDl4K-0002pz-GP
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDl1r-0001aA-2W
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDl1o-0003ys-QI
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628676003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K+76O7G9UyrotRtWMOMVNQFVk4Jm3yZ+5NmEcOb9wAI=;
 b=cwrtg/dPTekYJaFlQakKqGs1JL0SJwsc5LOhEEDVGfi5qMefUANFp6QxAEzZv4N7eUl0sa
 EgU8Lpt9u9H6Sg/yiboslPBxLnUk6Tt+ACZl/lkEW8ekkw1C1zkjOkKfiMpdPQ++9wL6Ew
 K5gg5ARdJdealcEy+TVXpXzTwIeZMXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-vre7GKGSO2SjpwldGunfyA-1; Wed, 11 Aug 2021 06:00:02 -0400
X-MC-Unique: vre7GKGSO2SjpwldGunfyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 155BA192CC40;
 Wed, 11 Aug 2021 10:00:01 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAD912854E;
 Wed, 11 Aug 2021 09:59:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH] tests/qtest/vhost-user-blk-test: Check whether
 qemu-storage-daemon is available
Date: Wed, 11 Aug 2021 11:59:49 +0200
Message-Id: <20210811095949.133462-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-block@nongnu.org, philmd@redhat.com,
 alxndr@bu.edu, Stefan Hajnoczi <stefanha@redhat.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-blk-test currently hangs if QTEST_QEMU_STORAGE_DAEMON_BINARY
points to a non-existing binary. Let's improve this situation by checking
for the availability of the binary first, so we can fail gracefully if
it is not accessible.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 8796c74ca4..6f108a1b62 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -789,6 +789,14 @@ static const char *qtest_qemu_storage_daemon_binary(void)
         exit(0);
     }
 
+    /* If we've got a path to the binary, check whether we can access it */
+    if (strchr(qemu_storage_daemon_bin, '/') &&
+        access(qemu_storage_daemon_bin, X_OK) != 0) {
+        fprintf(stderr, "ERROR: '%s' is not accessible\n",
+                qemu_storage_daemon_bin);
+        exit(1);
+    }
+
     return qemu_storage_daemon_bin;
 }
 
-- 
2.27.0


