Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58B3B8CE0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:19:01 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoAG-0003t3-W6
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5S-0001bm-CO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5P-00011v-Cv
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UUZKsnxjk479MmTFaykmhlePb3zu5VVZKiuPKcifhU=;
 b=OyBGHbxZVdPI7dJYXENlfyB4fN8e5dhMGCOzjCdajI/mGtAfm6uPgAN2+B3uMHpkFWsVf/
 VOPfP+d0fXRjG6RCkFsdI1Rvyzj/hqAzY79Gum5pSrBo25DMVbPhg6jMebmxmdabBajYBU
 p5SzHrsgKq03ZR5uN8xcoorCvwpSGFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-jCtHCQk-PX6y8e78xXfpsg-1; Thu, 01 Jul 2021 00:13:56 -0400
X-MC-Unique: jCtHCQk-PX6y8e78xXfpsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468D6100C611;
 Thu,  1 Jul 2021 04:13:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5124269CB4;
 Thu,  1 Jul 2021 04:13:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/20] python/aqmp: add asyncio_run compatibility wrapper
Date: Thu,  1 Jul 2021 00:13:12 -0400
Message-Id: <20210701041313.1696009-20-jsnow@redhat.com>
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

Merely as a convenience for users stuck on Python 3.6. It isn't used by
the library itself.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 2311be5893..356323ac70 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -109,6 +109,26 @@ async def wait_task_done(task: Optional['asyncio.Future[Any]']) -> None:
             break
 
 
+def asyncio_run(coro: Coroutine[Any, Any, T]) -> T:
+    """
+    Python 3.6-compatible `asyncio.run` wrapper.
+
+    :param coro: A coroutine to execute now.
+    :return: The return value from the coroutine.
+    """
+    # Python 3.7+
+    if hasattr(asyncio, 'run'):
+        # pylint: disable=no-member
+        return asyncio.run(coro)  # type: ignore
+
+    # Python 3.6
+    loop = asyncio.get_event_loop()
+    ret = loop.run_until_complete(coro)
+    loop.close()
+
+    return ret
+
+
 def pretty_traceback(prefix: str = "  | ") -> str:
     """
     Formats the current traceback, indented to provide visual distinction.
-- 
2.31.1


