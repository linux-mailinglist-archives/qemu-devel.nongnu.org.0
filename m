Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D853D4154EB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:59:16 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD51-0007Ri-Ss
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCwD-0001mO-T0
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCwC-0006Vl-Ae
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMY6oYi7wqFHsQ1450+IUVwq/P/BEgFbw3j2tBKjeI8=;
 b=iWYelJrzHBZWT+g2tMNLOedUl3Kgt+yx0L4NlsSYTIWQJuSXSS6z7fmYHRVn4ZujvD0+VL
 QuatjTfbiRc45/PvOvCWaq/APFF9caZwwIvMyC8ciHNz8SooXJnjibdhiMXSO0jubK22XK
 BOeh9zrGgDxGzgcScJGit0ugQq8yNzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-4sX_4D-9M5CyfpIioorv_Q-1; Wed, 22 Sep 2021 20:50:06 -0400
X-MC-Unique: 4sX_4D-9M5CyfpIioorv_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FAA1006AA2;
 Thu, 23 Sep 2021 00:50:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 751FD60BF4;
 Thu, 23 Sep 2021 00:50:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/17] iotests: Accommodate async QMP Exception classes
Date: Wed, 22 Sep 2021 20:49:34 -0400
Message-Id: <20210923004938.3999963-14-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 tests/qemu-iotests/tests/mirror-top-perms | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index 2fc8dd66e0a..9fe315e3b01 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -26,6 +26,7 @@ from iotests import qemu_img
 # Import qemu after iotests.py has amended sys.path
 # pylint: disable=wrong-import-order
 import qemu
+from qemu.aqmp import ConnectError
 
 
 image_size = 1 * 1024 * 1024
@@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
             self.vm_b.launch()
             print('ERROR: VM B launched successfully, this should not have '
                   'happened')
-        except qemu.qmp.QMPConnectError:
+        except (qemu.qmp.QMPConnectError, ConnectError):
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


