Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E9702CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:35:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPL-0006XA-0B; Mon, 15 May 2023 08:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOh-0006Qx-UC
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOf-0003Jn-QF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95lQhwQsYaDYNogO8cgjiJ0NBYPqWgKFLGrU7Vr2/iA=;
 b=H0wbQ+Nun/GY/r4ZzT+QCDrehBZualiBrVlhefNYk0lFUeUNg2NzXWi3WpfKas9VPWWcVt
 Va8hLyYguXYipfUdv8ai8U5pVAICglsbP2c5Barxkqq2VuUaIi7KU3UlZ7gcApbvNX4+6p
 LeqBYrUMF1Z+RXzEyIB1KjVN8YTbIzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-VVrqOjb-OTKTZ0XGQZeWQQ-1; Mon, 15 May 2023 08:33:42 -0400
X-MC-Unique: VVrqOjb-OTKTZ0XGQZeWQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC2F2808E61;
 Mon, 15 May 2023 12:33:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C992A35453;
 Mon, 15 May 2023 12:33:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/11] softmmu: Create qemu_target_pages_to_MiB()
Date: Mon, 15 May 2023 14:33:25 +0200
Message-Id: <20230515123334.58995-3-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Function that convert a number of target_pages into its size in MiB.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230511141208.17779-2-quintela@redhat.com>
---
 include/exec/target_page.h |  1 +
 softmmu/physmem.c          | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/exec/target_page.h b/include/exec/target_page.h
index 96726c36a4..bbf37aea17 100644
--- a/include/exec/target_page.h
+++ b/include/exec/target_page.h
@@ -18,4 +18,5 @@ size_t qemu_target_page_size(void);
 int qemu_target_page_bits(void);
 int qemu_target_page_bits_min(void);
 
+size_t qemu_target_pages_to_MiB(size_t pages);
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0e0182d9f2..efaed36773 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3357,6 +3357,17 @@ int qemu_target_page_bits_min(void)
     return TARGET_PAGE_BITS_MIN;
 }
 
+/* Convert target pages to MiB (2**20). */
+size_t qemu_target_pages_to_MiB(size_t pages)
+{
+    int page_bits = TARGET_PAGE_BITS;
+
+    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
+    g_assert(page_bits < 20);
+
+    return pages >> (20 - page_bits);
+}
+
 bool cpu_physical_memory_is_io(hwaddr phys_addr)
 {
     MemoryRegion*mr;
-- 
2.40.1


