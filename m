Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3648A3D9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:43:05 +0100 (CET)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Jc-0003FE-LW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748W-0003ru-HL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748U-00008z-PN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuSwDqKg/bbUG6s3ZY2E9hTlUXu4rBc7DyGKnKTOigE=;
 b=cSY9SggQotQ36l23FC6Slk/+yWslLHDkix3TAF+v700XXzdXndaiGq6OcJOY6wSyWyNqVt
 xm8K2sy78fb3QSUTCnDIVGwL5F09nAHSfrRAEufmwqAzXCuhSeOiu4w6J6W/9pXz9AA6ES
 /i6Qfgc/O7eqtcyr/mL/XkfWsWwb9sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-Cb228NwsPgK8Mxod8y9q6w-1; Mon, 10 Jan 2022 18:31:31 -0500
X-MC-Unique: Cb228NwsPgK8Mxod8y9q6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7C1C81CCB4;
 Mon, 10 Jan 2022 23:31:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2E057B9C5;
 Mon, 10 Jan 2022 23:30:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/31] python/aqmp: add __del__ method to legacy interface
Date: Mon, 10 Jan 2022 18:28:45 -0500
Message-Id: <20220110232910.1923864-7-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

asyncio can complain *very* loudly if you forget to back out of things
gracefully before the garbage collector starts destroying objects that
contain live references to asyncio Tasks.

The usual fix is just to remember to call aqmp.disconnect(), but for the
sake of the legacy wrapper and quick, one-off scripts where a graceful
shutdown is not necessarily of paramount imporance, add a courtesy
cleanup that will trigger prior to seeing screenfuls of confusing
asyncio tracebacks.

Note that we can't *always* save you from yourself; depending on when
the GC runs, you might just seriously be out of luck. The best we can do
in this case is to gently remind you to clean up after yourself.

(Still much better than multiple pages of incomprehensible python
warnings for the crime of forgetting to put your toys away.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/aqmp/legacy.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 9e7b9fb80b..2ccb136b02 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -16,6 +16,8 @@
 import qemu.qmp
 from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
 
+from .error import AQMPError
+from .protocol import Runstate
 from .qmp_client import QMPClient
 
 
@@ -136,3 +138,19 @@ def settimeout(self, timeout: Optional[float]) -> None:
 
     def send_fd_scm(self, fd: int) -> None:
         self._aqmp.send_fd_scm(fd)
+
+    def __del__(self) -> None:
+        if self._aqmp.runstate == Runstate.IDLE:
+            return
+
+        if not self._aloop.is_running():
+            self.close()
+        else:
+            # Garbage collection ran while the event loop was running.
+            # Nothing we can do about it now, but if we don't raise our
+            # own error, the user will be treated to a lot of traceback
+            # they might not understand.
+            raise AQMPError(
+                "QEMUMonitorProtocol.close()"
+                " was not called before object was garbage collected"
+            )
-- 
2.31.1


