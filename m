Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D24D4154D8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:52:55 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCys-0004k7-Bp
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvv-0000yr-LQ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvu-0006HL-2u
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIR3Z53lZP5ccHTneCuI5NEqDeFZdnQRcOV89ezjkQA=;
 b=E41PK3tunguai1BomsXn4FhU+PMMD9Eg5ItvcF0apxgKdJIRnA7YoYwBMT496KaI2H5JoS
 6zaS71JJGa0CGgha+T6CSYq3B1WbUe0HR9aKIorS9R1MBs+qDkjvnGMqpNOgqceeO5xim6
 UH2OzDW7N/ze4S2WTOSCSA4SJH5eIhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-_PzkBeS8PgCw9JrskajPsg-1; Wed, 22 Sep 2021 20:49:48 -0400
X-MC-Unique: _PzkBeS8PgCw9JrskajPsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B48618D6A2E;
 Thu, 23 Sep 2021 00:49:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6C6B60BF4;
 Thu, 23 Sep 2021 00:49:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] python/aqmp: Return cleared events from
 EventListener.clear()
Date: Wed, 22 Sep 2021 20:49:24 -0400
Message-Id: <20210923004938.3999963-4-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serves two purposes:

(1) It is now possible to discern whether or not clear() removed any
event(s) from the queue with absolute certainty, and

(2) It is now very easy to get a List of all pending events in one
chunk, which is useful for the sync bridge.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/aqmp/events.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/events.py b/python/qemu/aqmp/events.py
index 271899f6b82..5f7150c78d4 100644
--- a/python/qemu/aqmp/events.py
+++ b/python/qemu/aqmp/events.py
@@ -562,7 +562,7 @@ def empty(self) -> bool:
         """
         return self._queue.empty()
 
-    def clear(self) -> None:
+    def clear(self) -> List[Message]:
         """
         Clear this listener of all pending events.
 
@@ -570,17 +570,22 @@ def clear(self) -> None:
         pending FIFO queue synchronously. It can be also be used to
         manually clear any pending events, if desired.
 
+        :return: The cleared events, if any.
+
         .. warning::
             Take care when discarding events. Cleared events will be
             silently tossed on the floor. All events that were ever
             accepted by this listener are visible in `history()`.
         """
+        events = []
         while True:
             try:
-                self._queue.get_nowait()
+                events.append(self._queue.get_nowait())
             except asyncio.QueueEmpty:
                 break
 
+        return events
+
     def __aiter__(self) -> AsyncIterator[Message]:
         return self
 
-- 
2.31.1


