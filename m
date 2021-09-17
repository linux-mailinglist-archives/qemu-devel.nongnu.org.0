Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4140F1BF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:49:00 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6k7-0005AC-5E
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cb-0004vv-Ki
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cY-0003Kt-CL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rQTYxM12O0gGxp/LBmoCwHBzY/dzx3Uu+G1x1JDjrI=;
 b=isiWP+HMqy391OqV8oXWkawruKx7cUye7LzK/PzDc8TwCoKXdSV80+GOjGLxcucrKYMq/q
 EnErTN1I4g0K1idOqEd+kiL5P0BnmKd8tlCdWpAFuzSbLrUwPz38Kk6OM//aIhDyBlAnxh
 sERnLYHCYiBhjkjKuPnfqGmEswsnmAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-EpER2eMrPISZCBhGor2Zyw-1; Fri, 17 Sep 2021 01:41:06 -0400
X-MC-Unique: EpER2eMrPISZCBhGor2Zyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D061084681;
 Fri, 17 Sep 2021 05:41:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C24DC60843;
 Fri, 17 Sep 2021 05:41:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] python/aqmp: Return cleared events from
 EventListener.clear()
Date: Fri, 17 Sep 2021 01:40:35 -0400
Message-Id: <20210917054047.2042843-4-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 python/qemu/aqmp/events.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/events.py b/python/qemu/aqmp/events.py
index 271899f6b8..5f7150c78d 100644
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


