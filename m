Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9F170D0C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 01:12:34 +0100 (CET)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j76n3-0005eQ-Il
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 19:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1j76ha-0004rj-27
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1j76hY-0005w2-57
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46358
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1j76hX-0005uy-WF
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582762011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJefKQtoki8CCsDVwlXv0xNzlmDcB+4Ud4A3n2u5We0=;
 b=UqxBkDLjPtemty8+mpOWQ4VLpp6Gl0lq49WQUGd6Xe8MXZ8C4i+0OJNmWIEJOV0Nrvq7s+
 3R9sKJsvDgcTTA01mHC7Y2kjSs/oysbou4V24Q0i9Tzc7XLL8mPcnMo7mLrTrRt7QLogIx
 7Gt7b7smKWG1vMgGKSNsdO32W7vSqvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-wmIHiigfOym8KHFOxlbhGQ-1; Wed, 26 Feb 2020 19:06:49 -0500
X-MC-Unique: wmIHiigfOym8KHFOxlbhGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE4F107ACC4;
 Thu, 27 Feb 2020 00:06:48 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-58.rdu2.redhat.com [10.10.123.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB642708E;
 Thu, 27 Feb 2020 00:06:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/9] iotests: use python logging for iotests.log()
Date: Wed, 26 Feb 2020 19:06:36 -0500
Message-Id: <20200227000639.9644-7-jsnow@redhat.com>
In-Reply-To: <20200227000639.9644-1-jsnow@redhat.com>
References: <20200227000639.9644-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can turn logging on/off globally instead of per-function.

Remove use_log from run_job, and use python logging to turn on
diffable output when we run through a script entry point.

iotest 245 changes output order due to buffering reasons.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/030        |  4 +--
 tests/qemu-iotests/245        |  1 +
 tests/qemu-iotests/245.out    | 24 ++++++++---------
 tests/qemu-iotests/iotests.py | 50 +++++++++++++++++++++--------------
 4 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index aa911d266a..104e3cee1b 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -411,8 +411,8 @@ class TestParallelOps(iotests.QMPTestCase):
         result =3D self.vm.qmp('block-job-set-speed', device=3D'drive0', s=
peed=3D0)
         self.assert_qmp(result, 'return', {})
=20
-        self.vm.run_job(job=3D'drive0', auto_dismiss=3DTrue, use_log=3DFal=
se)
-        self.vm.run_job(job=3D'node4', auto_dismiss=3DTrue, use_log=3DFals=
e)
+        self.vm.run_job(job=3D'drive0', auto_dismiss=3DTrue)
+        self.vm.run_job(job=3D'node4', auto_dismiss=3DTrue)
         self.assert_no_active_block_jobs()
=20
     # Test a block-stream and a block-commit job in parallel
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 489bf78bd0..edb40a4ae8 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1002,5 +1002,6 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'backing': 'hd2'})
=20
 if __name__ =3D=3D '__main__':
