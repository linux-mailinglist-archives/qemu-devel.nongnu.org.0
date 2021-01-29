Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A392230899E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:54:47 +0100 (CET)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VAc-0000Dm-Oq
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5V8r-0007hD-RK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:52:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5V8o-00050X-L7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611931973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rB0hRZ6BmtdbtE8k2FTy1NbEjxSkEhfMv7K+cOao69E=;
 b=gqtBbQRz8I2kBHZBDCU672/WTpkYU2esLwYEuyqiqr5nREVIsqr+upzVNvlrkkvnUsWyJU
 f9FrNKTigyJ6BgEopBJLKWe8vaTHXKHB5lxL3eCwkdGYErts3W2fAGtPFuuTJik++SRW4D
 Ina0w/X7b97lPcQpXyTLPvyIj2OV78I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-nEOM-x-hNbiO8HHETXKnGw-1; Fri, 29 Jan 2021 09:52:51 -0500
X-MC-Unique: nEOM-x-hNbiO8HHETXKnGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2844B1800D41;
 Fri, 29 Jan 2021 14:52:50 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-198.ams2.redhat.com [10.36.114.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F59F5C1B4;
 Fri, 29 Jan 2021 14:52:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/2] iotests/testrunner: fix recognition of python tests
Date: Fri, 29 Jan 2021 15:52:39 +0100
Message-Id: <20210129145240.34104-2-kwolf@redhat.com>
In-Reply-To: <20210129145240.34104-1-kwolf@redhat.com>
References: <20210129145240.34104-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We should drop final '\n' before comparing with python3 shebang.

Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210129090616.84145-1-vsementsov@virtuozzo.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a581be6a29..24b3fba115 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -248,7 +248,7 @@ class TestRunner(ContextManager['TestRunner']):
 
         with f_test.open(encoding="utf-8") as f:
             try:
-                if f.readline() == '#!/usr/bin/env python3':
+                if f.readline().rstrip() == '#!/usr/bin/env python3':
                     args.insert(0, self.env.python)
             except UnicodeDecodeError:  # binary test? for future.
                 pass
-- 
2.29.2


