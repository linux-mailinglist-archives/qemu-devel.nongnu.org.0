Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33915A6CC9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:08:38 +0200 (CEST)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6bF-0000Kt-PP
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AC-0007Ra-3s
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT69x-00052U-Al
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fHXCuciaWFMe4FtKUYwCPclO84Udg7TFEzox8NoblE=;
 b=DXbvgR09mB6BauG7m0VLde92tIHyMyCxB77iO3ETj12b9k8wUuiQ3HMnVoFZ2HnleYxD2f
 kHy7cCU47mtMeQQEsMi9JO+1ON1LTlqCctasBI+F3dISkCQ/WOK9fdsgRcmjEmjzH7bzLu
 hSlkV15XJNe/7iHPUuS6uZntxjObp+c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-Ng_u8aLoNC6hEmwJGgrRWQ-1; Tue, 30 Aug 2022 14:40:18 -0400
X-MC-Unique: Ng_u8aLoNC6hEmwJGgrRWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 961B93800C2B;
 Tue, 30 Aug 2022 18:40:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5366E1415117;
 Tue, 30 Aug 2022 18:40:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 01/23] tests/qtest: Use g_setenv()
Date: Tue, 30 Aug 2022 20:39:50 +0200
Message-Id: <20220830184012.77978-2-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Windows does not provide a setenv() API, but glib does.
Replace setenv() call with the glib version.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-2-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
 tests/qtest/libqtest.c          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 447ffe8178..afc1d20355 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -994,16 +994,16 @@ static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
     g_assert(t->opaque);
 
     config = t->opaque;
-    setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
+    g_setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
     if (config->argfunc) {
         args = config->argfunc();
-        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_setenv("QEMU_FUZZ_ARGS", args, 1);
         g_free(args);
     } else {
         g_assert_nonnull(config->args);
-        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+        g_setenv("QEMU_FUZZ_ARGS", config->args, 1);
     }
-    setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
+    g_setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8c159eacf5..ad6860d774 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1424,7 +1424,7 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
      * way, qtest_get_arch works for inproc qtest.
      */
     gchar *bin_path = g_strconcat("/qemu-system-", arch, NULL);
-    setenv("QTEST_QEMU_BINARY", bin_path, 0);
+    g_setenv("QTEST_QEMU_BINARY", bin_path, 0);
     g_free(bin_path);
 
     return qts;
-- 
2.31.1


