Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405664C5063
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:12:44 +0100 (CET)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhtK-0001K0-GN
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:12:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhi4-0003JW-3R
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhz-0005Bz-5g
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DwMkJw8AKjc/H8PyjUxahyrYX2PUI0Wzg6UJzZT0T0=;
 b=OQ2uaSY2px3nBBHuUt442YOZlA7m+tMCpqiA9ARWHosIe7qOTnJb0yY9lRXQqghY7yIDuU
 FRlFYfmEIMTGVQG33oiNGkApiOyUhbkDQmRrrkfosWre21kj2BGzPh9FxWHA+XoR+cN2oo
 GRhuwYHpNsCwFZRfEHXwqY2NnA00Ftg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-UqS6M0Y8Mpu--_HY-ln4Fw-1; Fri, 25 Feb 2022 16:00:57 -0500
X-MC-Unique: UqS6M0Y8Mpu--_HY-ln4Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 562E2801DDC;
 Fri, 25 Feb 2022 21:00:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B8B21081302;
 Fri, 25 Feb 2022 21:00:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] python/aqmp: fix race condition in legacy.py
Date: Fri, 25 Feb 2022 15:59:47 -0500
Message-Id: <20220225205948.3693480-10-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With all of that refactoring out of the way, this is extraordinarily
simple.

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


