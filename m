Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E444058AB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:12:38 +0200 (CEST)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKn7-0005yt-Ik
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOKlS-0005AW-JU
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOKlM-0008Hc-BP
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631196643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6r6Z4BDy9NaU5a/PaE3B9rYvAKa1y1d2dMYQOajVfkw=;
 b=b0fsTcY7b/GgNMz8sRjkmKGcEyGvvXzxzqMeEpsQ9sTRPY4zWDuwaWdcZvZaFu1gwkudQx
 JlnURogskJLj+9af4iVkCQPsWDYLZBhDDdDCBpBoINm3xE0ctBe89Q+YRjzehFa/5e4/Pl
 ct/00P/n79fkONpxENzgYdcPSm76vCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-2wvZ88RpMzyWXqYV0In0eg-1; Thu, 09 Sep 2021 10:10:42 -0400
X-MC-Unique: 2wvZ88RpMzyWXqYV0In0eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC41679EDD
 for <qemu-devel@nongnu.org>; Thu,  9 Sep 2021 14:10:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9454460C04;
 Thu,  9 Sep 2021 14:10:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: remove incorrect RCU comment for address_space_read()
Date: Thu,  9 Sep 2021 15:10:31 +0100
Message-Id: <20210909141031.958393-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although the doc comment says "Called within RCU critical section" the
address_space_read() function takes the RCU read lock itself. There is
no need for the caller to hold an RCU read lock.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Fixes: b2a44fcad74f1cc7a6786d38eba7db12ab2352ba ("address_space_read: address_space_to_flatview needs RCU lock")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..60508a1e19 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2768,7 +2768,7 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
  *
  * Return a MemTxResult indicating whether the operation succeeded
  * or failed (eg unassigned memory, device rejected the transaction,
- * IOMMU fault).  Called within RCU critical section.
+ * IOMMU fault).
  *
  * @as: #AddressSpace to be accessed
  * @addr: address within that address space
-- 
2.31.1


