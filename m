Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF942A4954
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:21:20 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZy7b-0000GM-AN
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZy1X-0002GT-GG
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZy1T-0002w7-DT
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604416498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jBDGMGT/1tJgzyUvHiZlF/GlXJL28Sljhs100quxes=;
 b=RLpON3p4DB7pyAp/ISdOwleuzQAHM/FdU37w3H+8ZrdiOqsI59tMD1EnrmObLTjMFdp95d
 ypCAk0r4oqe7B5S5wFCIFPZ71f5VbGqQHVwW2RPmojiO9/URjIuIBIdixgQLnLf9kdDWh7
 HgV8Ja0fgERjVCCBEW8FipW+XfwxE/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-TXJDkYKqMaGPOB8tLRcczQ-1; Tue, 03 Nov 2020 10:14:55 -0500
X-MC-Unique: TXJDkYKqMaGPOB8tLRcczQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F511018F81
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 15:14:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68535100238E;
 Tue,  3 Nov 2020 15:14:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 3/4] qtest: escape device name in
 device-introspect-test
Date: Tue,  3 Nov 2020 10:14:51 -0500
Message-Id: <20201103151452.416784-4-pbonzini@redhat.com>
In-Reply-To: <20201103151452.416784-1-pbonzini@redhat.com>
References: <20201103151452.416784-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

device-introspect-test uses HMP, so it should escape the device name
properly.  Because of this, a few devices that had commas in their
names were escaping testing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/device-introspect-test.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index 9f22340ee5..f471b0e0dd 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -104,7 +104,9 @@ static QList *device_type_list(QTestState *qts, bool abstract)
 static void test_one_device(QTestState *qts, const char *type)
 {
     QDict *resp;
-    char *help;
+    g_autofree char *help;
+    g_autofree GRegex *comma;
+    g_autofree char *escaped;
 
     g_test_message("Testing device '%s'", type);
 
@@ -113,8 +115,9 @@ static void test_one_device(QTestState *qts, const char *type)
                type);
     qobject_unref(resp);
 
-    help = qtest_hmp(qts, "device_add \"%s,help\"", type);
-    g_free(help);
+    comma = g_regex_new(",", 0, 0, NULL);
+    escaped = g_regex_replace_literal(comma, type, -1, 0, ",,", 0, NULL);
+    help = qtest_hmp(qts, "device_add \"%s,help\"", escaped);
 }
 
 static void test_device_intro_list(void)
-- 
2.26.2



