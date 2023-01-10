Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB83663ABA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9g8-00010O-NM; Tue, 10 Jan 2023 03:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pdel@pdel-mbp.localdomain>)
 id 1pF9g0-0000zD-3T
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:08:11 -0500
Received: from [163.114.132.7] (helo=pdel-mbp.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdel@pdel-mbp.localdomain>) id 1pF9fw-0000Bw-Sx
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:08:07 -0500
Received: by pdel-mbp.localdomain (Postfix, from userid 501)
 id 2B7C4E17558; Tue, 10 Jan 2023 00:07:57 -0800 (PST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, philmd@linaro.org,
 wainersm@redhat.com, qemu-devel@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
Date: Tue, 10 Jan 2023 00:07:56 -0800
Message-Id: <20230110080756.38271-2-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110080756.38271-1-peter@pjd.dev>
References: <20230110080756.38271-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 163.114.132.7 (failed)
Received-SPF: none client-ip=163.114.132.7;
 envelope-from=pdel@pdel-mbp.localdomain; helo=pdel-mbp.localdomain
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On macOS, private $TMPDIR's are the default. These $TMPDIR's are
generated from a user's unix UID and UUID [1], which can create a
relatively long path:

    /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/

QEMU's avocado tests create a temporary directory prefixed by
"avo_qemu_sock_", and create QMP sockets within _that_ as well.
The QMP socket is unnecessarily long, because a temporary directory
is created for every QEMUMachine object.

    /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock

The path limit for unix sockets on macOS is 104: [2]

    /*
     * [XSI] Definitions for UNIX IPC domain.
     */
    struct  sockaddr_un {
        unsigned char   sun_len;        /* sockaddr len including null */
        sa_family_t     sun_family;     /* [XSI] AF_UNIX */
        char            sun_path[104];  /* [XSI] path name (gag) */
    };

This results in avocado tests failing on macOS because the QMP unix
socket can't be created, because the path is too long:

    ERROR| Failed to establish connection: OSError: AF_UNIX path too long

This change resolves by reducing the size of the socket directory prefix
and the suffix on the QMP and console socket names.

The result is paths like this:

    pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
    $ tree qemu*
    qemu_df4evjeq
    qemu_jbxel3gy
    qemu_ml9s_gg7
    qemu_oc7h7f3u
    qemu_oqb1yf97
    ├── 10a004050.con
    └── 10a004050.qmp

[1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
[2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 python/qemu/machine/machine.py         | 6 +++---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 748a0d807c9d..d70977378305 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -157,7 +157,7 @@ def __init__(self,
         self._wrapper = wrapper
         self._qmp_timer = qmp_timer
 
-        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
+        self._name = name or f"{id(self):x}"
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
@@ -167,7 +167,7 @@ def __init__(self,
             self._monitor_address = monitor_address
         else:
             self._monitor_address = os.path.join(
-                self.sock_dir, f"{self._name}-monitor.sock"
+                self.sock_dir, f"{self._name}.qmp"
             )
 
         self._console_log_path = console_log
@@ -192,7 +192,7 @@ def __init__(self,
         self._console_set = False
         self._console_device_type: Optional[str] = None
         self._console_address = os.path.join(
-            self.sock_dir, f"{self._name}-console.sock"
+            self.sock_dir, f"{self._name}.con"
         )
         self._console_socket: Optional[socket.socket] = None
         self._remove_files: List[str] = []
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1eab8..25a546842fab 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -306,7 +306,7 @@ def require_netdev(self, netdevname):
             self.cancel('no support for user networking')
 
     def _new_vm(self, name, *args):
-        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
+        self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
                          sock_dir=self._sd.name, log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
-- 
2.39.0


