Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E688C39BC85
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:04:59 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCJf-0002UD-0I
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAq-00015a-2v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAj-0001Vb-JC
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAeKin8fXiNkWdbPGFedXcvCVPBW5Bzox4Jd8hfMSho=;
 b=Vg18iCArEuDM5XKjKHQoPkOlqC+stE3z5sSmX3XJ13PSLypuHXrmN3kotFTbkjsiHlhk4g
 PQPCTp9O/o6eJlAj3xtIwgJTQq689mF/Zd3twiZMUBL4Inf9Bi3CsUJHb1hvgkBLMF4pPn
 f6cGaabqSDoI6UKrBbW8IsFBZyzlj2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-hJNNA1I0MNKZMIV1oxYLxQ-1; Fri, 04 Jun 2021 11:55:42 -0400
X-MC-Unique: hJNNA1I0MNKZMIV1oxYLxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC058042AD;
 Fri,  4 Jun 2021 15:55:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB0105B4A4;
 Fri,  4 Jun 2021 15:55:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] python/qmp: Correct type of QMPReturnValue
Date: Fri,  4 Jun 2021 11:55:28 -0400
Message-Id: <20210604155532.1499282-8-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's only a Dict[str, Any] most of the time. It's not actually
guaranteed to be anything in particular. Fix this type to be
more accurate to the reality we live in.

Signed-off-by: John Snow <jsnow@redhat.com>

---

A note for Vladimir: I'm not using 'object' here yet because it causes a
few regressions in iotests.py type checking that I'm not ready to fix
just yet, but it will eventually happen.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/__init__.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 822c793c32..a6e1a7b857 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -35,14 +35,19 @@
 )
 
 
-# QMPMessage is a QMP Message of any kind.
-# e.g. {'yee': 'haw'}
-#
-# QMPReturnValue is the inner value of return values only.
-# {'return': {}} is the QMPMessage,
-# {} is the QMPReturnValue.
+#: QMPMessage is an entire QMP message of any kind.
 QMPMessage = Dict[str, Any]
-QMPReturnValue = Dict[str, Any]
+
+#: QMPReturnValue is the 'return' value of a command.
+QMPReturnValue = object
+
+# QMPMessage can be outgoing commands or incoming events/returns.
+# QMPReturnValue is usually a dict/json object, but due to QAPI's
+# 'returns-whitelist', it can actually be anything.
+#
+# {'return': {}} is a QMPMessage,
+# {} is the QMPReturnValue.
+
 
 InternetAddrT = Tuple[str, int]
 UnixAddrT = str
@@ -297,8 +302,8 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
         return resp
 
     def cmd(self, name: str,
-            args: Optional[Dict[str, Any]] = None,
-            cmd_id: Optional[Any] = None) -> QMPMessage:
+            args: Optional[Dict[str, object]] = None,
+            cmd_id: Optional[object] = None) -> QMPMessage:
         """
         Build a QMP command and send it to the QMP Monitor.
 
@@ -313,7 +318,7 @@ def cmd(self, name: str,
             qmp_cmd['id'] = cmd_id
         return self.cmd_obj(qmp_cmd)
 
-    def command(self, cmd: str, **kwds: Any) -> QMPReturnValue:
+    def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
         """
         Build and send a QMP command to the monitor, report errors if any
         """
-- 
2.31.1


