Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D019670B6B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuAA-0003d1-C2; Tue, 17 Jan 2023 17:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9r-0002kO-To
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9q-0007rp-4I
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfQL5H6B8e8hdqXoP2IDShzPV2mKexzfOVrl4WAyjgw=;
 b=NALwSKm7qcu6uS9G0RdzK2vrpSnKRVXhO1ckldzralJqa2Nhu+QY+dCAbxvNP027iMGGp+
 YgZQZVMVxfZj3M9fmED7EUYXuBhS18ZZ7BkIi0ncQ8m0kry8cmUsQdZoKR7t6cu9IcGbGS
 It2J5p/0IwF+6dIRad0r6Ye8rtTErls=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-ZXvMl1MxMcKRYsEBRKkOYA-1; Tue, 17 Jan 2023 17:10:04 -0500
X-MC-Unique: ZXvMl1MxMcKRYsEBRKkOYA-1
Received: by mail-vs1-f69.google.com with SMTP id
 k27-20020a67ef5b000000b003d0dce04b32so4978655vsr.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfQL5H6B8e8hdqXoP2IDShzPV2mKexzfOVrl4WAyjgw=;
 b=QOTvtzBySz5air7YW86J9Tt0uVp3AsCTDcvNnMA/zfc1LrsiI31a+rQEChL7LDddQv
 q5oOt26urfVUYao90AhocRmh3FIJ32yxnoyRyFZkXvOtbexOCWqBhdvnIewnnCmZZLxB
 2ZQjYUffAmkeGpbKh5D3q9cRBn+ECCfFo6Fk/brRECw+ViSrj50KFPCDVXiUN1/mOTH1
 NMdrBVLpYv21mQAICxU93EACGw0Bha2bNF1ofSVYK/Y1JsUvd8B3gcsXcqn6izBRSlf6
 NqEjD9ZFmw68dWkcPr6cNbjkRTfj55s6U+9y1Zdm87/zXNI5zdxm82T/QF9d9hIobJbS
 TGFQ==
X-Gm-Message-State: AFqh2kogGLn4/eGz0v+P2HDmQ6Vp53XBWmqF9TpeWCxfnTG3yijduUwX
 DI8kDvdO2aGsr1y+cghoBd4RmHjXHAmrXi/0vROwT1z2MMlf+g8Lyw6xbqLViDJ2ZOwVTfQXtAr
 ZxRjLuKBgWsIm6xqqTxdbSk/e3lUC4ZS2IrQnKwYJniPtuiYi3eJk9Ieqki3dYC1C
X-Received: by 2002:a67:f84a:0:b0:3ce:5079:1063 with SMTP id
 b10-20020a67f84a000000b003ce50791063mr14478491vsp.35.1673993402513; 
 Tue, 17 Jan 2023 14:10:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBig1mXDQuo8a/BpN2rgkNj/xn5SLVOgLA201wdwP4J7YZD7gr4Spq81OgbZrdUaP23Mbipg==
X-Received: by 2002:a67:f84a:0:b0:3ce:5079:1063 with SMTP id
 b10-20020a67f84a000000b003ce50791063mr14478461vsp.35.1673993402208; 
 Tue, 17 Jan 2023 14:10:02 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:10:00 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 17/21] migration: Rework ram discard logic for hugetlb
 double-map
Date: Tue, 17 Jan 2023 17:09:10 -0500
Message-Id: <20230117220914.2062125-18-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Hugetlb double map will make the ram discard logic different.

The whole idea will still be the same: we need to a bitmap sync between
src/dst before we switch to postcopy.

When discarding a range, we only erase the pgtables that were used to be
mapped for the guest leveraging the semantics of MADV_DONTNEED on Linux.
This guarantees us that when a guest access triggered we'll receive a MINOR
fault message rather than a MISSING fault message.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/cpu-common.h |  1 +
 migration/ram.c           | 16 +++++++++++++++-
 migration/trace-events    |  1 +
 softmmu/physmem.c         | 31 +++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 4c394ccdfc..09378c6ada 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -155,6 +155,7 @@ typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
 int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length);
+int ram_block_zap_range(RAMBlock *rb, uint64_t start, size_t length);
 
 #endif
 
diff --git a/migration/ram.c b/migration/ram.c
index 4d786f4b97..4da56d925c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2770,6 +2770,12 @@ static void postcopy_each_ram_send_discard(MigrationState *ms)
          * host-page size chunks, mark any partially dirty host-page size
          * chunks as all dirty.  In this case the host-page is the host-page
          * for the particular RAMBlock, i.e. it might be a huge page.
+         *
+         * Note: we need to do huge page truncation when double-map is
+         * enabled too, _only_ because we use MADV_DONTNEED to drop
+         * pgtables on dest QEMU, and it (at least so far...) does not
+         * support dropping partial of the hugetlb pgtables.  If it can one
+         * day, we can skip this "chunk" operation as further optimization.
          */
         postcopy_chunk_hostpages_pass(ms, block);
 
@@ -2913,7 +2919,15 @@ int ram_discard_range(const char *rbname, uint64_t start, size_t length)
                      length >> qemu_target_page_bits());
     }
 
-    return ram_block_discard_range(rb, start, length);
+    if (postcopy_use_minor_fault(rb)) {
+        /*
+         * We need to keep the page cache exist, so as to trigger MINOR
+         * faults for every future page accesses on old pages.
+         */
+        return ram_block_zap_range(rb, start, length);
+    } else {
+        return ram_block_discard_range(rb, start, length);
+    }
 }
 
 /*
diff --git a/migration/trace-events b/migration/trace-events
index 57003edcbd..6b418a0e9e 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -92,6 +92,7 @@ migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
 migration_throttle(void) ""
 ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: start: %" PRIx64 " %zx"
+postcopy_discard_range(const char *rbname, uint64_t start, void *host, size_t len) "%s: start=%" PRIx64 " haddr=%p len=%zx"
 ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) "%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
 ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=%d addr=0x%" PRIx64 " flags=0x%x"
 ram_postcopy_send_discard_bitmap(void) ""
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 536c204811..12c0bc9aee 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3567,6 +3567,37 @@ int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
     return ret;
 }
 
+/*
+ * Zap page tables for specified range.  Only applicable for file-backed
+ * memory.  We're relying on Linux's MADV_DONTNEED behavior here for
+ * zapping the pgtables, it may or may not work on other OSes.  Before we
+ * know that, fail them.
+ */
+int ram_block_zap_range(RAMBlock *rb, uint64_t start, size_t length)
+{
+#ifdef CONFIG_LINUX
+    uint8_t *host_addr = rb->host + start;
+    int ret;
+
+    if (rb->fd == -1) {
+        /* The zap magic only works with file-backed */
+        return -EINVAL;
+    }
+
+    ret = madvise(host_addr, length, MADV_DONTNEED);
+    if (ret) {
+        ret = -errno;
+        error_report("%s: Failed to zap ramblock start=0x%"PRIx64
+                     " addr=0x%"PRIx64" length=0x%zx", __func__,
+                     start, (uint64_t)host_addr, length);
+    }
+
+    return ret;
+#else
+    return -EINVAL;
+#endif
+}
+
 /*
  * Unmap pages of memory from start to start+length such that
  * they a) read as 0, b) Trigger whatever fault mechanism
-- 
2.37.3


