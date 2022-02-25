Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6A4C5076
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:17:19 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhxm-0006pS-I4
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhi3-0003Hv-Od
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhz-0005Bt-6D
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6nvOSn72f+kcAx5Iz1ORmAyToAgumTj/r9RbzxiomI=;
 b=RDo9LfX3tJx17k57i4kYsyX+2nRIHWog44MU7lQTm6vM1vJbxGMbtLzGfzVV/fkj4oV4fm
 rkfhL+Wa+uWFCZXMtRgMcccBJQ7KmsZRpAv9sMghZhuGrkITllHxeKKNbC9ewo42QU3pvB
 qCpcgrCZp7bUjscxhEQMQHxhjIfbLe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-56oOMytbNS6C1hdH_YKO6Q-1; Fri, 25 Feb 2022 16:00:55 -0500
X-MC-Unique: 56oOMytbNS6C1hdH_YKO6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B671006AA7;
 Fri, 25 Feb 2022 21:00:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 447AD1081302;
 Fri, 25 Feb 2022 21:00:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] python/aqmp: stop the server during disconnect()
Date: Fri, 25 Feb 2022 15:59:45 -0500
Message-Id: <20220225205948.3693480-8-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we allow the full separation of starting the server and accepting
new connections, make sure that the disconnect cleans up the server and
its new state, too.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index e2bdad542d..cdbc9cba0d 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -432,7 +432,7 @@ def _set_state(self, state: Runstate) -> None:
         self._runstate_event.set()
         self._runstate_event.clear()
 
-    @bottom_half  # However, it does not run from the R/W tasks.
+    @bottom_half
     async def _stop_server(self) -> None:
         """
         Stop listening for / accepting new incoming connections.
@@ -709,6 +709,7 @@ def _paranoid_task_erase(task: Optional['asyncio.Future[_U]']
 
         self._reader = None
         self._writer = None
+        self._accepted = None
 
         # NB: _runstate_changed cannot be cleared because we still need it to
         # send the final runstate changed event ...!
@@ -732,6 +733,9 @@ async def _bh_disconnect(self) -> None:
         def _done(task: Optional['asyncio.Future[Any]']) -> bool:
             return task is not None and task.done()
 
+        # If the server is running, stop it.
+        await self._stop_server()
+
         # Are we already in an error pathway? If either of the tasks are
         # already done, or if we have no tasks but a reader/writer; we
         # must be.
-- 
2.34.1


