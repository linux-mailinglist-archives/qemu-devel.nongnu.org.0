Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92140F1BB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:44:44 +0200 (CEST)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6fz-0008LY-F6
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cb-0004vx-L1
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cY-0003MD-KB
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBw5mtpr7i7V2RinC1R2gjVHzSYtc5auLIfH0TrTmBc=;
 b=ijGGKyOytX29N370oDD68HdEbo2bYI+4U8t/Qg8AbmZJPbJyBq4ZHLvagPllp5H3+rcgUP
 86bB6vPiY0graZp9t816NKt26laQU1fyYtxlP6/qlWE8M2wRfHWSV6MEPiuzDsaa/GUeZ9
 BVqrPiEl/XWzAd3s9SbuKLNAiaFCmiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-70RLgkoBNXS8RUyMq_qfFQ-1; Fri, 17 Sep 2021 01:41:08 -0400
X-MC-Unique: 70RLgkoBNXS8RUyMq_qfFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69EA2824FA6;
 Fri, 17 Sep 2021 05:41:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E23360843;
 Fri, 17 Sep 2021 05:41:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] python/qmp: clear events on get_events() call
Date: Fri, 17 Sep 2021 01:40:36 -0400
Message-Id: <20210917054047.2042843-5-jsnow@redhat.com>
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

All callers in the tree *already* clear the events after a call to
get_events(). Do it automatically instead and update callsites to remove
the manual clear call.

These semantics are quite a bit easier to emulate with async QMP, and
nobody appears to be abusing some emergent properties of what happens if
you decide not to clear them, so let's dial down to the dumber, simpler
thing.

Specifically: callers of clear() right after a call to get_events() are
more likely expressing their desire to not see any events they just
retrieved, whereas callers of clear_events() not in relation to a recent
call to pull_event/get_events are likely expressing their desire to
simply drop *all* pending events straight onto the floor. In the sync
world, this is safe enough; in the async world it's nearly impossible to
promise that nothing happens between getting and clearing the
events.

Making the retrieval also clear the queue is vastly simpler.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 1 -
 python/qemu/qmp/__init__.py    | 4 +++-
 python/qemu/qmp/qmp_shell.py   | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 34131884a5..ae945ca3c9 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -631,7 +631,6 @@ def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
         events = self._qmp.get_events(wait=wait)
         events.extend(self._events)
         del self._events[:]
-        self._qmp.clear_events()
         return events
 
     @staticmethod
diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 269516a79b..ba15668c25 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -374,7 +374,9 @@ def get_events(self, wait: bool = False) -> List[QMPMessage]:
         @return The list of available QMP events.
         """
         self.__get_events(wait)
-        return self.__events
+        events = self.__events
+        self.__events = []
+        return events
 
     def clear_events(self) -> None:
         """
diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index 337acfce2d..e7d7eb18f1 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -381,7 +381,6 @@ def read_exec_command(self) -> bool:
         if cmdline == '':
             for event in self.get_events():
                 print(event)
-            self.clear_events()
             return True
 
         return self._execute_cmd(cmdline)
-- 
2.31.1


