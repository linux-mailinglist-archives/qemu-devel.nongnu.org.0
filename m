Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FAB3EC0D9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:14:25 +0200 (CEST)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmw4-00067S-G9
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms5-0006n2-HG
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms3-0004J9-9h
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2cfi7kmznoROCAFCUq4RNN/VdNXHw/nS8bddWC6uQM=;
 b=YiMDrrApOYKHbmhJHRhugu3rwnsqWl2xlmfVYdgsaSfZzUBuxWTGGWrPvZNS+t8+e9dUHq
 CHWXZGiPoV+yR4figZjZ4I42BCGQKzEZiCqJYyFDIwNBR35fhhc3+L2acJBzq5K2iIczYE
 DGFZD7Avcd6lynZwBC2NsMSQj6hosiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-RNit878QMNyqWA2AyzcQ9A-1; Sat, 14 Aug 2021 02:10:12 -0400
X-MC-Unique: RNit878QMNyqWA2AyzcQ9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A3C101C8A0;
 Sat, 14 Aug 2021 06:10:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC0865D9D5;
 Sat, 14 Aug 2021 06:10:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 04/11] tests/qtest/vhost-user-blk-test: Check whether
 qemu-storage-daemon is available
Date: Sat, 14 Aug 2021 08:09:49 +0200
Message-Id: <20210814060956.12852-5-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.701, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-blk-test currently hangs if QTEST_QEMU_STORAGE_DAEMON_BINARY
points to a non-existing binary. Let's improve this situation by checking
for the availability of the binary first, so we can fail gracefully if
it is not accessible.

Message-Id: <20210811095949.133462-1-thuth@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
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


