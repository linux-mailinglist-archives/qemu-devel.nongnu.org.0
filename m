Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D44A7DEC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:30:52 +0100 (CET)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRtb-0007VT-SH
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRnl-0003Ip-8n
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRnj-0000Wk-7l
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643855086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1rQ2bf2pnIC4/TwrE/jyxd9/PvqyzNmIzVCiMALWXY=;
 b=J79ChXwhqWc6bSCNWumMUBKsflAgbeSVj/ANHyIXvNSwd+fSGs6Um2l8qLKEaxL8EQzk7a
 r64OgTs7rikkGAMZmaBAjQgcuZxwjNPcFjiXQx2JXif+hq7MsR7BccnUIHr5QrroJ3xQS7
 pyjoLoXYBPCEFkCPnUTcXdvndgh5AtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-eTlQkp0DNbeJU4dSPORrYQ-1; Wed, 02 Feb 2022 21:24:43 -0500
X-MC-Unique: eTlQkp0DNbeJU4dSPORrYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A182814246;
 Thu,  3 Feb 2022 02:24:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7543E9A31C;
 Thu,  3 Feb 2022 02:24:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] iotests/mirror-top-perms: switch to AQMP
Date: Wed,  2 Feb 2022 21:24:04 -0500
Message-Id: <20220203022405.1336635-4-jsnow@redhat.com>
In-Reply-To: <20220203022405.1336635-1-jsnow@redhat.com>
References: <20220203022405.1336635-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have to maintain compatibility with both QMP libraries anymore,
so we can just remove the old exception. While we're here, take
advantage of the extra fields present in the VMLaunchFailure exception
that machine.py now raises.

(Note: I'm leaving the logging suppression here unchanged. I had
suggested previously we use filters to scrub the PID out of the logging
information so it could just be diffed as part of the iotest output, but
that meant *always* scrubbing PID from logger output, which defeated the
point of even offering that information in the output to begin with.

Ultimately, I decided it's fine to just suppress the logger temporarily.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index b5849978c4..223f3c1620 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -22,7 +22,6 @@
 import os
 
 from qemu.machine import machine
-from qemu.qmp import QMPConnectError
 
 import iotests
 from iotests import change_log_level, qemu_img
@@ -99,15 +98,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
-            # Silence AQMP errors temporarily.
-            # TODO: Remove this and just allow the errors to be logged when
-            # AQMP fully replaces QMP.
+            # Silence AQMP logging errors temporarily.
             with change_log_level('qemu.aqmp'):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-        except (QMPConnectError, machine.VMLaunchFailure):
-            assert 'Is another process using the image' in self.vm_b.get_log()
+        except machine.VMLaunchFailure as exc:
+            assert 'Is another process using the image' in exc.output
 
         result = self.vm.qmp('block-job-cancel',
                              device='mirror')
-- 
2.31.1


