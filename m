Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64827339621
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:19:57 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmOC-0007GX-A6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWL-0007db-Q4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWI-0000hd-LT
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PvcW1ai/Mc/z4nsjUH9/J6ybTbghIn0A68e75ujdf2g=;
 b=hwp8TSiCSSOJx3cSOuFELbU6zQWUyu0zkK7Mq+DwTpSXCYuthxJpu1aeIegJb2aJ7TJMKY
 1fbwXnDxSlTRpVJFaQidIb08aPNM7WVRin6uXSxxhu2KQaqP7VYpQCjmV3RqsNdCGKhx6V
 OfM1sHOSls4lo0roCFGq/EyjL+bJGDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-aTmk42IQN1ui9hQRjCpitg-1; Fri, 12 Mar 2021 12:24:11 -0500
X-MC-Unique: aTmk42IQN1ui9hQRjCpitg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF06100C663;
 Fri, 12 Mar 2021 17:24:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0982D19704;
 Fri, 12 Mar 2021 17:24:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/9] tests: remove "make check-speed" in favor of "make bench"
Date: Fri, 12 Mar 2021 18:23:54 +0100
Message-Id: <20210312172356.968219-8-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

"make check-speed" has been broken since the removal of ninja2make
last October.  It was just a backwards-compatibility alias for
"make bench-speed", which in turn is in principle a subset of
"make bench".  Advertise the latter and drop "make check-speed"
completely since no one has noticed.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210310164612.285362-1-pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 799e47169c..8f220e15d1 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,13 +3,13 @@
 .PHONY: check-help
 check-help:
 	@echo "Regression testing targets:"
-	@echo
 	@echo " $(MAKE) check                Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
+	@echo " $(MAKE) bench                Run speed tests"
 	@echo
+	@echo "Individual test suites:"
 	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
 	@echo " $(MAKE) check-qtest          Run qtest tests"
 	@echo " $(MAKE) check-unit           Run qobject tests"
-	@echo " $(MAKE) check-speed          Run qobject speed tests"
 	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 	@echo " $(MAKE) check-block          Run block tests"
 ifneq ($(filter $(all-check-targets), check-softfloat),)
@@ -155,8 +155,4 @@ check-clean:
 
 clean: check-clean
 
-# For backwards compatibility
-
-check-speed: bench-speed
-
 endif
-- 
2.27.0


