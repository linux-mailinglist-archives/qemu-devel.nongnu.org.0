Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7E354E3D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:06:18 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgj3-00038R-5q
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgei-0007wO-1W
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgeg-0004D6-3t
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617696105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zea6hc3YjtSyoECwOf14Hjy8OihHLytzuxBGcrhq66A=;
 b=GEYqjePALYhUIl8A0fHDMOa5en9O7awJ9OXxDZs34/0DOcetR62xc3A+3elc0IXoUphBD/
 ms1Zd7Is8VjHsRDFwZNQb2C+qbzwYhinQo/aGoFE/vROHezsHB3srMf3J8yt/nnpz8v5Ly
 MqUuqZMkXZzNvSym+EyiwLEwkELhFYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245--oeuT6K1PzOT59LjI-Dz5Q-1; Tue, 06 Apr 2021 04:01:42 -0400
X-MC-Unique: -oeuT6K1PzOT59LjI-Dz5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB5F8189C6;
 Tue,  6 Apr 2021 08:01:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-79.ams2.redhat.com [10.36.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D102B100239A;
 Tue,  6 Apr 2021 08:01:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v1 2/3] softmmu/physmem: Fix ram_block_discard_range()
 to handle shared anonymous memory
Date: Tue,  6 Apr 2021 10:01:25 +0200
Message-Id: <20210406080126.24010-3-david@redhat.com>
In-Reply-To: <20210406080126.24010-1-david@redhat.com>
References: <20210406080126.24010-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can create shared anonymous memory via
    "-object memory-backend-ram,share=on,..."
which is, for example, required by PVRDMA for mremap() to work.

Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
have to use MADV_REMOVE: MADV_DONTNEED will only remove / zap all
relevant page table entries of the current process, the backend storage
will not get removed, resulting in no reduced memory consumption and
a repopulation of previous content on next access.

Shared anonymous memory is internally really just shmem, but without a
fd exposed. As we cannot use fallocate() without the fd to discard the
backing storage, MADV_REMOVE gets the same job done without a fd as
documented in "man 2 madvise". Removing backing storage implicitly
invalidates all page table entries with relevant mappings - an additional
MADV_DONTNEED is not required.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/physmem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 76bb8e324e..afff96a6dc 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3506,6 +3506,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
         /* The logic here is messy;
          *    madvise DONTNEED fails for hugepages
          *    fallocate works on hugepages and shmem
+         *    shared anonymous memory requires madvise REMOVE
          */
         need_madvise = (rb->page_size == qemu_host_page_size);
         need_fallocate = rb->fd != -1;
@@ -3539,7 +3540,11 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
              * fallocate'd away).
              */
 #if defined(CONFIG_MADVISE)
-            ret =  madvise(host_startaddr, length, MADV_DONTNEED);
+            if (qemu_ram_is_shared(rb) && rb->fd < 0) {
+                ret = madvise(host_startaddr, length, MADV_REMOVE);
+            } else {
+                ret = madvise(host_startaddr, length, MADV_DONTNEED);
+            }
             if (ret) {
                 ret = -errno;
                 error_report("ram_block_discard_range: Failed to discard range "
-- 
2.30.2


