Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1E6BD401
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpfU-0006lH-BI; Thu, 16 Mar 2023 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcpfN-0006kI-4J
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcpfH-0005jJ-8l
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678981028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqu0cAs9eTlWK2DixC9E/BgDBYTXq1Cn6sUlNMmpiDg=;
 b=QEiKuK6ti41fuxJrLPjxcM1Xj3db5gEWmKPfRvx+lljCgGiurQOkNJAs4YQFx6IA7rg+rS
 OXZrjiMB2ad3UAT+2+6oFH1YMokL0Eh5ULH62HoJiPuUkV/zQJYjiXiFPqp/j8arUMCkLW
 IZppj4jiy8CeWDRY1dYkroFLi5M75d4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-LlPwcDeVO6e9Ce2qplqANw-1; Thu, 16 Mar 2023 11:37:07 -0400
X-MC-Unique: LlPwcDeVO6e9Ce2qplqANw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C64E18E004E
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 15:37:05 +0000 (UTC)
Received: from t480s.in.tum.de (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51C342A68;
 Thu, 16 Mar 2023 15:37:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 3/3] softmmu/physmem: Fixup qemu_ram_block_from_host()
 documentation
Date: Thu, 16 Mar 2023 16:36:58 +0100
Message-Id: <20230316153658.214487-4-david@redhat.com>
In-Reply-To: <20230316153658.214487-1-david@redhat.com>
References: <20230316153658.214487-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Let's fixup the documentation (e.g., removing traces of the ram_addr_t
parameter that no longer exists) and move it to the header file while at
it.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/cpu-common.h | 15 +++++++++++++++
 softmmu/physmem.c         | 17 -----------------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7..edef5bee21 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -75,6 +75,21 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
 ram_addr_t qemu_ram_addr_from_host(void *ptr);
 ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
 RAMBlock *qemu_ram_block_by_name(const char *name);
+
+/*
+ * Translates a host ptr back to a RAMBlock and an offset in that RAMBlock.
+ *
+ * @ptr: The host pointer to transalte.
+ * @round_offset: Whether to round the result offset down to a target page
+ * @offset: Will be set to the offset within the returned RAMBlock.
+ *
+ * Returns: RAMBlock (or NULL if not found)
+ *
+ * By the time this function returns, the returned pointer is not protected
+ * by RCU anymore.  If the caller is not within an RCU critical section and
+ * does not hold the iothread lock, it must have other means of protecting the
+ * pointer, such as a reference to the memory region that owns the RAMBlock.
+ */
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset);
 ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fb412a56e1..36b33786fd 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2169,23 +2169,6 @@ ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host)
     return res;
 }
 
-/*
- * Translates a host ptr back to a RAMBlock, a ram_addr and an offset
- * in that RAMBlock.
- *
- * ptr: Host pointer to look up
- * round_offset: If true round the result offset down to a page boundary
- * *ram_addr: set to result ram_addr
- * *offset: set to result offset within the RAMBlock
- *
- * Returns: RAMBlock (or NULL if not found)
- *
- * By the time this function returns, the returned pointer is not protected
- * by RCU anymore.  If the caller is not within an RCU critical section and
- * does not hold the iothread lock, it must have other means of protecting the
- * pointer, such as a reference to the region that includes the incoming
- * ram_addr_t.
- */
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset)
 {
-- 
2.39.2


