Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA32FD3F8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:30:30 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FR9-0006na-VC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFf-0000Lr-Av
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFW-0007kK-2x
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRg4sE/VgKudjQt+zXrgar9IY3gEmqlrOhBY1H1kpic=;
 b=MHhSs4HUV/hsr71La6rL9f3cpADAfdqDqW19mb9eBHqf1OWFS2vbrgLSYf76khUAGpAZSL
 HPLw8LfROw4EBH4w7qWq8yGyP4lRoFGjNvtJ1fCNdHlhLpnk8stbn+bdHCD+B0cNxk9jPv
 BYrZZyFJ+nZKrMH6v8LEE4kFza3yZ4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Rhfy4ekQNFmwAyT4s2RFvA-1; Wed, 20 Jan 2021 10:18:15 -0500
X-MC-Unique: Rhfy4ekQNFmwAyT4s2RFvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A331005504;
 Wed, 20 Jan 2021 15:18:14 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296E260C6A;
 Wed, 20 Jan 2021 15:18:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/14] tests: Fix memory leak in tpm-util.c
Date: Wed, 20 Jan 2021 16:17:49 +0100
Message-Id: <20210120151751.520597-13-thuth@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

This patch fixes the following memory leak detected by asan:

Indirect leak of 560320 byte(s) in 136 object(s) allocated from:
    #0 0x556b3b3f9b57 in calloc (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
    #1 0x152b0e96b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
    #2 0x556b3b588f61 in parse_object /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:318:12
    #3 0x556b3b588f61 in parse_value /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:546:16
    #4 0x556b3b5886e8 in json_parser_parse /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
    #5 0x556b3b52ff4a in json_message_process_token /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
    #6 0x556b3b59896f in json_lexer_feed_char /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
    #7 0x556b3b598443 in json_lexer_feed /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:350:9
    #8 0x556b3b436c70 in qmp_fd_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:614:9
    #9 0x556b3b435871 in qtest_qmp_receive_dict /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:636:12
    #10 0x556b3b435871 in qtest_qmp_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:624:27
    #11 0x556b3b435c59 in qtest_vqmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:715:12
    #12 0x556b3b435c59 in qtest_qmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:756:16
    #13 0x556b3b4328c7 in tpm_util_wait_for_migration_complete /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-util.c:245:15
    #14 0x556b3b4333be in tpm_test_swtpm_migration_test /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-tests.c:117:5
    #15 0x152b0e98e29d  (/lib64/libglib-2.0.so.0+0x7b29d)

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210115204637.3332555-1-stefanb@linux.vnet.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tpm-util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index 5a33a6ef0f..b70cc32d60 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -250,7 +250,7 @@ void tpm_util_wait_for_migration_complete(QTestState *who)
         status = qdict_get_str(rsp_return, "status");
         completed = strcmp(status, "completed") == 0;
         g_assert_cmpstr(status, !=,  "failed");
-        qobject_unref(rsp_return);
+        qobject_unref(rsp);
         if (completed) {
             return;
         }
-- 
2.27.0


