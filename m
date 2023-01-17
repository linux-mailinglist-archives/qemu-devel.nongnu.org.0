Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2B670B63
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9t-0002hy-25; Tue, 17 Jan 2023 17:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9o-0002Wm-H7
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9k-0007q7-Ju
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+lyqMf7FS/xt0fUNaJo0X2RsMrbw86pu+I7arjRFgs=;
 b=geyINHpGCziy+DClnn/njyhq44Gl7IQP8GsE8aslR/uOljMvoUJVg8TWTdPOq6tFmSVQ4f
 PMnhnp3FgOIWa7Z/CsfKthQEOZTUmt19XQuvl/iv+3CLVlL1//3mXqIdUqAXgXtfyTkTXD
 yOt7gCeWG1HGAaKL7L0l+CIN86q4jr0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-SM2TDBSFOya7wXUDsiKQew-1; Tue, 17 Jan 2023 17:10:10 -0500
X-MC-Unique: SM2TDBSFOya7wXUDsiKQew-1
Received: by mail-yb1-f197.google.com with SMTP id
 m187-20020a2558c4000000b007f17c91f06fso2796577ybb.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+lyqMf7FS/xt0fUNaJo0X2RsMrbw86pu+I7arjRFgs=;
 b=HcLzX7j1alPRfciiaheG8KHdUhOfoyRJTy9uAko6uOC7a2PJrxHapGa/XzP1cvNEgp
 wbhuEbmcj8S9zphXgUE4FKG15cCVrsg7FE2YBIcXpt6v+gXbwgS3xDPXk2cDFYHf9HXl
 HE2i6enOffeEn4H9Dk9eXw2iESOAn6vtv0GHuMJekzVPEMyGFSasndWrPI3SNwQGGg3v
 4ZPE41kxkyvaLPuc3h/ptiUSKyg91Do2JSqRPx9BZg/Mm7BKKUi+6lYYVfpEVNycuyze
 3WgRMnsR/4rySs5VqDFgBHD+tffG+DQ37ldLu1XXuwZu3Rm4li9VmofJ3e87KRajm3jw
 rz3A==
X-Gm-Message-State: AFqh2krYv5WIgB3fSXUhGSTonytrW6Y7WbR+AWgnS3Ivz3LEsAqadKQu
 xRv3qP1U1CxNmaI3kD3+yw19oR0zA6wThuaWSl09mwNoYZCDvpRufvUnzpXV7dQKZaGsaGt8IYK
 2CM9rraVa+pWTck6SIdifdPTIqo4ibNHrQSdzhOFcilqf4t5LxvtDJS1FaXsoQkWz
X-Received: by 2002:a25:b52:0:b0:7c2:82a5:292f with SMTP id
 79-20020a250b52000000b007c282a5292fmr4760769ybl.32.1673993409301; 
 Tue, 17 Jan 2023 14:10:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuh4diQw1eV/fPVemocx+IX7icllN9AA2J+U2iDK6T1MCoWJUzzF7OigYVFncpJzipHo4376w==
X-Received: by 2002:a25:b52:0:b0:7c2:82a5:292f with SMTP id
 79-20020a250b52000000b007c282a5292fmr4760741ybl.32.1673993408866; 
 Tue, 17 Jan 2023 14:10:08 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:10:07 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 20/21] migration: Handle page faults using UFFDIO_CONTINUE
Date: Tue, 17 Jan 2023 17:09:13 -0500
Message-Id: <20230117220914.2062125-21-peterx@redhat.com>
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

Teach QEMU to be able to handle page faults using UFFDIO_CONTINUE for
hugetlbfs double mapped ranges.

To copy the data, we need to use the mirror buffer created per ramblock by
a raw memcpy(), then we can kick the faulted threads using UFFDIO_CONTINUE
by installing the pgtables.

Move trace_postcopy_place_page(host) upper so that it'll dump something for
either UFFDIO_COPY or UFFDIO_CONTINUE.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 55 ++++++++++++++++++++++++++++++++++++++--
 migration/trace-events   |  4 +--
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 8a2259581e..c4bd338e22 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1350,6 +1350,43 @@ int postcopy_notify_shared_wake(RAMBlock *rb, uint64_t offset)
     return 0;
 }
 