+    iotests.activate_logging()
     iotests.main(supported_fmts=3D["qcow2"],
                  supported_protocols=3D["file"])
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index a19de5214d..15c3630e92 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -1,17 +1,17 @@
+{"execute": "job-finalize", "arguments": {"id": "commit0"}}
+{"return": {}}
+{"data": {"id": "commit0", "type": "commit"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "commit0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-finalize", "arguments": {"id": "stream0"}}
+{"return": {}}
+{"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-finalize", "arguments": {"id": "stream0"}}
+{"return": {}}
+{"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
 ..................
 ----------------------------------------------------------------------
 Ran 18 tests
=20
 OK
-{"execute": "job-finalize", "arguments": {"id": "commit0"}}
-{"return": {}}
-{"data": {"id": "commit0", "type": "commit"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"data": {"device": "commit0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
-{"execute": "job-finalize", "arguments": {"id": "stream0"}}
-{"return": {}}
-{"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
-{"execute": "job-finalize", "arguments": {"id": "stream0"}}
-{"return": {}}
-{"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING"=
, "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed":=
 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b02d7932fa..60c4c7f736 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -35,6 +35,14 @@
=20
 assert sys.version_info >=3D (3, 6)
=20
+# Use this logger for logging messages directly from the iotests module
+logger =3D logging.getLogger('qemu.iotests')
+logger.addHandler(logging.NullHandler())
+
+# Use this logger for messages that ought to be used for diff output.
+test_logger =3D logging.getLogger('qemu.iotests.diff_io')
+
+
 # This will not work if arguments contain spaces but is necessary if we
 # want to support the override options that ./check supports.
 qemu_img_args =3D [os.environ.get('QEMU_IMG_PROG', 'qemu-img')]
@@ -361,10 +369,10 @@ def log(msg, filters=3D(), indent=3DNone):
         separators =3D (', ', ': ') if indent is None else (',', ': ')
         # Don't sort if it's already sorted
         do_sort =3D not isinstance(msg, OrderedDict)
-        print(json.dumps(msg, sort_keys=3Ddo_sort,
-                         indent=3Dindent, separators=3Dseparators))
+        test_logger.info(json.dumps(msg, sort_keys=3Ddo_sort,
+                                    indent=3Dindent, separators=3Dseparato=
rs))
     else:
-        print(msg)
+        test_logger.info(msg)
=20
 class Timeout:
     def __init__(self, seconds, errmsg=3D"Timeout"):
@@ -578,7 +586,7 @@ def qmp_log(self, cmd, filters=3D(), indent=3DNone, **k=
wargs):
=20
     # Returns None on success, and an error string on failure
     def run_job(self, job, auto_finalize=3DTrue, auto_dismiss=3DFalse,
-                pre_finalize=3DNone, cancel=3DFalse, use_log=3DTrue, wait=
=3D60.0):
+                pre_finalize=3DNone, cancel=3DFalse, wait=3D60.0):
         """
         run_job moves a job from creation through to dismissal.
=20
@@ -591,7 +599,6 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dismi=
ss=3DFalse,
                              invoked prior to issuing job-finalize, if any=
.
         :param cancel: Bool. When true, cancels the job after the pre_fina=
lize
                        callback.
-        :param use_log: Bool. When false, does not log QMP messages.
         :param wait: Float. Timeout value specifying how long to wait for =
any
                      event, in seconds. Defaults to 60.0.
         """
@@ -609,8 +616,7 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dismi=
ss=3DFalse,
         while True:
             ev =3D filter_qmp_event(self.events_wait(events, timeout=3Dwai=
t))
             if ev['event'] !=3D 'JOB_STATUS_CHANGE':
-                if use_log:
-                    log(ev)
+                log(ev)
                 continue
             status =3D ev['data']['status']
             if status =3D=3D 'aborting':
@@ -618,26 +624,18 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dis=
miss=3DFalse,
                 for j in result['return']:
                     if j['id'] =3D=3D job:
                         error =3D j['error']
-                        if use_log:
-                            log('Job failed: %s' % (j['error']))
+                        log('Job failed: %s' % (j['error']))
             elif status =3D=3D 'ready':
                 self.qmp_log('job-complete', id=3Djob)
             elif status =3D=3D 'pending' and not auto_finalize:
                 if pre_finalize:
                     pre_finalize()
-                if cancel and use_log:
+                if cancel:
                     self.qmp_log('job-cancel', id=3Djob)
-                elif cancel:
-                    self.qmp('job-cancel', id=3Djob)
-                elif use_log:
+                else:
                     self.qmp_log('job-finalize', id=3Djob)
-                else:
-                    self.qmp('job-finalize', id=3Djob)
             elif status =3D=3D 'concluded' and not auto_dismiss:
-                if use_log:
-                    self.qmp_log('job-dismiss', id=3Djob)
-                else:
-                    self.qmp('job-dismiss', id=3Djob)
+                self.qmp_log('job-dismiss', id=3Djob)
             elif status =3D=3D 'null':
                 return error
=20
@@ -953,7 +951,7 @@ def notrun(reason):
     seq =3D os.path.basename(sys.argv[0])
=20
     open('%s/%s.notrun' % (output_dir, seq), 'w').write(reason + '\n')
-    print('%s not run: %s' % (seq, reason))
+    logger.warning("%s not run: %s", seq, reason)
     sys.exit(0)
=20
 def case_notrun(reason):
@@ -1136,6 +1134,7 @@ def execute_setup_common(supported_fmts: Collection[s=
tr] =3D (),
     if debug:
         sys.argv.remove('-d')
     logging.basicConfig(level=3D(logging.DEBUG if debug else logging.WARN)=
)
+    logger.debug("iotests debugging messages active")
=20
     return debug
=20
@@ -1148,14 +1147,25 @@ def execute_test(*args, test_function=3DNone, **kwa=
rgs):
     else:
         test_function()
=20
+def activate_logging():
+    """Activate iotests.log() output to stdout for script-style tests."""
+    handler =3D logging.StreamHandler(stream=3Dsys.stdout)
+    formatter =3D logging.Formatter('%(message)s')
+    handler.setFormatter(formatter)
+    test_logger.addHandler(handler)
+    test_logger.setLevel(logging.INFO)
+    test_logger.propagate =3D False
+
 # This is called from script-style iotests without a single point of entry
 def script_initialize(*args, **kwargs):
     """Initialize script-style tests without running any tests."""
+    activate_logging()
     execute_setup_common(*args, **kwargs)
=20
 # This is called from script-style iotests with a single point of entry
 def script_main(test_function, *args, **kwargs):
     """Run script-style tests outside of the unittest framework"""
+    activate_logging()
     execute_test(*args, test_function=3Dtest_function, **kwargs)
=20
 # This is called from unittest style iotests
--=20
2.21.1


