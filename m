Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB644420C9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:24:53 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcvM-0005dy-DC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbFc-0004SH-D2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbFa-0004oo-T1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZcpucreAvBk7xxm1UjkVG5FMbri5xYkSMZO8JvYPdY=;
 b=DwZ7lNHmOGVcVUjzPBDMYOPZwH/y5FLDjxmIinTC2AgB4FzTKl+bwpIC57mKIijRfPam7O
 56FPitHOl0iFV7Kx8YhF10oefc50Bun4LvcpyLBAAHazyVZ8PFK/XDv2ieU4F9nro3pd31
 9ucyud4s7l2imne9jYdODjjbFnVqjYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19--wpvcf7DObSoCK0uDROIVw-1; Mon, 01 Nov 2021 13:37:35 -0400
X-MC-Unique: -wpvcf7DObSoCK0uDROIVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B28138066EF;
 Mon,  1 Nov 2021 17:37:33 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22EC719C79;
 Mon,  1 Nov 2021 17:37:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] iotests: Accommodate async QMP Exception classes
Date: Mon,  1 Nov 2021 13:30:02 -0400
Message-Id: <20211101173006.656673-19-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20211026175612.4127598-5-jsnow@redhat.com
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


