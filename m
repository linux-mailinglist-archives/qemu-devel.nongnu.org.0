Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424E505F47
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:22:22 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYpB-0001Zc-DA
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYia-0001Kt-Ge
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiV-0004nZ-MR
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpnutllcCNElkyJTjJgJ6d3qeryT4OUdQG1J4/NfJuI=;
 b=DrPWmuOo86or73OL5RR7GhlH5XFFOLkcIlMPWBGpMd7Frt5BREAe22lXUFtzsGH2hPJ0ck
 13GGFnl7yQ2zkCUB05NjAIW3ylsUIj/sFCoio6xfBkOIcocBGl6eQ9MZaidZdnFVaZNoNa
 6L52Dk9gQDrgxBtRXvDJzP3L/Q6YSVw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-RUfVjEhaPhWh2NFWxjazng-1; Mon, 18 Apr 2022 17:15:14 -0400
X-MC-Unique: RUfVjEhaPhWh2NFWxjazng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BB843806702;
 Mon, 18 Apr 2022 21:15:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C262166BA2;
 Mon, 18 Apr 2022 21:15:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] iotests/040: Fix TestCommitWithFilters test
Date: Mon, 18 Apr 2022 17:14:57 -0400
Message-Id: <20220418211504.943969-6-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
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

The commit jobs changes the backing file string stored in the image file
header belonging to the node above the commit’s top node to point to the
commit target (the base node).  QEMU tries to be as accurate as
possible, and so in these test cases will include the filter that is
part of the block graph in that backing file string (by virtue of making
it a json:{} description of the post-commit subgraph).  This makes
little sense outside of QEMU, though: Specifically, the throttle node in
that subgraph will dearly miss its supposedly associated throttle group
object.

When starting the commit job, we can specify a custom backing file
string to write into said image file, so let’s use that feature to write
the plain filename of the backing chain’s next actual image file there.

Explicitly provide the backing file so that opening the file outside of
QEMU (Where we will not have throttle groups) will succeed.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/040 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index c4a90937dcb..30eb97829ea 100755
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


