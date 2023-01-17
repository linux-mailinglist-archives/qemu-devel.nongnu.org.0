Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF76670B50
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9J-0000Gr-5j; Tue, 17 Jan 2023 17:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9G-00008D-PM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9F-0007Z2-22
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBzEOj0C8gI3srLDIfpzVTfM/NNJ4x/eV+I6rmI2dW8=;
 b=PD4Myp315ZzrXiPLNFsb8Co4618geOIbO+p0FYicwpvFCitlCqAIdJ4GQOzVrOY/UiIT3P
 oInhCJfC0JOPis/HT54uzq6y7L+C6jNvw80xnmXuCaJDW9fYF8YEzpIzWbh/s8rW2n1Rx7
 cFTcZWTKUNx4gxj+Mal+lj08TdTx34w=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-jXAg80F_MOi8dWxnMi5kVQ-1; Tue, 17 Jan 2023 17:09:39 -0500
X-MC-Unique: jXAg80F_MOi8dWxnMi5kVQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 n189-20020a6772c6000000b003d0ecf8a7f2so4476721vsc.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBzEOj0C8gI3srLDIfpzVTfM/NNJ4x/eV+I6rmI2dW8=;
 b=AXXXUAkPdtElAiQUmPJOTZtr/tEwvOtIbQ/phF0k8xD3JsZ3ZSpAHYbZjocJmv+qU5
 GSzGaZPpPlXewior9m3CSOLcFVi5qOi9s2n8Git2yGcToWpjKCaQoUXNkmhGJR2Ovors
 glR/dcgNlse0z6nos+xDq1EpUJYKYS5cbcpwzQBdEYxlfWy4910hESNLbMKQ0PGuwS5r
 21FrJhmEFwW+LuknOR8K0USzpxyksVQvZByS3l1YPTMlUrf4kizqVA+Czi83ICJglftm
 zEKeI70MzU9xWHoJnptB1iu0HipwGCzDpz5y8Jyn6LOPauoZ/buk4BCun8kQDyujgcnQ
 s2ig==
X-Gm-Message-State: AFqh2kp8owVVeRp7VOwp6BdxAc7q6XrBBE3g3fBiOZjgKfrLpTum+cWN
 kh5wu3TRxScw3kLFAqn1MgmB5a3x9a9kzbIFPlFATyDRENmhg9aJneqT25bwUkLmLWnOmAaJPxJ
 2wsfDnc5yjqS6h3BnAeVJ+B34tM5J4ooue/rO06YEkTH1gc8rY+9ShUyZbKuMpzH9
X-Received: by 2002:a67:fc81:0:b0:3d0:ebf4:dcb2 with SMTP id
 x1-20020a67fc81000000b003d0ebf4dcb2mr1980773vsp.20.1673993377933; 
 Tue, 17 Jan 2023 14:09:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxxv8ykuTj/lPHjSQpxQZQ3ws68iQ9lEZHpHhSnFcQLM8FSLeJP5GoRKtJvi5IfpcfkdAS3Q==
X-Received: by 2002:a67:fc81:0:b0:3d0:ebf4:dcb2 with SMTP id
 x1-20020a67fc81000000b003d0ebf4dcb2mr1980743vsp.20.1673993377564; 
 Tue, 17 Jan 2023 14:09:37 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:36 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 08/21] ramblock: Cache the length to do file mmap() on
 ramblocks
Date: Tue, 17 Jan 2023 17:09:01 -0500
Message-Id: <20230117220914.2062125-9-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We do proper page size alignment for file backed mmap()s for ramblocks.
Even if it's as simple as that, cache the value because it'll be used in
multiple places.

Since at it, drop size for file_ram_alloc() and just use max_length because
that's always true for file-backed ramblocks.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ramblock.h |  2 ++
 softmmu/physmem.c       | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 76cd0812c8..3f31ce1591 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -32,6 +32,8 @@ struct RAMBlock {
     ram_addr_t offset;
     ram_addr_t used_length;
     ram_addr_t max_length;
+    /* Only used for file-backed ramblocks */
+    ram_addr_t mmap_length;
     void (*resized)(const char*, uint64_t length, void *host);
     uint32_t flags;
     /* Protected by iothread lock.  */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index aa1a7466e5..b5be02f1cb 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1533,7 +1533,6 @@ static int file_ram_open(const char *path,
 }
 
 static void *file_ram_alloc(RAMBlock *block,
-                            ram_addr_t memory,
                             int fd,
                             bool readonly,
                             bool truncate,
@@ -1563,14 +1562,14 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 #endif
 
-    if (memory < block->page_size) {
+    if (block->max_length < block->page_size) {
         error_setg(errp, "memory size 0x" RAM_ADDR_FMT " must be equal to "
                    "or larger than page size 0x%zx",
-                   memory, block->page_size);
+                   block->max_length, block->page_size);
         return NULL;
     }
 
-    memory = ROUND_UP(memory, block->page_size);
+    block->mmap_length = ROUND_UP(block->max_length, block->page_size);
 
     /*
      * ftruncate is not supported by hugetlbfs in older
@@ -1586,7 +1585,7 @@ static void *file_ram_alloc(RAMBlock *block,
      * those labels. Therefore, extending the non-empty backend file
      * is disabled as well.
      */
-    if (truncate && ftruncate(fd, memory)) {
+    if (truncate && ftruncate(fd, block->mmap_length)) {
         perror("ftruncate");
     }
 
@@ -1594,7 +1593,8 @@ static void *file_ram_alloc(RAMBlock *block,
     qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
     qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
     qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
-    area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
+    area = qemu_ram_mmap(fd, block->mmap_length, block->mr->align,
+                         qemu_map_flags, offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
@@ -2100,7 +2100,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, size, fd, readonly,
+    new_block->host = file_ram_alloc(new_block, fd, readonly,
                                      !file_size, offset, errp);
     if (!new_block->host) {
         g_free(new_block);
-- 
2.37.3


