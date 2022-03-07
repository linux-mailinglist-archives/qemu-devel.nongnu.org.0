Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DA4D0AF3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:22:12 +0100 (CET)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLk3-0003di-6b
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdX-0006Ny-Qn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdT-00016R-0Y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uX2xYOfks0dxXpJ5arraJ4+qoeIBhRVJhy65dmuNaRM=;
 b=NULUWy7xjKC4djHgzx35S35PSXBalVWpJg7Z2/rITzocJ0tmCXCTmSftbvaM+bxc2aWWS7
 yxkZgy4vxcQhWkRJ8oqf3abgLyk25jynhqN02TrWjfthB4orcdqToPWRBKc0l5txC071Qn
 7I23aBlRGi9NLM4CzDwrEDD/liz9aKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-Nm3ajl2xNGW6KGsWf41j1w-1; Mon, 07 Mar 2022 17:15:21 -0500
X-MC-Unique: Nm3ajl2xNGW6KGsWf41j1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07067800D55;
 Mon,  7 Mar 2022 22:15:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039515E253;
 Mon,  7 Mar 2022 22:15:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] python/aqmp: fix race condition in legacy.py
Date: Mon,  7 Mar 2022 17:15:05 -0500
Message-Id: <20220307221507.1218892-10-jsnow@redhat.com>
In-Reply-To: <20220307221507.1218892-1-jsnow@redhat.com>
References: <20220307221507.1218892-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

legacy.py provides a synchronous model. iotests frequently uses this
paradigm:

 - create QMP client object
 - start QEMU process
 - await connection from QEMU process

In the switch from sync to async QMP, the QMP client object stopped
calling bind() and listen() during the QMP object creation step, which
creates a race condition if the QEMU process dials in too quickly.

With refactoring out of the way, restore the former behavior of calling
bind() and listen() during __init__() to fix this race condition.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220225205948.3693480-10-jsnow@redhat.com
[Expanded commit message. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index dca1e76ed4..cb50e60564 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -57,7 +57,7 @@ def __init__(self, address: SocketAddrT,
         self._timeout: Optional[float] = None
 
         if server:
-            self._aqmp._bind_hack(address)  # pylint: disable=protected-access
+            self._sync(self._aqmp.start_server(address))
 
     _T = TypeVar('_T')
 
@@ -90,10 +90,7 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
         self._aqmp.await_greeting = True
         self._aqmp.negotiate = True
 
-        self._sync(
-            self._aqmp.start_server_and_accept(self._address),
-            timeout
-        )
+        self._sync(self._aqmp.accept(), timeout)
 
         ret = self._get_greeting()
         assert ret is not None
-- 
2.34.1


