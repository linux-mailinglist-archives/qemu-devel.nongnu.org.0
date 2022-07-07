Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C7A569C5F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:03:31 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MTy-0002wW-6x
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLZ-0002j1-AO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLX-0007Vn-Rq
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zN+rMi1rWywiJy4dMxE2M71nb8rplRHjdCn8M4d5z9A=;
 b=fVntzJWZMDMviZA7obw6incvupmhxyKFFY4zP/mRgEfZffIgkcTNcQoZOwZnYBj60/T30/
 1+5p5IUgTXa8GuJxQNIztgZqYdsp1TQxf/LvW7mD7VF97s4Hhy8guQuNROu6FS64oiP91i
 0EjkWdJleupNLWkMgUne/I9FTpk3LrA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-05mdeF0FOvWpbRXmTfB52A-1; Thu, 07 Jul 2022 03:54:32 -0400
X-MC-Unique: 05mdeF0FOvWpbRXmTfB52A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C95D6811E75;
 Thu,  7 Jul 2022 07:54:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF61404754C;
 Thu,  7 Jul 2022 07:54:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 01/18] target/s390x/tcg: SPX: check validity of new prefix
Date: Thu,  7 Jul 2022 09:54:09 +0200
Message-Id: <20220707075426.1163210-2-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

According to the architecture, SET PREFIX must try to access the new
prefix area and recognize an addressing exception if the area is not
accessible.
For qemu this check prevents a crash in cpu_map_lowcore after an
inaccessible prefix area has been set.

Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220630094340.3646279-1-scgl@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/misc_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index aab9c47747..10dadb002a 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -158,6 +158,13 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
     if (prefix == old_prefix) {
         return;
     }
+    /*
+     * Since prefix got aligned to 8k and memory increments are a multiple of
+     * 8k checking the first page is sufficient
+     */
+    if (!mmu_absolute_addr_valid(prefix, true)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
+    }
 
     env->psa = prefix;
     HELPER_LOG("prefix: %#x\n", prefix);
-- 
2.31.1


