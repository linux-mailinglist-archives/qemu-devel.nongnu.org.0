Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E491988B2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 02:11:52 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ4VT-0001Ja-LT
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 20:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Ky-00047j-RN
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Kw-0000mH-It
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:01:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:22460)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jJ4Kv-0000h0-8a
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585612857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAWX00ZoHIpQ6rW+ga1PGOQ9I2fnPLtI1ZfDGIQKvo4=;
 b=eYJJ+3IqywwUQ/y8M+LlPvziuFBxXymV0TN2q1oyziTD6n9+yhXG3guKgzSN9Lo9fXzQx1
 CTTPzDkEdJqL33ibZOYJ96lfRoYa2AUKqxNfs3dMrUeRz6L4t32bRMfqbU2DlrInnsqUL3
 852opWLEZCRXhCqFqRciurjHmBi4cOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-C2k8a9k7PxuR2REvlTmNqQ-1; Mon, 30 Mar 2020 20:00:53 -0400
X-MC-Unique: C2k8a9k7PxuR2REvlTmNqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB0D1801E66;
 Tue, 31 Mar 2020 00:00:52 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-210.rdu2.redhat.com [10.10.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8557A100EBB6;
 Tue, 31 Mar 2020 00:00:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 14/14] iotests: use python logging for iotests.log()
Date: Mon, 30 Mar 2020 20:00:14 -0400
Message-Id: <20200331000014.11581-15-jsnow@redhat.com>
In-Reply-To: <20200331000014.11581-1-jsnow@redhat.com>
References: <20200331000014.11581-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can turn logging on/off globally instead of per-function.

Remove use_log from run_job, and use python logging to turn on
diffable output when we run through a script entry point.

iotest 245 changes output order due to buffering reasons.


An extended note on python logging:

A NullHandler is added to `qemu.iotests` to stop output from being
generated if this code is used as a library without configuring logging.
A NullHandler is only needed at the root, so a duplicate handler is not
needed for `qemu.iotests.diff_io`.

When logging is not configured, messages at the 'WARNING' levels or
above are printed with default settings. The NullHandler stops this from
occurring, which is considered good hygiene for code used as a library.

See https://docs.python.org/3/howto/logging.html#library-config

When logging is actually enabled (always at the behest of an explicit
call by a client script), a root logger is implicitly created at the
root, which allows messages to propagate upwards and be handled/emitted
from the root logger with default settings.

When we want iotest logging, we attach a handler to the
qemu.iotests.diff_io logger and disable propagation to avoid possible
double-printing.

For more information on python logging infrastructure, I highly
recommend downloading the pip package `logging_tree`, which provides
convenient visualizations of the hierarchical logging configuration
under different circumstances.

See https://pypi.org/project/logging_tree/ for more information.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/030        |  4 +--
 tests/qemu-iotests/155        |  2 +-
 tests/qemu-iotests/245        |  1 +
 tests/qemu-iotests/245.out    | 24 ++++++++--------
 tests/qemu-iotests/iotests.py | 53 ++++++++++++++++++++---------------
 5 files changed, 46 insertions(+), 38 deletions(-)

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
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 571bce9de4..cb371d4649 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -188,7 +188,7 @@ class MirrorBaseClass(BaseClass):
=20
         self.assert_qmp(result, 'return', {})
=20
-        self.vm.run_job('mirror-job', use_log=3DFalse, auto_finalize=3DFal=
se,
+        self.vm.run_job('mirror-job', auto_finalize=3DFalse,
                         pre_finalize=3Dself.openBacking, auto_dismiss=3DTr=
ue)
=20
     def testFull(self):
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 1001275a44..4f5f0bb901 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1027,5 +1027,6 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.run_test_iothreads(None, 'iothread0')
=20
 if __name__ =3D=3D '__main__':
+    iotests.activate_logging()
     iotests.main(supported_fmts=3D["qcow2"],
                  supported_protocols=3D["file"])
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 682b93394d..4b33dcaf5c 100644
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
 .....................
 ----------------------------------------------------------------------
 Ran 21 tests
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
index fd8cb36622..56179605a9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -42,6 +42,14 @@
 QMPResponse =3D Dict[str, Any]
=20
=20
+# Use this logger for logging messages directly from the iotests module
+logger =3D logging.getLogger('qemu.iotests')
+logger.addHandler(logging.NullHandler())
+
+# Use this logger for messages that ought to be used for diff output.
+test_logger =3D logging.getLogger('qemu.iotests.diff_io')
+
+
 faulthandler.enable()
=20
 # This will not work if arguments contain spaces but is necessary if we
@@ -384,9 +392,9 @@ def log(msg: Msg,
     if isinstance(msg, (dict, list)):
         # Don't sort if it's already sorted
         do_sort =3D not isinstance(msg, OrderedDict)
-        print(json.dumps(msg, sort_keys=3Ddo_sort, indent=3Dindent))
+        test_logger.info(json.dumps(msg, sort_keys=3Ddo_sort, indent=3Dind=
ent))
     else:
-        print(msg)
+        test_logger.info(msg)
=20
 class Timeout:
     def __init__(self, seconds, errmsg=3D"Timeout"):
@@ -608,7 +616,7 @@ def qmp_log(self, cmd, filters=3D(), indent=3DNone, **k=
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
@@ -621,7 +629,6 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dismi=
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
@@ -639,8 +646,7 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dismi=
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
@@ -648,29 +654,18 @@ def run_job(self, job, auto_finalize=3DTrue, auto_dis=
miss=3DFalse,
                 for j in result['return']:
                     if j['id'] =3D=3D job:
                         error =3D j['error']
-                        if use_log:
-                            log('Job failed: %s' % (j['error']))
+                        log('Job failed: %s' % (j['error']))
             elif status =3D=3D 'ready':
-                if use_log:
-                    self.qmp_log('job-complete', id=3Djob)
-                else:
-                    self.qmp('job-complete', id=3Djob)
+                self.qmp_log('job-complete', id=3Djob)
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
@@ -990,7 +985,7 @@ def notrun(reason):
     seq =3D os.path.basename(sys.argv[0])
=20
     open('%s/%s.notrun' % (output_dir, seq), 'w').write(reason + '\n')
-    print('%s not run: %s' % (seq, reason))
+    logger.warning("%s not run: %s", seq, reason)
     sys.exit(0)
=20
 def case_notrun(reason):
@@ -1182,6 +1177,7 @@ def execute_setup_common(supported_fmts: Sequence[str=
] =3D (),
     if debug:
         sys.argv.remove('-d')
     logging.basicConfig(level=3D(logging.DEBUG if debug else logging.WARN)=
)
+    logger.debug("iotests debugging messages active")
=20
     return debug
=20
@@ -1194,14 +1190,25 @@ def execute_test(*args, test_function=3DNone, **kwa=
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


