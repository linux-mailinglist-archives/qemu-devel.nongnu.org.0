Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65EF2591D4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:56:28 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7hz-0000SR-KY
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7ON-0001kJ-8t
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:36:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7OH-0007UT-Jm
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVbs/jm54wzpCPp1bOuM2UFI4F7Icj8UBnILl8cNZKU=;
 b=Wlo8AAvMlWOM/2G2ONjtJI9wPv7sZbcXfflo1Xrvz3VvQmOPocpmxPqjb4EKLIRMKX5mXh
 BCT04cBnsJxWheLPWj3KnyACqftg+j42aoy0tWrFoIFgVtbsNdZ/x6RffO8WfE4tncHRyj
 2wKTZAOERmCb/nscvYxvKT5ntRjusu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-Sw617yusPZylI2MAoeVphw-1; Tue, 01 Sep 2020 10:36:03 -0400
X-MC-Unique: Sw617yusPZylI2MAoeVphw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3378015DB;
 Tue,  1 Sep 2020 14:36:02 +0000 (UTC)
Received: from localhost (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4051002D58;
 Tue,  1 Sep 2020 14:36:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 39/43] iotests: Let complete_and_wait() work with commit
Date: Tue,  1 Sep 2020 16:34:20 +0200
Message-Id: <20200901143424.884735-40-mreitz@redhat.com>
In-Reply-To: <20200901143424.884735-1-mreitz@redhat.com>
References: <20200901143424.884735-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

complete_and_wait() and wait_ready() currently only work for mirror
jobs.  Let them work for active commit jobs, too.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index e197c73ca5..64ccaf9061 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -972,8 +972,12 @@ class QMPTestCase(unittest.TestCase):
 
     def wait_ready(self, drive='drive0'):
         """Wait until a BLOCK_JOB_READY event, and return the event."""
-        f = {'data': {'type': 'mirror', 'device': drive}}
-        return self.vm.event_wait(name='BLOCK_JOB_READY', match=f)
+        return self.vm.events_wait([
+            ('BLOCK_JOB_READY',
+             {'data': {'type': 'mirror', 'device': drive}}),
+            ('BLOCK_JOB_READY',
+             {'data': {'type': 'commit', 'device': drive}})
+        ])
 
     def wait_ready_and_cancel(self, drive='drive0'):
         self.wait_ready(drive=drive)
@@ -992,7 +996,7 @@ class QMPTestCase(unittest.TestCase):
         self.assert_qmp(result, 'return', {})
 
         event = self.wait_until_completed(drive=drive, error=completion_error)
-        self.assert_qmp(event, 'data/type', 'mirror')
+        self.assertTrue(event['data']['type'] in ['mirror', 'commit'])
 
     def pause_wait(self, job_id='job0'):
         with Timeout(3, "Timeout waiting for job to pause"):
-- 
2.26.2


