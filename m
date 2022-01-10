Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775648A405
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:54:42 +0100 (CET)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Ur-0001yh-Jh
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749A-0005Uw-K2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7498-0000MQ-Ru
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZKUCxF+gcLpWqoCB88zDSSxE28Qrtc5Pc9kTOG/WZU=;
 b=Dfy2GGDzb+wR8MlVa6OP18zl10j6HnQAPpAUdyiBra1Tar5MQgQYoh9CULtSvoG+5OfwuM
 zsNLo+uTdVWW3aLutpWI/zJ9eCTCplg05KCpog5VjyQSPQYL1cmwAiSLfpiQKJS8qthbqv
 dYQh3bveS6HPuRsPlOihjJOtrGUtV58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-9jA0_Vo9P3ehaVKryiYx2A-1; Mon, 10 Jan 2022 18:32:12 -0500
X-MC-Unique: 9jA0_Vo9P3ehaVKryiYx2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C7A10247A7;
 Mon, 10 Jan 2022 23:32:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 206ED7B9C6;
 Mon, 10 Jan 2022 23:32:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/31] iotests/mirror-top-perms: switch to AQMP
Date: Mon, 10 Jan 2022 18:29:01 -0500
Message-Id: <20220110232910.1923864-23-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>

---

Note: I still need to adjust the logging. The problem now is that the
logging messages include the PID of the test process, so they need to be
filtered out. I'll investigate that for a follow-up.

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


