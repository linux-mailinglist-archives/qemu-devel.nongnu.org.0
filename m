Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78482941B7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 19:48:39 +0200 (CEST)
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUvkU-00049Z-TA
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 13:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUvQp-00033Z-8W
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUvQh-0000CV-O6
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603214891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/4JaS/5chTTcznkuUBQV5ElmPQUPB22BqHhkRvztlI=;
 b=Dxuyymo7tD9ixcl2XwBZVh8NvKX5NwYNewMdB0AuKGfqWh5ar3FDhG8Ve2r/1n2itrPKxp
 q0lLpeBnkDZaj+JkskV5Mk3d5lS9SQpUX7CQqmdxSgC7vUqYgf3oZolI4ZrR9YjOSiLVCW
 NMWvkZz8d42y1YRYkIP+wsLeC3GIJdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-uR1fG6OgP0WP-cpmy7nWSQ-1; Tue, 20 Oct 2020 13:28:06 -0400
X-MC-Unique: uR1fG6OgP0WP-cpmy7nWSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1591006C90;
 Tue, 20 Oct 2020 17:28:05 +0000 (UTC)
Received: from scv.redhat.com (ovpn-115-172.rdu2.redhat.com [10.10.115.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA06E2639C;
 Tue, 20 Oct 2020 17:28:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] python/qemu/console_socket.py: fix typing of settimeout
Date: Tue, 20 Oct 2020 13:27:35 -0400
Message-Id: <20201020172742.1483258-15-jsnow@redhat.com>
In-Reply-To: <20201020172742.1483258-1-jsnow@redhat.com>
References: <20201020172742.1483258-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The types and names of the parameters must match the socket.socket interface.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20201006235817.3280413-14-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/console_socket.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index cb3400a038..3945682506 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -17,6 +17,7 @@
 import socket
 import threading
 import time
+from typing import Optional
 
 
 class ConsoleSocket(socket.socket):
@@ -31,6 +32,7 @@ class ConsoleSocket(socket.socket):
     """
     def __init__(self, address, file=None, drain=False):
         self._recv_timeout_sec = 300
+        self._recv_timeout_sec = 300.0
         self._sleep_time = 0.5
         self._buffer = deque()
         socket.socket.__init__(self, socket.AF_UNIX, socket.SOCK_STREAM)
@@ -120,11 +122,11 @@ def setblocking(self, value):
         if self._drain_thread is None:
             socket.socket.setblocking(self, value)
 
-    def settimeout(self, seconds):
+    def settimeout(self, value: Optional[float]) -> None:
         """When not draining we pass thru to the socket,
            since when draining we control the timeout.
         """
-        if seconds is not None:
-            self._recv_timeout_sec = seconds
+        if value is not None:
+            self._recv_timeout_sec = value
         if self._drain_thread is None:
-            socket.socket.settimeout(self, seconds)
+            socket.socket.settimeout(self, value)
-- 
2.26.2


