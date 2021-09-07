Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECA4029F6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:42:28 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbMp-0003JA-Cw
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawq-0003JQ-Tr
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawk-0002Og-59
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdTkyxxjgv5UIAzXmWlWzTbdsYCe4ltA3Qjx5VEJ/ro=;
 b=a63dA+h/1ayMSMiz9fgHuKNz/3PKm+aSLFWY7Bvh74GlKX3j0pudaLn4yEd8uxCxgUNuf0
 wzjESHIX7zfRio2bdwTsqGGfu/Au31woWwRTpUOkL+UVzMhHCr/K7TQ22ZeKGcDTuX/Gh0
 iGrbuQaB13RzihwlNgAZ6wacPPLnv4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-xL_MfVJIMK-SJ8G5iy45Yg-1; Tue, 07 Sep 2021 09:15:17 -0400
X-MC-Unique: xL_MfVJIMK-SJ8G5iy45Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D94756BA1;
 Tue,  7 Sep 2021 13:15:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A115E17258;
 Tue,  7 Sep 2021 13:15:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/20] s390x/tcg: fix and optimize SPX (SET PREFIX)
Date: Tue,  7 Sep 2021 15:14:33 +0200
Message-Id: <20210907131449.493875-5-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Message-Id: <20210805125938.74034-1-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


