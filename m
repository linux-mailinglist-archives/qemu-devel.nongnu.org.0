Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62A6655A1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFW36-0000c7-Ra; Wed, 11 Jan 2023 03:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW33-0000bZ-2h
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW31-0007oO-41
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673424082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IBCC0tTSA3CBKm91kOvQ1RQFB4uPUG6F/bRIBamZ0Y=;
 b=JZzYUz+HMGGiPct4NBNVQsjI9xmwxC/fejPSkqdNlwm4axkwgTRDQvaYA74JSTpd4cnnuB
 AD1Eftk/RlzqrjwZEY2sqJYAuKOxLWu6F9DRXFfZmD3P5OPcuyBtoWi8pnfK00n7Ug3zyp
 6HXOB4GgTHkPvmnwkhqVZJZvYxy1cUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-HLGDhDEpMwCFhriV4hxGgA-1; Wed, 11 Jan 2023 03:01:20 -0500
X-MC-Unique: HLGDhDEpMwCFhriV4hxGgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87D48857F41
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:01:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9281340C2064;
 Wed, 11 Jan 2023 08:01:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
Date: Wed, 11 Jan 2023 12:01:01 +0400
Message-Id: <20230111080101.969151-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230111080101.969151-1-marcandre.lureau@redhat.com>
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
---
 python/qemu/machine/machine.py | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 748a0d807c..5b2e499e68 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -158,17 +158,13 @@ def __init__(self,
         self._qmp_timer = qmp_timer
 
         self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
+        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] = None
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
         self._log_dir = log_dir
 
-        if monitor_address is not None:
-            self._monitor_address = monitor_address
-        else:
-            self._monitor_address = os.path.join(
-                self.sock_dir, f"{self._name}-monitor.sock"
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
@@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
         ))
 
     def _post_launch(self) -> None:
+        self._sock_pair[0].close()
         if self._qmp_connection:
             self._qmp.accept(self._qmp_timer)
 
-- 
2.39.0


