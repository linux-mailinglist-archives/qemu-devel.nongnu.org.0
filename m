Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9445A6C90
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:50:03 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6JF-0001uZ-CC
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A4-0007LT-HR
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A1-00055I-0l
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYNR5HMTqq9bB8Ck0rRSwAQOy2i9EEXi867oqYqN7gI=;
 b=fJmUx6CJ/iQl2M6PbL4M3TG67KUfCua7Yu0HmoDpgqANz38eorbRijf6qDnX6hsQ4wEzET
 P13leLiW9vzS2Cenjn4Q3WLo8WbwcpuL2x+tsPbeKB14gWXzgFTsWRW6KzBbg18xR1hoP0
 NZA3VIwGbgDWlpQJrv2szcsZuXZ7Nto=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-zrYo9wJhP6-pW19CiX_eiw-1; Tue, 30 Aug 2022 14:40:22 -0400
X-MC-Unique: zrYo9wJhP6-pW19CiX_eiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462D91C05AAD;
 Tue, 30 Aug 2022 18:40:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE721410DD5;
 Tue, 30 Aug 2022 18:40:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 04/23] tests/qtest: migration-test: Handle link() for win32
Date: Tue, 30 Aug 2022 20:39:53 +0200
Message-Id: <20220830184012.77978-5-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Windows does not provide a link() API like POSIX. Instead it provides
a similar API CreateHardLink() that does the same thing, but with
different argument order and return value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220824094029.1634519-14-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 21bd76be19..18d30bfc3c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -876,9 +876,17 @@ test_migrate_tls_x509_start_common(QTestState *from,
     g_mkdir_with_parents(data->workdir, 0700);
 
     test_tls_init(data->keyfile);
+#ifndef _WIN32
     g_assert(link(data->keyfile, data->serverkey) == 0);
+#else
+    g_assert(CreateHardLink(data->serverkey, data->keyfile, NULL) != 0);
+#endif
     if (args->clientcert) {
+#ifndef _WIN32
         g_assert(link(data->keyfile, data->clientkey) == 0);
+#else
+        g_assert(CreateHardLink(data->clientkey, data->keyfile, NULL) != 0);
+#endif
     }
 
     TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
-- 
2.31.1


