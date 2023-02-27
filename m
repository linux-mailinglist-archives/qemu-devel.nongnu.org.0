Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4336A40BC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpJ-0005yG-7T; Mon, 27 Feb 2023 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboK-0005hR-8m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboE-0005h1-PB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7mbqNmgioHwFOABac5OkJAD03IW2iZfmJwZyH0uuQQ=;
 b=gYzFCdpha7C1IkGjw++w7JSteao0aaysbrApuWQHsfq+RiEmMPetDSYdB9/i7S7g7lHxEr
 9yMkhR1CnLGf5ULOZ3tZnUaZW1DlfXfyDob22HNqVWRJ9auUD5dVzrPf78rDbuxQywoW4g
 BI3e5DwOIS2xYr6t2fyW20L1HT/IsEc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-IP19m8yrPRuEphp3PKL6HQ-1; Mon, 27 Feb 2023 06:36:43 -0500
X-MC-Unique: IP19m8yrPRuEphp3PKL6HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4A74101B42B;
 Mon, 27 Feb 2023 11:36:42 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDC9A1121314;
 Mon, 27 Feb 2023 11:36:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 16/33] target/s390x: Hoist some computation in access_memmove
Date: Mon, 27 Feb 2023 12:36:04 +0100
Message-Id: <20230227113621.58468-17-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Ensure that the total length is in a local variable
across the byte loop.  Compute size1 difference once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-8-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index f28126fde6..e51a0db0fe 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -299,16 +299,17 @@ static void access_set_byte(CPUS390XState *env, S390Access *access,
 static void access_memmove(CPUS390XState *env, S390Access *desta,
                            S390Access *srca, uintptr_t ra)
 {
+    int len = desta->size1 + desta->size2;
     int diff;
 
-    g_assert(desta->size1 + desta->size2 == srca->size1 + srca->size2);
+    assert(len == srca->size1 + srca->size2);
 
     /* Fallback to slow access in case we don't have access to all host pages */
     if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
                  !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
         int i;
 
-        for (i = 0; i < desta->size1 + desta->size2; i++) {
+        for (i = 0; i < len; i++) {
             uint8_t byte = access_get_byte(env, srca, i, ra);
 
             access_set_byte(env, desta, i, byte, ra);
@@ -316,20 +317,20 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
         return;
     }
 
-    if (srca->size1 == desta->size1) {
+    diff = desta->size1 - srca->size1;
+    if (likely(diff == 0)) {
         memmove(desta->haddr1, srca->haddr1, srca->size1);
         if (unlikely(srca->size2)) {
             memmove(desta->haddr2, srca->haddr2, srca->size2);
         }
-    } else if (srca->size1 < desta->size1) {
-        diff = desta->size1 - srca->size1;
+    } else if (diff > 0) {
         memmove(desta->haddr1, srca->haddr1, srca->size1);
         memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
         if (likely(desta->size2)) {
             memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
         }
     } else {
-        diff = srca->size1 - desta->size1;
+        diff = -diff;
         memmove(desta->haddr1, srca->haddr1, desta->size1);
         memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
         if (likely(srca->size2)) {
-- 
2.31.1


