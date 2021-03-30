Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CBC34EF67
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:26:50 +0200 (CEST)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI8f-0000Sx-JJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1D-0000J4-3N
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI18-0003Yb-4B
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLhOpDZ5KoMONYdgU/kg5BWAuuPKYn7GxOoOsYDu6Ew=;
 b=CN0s0mGaPr0GuoASoRCmoeF0HqowJ1dQPGmjs6cjHU1zVU3irwh3Zf7BJsj1MCVfQF9e/F
 YpW+Sz02TQco1xsoWmCMqhmfjGGHfBlrsTSZHb3jLhAWblLgm5OS21fGvyeyoS10aOWW4k
 q4R8QdeY4808IA1/SfdxZTansqRlQqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-tt_8_CqrOkiqJ2G79G8qtA-1; Tue, 30 Mar 2021 13:18:51 -0400
X-MC-Unique: tt_8_CqrOkiqJ2G79G8qtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AB528006E;
 Tue, 30 Mar 2021 17:18:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E496560861;
 Tue, 30 Mar 2021 17:18:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 3/8] qapi/error: Make QAPISourceError 'col' parameter
 optional
Date: Tue, 30 Mar 2021 13:18:39 -0400
Message-Id: <20210330171844.1197918-4-jsnow@redhat.com>
In-Reply-To: <20210330171844.1197918-1-jsnow@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's already treated as optional, with some callers and subclasses
passing 'None'. Make it officially optional, which requires moving the
position of the argument to come after all required parameters.

QAPISemError becomes functionally identical to QAPISourceError. Keep the
name to preserve its semantic meaning and avoid code churn, but remove
the now-useless __init__ wrapper.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py  | 8 +++-----
 scripts/qapi/schema.py | 3 +--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 38bd7c4dd6..d179a3bd0c 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -18,11 +18,11 @@ class QAPIError(Exception):
 
 class QAPISourceError(QAPIError):
     """Error class for all exceptions identifying a source location."""
-    def __init__(self, info, col, msg):
+    def __init__(self, info, msg, col=None):
         super().__init__()
         self.info = info
-        self.col = col
         self.msg = msg
+        self.col = col
 
     def __str__(self):
         loc = str(self.info)
@@ -41,10 +41,8 @@ def __init__(self, parser, msg):
                 col = (col + 7) % 8 + 1
             else:
                 col += 1
-        super().__init__(parser.info, col, msg)
+        super().__init__(parser.info, msg, col)
 
 
 class QAPISemError(QAPISourceError):
     """Error class for semantic QAPI errors."""
-    def __init__(self, info, msg):
-        super().__init__(info, None, msg)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 1849c3e45f..dcf8a86139 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -878,8 +878,7 @@ def _def_entity(self, ent):
         other_ent = self._entity_dict.get(ent.name)
         if other_ent:
             if other_ent.info:
-                where = QAPISourceError(other_ent.info, None,
-                                        "previous definition")
+                where = QAPISourceError(other_ent.info, "previous definition")
                 raise QAPISemError(
                     ent.info,
                     "'%s' is already defined\n%s" % (ent.name, where))
-- 
2.30.2


