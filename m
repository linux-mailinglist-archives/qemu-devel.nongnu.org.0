Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209DC3B8D22
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:26:04 +0200 (CEST)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoH5-0002Jb-3w
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5R-0001ZS-Ph
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5M-0000zD-NF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9oVPt2wrGnnSHtYvijBTJbfNDXJHXzMXH4ecL6YbSQ=;
 b=YmtXwaNbKdsP7tG/4vZlM37YJu88Q4gGDZvTKncWO3nEU10V0pUjZK/xarw2sUqPnLSz8B
 9H/luS+XRT9MTFc7ys0FnQF0LLSSfOspe621M1tGrx5Xr0bms8bKPM3/i6eSVKYUXClOD1
 OxhYmdLswRtYkIcvmna654Kgd2s7y6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-u7ieV3aLNryKS5XL_e0Umg-1; Thu, 01 Jul 2021 00:13:55 -0400
X-MC-Unique: u7ieV3aLNryKS5XL_e0Umg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F31836308;
 Thu,  1 Jul 2021 04:13:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D010604CC;
 Thu,  1 Jul 2021 04:13:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] python/aqmp: add _raw() execution interface
Date: Thu,  1 Jul 2021 00:13:11 -0400
Message-Id: <20210701041313.1696009-19-jsnow@redhat.com>
In-Reply-To: <20210701041313.1696009-1-jsnow@redhat.com>
References: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is added in anticipation of wanting it for a synchronous wrapper
for the iotest interface. Normally, execute() and execute_msg() both
raise QMP errors in the form of Python exceptions.

Many iotests expect the entire reply as-is. To reduce churn there, add a
private execution interface that will ease transition churn. However, I
do not wish to encourage its use, so it will remain a private interface.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_protocol.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/python/qemu/aqmp/qmp_protocol.py b/python/qemu/aqmp/qmp_protocol.py
index 3c16cdc213..36baef9fb3 100644
--- a/python/qemu/aqmp/qmp_protocol.py
+++ b/python/qemu/aqmp/qmp_protocol.py
@@ -454,6 +454,31 @@ async def _execute(self, msg: Message, assign_id: bool = True) -> Message:
         exec_id = await self._issue(msg)
         return await self._reply(exec_id)
 
+    @upper_half
+    @require(Runstate.RUNNING)
+    async def _raw(
+            self,
+            msg: Union[Message, Mapping[str, object], bytes]
+    ) -> Message:
+        """
+        Issue a fairly raw `Message` to the QMP server and await a reply.
+
+        An AQMP execution ID will be assigned, so it isn't *truly* raw.
+
+        :param msg:
+            A Message to send to the server. It may be a `Message`, any
+            Mapping (including Dict), or raw bytes.
+
+        :return: Execution reply from the server.
+        :raise ExecInterruptedError:
+            When the reply could not be retrieved because the connection
+            was lost, or some other problem.
+        """
+        # 1. convert generic Mapping or bytes to a QMP Message
+        # 2. copy Message objects so that we assign an ID only to the copy.
+        msg = Message(msg)
+        return await self._execute(msg)
+
     @upper_half
     @require(Runstate.RUNNING)
     async def execute_msg(self, msg: Message) -> object:
-- 
2.31.1


