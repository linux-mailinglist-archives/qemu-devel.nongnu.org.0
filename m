Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76743B935
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:13:54 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQxN-00064N-P4
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgY-0003cp-1N
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgS-0004Yd-Nm
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635270984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg98vKT4BEF48sXoFpc39NSWEIJX99bedc0aLM9zakk=;
 b=WJDaACijmRjI1WBUH/3RlI7iyf4W7SmPthyJvJWcq1aY0fV4zfCINgZwP7m2XSIpvYkHPD
 MVU/eyPZoJ/OHTV/98BBaA8RQY2FtiQas7kAUnBDd2pEK6PQqKq2P3NxBkvZedWpQExMvX
 KUvBABMO45/5+d/2XOg78lD3TqglcQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-YeiO3I32Mbyp8r4eDCsUPg-1; Tue, 26 Oct 2021 13:56:20 -0400
X-MC-Unique: YeiO3I32Mbyp8r4eDCsUPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741AD10247A7;
 Tue, 26 Oct 2021 17:56:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.17.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB015DF21;
 Tue, 26 Oct 2021 17:56:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/8] iotests/300: avoid abnormal shutdown race condition
Date: Tue, 26 Oct 2021 13:56:10 -0400
Message-Id: <20211026175612.4127598-7-jsnow@redhat.com>
In-Reply-To: <20211026175612.4127598-1-jsnow@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wait for the destination VM to close itself instead of racing to shut it
down first, which produces different error log messages from AQMP
depending on precisely when we tried to shut it down.

(For example: We may try to issue 'quit' immediately prior to the target
VM closing its QMP socket, which will cause an ECONNRESET error to be
logged. Waiting for the VM to exit itself avoids the race on shutdown
behavior.)

Reported-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/300 | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 10f9f2a8da6..dbd28384ec3 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -24,8 +24,6 @@ import random
 import re
 from typing import Dict, List, Optional
 
-from qemu.machine import machine
-
 import iotests
 
 
@@ -461,12 +459,11 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
                       f"'{self.src_node_name}': Name is longer than 255 bytes",
                       log)
 
-        # Expect abnormal shutdown of the destination VM because of
-        # the failed migration
-        try:
-            self.vm_b.shutdown()
-        except machine.AbnormalShutdown:
-            pass
+        # Destination VM will terminate w/ error of its own accord
+        # due to the failed migration.
+        self.vm_b.wait()
+        rc = self.vm_b.exitcode()
+        assert rc is not None and rc > 0
 
     def test_aliased_bitmap_name_too_long(self) -> None:
         # Longer than the maximum for bitmap names
-- 
2.31.1


