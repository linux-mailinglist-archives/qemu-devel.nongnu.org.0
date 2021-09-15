Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF740CB69
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:09:36 +0200 (CEST)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYPf-0002t3-3R
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpF-0005Ro-Ov
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpC-0005Vk-Sg
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqHftjUPkLgXy0odwhpx0g/627PwpY2uQSSWqrzEP/4=;
 b=fXbW2IY+qQK8CFi8wZpMkNbjsoVegW75+0pvsPghTVSiOHa+/X2iIudYfzrrsee7uWhQhf
 pFu0NmBJN5qVGbsLqV1nIA+GpX7701c53nWtxMVe4XasspURhHqX9z7JC3OQBxUAKjvA0X
 cC2lkY5Q/bAOxHOw5G5hFGkEY4lC7js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-bAY0v-oMOF6LcRT0xriM7A-1; Wed, 15 Sep 2021 12:31:50 -0400
X-MC-Unique: bAY0v-oMOF6LcRT0xriM7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B314F10168CE;
 Wed, 15 Sep 2021 16:31:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653F97771A;
 Wed, 15 Sep 2021 16:31:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/27] python/aqmp: add asyncio_run compatibility wrapper
Date: Wed, 15 Sep 2021 12:29:50 -0400
Message-Id: <20210915162955.333025-23-jsnow@redhat.com>
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

As a convenience. It isn't used by the library itself, but it is used by
the test suite. It will also come in handy for users of the library
still on Python 3.6.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 52a1532188..eaa5fc7d5f 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -147,6 +147,25 @@ async def wait_closed(writer: asyncio.StreamWriter) -> None:
         await asyncio.sleep(0)
 
 
+def asyncio_run(coro: Coroutine[Any, Any, T], *, debug: bool = False) -> T:
+    """
+    Python 3.6-compatible `asyncio.run` wrapper.
+
+    :param coro: A coroutine to execute now.
+    :return: The return value from the coroutine.
+    """
+    if sys.version_info >= (3, 7):
+        return asyncio.run(coro, debug=debug)
+
+    # Python 3.6
+    loop = asyncio.get_event_loop()
+    loop.set_debug(debug)
+    ret = loop.run_until_complete(coro)
+    loop.close()
+
+    return ret
+
+
 # ----------------------------
 # Section: Logging & Debugging
 # ----------------------------
-- 
2.31.1


