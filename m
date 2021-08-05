Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB763E113D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:24:54 +0200 (CEST)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZcT-0001wA-MK
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBZbi-0001Gw-N2
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBZbg-0001Pl-68
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628155443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M27Tktj58HA6z++t4uXwLvkz9YSeO15HewTPKKtJzF4=;
 b=EgOKmXD6mRAwlsu4KFkNvxUCySam6hESWnyyNE8S5GWiRQadfGNJ99Hf5goXKhzWSTgxZ2
 Mkka2oVFVNYUx2Hzx40Z6lpJNh8smrwlqicY2x2g7en4Rf6Rfhj7ZV6qJioPBrAUdgXZkp
 2IX5kSJV99BDhDCPm64VRjfY6Q3ael0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-0MzrIjlxMKK_JOyIS6lpjQ-1; Thu, 05 Aug 2021 05:24:01 -0400
X-MC-Unique: 0MzrIjlxMKK_JOyIS6lpjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3721987D541
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 09:24:01 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31AAC1B5C1;
 Thu,  5 Aug 2021 09:23:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
Date: Thu,  5 Aug 2021 11:23:50 +0200
Message-Id: <20210805092350.31195-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When adding RAM_NORESERVE, we forgot to remove the old assertion when
adding the updated one, most probably when reworking the patches or
rebasing. We can easily crash QEMU by adding
  -object memory-backend-ram,id=mem0,size=500G,reserve=off
to the QEMU cmdline:
  qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
  Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
  == 0' failed.

Fix it by removing the old assertion.

Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

v1 -> v2:
- Added rbs
- Tagged for 6.1 inclusion

---
 softmmu/physmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a1a0..2e18947598 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     RAMBlock *new_block;
     Error *local_err = NULL;
 
-    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
     assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
                           RAM_NORESERVE)) == 0);
     assert(!host ^ (ram_flags & RAM_PREALLOC));
-- 
2.31.1


