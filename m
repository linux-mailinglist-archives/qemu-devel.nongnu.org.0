Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4D3AD5C8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:23:36 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNpm-0007iU-R3
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYU-0007Bk-3v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYI-0006H3-KH
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XG3IXHTCVJauF6KmY2+k3zXKMVnrsv5+iivse6EO1k=;
 b=EyqfZAyxCK3aXM+1LVE53nt+/DxSgd9qFUEuGPiqvN5Dyo0KkGZlERu6Q3A7AK06cUuDtQ
 k/OXBrhnDcL7o+qmfZGG7qXe63BvHHSq0SZew1TLiIhCU1OkamRA28O6NC9V9n6QaWQiMp
 WdQeuMh5VAF9IEhEQLX7wRp5VoNQYqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-Q1nRLaK2P8Gu_anKmB50BQ-1; Fri, 18 Jun 2021 19:05:28 -0400
X-MC-Unique: Q1nRLaK2P8Gu_anKmB50BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D32800685;
 Fri, 18 Jun 2021 23:05:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F59B1017CE5;
 Fri, 18 Jun 2021 23:05:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/72] python/qmp: Correct type of QMPReturnValue
Date: Fri, 18 Jun 2021 19:04:09 -0400
Message-Id: <20210618230455.2891199-27-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's only a Dict[str, Any] most of the time. It's not actually
guaranteed to be anything in particular. Fix this type to be
more accurate to the reality we live in.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-8-jsnow@redhat.com
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


