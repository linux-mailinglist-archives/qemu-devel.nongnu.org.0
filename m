Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC34AEF7B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:44:38 +0100 (CET)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkSj-0001hx-Al
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:44:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk1L-0003N8-2B
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk1H-0004wm-1T
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikexOuAm5i1DDeTrW77U0hOXhXy5YI84ssuuFDabCRQ=;
 b=dveXmu2fsAbGjIca9tMy2+xrHVm3TQZQopA+gJPHVtcgtLwYUn4uBFfovuumXlpm58HcbX
 eM4bHfyMTZn0bujSl+MVLwKXJ/BbcjHrIseAhwo90Z3AHj1LLQ4LgfpeaE7pI3Uu57uW1G
 R1KJUpyFv304r+Gx/LSTnlmlhSqKo9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-Pa1A0uzeOm-_-tZJXg9hoQ-1; Wed, 09 Feb 2022 05:16:11 -0500
X-MC-Unique: Pa1A0uzeOm-_-tZJXg9hoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411101018730;
 Wed,  9 Feb 2022 10:16:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 207B52A178;
 Wed,  9 Feb 2022 10:16:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 7/8] tests/qemu-iotests/testrunner: Print diff to stderr in
 TAP mode
Date: Wed,  9 Feb 2022 11:15:29 +0100
Message-Id: <20220209101530.3442837-8-thuth@redhat.com>
In-Reply-To: <20220209101530.3442837-1-thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running in TAP mode, stdout is reserved for the TAP protocol.
To see the "diff" of the failed test, we have to print it to
stderr instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 9d20f51bb1..1f7ca1f2f9 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -404,7 +404,10 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
             if res.status == 'fail':
                 failed.append(name)
                 if res.diff:
-                    print('\n'.join(res.diff))
+                    if self.tap:
+                        print('\n'.join(res.diff), file=sys.stderr)
+                    else:
+                        print('\n'.join(res.diff))
             elif res.status == 'not run':
                 notrun.append(name)
             elif res.status == 'pass':
-- 
2.27.0


