Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A68033E7E4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:55:08 +0100 (CET)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNH1-0005sP-LG
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNEw-0003F6-UB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNEu-0002zq-OO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615953176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHrAgiiRTvli6S+q8WbO/yd68EtMlaFBeXtli09gb5U=;
 b=O3/MWQEo3Yj7DlfQJPFoV1YoiUdN8K3s8AfCbl7PP5KmFVm0job+SBknC/3TH+pDNljf0a
 kxW+ozw9+aw+w4Z8hLu5ybPCxbimTkbBqrwKSmw7x95/9NmXGe22xkGlrTP7MbdqazSaOK
 z8PUVNVRKrD+A22Lrt9K/EEBxJNYMIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-R2fox6hJPW6GXSyLHxeBWQ-1; Tue, 16 Mar 2021 23:52:53 -0400
X-MC-Unique: R2fox6hJPW6GXSyLHxeBWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CF6100C61A;
 Wed, 17 Mar 2021 03:52:52 +0000 (UTC)
Received: from localhost.net (ovpn-113-107.rdu2.redhat.com [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AD495D9C0;
 Wed, 17 Mar 2021 03:52:48 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/5] tests/acceptance: Print expected message on
 wait_for_console_pattern
Date: Tue, 16 Mar 2021 23:52:38 -0400
Message-Id: <20210317035242.24418-2-crosa@redhat.com>
In-Reply-To: <20210317035242.24418-1-crosa@redhat.com>
References: <20210317035242.24418-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

For the sake of improve debuggability of tests which use the
wait_for_console_pattern(), this changed the _console_interaction() so that
the expected message is printed if the test fail.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210309153507.1905682-1-wainersm@redhat.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142cc..ed338caaba9 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -97,7 +97,8 @@ def _console_interaction(test, success_message, failure_message,
             break
         if failure_message and failure_message in msg:
             console.close()
-            fail = 'Failure message found in console: %s' % failure_message
+            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
+                    (failure_message, success_message)
             test.fail(fail)
 
 def interrupt_interactive_console_until_pattern(test, success_message,
-- 
2.30.2


