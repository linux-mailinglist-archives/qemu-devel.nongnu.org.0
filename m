Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFC20A289
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 18:01:51 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUJx-0005Yb-W1
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 12:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTjL-0006vL-6A
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39630
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTjJ-0001WI-9C
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tNmvsX0enHZpWlhX9xUzW41+hKt4XBVUHLN3u9eAeI=;
 b=eCQ5YHtnFbCTPme8EUluOsOPiOrfxkCtwyMwwf3AcIOf4ZPQ+kDMa/n0tw61lrpxQZMCEQ
 WZJ5lrK5WBXBL5Sv0sEIMyfQQThiH0fO6Qy6glSHCD9cHfvNJ7wLYvNQJ93sK/vX2Y7SJo
 WuZHEICsolXUYDFcjRgJnM8w7ocunpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-Thtf0bSMNxugvEjrlyqX9w-1; Thu, 25 Jun 2020 11:23:54 -0400
X-MC-Unique: Thtf0bSMNxugvEjrlyqX9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2BB0800C64;
 Thu, 25 Jun 2020 15:23:53 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82759D01E7;
 Thu, 25 Jun 2020 15:23:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 43/47] iotests: Let complete_and_wait() work with commit
Date: Thu, 25 Jun 2020 17:22:11 +0200
Message-Id: <20200625152215.941773-44-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

complete_and_wait() and wait_ready() currently only work for mirror
jobs.  Let them work for active commit jobs, too.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5ea4c4df8b..57b32d8ad3 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -932,8 +932,12 @@ class QMPTestCase(unittest.TestCase):
 
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
@@ -952,7 +956,7 @@ class QMPTestCase(unittest.TestCase):
         self.assert_qmp(result, 'return', {})
 
         event = self.wait_until_completed(drive=drive, error=completion_error)
-        self.assert_qmp(event, 'data/type', 'mirror')
+        self.assertTrue(event['data']['type'] in ['mirror', 'commit'])
 
     def pause_wait(self, job_id='job0'):
         with Timeout(3, "Timeout waiting for job to pause"):
-- 
2.26.2


