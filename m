Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EBE3DF5C7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:36:32 +0200 (CEST)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0DH-00075m-Ee
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0By-00054v-Tb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0Bu-0002Qv-KH
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628019305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGNma4QjraifpLlbRntJRbPtPrtvs8zqtLSvnBCVGks=;
 b=GZ6Zh25YoJHJi/NrvBOu4C6wOotYUBmvgoeVd/YygJWbE1C0OCbxjOzJZaU7BKueUt0ybR
 gEATTSqPWbauZbcAMlMJzsQubFGwoG0ZO9Fq8wdpV2euzxKMuEKKQmL48MwrENB1J86yAg
 o5MU4PxwanstBE+ObymHrr2mxJ1HTs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-B7qunb11Pza8VLwGqBcKqg-1; Tue, 03 Aug 2021 15:35:02 -0400
X-MC-Unique: B7qunb11Pza8VLwGqBcKqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB8A7107ACF5;
 Tue,  3 Aug 2021 19:35:01 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.8.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A780717C58;
 Tue,  3 Aug 2021 19:35:00 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] Acceptance Tests: add standard clean up at test tearDown()
Date: Tue,  3 Aug 2021 15:34:46 -0400
Message-Id: <20210803193447.3946219-2-crosa@redhat.com>
In-Reply-To: <20210803193447.3946219-1-crosa@redhat.com>
References: <20210803193447.3946219-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tests/acceptance/avocado_qemu/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e14..1e807e2e55 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -276,6 +276,7 @@ def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
         self._sd = None
+        super(Test, self).tearDown()
 
     def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
-- 
2.31.1


