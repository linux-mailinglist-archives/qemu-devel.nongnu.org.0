Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF81EC4BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 23:58:56 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgEvv-0005Pb-GF
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 17:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgEjX-0005Tv-Pt
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 17:46:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51267
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgEjV-0008Tu-GB
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 17:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591134360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXZsgNy8ylD2Xon0Zvh4kBHu+MYqm9yocytCFoFU9TE=;
 b=iOFEyuiEdkQnhAr+lrD583TceOVAsA9aJfK8DAC/98gHhDFHdBLoQ7ndNFsZ6JMtyIyfD5
 SpLPhOcPK3ikdORQoJEL+SAPVV61PrVvp3PKVEsfGBhXfizr3kcTg+H0JmHHwyR01NOckM
 nkMwLtb2pJKDHJcKkZ3TNS1BGLWFJ8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-VVNjTjJqPou8lFRWT4RpNQ-1; Tue, 02 Jun 2020 17:45:58 -0400
X-MC-Unique: VVNjTjJqPou8lFRWT4RpNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FF051083E80;
 Tue,  2 Jun 2020 21:45:57 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-142.rdu2.redhat.com [10.10.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6594A61984;
 Tue,  2 Jun 2020 21:45:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] python/machine.py: fix _popen access
Date: Tue,  2 Jun 2020 17:45:25 -0400
Message-Id: <20200602214528.12107-14-jsnow@redhat.com>
In-Reply-To: <20200602214528.12107-1-jsnow@redhat.com>
References: <20200602214528.12107-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 17:45:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As always, Optional[T] causes problems with unchecked access. Add a
helper that asserts the pipe is present before we attempt to talk with
it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 9c45bdfb1e4..64197fc8492 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -113,7 +113,7 @@ def __init__(self, binary, args=None, wrapper=None, name=None,
         # Runstate
         self._qemu_log_path = None
         self._qemu_log_file = None
-        self._popen = None
+        self._popen: Optional['subprocess.Popen[bytes]'] = None
         self._events = []
         self._iolog = None
         self._qmp_set = True   # Enable QMP monitor by default.
@@ -225,6 +225,12 @@ def is_running(self):
         """Returns true if the VM is running."""
         return self._popen is not None and self._popen.poll() is None
 
+    @property
+    def _subp(self) -> 'subprocess.Popen[bytes]':
+        if self._popen is None:
+            raise QEMUMachineError('Subprocess pipe not present')
+        return self._popen
+
     def exitcode(self):
         """Returns the exit code if possible, or None."""
         if self._popen is None:
@@ -235,7 +241,7 @@ def get_pid(self):
         """Returns the PID of the running process, or None."""
         if not self.is_running():
             return None
-        return self._popen.pid
+        return self._subp.pid
 
     def _load_io_log(self):
         if self._qemu_log_path is not None:
@@ -365,7 +371,7 @@ def wait(self):
         """
         Wait for the VM to power off
         """
-        self._popen.wait()
+        self._subp.wait()
         if self._qmp:
             self._qmp.close()
         self._post_shutdown()
@@ -377,8 +383,8 @@ def _hard_shutdown(self) -> None:
         if not self.is_running():
             return
 
-        self._popen.kill()
-        self._popen.wait(timeout=60)
+        self._subp.kill()
+        self._subp.wait(timeout=60)
 
     def _soft_shutdown(self, has_quit: bool = False, timeout: int = 3) -> None:
         """
@@ -395,7 +401,7 @@ def _soft_shutdown(self, has_quit: bool = False, timeout: int = 3) -> None:
                 self._qmp.cmd('quit')
             self._qmp.close()
 
-        self._popen.wait(timeout=timeout)
+        self._subp.wait(timeout=timeout)
 
     def _do_shutdown(self, has_quit: bool = False, timeout: int = 3) -> None:
         """
-- 
2.21.3


