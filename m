Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576213E1543
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:04:41 +0200 (CEST)
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBd3A-0001jO-2w
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBcyv-0008N8-WA
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBcyu-0006Gx-E1
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GyzTEBYOpTPgEaPWaQ6BMDNaUNdSSfH0QMidNsidqB8=;
 b=A+7wuYqR5qqNWk4jkkfE/uDdt/dVPCkv6FztgraxDNutmRDku+/qLE5G2wu9vihPUvdIes
 P8ljBchk0Oqf6wQETvRQsluWRkTtzvp326T27Ih/mLYJQxSq6e3nuFTpkDFRlt54n1na3u
 04YF6y2dH346lMgy6NzaYghjJKowBJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-BLHnqo-VOFe7qjR2vKdy3w-1; Thu, 05 Aug 2021 09:00:12 -0400
X-MC-Unique: BLHnqo-VOFe7qjR2vKdy3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25371009456;
 Thu,  5 Aug 2021 12:59:58 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B74482B6D5;
 Thu,  5 Aug 2021 12:59:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
Date: Thu,  5 Aug 2021 14:59:38 +0200
Message-Id: <20210805125938.74034-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We not only invalidate the translation of the range 0x0-0x2000, we also
invalidate the translation of the new prefix range and the translation
of the old prefix range -- because real2abs would return different
results for all of these ranges when changing the prefix location.

This fixes the kvm-unit-tests "edat" test that just hangs before this
patch because we end up clearing the new prefix area instead of the old
prefix area.

While at it, let's not do anything in case the prefix doesn't change.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/misc_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 33e6999e15..aab9c47747 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -151,13 +151,26 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1, uint32_t r3, uint32_t num)
 /* Set Prefix */
 void HELPER(spx)(CPUS390XState *env, uint64_t a1)
 {
+    const uint32_t prefix = a1 & 0x7fffe000;
+    const uint32_t old_prefix = env->psa;
     CPUState *cs = env_cpu(env);
-    uint32_t prefix = a1 & 0x7fffe000;
+
+    if (prefix == old_prefix) {
+        return;
+    }
 
     env->psa = prefix;
     HELPER_LOG("prefix: %#x\n", prefix);
     tlb_flush_page(cs, 0);
     tlb_flush_page(cs, TARGET_PAGE_SIZE);
+    if (prefix != 0) {
+        tlb_flush_page(cs, prefix);
+        tlb_flush_page(cs, prefix + TARGET_PAGE_SIZE);
+    }
+    if (old_prefix != 0) {
+        tlb_flush_page(cs, old_prefix);
+        tlb_flush_page(cs, old_prefix + TARGET_PAGE_SIZE);
+    }
 }
 
 static void update_ckc_timer(CPUS390XState *env)
-- 
2.31.1


