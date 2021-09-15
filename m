Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84840CB66
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:07:56 +0200 (CEST)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYO1-0007cW-RD
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpA-0005NK-Pm
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXp9-0005TC-4m
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WF/GOxfte3fOf8YsvDGZzqabYZuhx3oFD8LPRfVXCuk=;
 b=DkFwP25W8wHpnIArCmFau8yL4rxTAYI5nak6FyXKnvk84SnYYrG+BtdAceb3sOCXyWQRWT
 l/8DDsiJ1JawPiE5TWjJyYRuEZ0HY9tFtC7VpqvyLiovrIgkPTTbHYiTVUZVHmhx5aiXCf
 B0KfVfx3+al4QMmpjm3DNdncQOA0llU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-fnSHKV5zNlCJiQ3BUf6aTw-1; Wed, 15 Sep 2021 12:31:49 -0400
X-MC-Unique: fnSHKV5zNlCJiQ3BUf6aTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C51010168EE;
 Wed, 15 Sep 2021 16:31:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26B097771A;
 Wed, 15 Sep 2021 16:31:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/27] python/aqmp: add _raw() execution interface
Date: Wed, 15 Sep 2021 12:29:49 -0400
Message-Id: <20210915162955.333025-22-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 python/qemu/aqmp/qmp_client.py | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 879348feaa..82e9dab124 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -484,6 +484,57 @@ async def _execute(self, msg: Message, assign_id: bool = True) -> Message:
         exec_id = await self._issue(msg)
         return await self._reply(exec_id)
 
+    @upper_half
+    @require(Runstate.RUNNING)
+    async def _raw(
+            self,
+            msg: Union[Message, Mapping[str, object], bytes],
+            assign_id: bool = True,
+    ) -> Message:
+        """
+        Issue a raw `Message` to the QMP server and await a reply.
+
+        :param msg:
+            A Message to send to the server. It may be a `Message`, any
+            Mapping (including Dict), or raw bytes.
+        :param assign_id:
+            Assign an arbitrary execution ID to this message. If
+            `False`, the existing id must either be absent (and no other
+            such pending execution may omit an ID) or a string. If it is
+            a string, it must not start with '__aqmp#' and no other such
+            pending execution may currently be using that ID.
+
+        :return: Execution reply from the server.
+
+        :raise ExecInterruptedError:
+            When the reply could not be retrieved because the connection
+            was lost, or some other problem.
+        :raise TypeError:
+            When assign_id is `False`, an ID is given, and it is not a string.
+        :raise ValueError:
+            When assign_id is `False`, but the ID is not usable;
+            Either because it starts with '__aqmp#' or it is already in-use.
+        """
+        # 1. convert generic Mapping or bytes to a QMP Message
+        # 2. copy Message objects so that we assign an ID only to the copy.
+        msg = Message(msg)
+
+        exec_id = msg.get('id')
+        if not assign_id and 'id' in msg:
+            if not isinstance(exec_id, str):
+                raise TypeError(f"ID ('{exec_id}') must be a string.")
+            if exec_id.startswith('__aqmp#'):
+                raise ValueError(
+                    f"ID ('{exec_id}') must not start with '__aqmp#'."
+                )
+
+        if not assign_id and exec_id in self._pending:
+            raise ValueError(
+                f"ID '{exec_id}' is in-use and cannot be used."
+            )
+
+        return await self._execute(msg, assign_id=assign_id)
+
     @upper_half
     @require(Runstate.RUNNING)
     async def execute_msg(self, msg: Message) -> object:
-- 
2.31.1


