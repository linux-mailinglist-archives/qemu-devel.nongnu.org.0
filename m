Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE8670B62
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9a-0001mb-Rv; Tue, 17 Jan 2023 17:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9Y-0001bk-AD
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9W-0007b2-Jc
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDIycr7V4ehicHYTbW8zApWYTAG6A+ojiqCcDH8vsjY=;
 b=MszW9KwdZbPUwrgjs6AG9GJ3pJ3vSIZcH42PwzzjFk2fydiimwudyjmAa4bpOHcjieRT+0
 mIQxNv2Or1Zz5Qe62uXp4rR2XyaDpGQHi+Gs6DpB8LVnyrpJssJa+NpqwyfeyYi+/sYHfQ
 xl8NmmOKYGaAH4UyINEs2MpN1b1eduI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-hgNqkl4vMga2BTwV3zFDRQ-1; Tue, 17 Jan 2023 17:09:57 -0500
X-MC-Unique: hgNqkl4vMga2BTwV3zFDRQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 x188-20020a2531c5000000b00716de19d76bso35371158ybx.19
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDIycr7V4ehicHYTbW8zApWYTAG6A+ojiqCcDH8vsjY=;
 b=iknJOyK075ujsCOGwrIjg64i6rj9rSKWTiWtV0i3x3+y6FPS9RUNhhV8ouZXBerGQt
 3uVyZ/Um14LOUbP7CVB80326lk/OwqIpNCPBzq6JVo5EoJ9HP4kgmyqec6YgECmeiFA6
 ozhjTEZxJWFhbG/WWelmAUJ4kyIPbJF0BbSEjRcCCCL+1aOEpnyFGIYxnp9ksgaWIllS
 xOmLrVf5ggOZAPrJ0HvVzR8EVcEeRaa7jvEhA4ftoqP3q/pNxi0jsvAG0p2ZqJSl6fd6
 Ac/8EdmPA41Uum4GklbnUUIy2z9VzfspWOfs9CdxZm2JDnXRRXDZl4nHp+S9lCobSnuX
 1fZQ==
X-Gm-Message-State: AFqh2krExAZembA9aR8baZKTJjsNmsIgL0ubos/+PSVx+sZ4SeUcgYGT
 lWuzk+PIh7xogZoAzg6qwyQiGW5Z+XGV6XecaoGpnxPlfMGxVKj2zdr8VbRyPV2AesTYwHmByQi
 tLfXDgXJ5riCxjgp7asV5LYsFoV88f2YSv+/QvPDKasXOHkxFox7YhaQTuO2h+AXU
X-Received: by 2002:a81:7587:0:b0:4e0:59b8:da3 with SMTP id
 q129-20020a817587000000b004e059b80da3mr4291700ywc.45.1673993395285; 
 Tue, 17 Jan 2023 14:09:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGNBXSYLOXaJPiMuvaBQl0LQxfkWLemrtYS1E24L/AtAcqgdELtLBZJDPDX8qaNmv3w67nQg==
X-Received: by 2002:a81:7587:0:b0:4e0:59b8:da3 with SMTP id
 q129-20020a817587000000b004e059b80da3mr4291680ywc.45.1673993394940; 
 Tue, 17 Jan 2023 14:09:54 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:53 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice,
 and pre-allocate
Date: Tue, 17 Jan 2023 17:09:07 -0500
Message-Id: <20230117220914.2062125-15-peterx@redhat.com>
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

Add a RAMBlock.host_mirror for all the hugetlbfs backed guest memories.
It'll be used to remap the same region twice and it'll be used to service
page faults using UFFDIO_CONTINUE.

To make sure all accesses to these ranges will generate minor page faults
not missing page faults, we need to pre-allocate the files to make sure
page cache exist start from the beginning.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ramblock.h |  7 +++++
 migration/ram.c         | 59 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 3f31ce1591..c76683c3c8 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -28,6 +28,13 @@ struct RAMBlock {
     struct rcu_head rcu;
     struct MemoryRegion *mr;
     uint8_t *host;
+    /*
+     * This is only used for hugetlbfs ramblocks where doublemap is
+     * enabled.  The pointer is managed by dest host migration code, and
+     * should be NULL when migration is finished.  On src host, it should
+     * always be NULL.
+     */
+    uint8_t *host_mirror;
     uint8_t *colo_cache; /* For colo, VM's ram cache */
     ram_addr_t offset;
     ram_addr_t used_length;
diff --git a/migration/ram.c b/migration/ram.c
index 2ebf414f5f..37d7b3553a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3879,6 +3879,57 @@ void colo_release_ram_cache(void)
     ram_state_cleanup(&ram_state);
 }
 
+static int migrate_hugetlb_doublemap_init(void)
+{
+    RAMBlock *rb;
+    void *addr;
+    int ret;
+
+    if (!migrate_hugetlb_doublemap()) {
+        return 0;
+    }
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
+        if (qemu_ram_is_hugetlb(rb)) {
+            /*
+             * Firstly, we remap the same ramblock into another range of
+             * virtual address, so that we can write to the pages without
+             * touching the page tables that directly mapped for the guest.
+             */
+            addr = ramblock_file_map(rb);
+            if (addr == MAP_FAILED) {
+                ret = -errno;
+                error_report("%s: Duplicate mapping for hugetlb ramblock '%s'"
+                             "failed: %s", __func__, qemu_ram_get_idstr(rb),
+                             strerror(errno));
+                return ret;
+            }
+            rb->host_mirror = addr;
+
+            /*
+             * We need to make sure we pre-allocate the range with
+             * hugetlbfs pages before hand, so that all the page fault will
+             * be trapped as MINOR faults always, rather than MISSING
+             * faults in userfaultfd.
+             */
+            ret = qemu_madvise(addr, rb->mmap_length, QEMU_MADV_POPULATE_WRITE);
+            if (ret) {
+                error_report("Failed to populate hugetlb ramblock '%s': "
+                             "%s", qemu_ram_get_idstr(rb), strerror(-ret));
+                return ret;
+            }
+        }
+    }
+
+    /*
+     * When reach here, it means we've setup the mirror mapping for all the
+     * hugetlbfs pages.  Hence when page fault happens, we'll be able to
+     * resolve page faults using UFFDIO_CONTINUE for hugetlbfs pages, but
+     * we'll keep using UFFDIO_COPY for anonymous pages.
+     */
+    return 0;
+}
+
 /**
  * ram_load_setup: Setup RAM for migration incoming side
  *
@@ -3893,6 +3944,10 @@ static int ram_load_setup(QEMUFile *f, void *opaque)
         return -1;
     }
 
+    if (migrate_hugetlb_doublemap_init()) {
+        return -1;
+    }
+
     xbzrle_load_setup();
     ramblock_recv_map_init();
 
@@ -3913,6 +3968,10 @@ static int ram_load_cleanup(void *opaque)
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
         g_free(rb->receivedmap);
         rb->receivedmap = NULL;
+        if (rb->host_mirror) {
+            munmap(rb->host_mirror, rb->mmap_length);
+            rb->host_mirror = NULL;
+        }
     }
 
     return 0;
-- 
2.37.3


