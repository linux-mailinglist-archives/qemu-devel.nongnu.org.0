Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E930151FD36
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:47:47 +0200 (CEST)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2nj-0005Si-1K
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no2ht-0006hF-Qc
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no2hq-00005n-No
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS7qJ9nFXwVVGmoCS8cOSEysUKk/NVdqHQxGIVHN0co=;
 b=TpSQslOY3yNGoBU4d/sPBGSjtuobdxmDcu8rMQkm0c24c2K3cDfPGhN1DSwF0qi2IzUlld
 2dkzUkKtv0nwp3nAjnnYEjcaV9b9MpGOKXf+GVu+CX0IbwDeCqAAEqWYdzFzweSTb6tM7Z
 8mf8Z9hZV8fBHN7wRrNt4j2UlrD+H2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-fUWHd7n6MlKkLwrIoWVb-Q-1; Mon, 09 May 2022 08:41:40 -0400
X-MC-Unique: fUWHd7n6MlKkLwrIoWVb-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE64811E7A;
 Mon,  9 May 2022 12:41:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38C8714A5087;
 Mon,  9 May 2022 12:41:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] tests/qemu-iotests: print intent to run a test in TAP mode
Date: Mon,  9 May 2022 13:41:33 +0100
Message-Id: <20220509124134.867431-2-berrange@redhat.com>
In-Reply-To: <20220509124134.867431-1-berrange@redhat.com>
References: <20220509124134.867431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running I/O tests using TAP output mode, we get a single TAP test
with a sub-test reported for each I/O test that is run. The output looks
something like this:

 1..123
 ok qcow2 011
 ok qcow2 012
 ok qcow2 013
 ok qcow2 217
 ...

If everything runs or fails normally this is fine, but periodically we
have been seeing the test harness abort early before all 123 tests have
been run, just leaving a fairly useless message like

  TAP parsing error: Too few tests run (expected 123, got 107)

we have no idea which tests were running at the time the test harness
abruptly exited. This change causes us to print a message about our
intent to run each test, so we have a record of what is active at the
time the harness exits abnormally.

 1..123
 # running qcow2 011
 ok qcow2 011
 # running qcow2 012
 ok qcow2 012
 # running qcow2 013
 ok qcow2 013
 # running qcow2 217
 ok qcow2 217
 ...

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index aae70a8341..dc871b7caf 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -361,6 +361,9 @@ def run_test(self, test: str,
                                      starttime=start,
                                      lasttime=last_el,
                                      end = '\n' if mp else '\r')
+        else:
+            testname = os.path.basename(test)
+            print(f'# running {self.env.imgfmt} {testname}')
 
         res = self.do_run_test(test, mp)
 
-- 
2.35.1


