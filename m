Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A25456480
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:49:51 +0100 (CET)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoLu-00065x-Ue
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIg-0001nh-1U
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIc-0000La-Os
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9SJ6jSzDcs9tlf6yXTJM4PepioMSeOnMyYx/zHEHUs=;
 b=YLxAx7Z8fpPgODSZuU3zCLZDbFhApEENpPBkFS6xSQEOef5L1JY4td3iLNJFuYCXAFHSEB
 oCKbjtcQD14Nsy51oCJrLMp46GXvi4N+9AtDwK06cPzEXKyjijG2Z4+O1GVIoQV1XIqKt7
 CLiwpcvAbEqlRvhaTGiGjid9EWXjlBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-yMf4MsvrPS--8u9IK4ys4Q-1; Thu, 18 Nov 2021 15:46:23 -0500
X-MC-Unique: yMf4MsvrPS--8u9IK4ys4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A191023F53
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6298F67843;
 Thu, 18 Nov 2021 20:46:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] python/machine: add @sock_dir property
Date: Thu, 18 Nov 2021 15:46:14 -0500
Message-Id: <20211118204620.1897674-2-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-1-jsnow@redhat.com>
References: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Analogous to temp_dir and log_dir, add a sock_dir property that defaults
to @temp_dir -- instead of base_temp_dir -- when the user hasn't
overridden the sock dir value in the initializer.

This gives us a much more unique directory to put sockfiles in by default.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a487c39745..b1dd77b538 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -134,8 +134,9 @@ def __init__(self,
         self._qmp_timer = qmp_timer
 
         self._name = name or "qemu-%d" % os.getpid()
+        self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
-        self._sock_dir = sock_dir or self._base_temp_dir
+        self._sock_dir = sock_dir
         self._log_dir = log_dir
 
         if monitor_address is not None:
@@ -143,7 +144,7 @@ def __init__(self,
             self._remove_monitor_sockfile = False
         else:
             self._monitor_address = os.path.join(
-                self._sock_dir, f"{self._name}-monitor.sock"
+                self.sock_dir, f"{self._name}-monitor.sock"
             )
             self._remove_monitor_sockfile = True
 
@@ -163,14 +164,13 @@ def __init__(self,
         self._qmp_set = True   # Enable QMP monitor by default.
         self._qmp_connection: Optional[QEMUMonitorProtocol] = None
         self._qemu_full_args: Tuple[str, ...] = ()
-        self._temp_dir: Optional[str] = None
         self._launched = False
         self._machine: Optional[str] = None
         self._console_index = 0
         self._console_set = False
         self._console_device_type: Optional[str] = None
         self._console_address = os.path.join(
-            self._sock_dir, f"{self._name}-console.sock"
+            self.sock_dir, f"{self._name}-console.sock"
         )
         self._console_socket: Optional[socket.socket] = None
         self._remove_files: List[str] = []
@@ -816,6 +816,15 @@ def temp_dir(self) -> str:
                                               dir=self._base_temp_dir)
         return self._temp_dir
 
+    @property
+    def sock_dir(self) -> str:
+        """
+        Returns the directory used for sockfiles by this machine.
+        """
+        if self._sock_dir:
+            return self._sock_dir
+        return self.temp_dir
+
     @property
     def log_dir(self) -> str:
         """
-- 
2.31.1


