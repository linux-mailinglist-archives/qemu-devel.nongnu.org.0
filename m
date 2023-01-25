Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76167A8D7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVct-0008ME-4G; Tue, 24 Jan 2023 21:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVco-0008HA-7k
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVcl-0005Mv-Oe
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674614095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFgFFOfo5jZZDru0T2DPfy03Qokj9J7YN68vjcMzOgs=;
 b=QDHAZUvvxzYQyS3c1q5EQBY4Cb5hmxWAWlDP3rvVq4lPIa242B3wQ9pyDA+48xq/Ta2tr7
 2B4cdnZYDAZcA/wcMPQmFsTY8KnQE0gDyzVIg2HIf2MTE3Tyk5pAoQFyroVTeGWSj9vcTN
 3yUXLuNGxpb3j/KCO0uzma6BA3GhTSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-cwMJIGBEP5auXKucFyLIpg-1; Tue, 24 Jan 2023 21:34:51 -0500
X-MC-Unique: cwMJIGBEP5auXKucFyLIpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57FC21869B12;
 Wed, 25 Jan 2023 02:34:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0F052026D4B;
 Wed, 25 Jan 2023 02:34:50 +0000 (UTC)
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 7/7] python/qemu/machine: use socketpair() for QMP by default
Date: Tue, 24 Jan 2023 21:34:45 -0500
Message-Id: <20230125023445.3655253-8-jsnow@redhat.com>
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When no monitor address is given, establish the QMP communication through
a socketpair() (API is also supported on Windows since Python 3.5)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230111080101.969151-4-marcandre.lureau@redhat.com
[Resolved conflicts, fixed typing error. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a71d87ead40..e57c2544842 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -158,17 +158,13 @@ def __init__(self,
         self._qmp_timer = qmp_timer
 
         self._name = name or f"{id(self):x}"
+        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] = None
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
         self._log_dir = log_dir
 
-        if monitor_address is not None:
-            self._monitor_address = monitor_address
-        else:
-            self._monitor_address = os.path.join(
-                self.sock_dir, f"{self._name}.qmp"
-            )
+        self._monitor_address = monitor_address
 
         self._console_log_path = console_log
         if self._console_log_path:
@@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
         args = ['-display', 'none', '-vga', 'none']
 
         if self._qmp_set:
-            if isinstance(self._monitor_address, tuple):
+            if self._sock_pair:
+                fd = self._sock_pair[0].fileno()
+                os.set_inheritable(fd, True)
+                moncdev = f"socket,id=mon,fd={fd}"
+            elif isinstance(self._monitor_address, tuple):
                 moncdev = "socket,id=mon,host={},port={}".format(
                     *self._monitor_address
                 )
@@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
             self._remove_files.append(self._console_address)
 
         if self._qmp_set:
+            monitor_address = None
+            sock = None
+            if self._monitor_address is None:
+                self._sock_pair = socket.socketpair()
+                sock = self._sock_pair[1]
             if isinstance(self._monitor_address, str):
                 self._remove_files.append(self._monitor_address)
+                monitor_address = self._monitor_address
             self._qmp_connection = QEMUMonitorProtocol(
-                self._monitor_address,
+                address=monitor_address,
+                sock=sock,
                 server=True,
                 nickname=self._name
             )
@@ -360,6 +367,8 @@ def _pre_launch(self) -> None:
         ))
 
     def _post_launch(self) -> None:
+        if self._sock_pair:
+            self._sock_pair[0].close()
         if self._qmp_connection:
             self._qmp.accept(self._qmp_timer)
 
-- 
2.39.0


