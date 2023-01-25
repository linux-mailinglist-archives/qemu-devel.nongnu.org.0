Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780A67A8DA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVcp-0008IU-R8; Tue, 24 Jan 2023 21:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVcm-0008F0-Tb
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVck-0005Lx-EU
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674614093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdy+8878Rt59YtBZVnB/HheQNmOVeHpRU+HMUqMLmsk=;
 b=TTAbhKJ2+6njLeUn/yReaWf95FUeTTg8DzgCMECvsGv14y3P+3ig+sCqBLZHdRo/Uw2whX
 kfGoWhXcebmZjvOpAzZ6tGAJhxttXshD/MdpByMJG/lDRTQN7PbfWW8n68IzJccZ3WUhmi
 MawxezdbZe2Sjx69udAMSQmNKOwHER0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-JYUIkejjMVmKl7G-zcTtYw-1; Tue, 24 Jan 2023 21:34:49 -0500
X-MC-Unique: JYUIkejjMVmKl7G-zcTtYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD1AB380406A;
 Wed, 25 Jan 2023 02:34:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E6752026D4B;
 Wed, 25 Jan 2023 02:34:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 3/7] python/machine: Fix AF_UNIX path too long on macOS
Date: Tue, 24 Jan 2023 21:34:41 -0500
Message-Id: <20230125023445.3655253-4-jsnow@redhat.com>
In-Reply-To: <20230125023445.3655253-1-jsnow@redhat.com>
References: <20230125023445.3655253-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Delevoryas <peter@pjd.dev>

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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230110082930.42129-2-peter@pjd.dev
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py         | 6 +++---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index c759db03e43..a71d87ead40 100644
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
index 910f3ba1eab..25a546842fa 100644
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


