Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DC6BEA86
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAal-00017R-OM; Fri, 17 Mar 2023 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pdAae-00016j-7v
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pdAaX-0007yx-6U
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679061463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K+peMdtBkm4f6xEadc5Qr7oCuQUcHDVM/i+t3wrIj80=;
 b=Za4TtVXPxcY2watxJi0Pl5fC30CJxdtmwSibkExDRl4oXzZ5J85IlAJLDyP+Hw2dBpLz8V
 pSVOYYJCDe8/ygsD1NkZCq8Tpb8GfvSSp9EecEMBtHTaCIo5qSOi58ZoJtqbf7Td7YHDzK
 oVqVaXFRfc28eDCSQ3frBfIJS+zVYJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-lyPyIF1MOHiSDqD7pWRU4g-1; Fri, 17 Mar 2023 09:57:40 -0400
X-MC-Unique: lyPyIF1MOHiSDqD7pWRU4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3E49101A531;
 Fri, 17 Mar 2023 13:57:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E1E2166B29;
 Fri, 17 Mar 2023 13:57:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] target/s390x/tcg/mem_helper: Remove bad assert() statement
Date: Fri, 17 Mar 2023 14:57:37 +0100
Message-Id: <20230317135737.597570-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The "assert(!nonfault)" statement can be triggered by running the
"mvpg" s390x kvm-unit-test with TCG. According to Richard: "... the
assert looks backward. We should only arrive there if nonfault was
true for the probe (otherwise the probe would have raised the
exception directly).  I would think we could just remove the assert."

Fixes: 4049431478 ("target/s390x: Fix s390_probe_access for user-only")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6835c26dda..adbc79b446 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -149,7 +149,6 @@ static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
                                    nonfault, phost, ra);
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
-        assert(!nonfault);
 #ifdef CONFIG_USER_ONLY
         /* Address is in TEC in system mode; see s390_cpu_record_sigsegv. */
         env->__excp_addr = addr & TARGET_PAGE_MASK;
-- 
2.31.1


