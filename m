Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBED670B58
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9X-0001Pc-FL; Tue, 17 Jan 2023 17:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9W-0001LS-3Z
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9U-0007ap-GB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/m6H/A6Idz67sjLDU/TwhgBulhjmWX8IAhtuHAZqTBo=;
 b=eu7re/DQZnNU4S8hXXxVf9mHNK8xFXetbzwKd2AlcRrLCpN0oYoMXfQcR8b7+n58aUDLVK
 QoK0CXupMh1de9LK2Dy6JTQfvJHK258C7pMAZXTgP7O8/3K64EvYQOXiF2YVp6N5SuxR4t
 H+nu6/ioGVHy+105Cn88KiOeeRR/xRM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-O_pV1PGKPxWYeEVkabTzuA-1; Tue, 17 Jan 2023 17:09:54 -0500
X-MC-Unique: O_pV1PGKPxWYeEVkabTzuA-1
Received: by mail-vk1-f198.google.com with SMTP id
 j17-20020a1f2311000000b003bd40550849so9618057vkj.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/m6H/A6Idz67sjLDU/TwhgBulhjmWX8IAhtuHAZqTBo=;
 b=OJPLvRW98d/uMO4nBoNtZE0Eg0ZFHWrnoJJ625OD19zC3Rwza6bRFNJPRtTBMC7pIK
 sedCeT3gFZBIkU4jcZpiio0VDrxmnAOYLTe1op/MWStC6ZFOXhxRrZYGTX5WJF1V4Y0t
 BibFpNrq7PX29ezID2Eo/B4yYRMgFP7ZTv0058sA1K4DCXqY+F56ZFkWwrHMRdV26qIT
 pmD2wsPAGQid7p3YjneDbkFcoFPTrywyH6WthveRWV5Mdo9r7F6+a6xMUFSmWHGP2vCV
 X8KRk/0Nl15aSR+paOQeLbyLF0j/r56hj0894sErCVT2zZwFIN1RTpa9UgsmL2MsYE+q
 HmmA==
X-Gm-Message-State: AFqh2kr7TZxbteMwfxMjfku7hTaLnk1IQ8PnoZ207wjvUrokV4C1/sbo
 DgysAptYcf8uTfBxmXxK5u/3yIl8qKHMiMGCo1VO8gJ/sbIVbrr7n+bAvTaWEQKaVUAI4WKi3Mr
 nK0+Bg2EswdToRGP8iND0EYuhJ2PtYWBB/EETuVGCPXK7YMNSYhDINLo8H9oEeocl
X-Received: by 2002:a05:6102:3d81:b0:3b0:eb7f:f15 with SMTP id
 h1-20020a0561023d8100b003b0eb7f0f15mr2816461vsv.19.1673993393287; 
 Tue, 17 Jan 2023 14:09:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvi07etoFLU93wVx8sx/5PSKVumBZGD40uvjm8bqR+wgw02yNY7ZFV2ywyJkcziwgq/iY6QuQ==
X-Received: by 2002:a05:6102:3d81:b0:3b0:eb7f:f15 with SMTP id
 h1-20020a0561023d8100b003b0eb7f0f15mr2816428vsv.19.1673993392989; 
 Tue, 17 Jan 2023 14:09:52 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:52 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 13/21] migration: Add migration_ram_pagesize_largest()
Date: Tue, 17 Jan 2023 17:09:06 -0500
Message-Id: <20230117220914.2062125-14-peterx@redhat.com>
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

Let it replace the old qemu_ram_pagesize_largest() just to fetch the page
sizes using migration_ram_pagesize(), because it'll start to consider
double mapping effect in migrations.

Also don't account the ignored ramblocks as they won't be migrated.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/cpu-common.h |  1 -
 migration/migration.c     |  2 +-
 migration/ram.c           | 12 ++++++++++++
 migration/ram.h           |  1 +
 softmmu/physmem.c         | 13 -------------
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 94452aa17f..4c394ccdfc 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -96,7 +96,6 @@ int qemu_ram_get_fd(RAMBlock *rb);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
 bool qemu_ram_is_hugetlb(RAMBlock *rb);
-size_t qemu_ram_pagesize_largest(void);
 
 /**
  * cpu_address_space_init:
diff --git a/migration/migration.c b/migration/migration.c
index f6fe474fc3..7724e00c47 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -604,7 +604,7 @@ process_incoming_migration_co(void *opaque)
 
     assert(mis->from_src_file);
     mis->migration_incoming_co = qemu_coroutine_self();
-    mis->largest_page_size = qemu_ram_pagesize_largest();
+    mis->largest_page_size = migration_ram_pagesize_largest();
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
     migrate_set_state(&mis->state, MIGRATION_STATUS_NONE,
                       MIGRATION_STATUS_ACTIVE);
diff --git a/migration/ram.c b/migration/ram.c
index 945c6477fd..2ebf414f5f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -135,6 +135,18 @@ size_t migration_ram_pagesize(RAMBlock *block)
     return qemu_ram_pagesize(block);
 }
 
+size_t migration_ram_pagesize_largest(void)
+{
+    RAMBlock *block;
+    size_t largest = 0;
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        largest = MAX(largest, migration_ram_pagesize(block));
+    }
+
+    return largest;
+}
+
 static void XBZRLE_cache_lock(void)
 {
     if (migrate_use_xbzrle()) {
diff --git a/migration/ram.h b/migration/ram.h
index 162b3e7cb8..cefe166841 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -69,6 +69,7 @@ bool ramblock_is_ignored(RAMBlock *block);
 
 int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 size_t migration_ram_pagesize(RAMBlock *block);
+size_t migration_ram_pagesize_largest(void);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
 void mig_throttle_counter_reset(void);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cdda7eaea5..536c204811 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1813,19 +1813,6 @@ bool qemu_ram_is_hugetlb(RAMBlock *rb)
     return rb->page_size > qemu_real_host_page_size();
 }
 
-/* Returns the largest size of page in use */
-size_t qemu_ram_pagesize_largest(void)
-{
-    RAMBlock *block;
-    size_t largest = 0;
-
-    RAMBLOCK_FOREACH(block) {
-        largest = MAX(largest, qemu_ram_pagesize(block));
-    }
-
-    return largest;
-}
-
 static int memory_try_enable_merging(void *addr, size_t len)
 {
     if (!machine_mem_merge(current_machine)) {
-- 
2.37.3


