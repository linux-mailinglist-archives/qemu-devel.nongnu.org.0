Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F965EAFA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPd5-0000cp-Lg; Thu, 05 Jan 2023 07:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPct-0000YP-UW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcr-0005of-BB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GfLUSb47cFW7GGHwnXHzE6IrxP6X33v/rRHtLW5mzY=;
 b=DyUDA911yFooXyD2wk0DbbkXPhfIcczpRf7Zy43qPilh4I0Tw3JkEG1fHGOrNGzDAViFXD
 NqzRAqBxy87odQF8fBeudQhrMa3M65C/fJsHr89gaORLFe3f3mTCK7BiOt0h0jL5s9gN60
 QIv1Njujq+bHuDL0HnuwVVBqWf1psfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-yr2vg_tOMNSQxoShwVKfMw-1; Thu, 05 Jan 2023 07:45:37 -0500
X-MC-Unique: yr2vg_tOMNSQxoShwVKfMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 126F51C0518A;
 Thu,  5 Jan 2023 12:45:37 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 896621121314;
 Thu,  5 Jan 2023 12:45:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v1 3/5] migration/ram: Don't explicitly unprotect when
 unregistering uffd-wp
Date: Thu,  5 Jan 2023 13:45:26 +0100
Message-Id: <20230105124528.93813-4-david@redhat.com>
In-Reply-To: <20230105124528.93813-1-david@redhat.com>
References: <20230105124528.93813-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

When unregistering uffd-wp, older kernels before commit f369b07c86143
("mm/uffd:reset write protection when unregister with wp-mode") won't
clear the uffd-wp PTE bit. When re-registering uffd-wp, the previous
uffd-wp PTE bits would trigger again. With above commit, the kernel will
clear the uffd-wp PTE bits when unregistering itself.

Consequently, we'll clear the uffd-wp PTE bits now twice -- whereby we
don't care about clearing them at all: a new background snapshot will
re-register uffd-wp and re-protect all memory either way.

So let's skip the manual clearing of uffd-wp. If ever relevant, we
could clear conditionally in uffd_unregister_memory() -- we just need a
way to figure out more recent kernels.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6e4e41952a..6a3dbee2c3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1918,12 +1918,6 @@ fail:
         if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
-        /*
-         * In case some memory block failed to be write-protected
-         * remove protection and unregister all succeeded RAM blocks
-         */
-        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
-                false, false);
         uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
         /* Cleanup flags and remove reference */
         block->flags &= ~RAM_UF_WRITEPROTECT;
@@ -1949,9 +1943,6 @@ void ram_write_tracking_stop(void)
         if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
-        /* Remove protection and unregister all affected RAM blocks */
-        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
-                false, false);
         uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
 
         trace_ram_write_tracking_ramblock_stop(block->idstr, block->page_size,
-- 
2.39.0


