Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487A48A3C3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:38:58 +0100 (CET)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Fd-0004n0-KD
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:38:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748X-0003ud-Bh
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748V-00009K-O9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lSe5ckY9kwe3DbxpzcO3XBuqGw1v8fh2OicCiw7MTU=;
 b=K66eGgRNNImHBTY0RQg6S7bvrf8SOAafY9m136Lp6aESQr3XetWuanq3bwV7RldUrc2+Lg
 LAoKltS2DkbZrlNX8hJD5md9s2h6tPW2LK+40vp14fS7P+uhTfq7OppV453ED/hjjeQz65
 8GQNeCfTT5Wkb0D0e2w91pbeO+c/UF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-PsJ3EeZ6MZaA1pxE-8CysQ-1; Mon, 10 Jan 2022 18:31:32 -0500
X-MC-Unique: PsJ3EeZ6MZaA1pxE-8CysQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F1F760C0;
 Mon, 10 Jan 2022 23:31:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C98007B035;
 Mon, 10 Jan 2022 23:31:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/31] python/aqmp: handle asyncio.TimeoutError on execute()
Date: Mon, 10 Jan 2022 18:28:46 -0500
Message-Id: <20220110232910.1923864-8-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This exception can be injected into any await statement. If we are
canceled via timeout, we want to clear the pending execution record on
our way out.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/qemu/aqmp/qmp_client.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 8105e29fa8..6a985ffe30 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None, str]:
             msg_id = msg['id']
 
         self._pending[msg_id] = asyncio.Queue(maxsize=1)
-        await self._outgoing.put(msg)
+        try:
+            await self._outgoing.put(msg)
+        except:
+            del self._pending[msg_id]
+            raise
 
         return msg_id
 
@@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -> Message:
             was lost, or some other problem.
         """
         queue = self._pending[msg_id]
-        result = await queue.get()
 
         try:
+            result = await queue.get()
             if isinstance(result, ExecInterruptedError):
                 raise result
             return result
-- 
2.31.1


