Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C01FABBF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 11:01:03 +0200 (CEST)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl7Sp-00015A-3H
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 05:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jl7QJ-0006hm-Cz
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:58:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31498
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jl7QH-00029Z-Lh
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592297904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=sVnCPrtiNh7pnTw7zBqyDo+Odg2R7iAkB3PuJ7uOjjY=;
 b=LFtgK2q56q7vYeO8u5hKSlzI9D/4rNF4XUSqBgrN4+Omn54XCHOwsF80mCvUj32vxU/S6R
 c3/f9rSLw+cIwg+DoTImCzxJf05k/LZQfrcEnkSVKLpn68QhRN7R0+EkLJkktBVerz+j9e
 tzKPv3kZSf3Hcm7ktBHp1aATT4DavvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-HlAo19eqP764XBgAMsOAkA-1; Tue, 16 Jun 2020 04:58:22 -0400
X-MC-Unique: HlAo19eqP764XBgAMsOAkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DDC6E90E;
 Tue, 16 Jun 2020 08:58:21 +0000 (UTC)
Received: from thuth.com (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63A956ED96;
 Tue, 16 Jun 2020 08:58:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 3/7] fuzz: Add support for logging QTest commands
Date: Tue, 16 Jun 2020 10:58:09 +0200
Message-Id: <20200616085813.29296-4-thuth@redhat.com>
In-Reply-To: <20200616085813.29296-1-thuth@redhat.com>
References: <20200616085813.29296-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20200529221450.26673-3-alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/fuzz.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index ea630ddb9b..a44fe479db 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -94,7 +94,9 @@ static void usage(char *path)
     printf("Alternatively, add -target-FUZZ_TARGET to the executable name\n\n"
            "Set the environment variable FUZZ_SERIALIZE_QTEST=1 to serialize\n"
            "QTest commands into an ASCII protocol. Useful for building crash\n"
-           "reproducers, but slows down execution.\n");
+           "reproducers, but slows down execution.\n\n"
+           "Set the environment variable QTEST_LOG=1 to log all qtest commands"
+           "\n");
     exit(0);
 }
 
@@ -197,6 +199,11 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
 
     /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
     const char *init_cmdline = fuzz_target->get_init_cmdline(fuzz_target);
+    init_cmdline = g_strdup_printf("%s -qtest /dev/null -qtest-log %s",
+                                   init_cmdline,
+                                   getenv("QTEST_LOG") ? "/dev/fd/2"
+                                                       : "/dev/null");
+
 
     /* Split the runcmd into an argv and argc */
     wordexp_t result;
-- 
2.18.1


