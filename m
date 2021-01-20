Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FD2FD3E5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:28:40 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FPT-0004IJ-Hh
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFh-0000Mc-2x
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFV-0007k6-NX
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsFy57mklfkgmUkJDKn2sHqNbbu7Gv8LwGJW/LsQMUQ=;
 b=iTBLlb/ffeD2Uo9oFV9N3gN7P5qaDqltqljR6dshpm2OpYXFWRpCErx8jrAW4tgWYFBDoJ
 6IBG13UJSRS1CiWCVXC24muJroTfl69BQuLmZr4Yp1EyP9h1Oaj0X7WC+EyF6qjXEI4R8H
 pS/PDuf0WdUXNbdQM2co/2HrmwHDz6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-5Z7qBe_xMt6OAQd4vuDJ-g-1; Wed, 20 Jan 2021 10:18:14 -0500
X-MC-Unique: 5Z7qBe_xMt6OAQd4vuDJ-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00EEEC1A3;
 Wed, 20 Jan 2021 15:18:12 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BCAE60C6A;
 Wed, 20 Jan 2021 15:18:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/14] qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get
Date: Wed, 20 Jan 2021 16:17:48 +0100
Message-Id: <20210120151751.520597-12-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
References: <20210120151751.520597-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

The pwm_qom_get function didn't free "response", which caused an indirect
memory leak. So use qobject_unref() to fix it.

ASAN shows memory leak stack:

Indirect leak of 74160000 byte(s) in 18000 object(s) allocated from:
    #0 0x7f96e2f79d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x556313112180 in qdict_new ../qobject/qdict.c:30
    #3 0x556313115bca in parse_object ../qobject/json-parser.c:318
    #4 0x556313117810 in parse_value ../qobject/json-parser.c:546
    #5 0x556313117bda in json_parser_parse ../qobject/json-parser.c:580
    #6 0x55631310fe67 in json_message_process_token ../qobject/json-streamer.c:92
    #7 0x5563131210b7 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #8 0x556313121662 in json_lexer_feed ../qobject/json-lexer.c:350
    #9 0x5563131101e9 in json_message_parser_feed ../qobject/json-streamer.c:121
    #10 0x5563130cb81e in qmp_fd_receive ../tests/qtest/libqtest.c:614
    #11 0x5563130cba2b in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
    #12 0x5563130cb939 in qtest_qmp_receive ../tests/qtest/libqtest.c:624
    #13 0x5563130cbe0d in qtest_vqmp ../tests/qtest/libqtest.c:715
    #14 0x5563130cc40f in qtest_qmp ../tests/qtest/libqtest.c:756
    #15 0x5563130c5623 in pwm_qom_get ../tests/qtest/npcm7xx_pwm-test.c:180
    #16 0x5563130c595e in pwm_get_duty ../tests/qtest/npcm7xx_pwm-test.c:210
    #17 0x5563130c7529 in test_toggle ../tests/qtest/npcm7xx_pwm-test.c:447

Reported-by: Euler Robot <euler.robot@huawei.com>
Message-Id: <20210115075634.717909-1-ganqixin@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 33fbdf5f54..63557d2c06 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -175,6 +175,7 @@ static int pwm_index(const PWM *pwm)
 static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
 {
     QDict *response;
+    uint64_t val;
 
     g_test_message("Getting properties %s from %s", name, path);
     response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
@@ -182,7 +183,9 @@ static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
             path, name);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
-    return qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    val = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return val;
 }
 
 static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_index)
-- 
2.27.0


