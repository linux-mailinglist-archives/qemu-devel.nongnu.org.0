Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26177380979
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:26:33 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWtk-0006QK-6g
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjj-00015G-1p
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWje-0005BO-UA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14tSB4tTUTQTk3xCoqSM5N90C8CnpaBHwi7JKiwNwTo=;
 b=RT/HhJRY0hUT7Qy/XIsJwyL7NNYOsgAMBXB8YEs+SFHuaMZ1/Ou44CVAyRO/cQUNBAno85
 +4cXJd72MJzp/h9SrZljKpxHK5XO+9Ou4obItUFBlbR073PpvlwiSfK/mGxSu7TfloxwfM
 /7CdKJGGiaiCIe+Jgy9Hcr2hM5xDIUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-mJ0Uph67PiCFJpAJcAE9uw-1; Fri, 14 May 2021 08:16:02 -0400
X-MC-Unique: mJ0Uph67PiCFJpAJcAE9uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599C4107ACC7;
 Fri, 14 May 2021 12:16:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176EF60CCF;
 Fri, 14 May 2021 12:15:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/20] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true()
 for non-test assertions
Date: Fri, 14 May 2021 14:15:08 +0200
Message-Id: <20210514121518.832729-11-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In the glib API, the distinction between g_assert() and
g_assert_true() is that the former is for "bug, terminate the
application" and the latter is for "test check, on failure either
terminate or just mark the testcase as failed".  For QEMU, g_assert()
is always fatal, so code can assume that if the assertion fails
execution does not proceed, but this is not true of g_assert_true().

In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
include some assertions that are just guarding against possible bugs
in the test code that might lead us to out-of-bounds array accesses.
These should use g_assert() because they aren't part of what the test
is testing and the code does not correctly handle the case where the
condition was false.

This fixes some Coverity issues where Coverity knows that
g_assert_true() can continue when the condition is false and
complains about the possible array overrun at various callsites.

Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Message-Id: <20210505135516.21097-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index bd15a1c294..a54fd70d27 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -201,7 +201,7 @@ static int pwm_module_index(const PWMModule *module)
 {
     ptrdiff_t diff = module - pwm_module_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
 
     return diff;
 }
@@ -211,7 +211,7 @@ static int pwm_index(const PWM *pwm)
 {
     ptrdiff_t diff = pwm - pwm_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
 
     return diff;
 }
-- 
2.27.0


