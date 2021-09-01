Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A633FDF0E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:53:11 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSY2-0007lF-Fx
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS00-0006Tn-HU
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzy-0004J8-QL
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6+t8EfAiYegrjRViao4/M9Jw3O8LEUbUwt2eQQTVEk=;
 b=fVxn/SFhOi4IUZGqqNDLoouYxZW8PAdGL6ZzEZfjbSu4rHBhmTit5YDPKvDM0NiaSmSzko
 BrAXZ8Ptbinsw82Zp4Z1vcA3z8YczHG2cFunxPuBxzA/EbRs0LYmn1BOgzN7pD6BJjHgKc
 wBnmnqpPf1PRMrzAXgng0owM1z4e8IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-oymNV2WZMrunM1NsD22Hsw-1; Wed, 01 Sep 2021 11:17:57 -0400
X-MC-Unique: oymNV2WZMrunM1NsD22Hsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F301B2C981;
 Wed,  1 Sep 2021 15:17:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9D95D9DC;
 Wed,  1 Sep 2021 15:17:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 44/56] python/qemu/machine: QEMUMachine: improve qmp() method
Date: Wed,  1 Sep 2021 17:16:07 +0200
Message-Id: <20210901151619.689075-45-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20210824083856.17408-25-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 3fde73cf10..6ec18570d9 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -578,11 +578,21 @@ def _qmp_args(cls, conv_keys: bool,
         return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPMessage:
         """
         Invoke a QMP command and return the response dict
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-- 
2.31.1


