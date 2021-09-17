Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B440F1C7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:54:30 +0200 (CEST)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6pR-00077A-O7
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cy-0005PO-QT
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cq-0003fk-En
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6EUxYxhOFzLU6kuss4XhdFLrG7URHqgFVAK7WCGG9Y=;
 b=TgQZbI62fy8jXGtWQH0TJy3803cOJMmKzKn5svKPJ4Z42dTZ9cUH52G1kU35DNusdI5bJy
 A67APIXnfoY3icwkqzNGAcmgm4Tl8lKLt57b2FQaKj1XEZ8SPlde6ZzkfmzLAIoT9SzriI
 01P9iabZ5qn5SIFJZfK4InCAh4V3QS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-tjj2HYjnMTmgFgyvL74yXg-1; Fri, 17 Sep 2021 01:41:25 -0400
X-MC-Unique: tjj2HYjnMTmgFgyvL74yXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53AC0824FA6;
 Fri, 17 Sep 2021 05:41:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B56877F3C;
 Fri, 17 Sep 2021 05:41:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] iotests: Accommodate async QMP Exception classes
Date: Fri, 17 Sep 2021 01:40:45 -0400
Message-Id: <20210917054047.2042843-14-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 tests/qemu-iotests/tests/mirror-top-perms | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 4f03c12169..a403c35b08 100755
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
index 451a0666f8..7d448f4d23 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -103,7 +103,11 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
             print('ERROR: VM B launched successfully, this should not have '
                   'happened')
         except qemu.qmp.QMPConnectError:
-            assert 'Is another process using the image' in self.vm_b.get_log()
+            pass
+        except qemu.aqmp.ConnectError:
+            pass
+
+        assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
                              device='mirror')
-- 
2.31.1


