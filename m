Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697268A018
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzep-00061y-09; Fri, 03 Feb 2023 12:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzen-00061q-BL
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzel-0003PL-Gm
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675444521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5i389KyvIdvqVOsoPuC6m23mDusUiOnk0MRlqE5W7TU=;
 b=J+cAuc9T14VsdACFcBXqWHVkjqMbIYZGc4IkFYZKo46NluE8tDeIQFozi0qrW2kiVxtAVQ
 EOHBIEnnlrn8eEg6i4BS+ZrrnHvIA2HpHMtULRMXD7JvTyr/3PstotpUGdx8qvd4Ie1x1N
 FUOtEXpU+EzxLLXAnh/gxUqrmm0+tp0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-irWonZiDN3CXGaYC87pJKA-1; Fri, 03 Feb 2023 12:15:18 -0500
X-MC-Unique: irWonZiDN3CXGaYC87pJKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00BAF802314;
 Fri,  3 Feb 2023 17:15:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D506403D0C1;
 Fri,  3 Feb 2023 17:15:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH] accel/tcg: test CPUJumpCache in tb_jmp_cache_clear_page()
Date: Fri,  3 Feb 2023 18:15:10 +0100
Message-Id: <20230203171510.2867451-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

After commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization
before registration"), it looks the CPUJumpCache handle can be NULL.
This causes a SIGSEV when running debug-wp-migration kvm unit test.

At the first place it should be clarified why this TCG code is called
with KVM acceleration. This may hide another bug.

Fixes: 4e4fa6c12d ("accel/tcg: Complete cpu initialization before registration")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 accel/tcg/cputlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4e040a1cb9..ac0245ee6c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -103,6 +103,10 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     int i, i0 = tb_jmp_cache_hash_page(page_addr);
     CPUJumpCache *jc = cpu->tb_jmp_cache;
 
+    if (!jc) {
+        return;
+    }
+
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
         qatomic_set(&jc->array[i0 + i].tb, NULL);
     }
-- 
2.37.3


