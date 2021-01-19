Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519B22FBF9D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:59:46 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wED-0000cB-BO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLY-0007li-7M
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLU-0005Rd-02
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60shrPKSBq0N3xI/dJVvfPA+/FHrHJZ5f+BtRl689cI=;
 b=G8NjZ9J8c0Xd9NxXhgjMABC56RIqXLEoGlsV8nOuCuRxtpHQkSn83e50Slwue5emV9kXjo
 Ec4tBbdP4hFniG93W5dVBUasvK6QA6tEUT3S+jhrf3a/wOiP/GZTrG0Zah3km4FV+KBgLg
 rzfqCS8391MYBZeVuukIa9jEpKA8K0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-7m1rkeMMPs6ZOCMFCpNQ-A-1; Tue, 19 Jan 2021 13:03:09 -0500
X-MC-Unique: 7m1rkeMMPs6ZOCMFCpNQ-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7B9107AD41
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 011BC5D9DD;
 Tue, 19 Jan 2021 18:02:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/17] qapi/gen: inline _wrap_ifcond into end_if()
Date: Tue, 19 Jan 2021 13:02:29 -0500
Message-Id: <20210119180242.1570753-5-jsnow@redhat.com>
In-Reply-To: <20210119180242.1570753-1-jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We assert _start_if is not None in end_if, but that's opaque to mypy.
By inlining _wrap_ifcond, that constraint becomes provable to mypy.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b40f18eee3c..3d81b90ab71 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -130,15 +130,12 @@ def start_if(self, ifcond: List[str]) -> None:
         self._start_if = (ifcond, self._body, self._preamble)
 
     def end_if(self) -> None:
-        assert self._start_if
-        self._wrap_ifcond()
-        self._start_if = None
-
-    def _wrap_ifcond(self) -> None:
+        assert self._start_if is not None
         self._body = _wrap_ifcond(self._start_if[0],
                                   self._start_if[1], self._body)
         self._preamble = _wrap_ifcond(self._start_if[0],
                                       self._start_if[2], self._preamble)
+        self._start_if = None
 
     def get_content(self) -> str:
         assert self._start_if is None
-- 
2.26.2


