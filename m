Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D763A817E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:55:29 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9XM-0003Wh-Ht
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hf-0005qI-Ux
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9He-0002lc-DG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:15 -0400
Received: by mail-ed1-x535.google.com with SMTP id d7so3113915edx.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ktS6dUjI6quq2dLhc+A3C2RYRlKl/XKEyMPYSFPo9M=;
 b=A6LVQoBwgFNfuaPf/MLnr+fFeu4J2sUeOYwihDMq49EB+g2hZtrxJHw0nPwwaOa5dt
 l24xiq4xNacQnfjLM/TA9BVM062OTLpRnt4MBtWv2e8UZ6Wj1KpipdhC1Ip0mXw2u3xG
 tg7TQ4krPBJZT2VaKtu2I8Wg4a8sQvfKdVJAtFTDOsnkiW2IbSOE7iqNslSYO+JCs8UI
 QI+bgq2IBrYjVeIE+pw2qcrrG04YdIZ/L6We+aJhsZEgKhV0JwORExfYxNAi9q471xQc
 DLtckD8RLXtoTyA0KcC+hlOTdqJCGWLIeepVI26wA9kmNkofWI973FtI3GS5qG+5Mzdt
 HFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2ktS6dUjI6quq2dLhc+A3C2RYRlKl/XKEyMPYSFPo9M=;
 b=pK5Ok0lIjLR6pVcYoHWgZCofQvVILcqOin/V8BeKDc48FdJxsX8EIcDAtvYs2bxMW1
 3rks0GZHEcle793FOxsQNnMIwj3wF7o2ED6erkf50gDJYxC5bXmVUX70kqkBU5xXDLhW
 T/UoJceigr/EqxZZq5luuAm5vDul6Jd4uwVRBePNY0j4dS0WPRMVz1Eivu/xVlorx6a4
 gPfohU7+C8S92zTvKD2H/tjy8NODlBQ3tBwDTpkC1BJU8bfqh6AIaQ2m3WvOyrz9engb
 0OEwbXVyR1jP0OfY1jZg2A2kpU4qTI1dke2vXHAYHp65fuuNUgdm52xALYLJb2NKnUti
 4R4A==
X-Gm-Message-State: AOAM530Ly6q5hLUyjPp93PoX/v8gpvTyVgFJ1vxAgMNMkXO9X1ZU8jDh
 oTqkaBS+E1eG+Q1zSGi+E24iXzXI7o8=
X-Google-Smtp-Source: ABdhPJxQqH4X9+ijmeEfBhLYcvz02QEJEZf4gD1wkDZwLrbIhodLAj6WB1irfEPDL/keOThrljv3Hw==
X-Received: by 2002:a05:6402:22d0:: with SMTP id
 dm16mr23168811edb.123.1623764353021; 
 Tue, 15 Jun 2021 06:39:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] softmmu/physmem: Fix ram_block_discard_range() to handle
 shared anonymous memory
Date: Tue, 15 Jun 2021 15:38:38 +0200
Message-Id: <20210615133855.775687-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210406080126.24010-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b78b30e7ba..b417f9c282 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3527,6 +3527,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
         /* The logic here is messy;
          *    madvise DONTNEED fails for hugepages
          *    fallocate works on hugepages and shmem
+         *    shared anonymous memory requires madvise REMOVE
          */
         need_madvise = (rb->page_size == qemu_host_page_size);
         need_fallocate = rb->fd != -1;
@@ -3560,7 +3561,11 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
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
2.31.1



