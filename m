Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4842AF49
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:48:42 +0200 (CEST)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPdZ-0003Xf-5F
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYD-0005Ey-Fv
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYB-00009V-K2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVMnDAoN7oI+8cXKvxSCHjEjU5qvmhv68lJA1kwCxEQ=;
 b=F3tuHaZtHp48zUYR0RE5tDG7owIk3h4VRFMqEI/IsRcERuL+RYMvazEOY20ofQ0s/lmEXi
 WVfV6LyHyqM6qWbidk9Sd31ihoXF18RJ9/W97moLpfT8X/ajlZJRYUEo1f3tbV8zr/YFld
 asdHrFhJS0MAxc+Znncd01de8extzNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Z2NVOMEdNRi_pyIouo0ypg-1; Tue, 12 Oct 2021 17:43:03 -0400
X-MC-Unique: Z2NVOMEdNRi_pyIouo0ypg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7302F362F8;
 Tue, 12 Oct 2021 21:43:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EB395D6A8;
 Tue, 12 Oct 2021 21:42:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] python/aqmp: Return cleared events from
 EventListener.clear()
Date: Tue, 12 Oct 2021 17:41:45 -0400
Message-Id: <20211012214152.802483-4-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serves two purposes:

(1) It is now possible to discern whether or not clear() removed any
event(s) from the queue with absolute certainty, and

(2) It is now very easy to get a List of all pending events in one
chunk, which is useful for the sync bridge.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210923004938.3999963-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


