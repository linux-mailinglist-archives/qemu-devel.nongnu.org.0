Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FC670B67
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuA8-00036m-84; Tue, 17 Jan 2023 17:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9q-0002ez-F3
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9o-0007r0-9k
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ia6RdXcdii0hyfKSWhplcLO26KVeNp4Sk3B79jomOc4=;
 b=LhDH3EvAAqaeA2W9yOf/dyPCihMs3VHwx8wyAE/9aQchGuq9gx3gUrUMXoapotoeOWHsm1
 wxE9jRiBNcuxLJGqkg9sOAFJRSHQd88ltyycdXTmTx0fZao9FRPDx7PfS+Lmk+0lTY1k1l
 omQfKS1fgxlgeE43wVDSLDgbY8Q8mPk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-0r7A6VeEO4-Ol9x1quo3Gw-1; Tue, 17 Jan 2023 17:10:13 -0500
X-MC-Unique: 0r7A6VeEO4-Ol9x1quo3Gw-1
Received: by mail-qt1-f200.google.com with SMTP id
 f23-20020ac84717000000b003b645f1491aso655072qtp.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia6RdXcdii0hyfKSWhplcLO26KVeNp4Sk3B79jomOc4=;
 b=7ODNS/8JQvh246b4zVSBEn5SDaili9/P8chXiFi19aBKsnO0tovKMbpLuDZAmDi9eg
 y8hXgehbRtwsLMfV5eNIPeEsb6T24BwYTaVsjnyod4MgSlc+TP0j9dQTX35e63tUPdDe
 WTeVIc6V+hge7uWg9q0xewWpal2J86xnFM604gxDoJMkm6CLcYp9T4YmnIc1V6QZ7bKr
 fS8VMtR8gqDmkl2AflPkld3W97G0GeFRKDC2W89kWDYV/uDPjy1NNbQomw2+w9ARibnP
 TfJpYI7iCNh0XNQVbboQy0uYQrVRAbZoJ5ulUigp8jOzLo4Sb7fpMRjexWlxD5MYI7ps
 KPhw==
X-Gm-Message-State: AFqh2koif+iBJkSf/rtJ37G+/t5SXK7zLhNck3bQE2ve9Djg0XkMm/yI
 1/dkjUal4sWpq+Vp7BnaLBbWU4sYTw4Iq6ZcaAMFJp6cHB1rqiuZHbDPwqRSFvfhf9li+t6YW5c
 ww5Lu8u909BU+XOuPstvDaiYhfK45aX/brUigXFxVyjjbtDheXMue3eVUoOZsU6ao
X-Received: by 2002:a05:6214:328c:b0:533:6733:2bd5 with SMTP id
 mu12-20020a056214328c00b0053367332bd5mr6696089qvb.52.1673993411962; 
 Tue, 17 Jan 2023 14:10:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgfEsm17g5nCU8Knu9+te1+qx0IYuLERmZwMz2tXKsPimPTx/Y7HNrottduPHI9P3QYA6DsQ==
X-Received: by 2002:a05:6214:328c:b0:533:6733:2bd5 with SMTP id
 mu12-20020a056214328c00b0053367332bd5mr6696064qvb.52.1673993411684; 
 Tue, 17 Jan 2023 14:10:11 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:10:11 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 21/21] migration: Collapse huge pages again after postcopy
 finished
Date: Tue, 17 Jan 2023 17:09:14 -0500
Message-Id: <20230117220914.2062125-22-peterx@redhat.com>
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

When hugetlb-doublemap enabled, the pages will be migrated in small page
sizes during postcopy.  When the migration finishes, the pgtable needs to
be rebuilt explicitly for these ranges to have huge page being mapped again.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c        | 31 +++++++++++++++++++++++++++++++
 migration/trace-events |  1 +
 2 files changed, 32 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 4da56d925c..178739f8c3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3986,6 +3986,31 @@ static int ram_load_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
+#define  MADV_COLLAPSE_CHUNK_SIZE  (1UL << 30) /* 1G */
+
+static void ramblock_rebuild_huge_mappings(RAMBlock *rb)
+{
+    unsigned long addr, size;
+
+    assert(qemu_ram_is_hugetlb(rb));
+
+    addr = (unsigned long)qemu_ram_get_host_addr(rb);
+    size = rb->mmap_length;
+
+    while (size) {
+        unsigned long chunk = MIN(size, MADV_COLLAPSE_CHUNK_SIZE);
+
+        if (qemu_madvise((void *)addr, chunk, QEMU_MADV_COLLAPSE)) {
+            error_report("%s: madvise(MADV_COLLAPSE) failed "
+                         "for ramblock '%s'", __func__, rb->idstr);
+        } else {
+            trace_ramblock_rebuild_huge_mappings(rb->idstr, addr, chunk);
+        }
+        addr += chunk;
+        size -= chunk;
+    }
+}
+
 static int ram_load_cleanup(void *opaque)
 {
     RAMBlock *rb;
@@ -4001,6 +4026,12 @@ static int ram_load_cleanup(void *opaque)
         g_free(rb->receivedmap);
         rb->receivedmap = NULL;
         if (rb->host_mirror) {
+            /*
+             * If host_mirror set, it means this is an hugetlb ramblock,
+             * and we've enabled double mappings for it.  Rebuild the huge
+             * page tables here.
+             */
+            ramblock_rebuild_huge_mappings(rb);
             munmap(rb->host_mirror, rb->mmap_length);
             rb->host_mirror = NULL;
         }
diff --git a/migration/trace-events b/migration/trace-events
index 7baf235d22..6b52bb691c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -119,6 +119,7 @@ postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
 postcopy_preempt_send_host_page(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
 postcopy_preempt_switch_channel(int channel) "%d"
 postcopy_preempt_reset_channel(void) ""
+ramblock_rebuild_huge_mappings(char *str, unsigned long start, unsigned long size) "ramblock %s start 0x%lx size 0x%lx"
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %u"
-- 
2.37.3


