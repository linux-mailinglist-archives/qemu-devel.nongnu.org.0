Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C000D4154FB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:06:02 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDBZ-0007Ot-Qb
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw6-0001UW-Qy
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw4-0006QS-Ci
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWlb0kekgI1y3vjNR7MixTbCGGeMoZhMBQevUVBlyv0=;
 b=ECnPI3KoE8yxJxgs2HgO0/ULSYo5GSDoMpnFNhmyjdAbL3xeXq4xbHu1uw100PtlkLtcBE
 E/rtv+zOuFXPyTNbVrIkzCARMP/sh7MbYYod8TZI8s41XWbYeK1b2nQpSEwI54Ko1ALnGn
 BRYx6x1l91Lxn42ZypNXxUApK2ZZjYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-5bq-8ZFrPKyCYBWW_YTimQ-1; Wed, 22 Sep 2021 20:49:56 -0400
X-MC-Unique: 5bq-8ZFrPKyCYBWW_YTimQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96F71006AA2;
 Thu, 23 Sep 2021 00:49:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717C560BF1;
 Thu, 23 Sep 2021 00:49:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/17] python/qmp: clear events on get_events() call
Date: Wed, 22 Sep 2021 20:49:29 -0400
Message-Id: <20210923004938.3999963-9-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 1 -
 python/qemu/qmp/__init__.py    | 6 ++++--
 python/qemu/qmp/qmp_shell.py   | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 34131884a57..ae945ca3c94 100644
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
index 269516a79b9..c27594b66a2 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -361,7 +361,7 @@ def pull_event(self,
 
     def get_events(self, wait: bool = False) -> List[QMPMessage]:
         """
-        Get a list of available QMP events.
+        Get a list of available QMP events and clear all pending events.
 
         @param wait (bool): block until an event is available.
         @param wait (float): If wait is a float, treat it as a timeout value.
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
index 337acfce2d2..e7d7eb18f19 100644
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


