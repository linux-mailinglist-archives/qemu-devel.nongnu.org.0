Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DED3B5E67
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:51:11 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqjG-0007LQ-R8
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqRM-0007QA-0q
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqRF-0003HO-Ky
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624883553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2jsiDhfrKN+h9mKViT2yviKD38tba7MzbS6fXevvbM=;
 b=Yd3ORAOfbRF2mwdV2ZTCHb9+Dc2i9awKBCY6RL9q2evrvECRiVskTAPgk3oV+FBmVwt7IC
 rMKRNzkmAl66NoYWqFh2pQp4DpwZmHjv5WInja6aFzAai4IuB99R1IgfV1/FVw3TFhbu56
 UG3uK2jQQ8qcYk/xUfIS1Tg9uSmGCKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-974g0MXxNQKObRoXsFRPLw-1; Mon, 28 Jun 2021 08:32:31 -0400
X-MC-Unique: 974g0MXxNQKObRoXsFRPLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F87EC1A1;
 Mon, 28 Jun 2021 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-69.ams2.redhat.com
 [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11D5B19C46;
 Mon, 28 Jun 2021 12:32:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 10/16] qemu-iotests: extend the check script to prepare
 supporting valgrind for python tests
Date: Mon, 28 Jun 2021 14:31:44 +0200
Message-Id: <20210628123150.56567-11-eesposit@redhat.com>
In-Reply-To: <20210628123150.56567-1-eesposit@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the check script only parses the option and sets the
VALGRIND_QEMU environmental variable to "y".
Add another local python variable that prepares the command line,
identical to the one provided in the test scripts.

Because the python script does not know in advance the valgrind
PID to assign to the log file name, use the "%p" flag in valgrind
log file name that automatically puts the process PID at runtime.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/check      |  7 ++++---
 tests/qemu-iotests/iotests.py | 11 +++++++++++
 tests/qemu-iotests/testenv.py |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 4365bb8066..ebd27946db 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -39,6 +39,10 @@ def make_argparser() -> argparse.ArgumentParser:
     p.add_argument('-gdb', action='store_true',
                    help="start gdbserver with $GDB_OPTIONS options \
                         ('localhost:12345' if $GDB_OPTIONS is empty)")
+    p.add_argument('-valgrind', action='store_true',
+                    help='use valgrind, sets VALGRIND_QEMU environment '
+                    'variable')
+
     p.add_argument('-misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
@@ -88,9 +92,6 @@ def make_argparser() -> argparse.ArgumentParser:
     g_bash.add_argument('-o', dest='imgopts',
                         help='options to pass to qemu-img create/convert, '
                         'sets IMGOPTS environment variable')
-    g_bash.add_argument('-valgrind', action='store_true',
-                        help='use valgrind, sets VALGRIND_QEMU environment '
-                        'variable')
 
     g_sel = p.add_argument_group('test selecting options',
                                  'The following options specify test set '
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index e7e3d92d3e..6aa1dc48ba 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -96,6 +96,17 @@
     sys.stderr.write('Please run this test via the "check" script\n')
     sys.exit(os.EX_USAGE)
 
+qemu_valgrind = []
+if os.environ.get('VALGRIND_QEMU') == "y" and \
+    os.environ.get('NO_VALGRIND') != "y":
+    valgrind_logfile = "--log-file=" + test_dir
+    # %p allows to put the valgrind process PID, since
+    # we don't know it a priori (subprocess.Popen is
+    # not yet invoked)
+    valgrind_logfile += "/%p.valgrind"
+
+    qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
+
 socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
 
 luks_default_secret_object = 'secret,id=keysec0,data=' + \
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 8501c6caf5..8bf154376f 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -298,6 +298,7 @@ def print_env(self) -> None:
 SOCK_DIR      -- {SOCK_DIR}
 SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
 GDB_OPTIONS   -- {GDB_OPTIONS}
+VALGRIND_QEMU -- {VALGRIND_QEMU}
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.31.1


