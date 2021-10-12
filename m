Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A742AF4B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:49:20 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPeB-00060C-47
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYY-0005kS-ID
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYV-0000Ni-Ur
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634075007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXVooBOJhc1dqjKnlIcYof0LO1f01Sb4+qPppmLy1DM=;
 b=Ta9mqICCB/vOHIh2yG5EfTBIs6di+7b5EmnT7fRvLiQWULRYT0mw6vsTRpcYNuAI9H30Ub
 gq+Jw4QgZ0IxgVRWNVv62LvFLWcp5bfY9OPBTU/Vj6g9c2ECmzc7qDA74ZSQQ9xE9brbI3
 ZcpSXoDadAt1fH1YVgmEdRuZOisP4LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-NI_oZCCcPh60hsPFCCmyqQ-1; Tue, 12 Oct 2021 17:43:24 -0400
X-MC-Unique: NI_oZCCcPh60hsPFCCmyqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB6D51006AA3;
 Tue, 12 Oct 2021 21:43:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A9A25D6A8;
 Tue, 12 Oct 2021 21:43:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] python/qmp: clear events on get_events() call
Date: Tue, 12 Oct 2021 17:41:50 -0400
Message-Id: <20211012214152.802483-9-jsnow@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210923004938.3999963-9-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


