Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F948A006
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:18:31 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70Ba-0006Uh-Ga
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707N-0003bg-30
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707J-0004K7-8Q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641842040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Zq98eDi1EyZSuUL5HDy8SVHM8lIBUIi4+o/WwznR4A=;
 b=dalLO0TMplX0cZWNpJGhEbxrycEL4/JaRbqk2Bmwj4TNyzO1AfU7QQ9ak3NEt+fPcrMvDy
 H3FgeBmN5NQZr//Q3+fAlT3W40nXJZbLr2vozwQt+Skt1s2IqiMZexlkX4l2TQeKZzLhlO
 pf2dZRJWb1xLV9Fhh5EHCYtONDVvf+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-5YOYE5YSM42HHg5kFZOtCg-1; Mon, 10 Jan 2022 14:13:56 -0500
X-MC-Unique: 5YOYE5YSM42HHg5kFZOtCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08F91023F4E;
 Mon, 10 Jan 2022 19:13:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E5B19724;
 Mon, 10 Jan 2022 19:13:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] Python/aqmp: fix type definitions for mypy 0.920
Date: Mon, 10 Jan 2022 14:13:48 -0500
Message-Id: <20220110191349.1841027-3-jsnow@redhat.com>
In-Reply-To: <20220110191349.1841027-1-jsnow@redhat.com>
References: <20220110191349.1841027-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

0.920 (Released 2021-12-15) is not entirely happy with the
way that I was defining _FutureT:

qemu/aqmp/protocol.py:601: error: Item "object" of the upper bound
"Optional[Future[Any]]" of type variable "_FutureT" has no attribute
"done"

Update it with something a little mechanically simpler that works better
across a wider array of mypy versions.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 5190b33b13..c4fbe35a0e 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -43,8 +43,8 @@
 
 
 T = TypeVar('T')
+_U = TypeVar('_U')
 _TaskFN = Callable[[], Awaitable[None]]  # aka ``async def func() -> None``
-_FutureT = TypeVar('_FutureT', bound=Optional['asyncio.Future[Any]'])
 
 
 class Runstate(Enum):
@@ -591,7 +591,8 @@ def _cleanup(self) -> None:
         """
         Fully reset this object to a clean state and return to `IDLE`.
         """
-        def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
+        def _paranoid_task_erase(task: Optional['asyncio.Future[_U]']
+                                 ) -> Optional['asyncio.Future[_U]']:
             # Help to erase a task, ENSURING it is fully quiesced first.
             assert (task is None) or task.done()
             return None if (task and task.done()) else task
-- 
2.31.1


