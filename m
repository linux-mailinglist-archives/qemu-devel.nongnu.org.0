Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E29670B56
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9s-0002eC-Do; Tue, 17 Jan 2023 17:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9m-0002VL-OG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9k-0007q5-FD
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrG55HiwnGXPFSX6+W/ipSAfxUfsFmficRwkiZNYMjg=;
 b=eVMbDNGJLJIh37/Jb7A6cD5xjcBNXgZPRvTl4sIQ7sutfH9Fmc2lRJV92eCTHa2LMfa+d8
 wlGOlm0A2jlQdvT4sJ2WZ3awbzqOBkQWzX4VOOyu769OeEbCicLyVUFwdPLf3EWbcRSwmh
 7iaxvjINrmu9rM4sEaUP1m1bZD0/tcg=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-21cWty5LMDGJzT_oxSVWjw-1; Tue, 17 Jan 2023 17:10:08 -0500
X-MC-Unique: 21cWty5LMDGJzT_oxSVWjw-1
Received: by mail-vs1-f72.google.com with SMTP id
 k8-20020a056102004800b003d0f2b18a22so4118641vsp.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZrG55HiwnGXPFSX6+W/ipSAfxUfsFmficRwkiZNYMjg=;
 b=aAQBEu42JaWxpn2tpvMgsoSDZFJMKnk4z5xuqnr27MrBtM5S4XTB+6jiKcMwxcw1iz
 cZRBntsmfMGtgywW7tY94RV+hC+dqoigYSlXLpArS3uEw/vaAbC8H6Ykf1Mmwe3mq0c2
 JCMhyk/3XTu5/kr1kUv7Wu2YtDNoxGREr3bNnhC/2kA6Len+4kpTi0gBZxTZPYc6CniD
 JT7oss/+XTN0w6IajI9RXY/girvyFkZlvNA+iM4MSHcmdzJR2BnMN8Js8KDOAJelyiIA
 KKrVceYnX2cKh+VsU6yqnGuRg5rIeC7D4ZCnPENj/tFnHYmdH53QdmWoiC7uiAQpwqk6
 FDmQ==
X-Gm-Message-State: AFqh2koprK3T/5VjAGPN93miermjbYAG8u+/zeZ1/KTKskt2gITboOW8
 BnAnOoM3buFXZVcJpgh0tOHyLOrjhXa3Q/YSTys7u8Ii6/RLNNyf53SfoUWwO7Xsb1SsW1zSd1C
 EMq2cs1nlBjHVXzb0eFm7Q3I5FAVHWudNkXok9pV7p0Q4iODTO5eRdRIRYX3P1FiM
X-Received: by 2002:a05:6122:106a:b0:3bd:795f:27b2 with SMTP id
 k10-20020a056122106a00b003bd795f27b2mr2418111vko.7.1673993407307; 
 Tue, 17 Jan 2023 14:10:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnJFBsunKabOjIpHKNV5cxf2l1L5FHTd0jjAHImX8iFp9CmXE9OWX9WpiJISWv/kC15wNnxw==
X-Received: by 2002:a05:6122:106a:b0:3bd:795f:27b2 with SMTP id
 k10-20020a056122106a00b003bd795f27b2mr2418079vko.7.1673993406949; 
 Tue, 17 Jan 2023 14:10:06 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:10:06 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 19/21] migration: Add postcopy_mark_received()
Date: Tue, 17 Jan 2023 17:09:12 -0500
Message-Id: <20230117220914.2062125-20-peterx@redhat.com>
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

We have a few maintainance work to do after we UFFDIO_[ZERO]COPY a page
before, e.g. on requested list of pages or when measuring page latencies.

Move those steps into a separate function so that it can be easily reused
when we're going to support UFFDIO_CONTINUE.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 0cfe5174a5..8a2259581e 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1288,6 +1288,25 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
     return 0;
 }
 
+static void
+postcopy_mark_received(MigrationIncomingState *mis, RAMBlock *rb,
+                       void *host_addr, size_t npages)
+{
+        qemu_mutex_lock(&mis->page_request_mutex);
+        ramblock_recv_bitmap_set_range(rb, host_addr, npages);
+        /*
+         * If this page resolves a page fault for a previous recorded faulted
+         * address, take a special note to maintain the requested page list.
+         */
+        if (g_tree_lookup(mis->page_requested, host_addr)) {
+            g_tree_remove(mis->page_requested, host_addr);
+            mis->page_requested_count--;
+            trace_postcopy_page_req_del(host_addr, mis->page_requested_count);
+        }
+        qemu_mutex_unlock(&mis->page_request_mutex);
+        mark_postcopy_blocktime_end((uintptr_t)host_addr);
+}
+
 static int qemu_ufd_copy_ioctl(MigrationIncomingState *mis, void *host_addr,
                                void *from_addr, uint64_t pagesize, RAMBlock *rb)
 {
@@ -1309,20 +1328,8 @@ static int qemu_ufd_copy_ioctl(MigrationIncomingState *mis, void *host_addr,
         ret = ioctl(userfault_fd, UFFDIO_ZEROPAGE, &zero_struct);
     }
     if (!ret) {
-        qemu_mutex_lock(&mis->page_request_mutex);
-        ramblock_recv_bitmap_set_range(rb, host_addr,
-                                       pagesize / qemu_target_page_size());
-        /*
-         * If this page resolves a page fault for a previous recorded faulted
-         * address, take a special note to maintain the requested page list.
-         */
-        if (g_tree_lookup(mis->page_requested, host_addr)) {
-            g_tree_remove(mis->page_requested, host_addr);
-            mis->page_requested_count--;
-            trace_postcopy_page_req_del(host_addr, mis->page_requested_count);
-        }
-        qemu_mutex_unlock(&mis->page_request_mutex);
-        mark_postcopy_blocktime_end((uintptr_t)host_addr);
+        postcopy_mark_received(mis, rb, host_addr,
+                               pagesize / qemu_target_page_size());
     }
     return ret;
 }
-- 
2.37.3


