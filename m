Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62050412784
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:52:08 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQGl-0006DJ-Er
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEZ-0003wz-3T
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEU-000874-Fc
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632170984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljJb8N6/03Un1DOfCAvJse+EgpLMnVNSUtDwK/2Z2y8=;
 b=GU+oY1A6xBINNlyFhgdWfVvMIUyvLLPwlF4iCf2I7Y8NbSn31uHjq/jYgbrJoIi7RqxQUw
 zDoPGzzu0kYSE4ztiv1PGJsloxLz/HS9jSbvXAgRGOe9ccptJ7ZmyoXTE3DdFQSrfrqBOU
 C1CwgBnn6I0fpvpH3w0fQZBKcQWCfu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-6l5o_aWIMLWT3S6DptTriA-1; Mon, 20 Sep 2021 16:49:43 -0400
X-MC-Unique: 6l5o_aWIMLWT3S6DptTriA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEA01800D41;
 Mon, 20 Sep 2021 20:49:42 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 696F419D9D;
 Mon, 20 Sep 2021 20:49:40 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] Acceptance Tests: add standard clean up at test tearDown()
Date: Mon, 20 Sep 2021 17:49:27 -0300
Message-Id: <20210920204932.94132-2-willianr@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
References: <20210920204932.94132-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.475, DKIM_SIGNED=0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The avocado.Test class, used as the basis of the avocado_qemu.Test
class, performs a clean of temporary directories up as part of its own
tearDown() implementation.

But the avocado_qemu.Test class is currently missing the same clean
up, as it implemented its own tearDown() method without resorting to
the upper class behavior.

This brings avocado_qemu.Test behavior in sync with the standard
avocado.Test behavior and prevents temporary directories from
cluttering the test results directory (unless instructed to do so with
Avocado's "--keep-tmp" option).

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
[willianr: respin to new Python super format]
Signed-off-by: Willian Rampazzo <willianr@redhat.com>

---
v2
  - adjust super call to conform with PEP3135
---
 tests/acceptance/avocado_qemu/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e14..d9e1b32aa1 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -276,6 +276,7 @@ def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
         self._sd = None
+        super().tearDown()
 
     def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
-- 
2.31.1


