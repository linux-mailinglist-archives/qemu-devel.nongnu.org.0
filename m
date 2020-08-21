Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D089324D731
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 16:19:52 +0200 (CEST)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k97tX-0003sB-Su
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 10:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k97j5-0007c8-O0
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 10:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k97j3-0004a6-QT
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 10:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598018941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92W2/VNpKH3NOOOD4Q+AtHcwoQhnZFYJS8bzwG1EkWE=;
 b=O5t8xel0J7dxmjnrCK7BpxY5QChOXYzNIIZIOYKw0CEYD0z2vOlKaDKSv8BWfpg1VnwiOV
 435rFdNDydGAVvIQ/9dqxvqzglYIBo/gEiCifa+Bo8uhAa1CtMPTK/Js1rwgIXbgUVV0qt
 j2HEV+3f9ybJh66tFbxPr6SgPioOxYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-wQt3JxkqOf2kEqwoqCnhuQ-1; Fri, 21 Aug 2020 10:08:44 -0400
X-MC-Unique: wQt3JxkqOf2kEqwoqCnhuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5A581CAFA;
 Fri, 21 Aug 2020 14:08:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-220.phx2.redhat.com [10.3.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEC14614F1;
 Fri, 21 Aug 2020 14:08:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] iotests.py: Let wait_migration() return on failure
Date: Fri, 21 Aug 2020 09:08:25 -0500
Message-Id: <20200821140826.194322-14-eblake@redhat.com>
In-Reply-To: <20200821140826.194322-1-eblake@redhat.com>
References: <20200821140826.194322-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 02:43:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Let wait_migration() return on failure (with the return value indicating
whether the migration was completed or has failed), so we can use it for
migrations that are expected to fail, too.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200820150725.68687-3-mreitz@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 717b5b652c45..e197c73ca501 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -729,16 +729,22 @@ class VM(qtest.QEMUQtestMachine):
             }
         ]))

-    def wait_migration(self, expect_runstate):
+    def wait_migration(self, expect_runstate: Optional[str]) -> bool:
         while True:
             event = self.event_wait('MIGRATION')
             log(event, filters=[filter_qmp_event])
-            if event['data']['status'] == 'completed':
+            if event['data']['status'] in ('completed', 'failed'):
                 break
-        # The event may occur in finish-migrate, so wait for the expected
-        # post-migration runstate
-        while self.qmp('query-status')['return']['status'] != expect_runstate:
-            pass
+
+        if event['data']['status'] == 'completed':
+            # The event may occur in finish-migrate, so wait for the expected
+            # post-migration runstate
+            runstate = None
+            while runstate != expect_runstate:
+                runstate = self.qmp('query-status')['return']['status']
+            return True
+        else:
+            return False

     def node_info(self, node_name):
         nodes = self.qmp('query-named-block-nodes')
-- 
2.28.0


