Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98A361463
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 23:55:50 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX9xl-0004LB-ID
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 17:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uS-0000gC-1l
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uN-0001yD-TD
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618523539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vm06+2+Ea/hlkjRzQEKPtb/wn1adVwmS884rgA2yYKI=;
 b=RlwcIuy7KTm/rkB2zYmcBiCcJSjswcRsk+qY37+ijEPfdYE8dcNffSCQXznMAYlRmHEGCz
 G1rsyb42UcprK1M/Xv3okvwcO9EGf54fHSG9+zjsMxikJ6n32dN9mgZmbKA8B6XZtSNOM9
 pg4pfg8jJGxekjukCFDsuuQV1rqrKiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-CmFTrq1HMEG1sSeS1poTJA-1; Thu, 15 Apr 2021 17:52:16 -0400
X-MC-Unique: CmFTrq1HMEG1sSeS1poTJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8018030A0;
 Thu, 15 Apr 2021 21:52:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D275D9DE;
 Thu, 15 Apr 2021 21:52:13 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper logging
 channels
Date: Thu, 15 Apr 2021 17:51:38 -0400
Message-Id: <20210415215141.1865467-6-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-1-crosa@redhat.com>
References: <20210415215141.1865467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test contains methods for the proper log of test related
information.  Let's use that and remove the print and the unused
logging import.

Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/avocado.html#avocado.Test.log
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/cpu_queries.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
index 293dccb89a..cc9e380cc7 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -8,8 +8,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-import logging
-
 from avocado_qemu import Test
 
 class QueryCPUModelExpansion(Test):
@@ -27,7 +25,7 @@ def test(self):
 
         cpus = self.vm.command('query-cpu-definitions')
         for c in cpus:
-            print(repr(c))
+            self.log.info("Checking CPU: %s", c)
             self.assertNotIn('', c['unavailable-features'], c['name'])
 
         for c in cpus:
-- 
2.25.4


