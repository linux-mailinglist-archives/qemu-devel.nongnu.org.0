Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EE52B598
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:09:58 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFgr-0003Dt-4n
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbx-0008EY-Ek
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004N2-3n
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cc6au0B6JALxPRdOYC3kfmJMafKytVuqtWe1tVyMNgM=;
 b=iMMSqCHEmAR73EUI834fFntLh3zikY6ugAhQtuGYcs5pjRd7D8dkvveXlx1Iy4mea0mWoU
 7WBhqMoRHBdYhh+0oRI6ZifJ1ock6u98gUm4t6G65EpjvqhdLl4bd04GA/KobL4sgX1W/Q
 ZhJWuuhyegnj/0T/Ldn1QAfdepULBlk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-lzcxByAYNQ-nyxJHOe6qVQ-1; Wed, 18 May 2022 05:04:43 -0400
X-MC-Unique: lzcxByAYNQ-nyxJHOe6qVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35A42999B5A;
 Wed, 18 May 2022 09:04:42 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74B281410DD5;
 Wed, 18 May 2022 09:04:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 3/8] tests/qtest: fix registration of ABRT handler for QEMU
 cleanup
Date: Wed, 18 May 2022 11:04:33 +0200
Message-Id: <20220518090438.158475-4-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Daniel P. Berrangé <berrange@redhat.com>

qtest_init registers a hook to cleanup the running QEMU process
should g_assert() fire before qtest_quit is called. When the first
hook is registered, it is supposed to triggere registration of the
SIGABRT handler. Unfortunately the logic in hook_list_is_empty is
inverted, so the SIGABRT handler never gets registered, unless
2 or more QEMU processes are run concurrently. This caused qtest
to leak QEMU processes anytime g_assert triggers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220513154906.206715-2-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 228357f1ea..4a4697c0d1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -197,11 +197,11 @@ static bool hook_list_is_empty(GHookList *hook_list)
     GHook *hook = g_hook_first_valid(hook_list, TRUE);
 
     if (!hook) {
-        return false;
+        return true;
     }
 
     g_hook_unref(hook_list, hook);
-    return true;
+    return false;
 }
 
 void qtest_add_abrt_handler(GHookFunc fn, const void *data)
-- 
2.27.0


