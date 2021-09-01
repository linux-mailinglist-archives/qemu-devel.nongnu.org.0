Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1473FDF23
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:56:25 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSbA-0005eA-JS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzy-0006Lf-LT
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzw-0004HC-Un
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yobDSfgySgqd29KpvN63xhV3w5UZjvHfE5LSvjQhW38=;
 b=Rvr+/Vj0nlo4ioefxB6cXlJR2zt0xT4Jn6f94P9CTUU7sRQVvuWYH3UvNBQ1LAOu01wnkD
 QnXNwICM57NLTveyCCdX+noAGFdZlB6+7RCZJeaUxP+kKFAei2LwnfP85kxo3UFG9SLulW
 LOl8Z8gzkp2+/jGRBnCcdNn9n+Qw9u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-_8cFQrbgOFm0PmIORdr1Xg-1; Wed, 01 Sep 2021 11:17:54 -0400
X-MC-Unique: _8cFQrbgOFm0PmIORdr1Xg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF92F1B2C980;
 Wed,  1 Sep 2021 15:17:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9714F6A8FA;
 Wed,  1 Sep 2021 15:17:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 43/56] python/qemu/machine.py: refactor _qemu_args()
Date: Wed,  1 Sep 2021 17:16:06 +0200
Message-Id: <20210901151619.689075-44-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20210824083856.17408-24-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 8b935813e9..3fde73cf10 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -570,14 +570,12 @@ def _qmp(self) -> QEMUMonitorProtocol:
         return self._qmp_connection
 
     @classmethod
-    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
-        for key, value in args.items():
-            if _conv_keys:
-                qmp_args[key.replace('_', '-')] = value
-            else:
-                qmp_args[key] = value
-        return qmp_args
+    def _qmp_args(cls, conv_keys: bool,
+                  args: Dict[str, Any]) -> Dict[str, object]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+
+        return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -585,7 +583,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -596,7 +594,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.31.1


