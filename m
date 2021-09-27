Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388D1419F8C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:53:26 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwgn-0002p3-8b
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJ6-0006UG-GO
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJ4-0008Nc-32
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLc6Y2eQJVeshW7PrOw7x9O65co80u6A/9pzHHuT3NE=;
 b=aOr1PLcgcLjbOI1GKat7pkQH9X32v9075L3/hvBUROC/BYOoihwdzglA9Nc2yTeF4TQsg7
 JRvlqwkpB6jz/JBhSUy0Jo7gE9JyIV4mIPH0sMdlgJSgsYnJVkfRJ8WVePSYmgL56XuV5G
 8TYkCBsJbb3Jq9MIWf4nlY+bIgJeVzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-0edRXwmCNYe6FlhV2IDoOw-1; Mon, 27 Sep 2021 15:28:51 -0400
X-MC-Unique: 0edRXwmCNYe6FlhV2IDoOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28AE319200C0;
 Mon, 27 Sep 2021 19:28:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62E5B60871;
 Mon, 27 Sep 2021 19:28:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/32] python/aqmp: add asyncio_run compatibility wrapper
Date: Mon, 27 Sep 2021 15:25:03 -0400
Message-Id: <20210927192513.744199-23-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a convenience. It isn't used by the library itself, but it is used by
the test suite. It will also come in handy for users of the library
still on Python 3.6.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210915162955.333025-23-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 52a15321889..eaa5fc7d5f9 100644
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


