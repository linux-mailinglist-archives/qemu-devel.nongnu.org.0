Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10B48A3AD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:32:01 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n748u-0002bD-Jh
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7436-0000sQ-Cr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7434-0007uE-V4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAyjc9fmhmTlfmWbuScgD6tJRKwOreXbnEvlDl+wRK0=;
 b=e5emS05xjS0g1BhLH7PudBoSsoXXdjc291QZhJsX47dj4XZmwsCTqDds4KZih2FwXWQsVh
 CPZMipxqN9fwrmrgzbnhsi2if2FeTDf3yBXXhT8N6sLGvSM3RhDcBgIRkdUTu7gyYeBR+i
 o6G0sCZ8rC+jYmjM7H/XmgmGeu60QVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-IeN3j7ukPVihy5Nn9Ys_rg-1; Mon, 10 Jan 2022 18:25:55 -0500
X-MC-Unique: IeN3j7ukPVihy5Nn9Ys_rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131891006AA7;
 Mon, 10 Jan 2022 23:25:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AAF85ED27;
 Mon, 10 Jan 2022 23:25:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] Python/aqmp: fix type definitions for mypy 0.920
Date: Mon, 10 Jan 2022 18:25:19 -0500
Message-Id: <20220110232521.1922962-3-jsnow@redhat.com>
In-Reply-To: <20220110232521.1922962-1-jsnow@redhat.com>
References: <20220110232521.1922962-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Message-id: 20220110191349.1841027-3-jsnow@redhat.com
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


