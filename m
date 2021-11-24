Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998D45CD6C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:40:43 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpy8I-0004EK-BT
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:40:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvG-0003lb-7I
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvC-0007ej-I0
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbR8cLUOu5n6ohejSdT7hbIEAZvI5H8CnJy9U6sbFHY=;
 b=NCsMetmP6T3tgrtxuYBBB0ydNEn/ns/uUEY8BoIjyAqXYkgU3lDpLgMTx3zdzsTOvXWMYR
 E2ZvGUbwX1by8YSkiAD0kbFbMKPbeYX3rJClbyhq/Syk7MWGjgXpDRkGLvV65wdZk3LE7T
 X41ocu4rRTIubJFb7DYAFXTfxkCajd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-3vV3_pRlNVyn-by-sJ985w-1; Wed, 24 Nov 2021 14:27:06 -0500
X-MC-Unique: 3vV3_pRlNVyn-by-sJ985w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A52DB102C81F;
 Wed, 24 Nov 2021 19:27:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF05B6C337;
 Wed, 24 Nov 2021 19:27:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/23] iotests/mirror-top-perms: switch to AQMP
Date: Wed, 24 Nov 2021 14:26:10 -0500
Message-Id: <20211124192617.3396403-17-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>

---

Note: I still need to adjust the logging. The problem now is that the
logging messages include the PID of the test process, so they need to be
filtered out. I'll investigate that for a follow-up, or for v2.

I could just add yet another filtering function somewhere, but I think
it's getting out of hand with how many filters and loggers there are, so
I want to give it a slightly more serious treatment instead of a
hackjob.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 0a51a613f3..f394931a00 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -23,7 +23,6 @@ import os
 
 from qemu.aqmp import ConnectError
 from qemu.machine import machine
-from qemu.qmp import QMPConnectError
 
 import iotests
 from iotests import change_log_level, qemu_img
@@ -101,13 +100,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
             # Silence AQMP errors temporarily.
-            # TODO: Remove this and just allow the errors to be logged when
-            # AQMP fully replaces QMP.
+            # TODO: Remove change_log_level and allow the errors to be logged.
+            #       This necessitates a PID filter on *all* logging output.
             with change_log_level('qemu.aqmp'):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-        except (QMPConnectError, ConnectError):
+        except ConnectError:
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


