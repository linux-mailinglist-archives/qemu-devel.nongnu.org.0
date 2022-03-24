Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302ED4E68C9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:38:40 +0100 (CET)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSM3-000403-2O
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:38:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEI-0000Dx-TR
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEE-0005k7-MV
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHT7c89Bh8Mn9PnD4cKB0TORfxzH0RFSej7dRZ38+AU=;
 b=SKYS/4cGKhlOwpLKdWykt7eFO6jyCO5JjCx99LA2k4mSjyuSO6hdlQ3dzQlDD5LxSgPuLW
 qReaOdGXxbqIFSQ3/+ssyV3OheQ4l11OjJU3eyzBFO58I4DQ2KdDzUApFUWedAVaAx03gs
 bL25KnPA7zrsrP6VwN5jO2MjKb1Fp/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-J938xYa2NziaqhvOLSwcRA-1; Thu, 24 Mar 2022 14:30:30 -0400
X-MC-Unique: J938xYa2NziaqhvOLSwcRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7281B803D67;
 Thu, 24 Mar 2022 18:30:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EE2BC27E83;
 Thu, 24 Mar 2022 18:30:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] iotests/040: Fix TestCommitWithFilters test
Date: Thu, 24 Mar 2022 14:30:06 -0400
Message-Id: <20220324183018.2476551-6-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this change, asserting that qemu_io always returns 0 causes this
test to fail in a way we happened not to be catching previously:

 qemu.utils.VerboseProcessError: Command
  '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
  '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
  'read -P 4 3M 1M',
  '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
  returned non-zero exit status 1.
  ┏━ output ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ┃ qemu-io: can't open device
  ┃ /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img:
  ┃ Could not open backing file: Could not open backing file: Throttle
  ┃ group 'tg' does not exist
  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Explicitly provide the backing file so that opening the file outside of
QEMU (Where we will not have throttle groups) will succeed.

[Patch entirely written by Hanna but I don't have her S-o-B]
[My commit message is probably also garbage, sorry]
[Feel free to suggest a better one]
[I hope your day is going well]
Signed-off-by: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/040 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index c4a90937dc..30eb97829e 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -836,7 +836,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
                              job_id='commit',
                              device='top-filter',
                              top_node='cow-2',
-                             base_node='cow-1')
+                             base_node='cow-1',
+                             backing_file=self.img1)
         self.assert_qmp(result, 'return', {})
         self.wait_until_completed(drive='commit')
 
@@ -852,7 +853,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
                              job_id='commit',
                              device='top-filter',
                              top_node='cow-1',
-                             base_node='cow-0')
+                             base_node='cow-0',
+                             backing_file=self.img0)
         self.assert_qmp(result, 'return', {})
         self.wait_until_completed(drive='commit')
 
-- 
2.34.1


