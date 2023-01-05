Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CC65EAF9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPd5-0000co-OI; Thu, 05 Jan 2023 07:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcs-0000YM-LU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcp-0005oC-TE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BILeqYNwEW1d4LTBUMoxKSfm/ZcEhG+psMo92quVnUc=;
 b=Wv2kPg7FgQd78r3uDs1IJb/7z65I+Ial0HBLR3mhDBrAQynRYi1wV3wkWeJsF1ad+AOzAo
 uqNYI+f4VdtJ13jCEK1hhk2H34Wn2He8DQohksSSlfa6AymFHg07JKm/xZPafFIeZ46KdT
 /nIFtXfXScX7wQfPDyv2NikWN3m7nkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-GoYPr8NhNR-Ox2hHJCMY8w-1; Thu, 05 Jan 2023 07:45:35 -0500
X-MC-Unique: GoYPr8NhNR-Ox2hHJCMY8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2932D8588E0;
 Thu,  5 Jan 2023 12:45:35 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD231121314;
 Thu,  5 Jan 2023 12:45:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-stable@nongnu.org
Subject: [PATCH v1 2/5] migration/ram: Fix error handling in
 ram_write_tracking_start()
Date: Thu,  5 Jan 2023 13:45:25 +0100
Message-Id: <20230105124528.93813-3-david@redhat.com>
In-Reply-To: <20230105124528.93813-1-david@redhat.com>
References: <20230105124528.93813-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

If something goes wrong during uffd_change_protection(), we would miss
to unregister uffd-wp and not release our reference. Fix it by
performing the uffd_change_protection(true) last.

Note that a uffd_change_protection(false) on the recovery path without a
prior uffd_change_protection(false) is fine.

Fixes: 278e2f551a09 ("migration: support UFFD write fault processing in ram_save_iterate()")
Cc: qemu-stable@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b8f58d2a40..6e4e41952a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1896,13 +1896,14 @@ int ram_write_tracking_start(void)
                 block->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
             goto fail;
         }
+        block->flags |= RAM_UF_WRITEPROTECT;
+        memory_region_ref(block->mr);
+
         /* Apply UFFD write protection to the block memory range */
         if (uffd_change_protection(rs->uffdio_fd, block->host,
                 block->max_length, true, false)) {
             goto fail;
         }
-        block->flags |= RAM_UF_WRITEPROTECT;
-        memory_region_ref(block->mr);
 
         trace_ram_write_tracking_ramblock_start(block->idstr, block->page_size,
                 block->host, block->max_length);
-- 
2.39.0


