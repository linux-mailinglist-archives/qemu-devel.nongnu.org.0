Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29852669A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:54:15 +0200 (CEST)
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXcM-0003EB-BZ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npXXW-0005sS-FR
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npXXU-0000fN-7i
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652456951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXoZzIrUFSIgWUGknGtxTRFqHJIoaDs0nio3CNHmeZw=;
 b=AcvB4T1D0SvosZUcHbWrpY1DhOch4ako29Gbg4vfqnfLfZYAaGBos0rJK2PG/HGXLMk/ZC
 KOyUZcJNd8K74739QjzvlTq3j4fPy7+LosQzWp13mCMdEl1X2MOQvfr9MHF93RSr2BmdUq
 k05aUDBoaCpk1KoZl7axuNgLb4TCFJM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-mP-hq8PtMsmvjFpEqPRSnA-1; Fri, 13 May 2022 11:49:10 -0400
X-MC-Unique: mP-hq8PtMsmvjFpEqPRSnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4A38811E75
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 15:49:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB681468961;
 Fri, 13 May 2022 15:49:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/2] tests/qtest: fix registration of ABRT handler for QEMU
 cleanup
Date: Fri, 13 May 2022 16:49:05 +0100
Message-Id: <20220513154906.206715-2-berrange@redhat.com>
In-Reply-To: <20220513154906.206715-1-berrange@redhat.com>
References: <20220513154906.206715-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

qtest_init registers a hook to cleanup the running QEMU process
should g_assert() fire before qtest_quit is called. When the first
hook is registered, it is supposed to triggere registration of the
SIGABRT handler. Unfortunately the logic in hook_list_is_empty is
inverted, so the SIGABRT handler never gets registered, unless
2 or more QEMU processes are run concurrently. This caused qtest
to leak QEMU processes anytime g_assert triggers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.36.1


