Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB903CC063
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:51:28 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YYB-0008Vm-6v
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YHA-0005mh-CA
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YH8-0006be-Jo
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626482030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sge704rBdgpy+KSEudyrNV8GxXXz3jFZTFGYymnrNRg=;
 b=SfN86OHxd33GSp02393V3Kb3/6FovVkdtOFfJjA7b7mTBh0wyrTWsfsCpz3ksTJqOaocoP
 yQbmDNpU7G0bDB04+W6cYmSgmVEbRRahbo/YlHpLujDm+6P6HKZYyUREZNgzth6Kmlktag
 Fhe+1PGleuTnxPnwQT94fRI3A63RspM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-ER4r9ctwMQqKe0Y3vJlRvQ-1; Fri, 16 Jul 2021 20:33:48 -0400
X-MC-Unique: ER4r9ctwMQqKe0Y3vJlRvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AC6F362F9;
 Sat, 17 Jul 2021 00:33:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFEC75C1A1;
 Sat, 17 Jul 2021 00:33:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] python/aqmp: add asyncio_run compatibility wrapper
Date: Fri, 16 Jul 2021 20:32:51 -0400
Message-Id: <20210717003253.457418-23-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

As a convenience. It isn't used by the library itself, but it is used by
the test suite. It will also come in handy for users of the library
still on Python 3.6.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 70ef94ad600..de0df44cbd7 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -137,6 +137,25 @@ async def wait_closed(writer: asyncio.StreamWriter) -> None:
     await flush(writer)
 
 
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


