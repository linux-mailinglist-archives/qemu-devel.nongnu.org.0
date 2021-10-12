Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264942AFB9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:38:16 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQPX-0002XV-1G
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maQMM-0007I9-4k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maQMK-000221-AK
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634078095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDYHnO/IpWaVnRKqpP1nH1ZYFWIAq4yQTw4V2TF3VXo=;
 b=A5OAnogh2iNky05C82lTChmg3n9/QSN2AgJY/BD7PtjhjShhD0MiT0TK5Tam2PtSgDzkJk
 rt0zgc3MI08SyKlVSKWDi+7zmweFJhKHMfPpajnKOpihBTJTdGZ+NA23WQdD0HY0UiDIRG
 tqhHjLc15lyal1V2x2fZxIfhiNX26g8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-YAxDV-_gPH-4VGL7_7NIgA-1; Tue, 12 Oct 2021 18:34:52 -0400
X-MC-Unique: YAxDV-_gPH-4VGL7_7NIgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0C818125C0;
 Tue, 12 Oct 2021 22:34:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED7919C79;
 Tue, 12 Oct 2021 22:34:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] iotests: Accommodate async QMP Exception classes
Date: Tue, 12 Oct 2021 18:34:42 -0400
Message-Id: <20211012223445.1051101-5-jsnow@redhat.com>
In-Reply-To: <20211012223445.1051101-1-jsnow@redhat.com>
References: <20211012223445.1051101-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

(But continue to support the old ones for now, too.)

There are very few cases of any user of QEMUMachine or a subclass
thereof relying on a QMP Exception type. If you'd like to check for
yourself, you want to grep for all of the derivatives of QMPError,
excluding 'AQMPError' and its derivatives. That'd be these:

- QMPError
- QMPConnectError
- QMPCapabilitiesError
- QMPTimeoutError
- QMPProtocolError
- QMPResponseError
- QMPBadPortError


Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench_block_job.py    | 3 ++-
 tests/qemu-iotests/tests/mirror-top-perms | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 4f03c121697..a403c35b08f 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -28,6 +28,7 @@
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
 from qemu.qmp import QMPConnectError
+from qemu.aqmp import ConnectError
 
 
 def bench_block_job(cmd, cmd_args, qemu_args):
@@ -49,7 +50,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
         vm.launch()
     except OSError as e:
         return {'error': 'popen failed: ' + str(e)}
-    except (QMPConnectError, socket.timeout):
+    except (QMPConnectError, ConnectError, socket.timeout):
         return {'error': 'qemu failed: ' + str(vm.get_log())}
 
     try:
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 3d475aa3a54..a2d5c269d7a 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -21,8 +21,9 @@
 
 import os
 
-from qemu import qmp
+from qemu.aqmp import ConnectError
 from qemu.machine import machine
+from qemu.qmp import QMPConnectError
 
 import iotests
 from iotests import qemu_img
@@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
             self.vm_b.launch()
             print('ERROR: VM B launched successfully, this should not have '
                   'happened')
-        except qmp.QMPConnectError:
+        except (QMPConnectError, ConnectError):
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