+/* Returns the mirror_host addr for a specific host address in ramblock */
+static inline void *migration_ram_get_mirror_addr(RAMBlock *rb, void *host)
+{
+    return (void *)((__u64)rb->host_mirror + ((__u64)host - (__u64)rb->host));
+}
+
+static int
+qemu_uffd_continue(MigrationIncomingState *mis, RAMBlock *rb, void *host,
+                   void *from)
+{
+    void *mirror_addr = migration_ram_get_mirror_addr(rb, host);
+    /* Doublemap uses small host page size */
+    uint64_t psize = qemu_real_host_page_size();
+    struct uffdio_continue req;
+
+    /*
+     * Copy data first into the mirror host pointer; we can't directly copy
+     * data into rb->host because otherwise our thread will get trapped too.
+     */
+    memcpy(mirror_addr, from, psize);
+
+    /* Kick off the faluted threads to fetch data from the page cache */
+    req.range.start = (__u64)host;
+    req.range.len = psize;
+    req.mode = 0;
+	if (ioctl(mis->userfault_fd, UFFDIO_CONTINUE, &req)) {
+        error_report("%s: UFFDIO_CONTINUE failed for start=%p"
+                     " len=0x%"PRIx64": %s\n", __func__, host,
+                     psize, strerror(-req.mapped));
+        return req.mapped;
+    }
+
+    postcopy_mark_received(mis, rb, host, psize / qemu_target_page_size());
+
+    return 0;
+}
+
 /*
  * Place a host page (from) at (host) atomically
  * returns 0 on success
@@ -1359,6 +1396,18 @@ int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
 {
     size_t pagesize = migration_ram_pagesize(rb);
 
+    trace_postcopy_place_page(rb->idstr, (uint8_t *)host - rb->host, host);
+
+    if (postcopy_use_minor_fault(rb)) {
+        /*
+         * If minor fault used, we use UFFDIO_CONTINUE instead.
+         *
+         * TODO: support shared uffds (e.g. vhost-user). Currently we're
+         * skipping them.
+         */
+        return qemu_uffd_continue(mis, rb, host, from);
+    }
+
     /* copy also acks to the kernel waking the stalled thread up
      * TODO: We can inhibit that ack and only do it if it was requested
      * which would be slightly cheaper, but we'd have to be careful
@@ -1372,7 +1421,6 @@ int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
         return -e;
     }
 
-    trace_postcopy_place_page(host);
     return postcopy_notify_shared_wake(rb,
                                        qemu_ram_block_host_offset(rb, host));
 }
@@ -1385,10 +1433,13 @@ int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                              RAMBlock *rb)
 {
     size_t pagesize = migration_ram_pagesize(rb);
-    trace_postcopy_place_page_zero(host);
+    trace_postcopy_place_page_zero(rb->idstr, (uint8_t *)host - rb->host, host);
 
     /* Normal RAMBlocks can zero a page using UFFDIO_ZEROPAGE
      * but it's not available for everything (e.g. hugetlbpages)
+     *
+     * NOTE: when hugetlb double-map enabled, then this ramblock will never
+     * have RAM_UF_ZEROPAGE, so it'll always go to postcopy_place_page().
      */
     if (qemu_ram_is_uf_zeroable(rb)) {
         if (qemu_ufd_copy_ioctl(mis, host, NULL, pagesize, rb)) {
diff --git a/migration/trace-events b/migration/trace-events
index 6b418a0e9e..7baf235d22 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -265,8 +265,8 @@ postcopy_discard_send_range(const char *ramblock, unsigned long start, unsigned
 postcopy_cleanup_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
 postcopy_init_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
 postcopy_nhp_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
-postcopy_place_page(void *host_addr) "host=%p"
-postcopy_place_page_zero(void *host_addr) "host=%p"
+postcopy_place_page(const char *id, size_t offset, void *host_addr) "id=%s offset=0x%zx host=%p"
+postcopy_place_page_zero(const char *id, size_t offset, void *host_addr) "id=%s offset=0x%zx host=%p"
 postcopy_ram_enable_notify(void) ""
 mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, int cpu, int received) "addr: 0x%" PRIx64 ", dd: %p, time: %u, cpu: %d, already_received: %d"
 mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
-- 
2.37.3


