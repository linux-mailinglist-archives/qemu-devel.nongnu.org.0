Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A365EAF5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPd7-0000dA-7m; Thu, 05 Jan 2023 07:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcv-0000YW-13
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcr-0005ob-9y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKjPvhnoNBzLZXaSESBUhCck4dzrCgas7ZbjAuGp4CU=;
 b=GlhMQfbwSGtF3nYtz+BNXDoKTZGGdFD9yppc4NbH/+CHgL5/V0lj/uUtJQf1El3sTfnlYp
 DbCCeJbTOCik22XkPIcddYb1a+auV6Xh+iNDIZa+/KThjA2bej/cQL/l2/faTJEkBTEiat
 aiBY9Y9DSfCPf4okU8x1MD7sixVCJw8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-15utGDaQMXqAuac0AH87-A-1; Thu, 05 Jan 2023 07:45:38 -0500
X-MC-Unique: 15utGDaQMXqAuac0AH87-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8706D3C0D18E;
 Thu,  5 Jan 2023 12:45:38 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514D01121314;
 Thu,  5 Jan 2023 12:45:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v1 4/5] migration/ram: Rely on used_length for
 uffd_change_protection()
Date: Thu,  5 Jan 2023 13:45:27 +0100
Message-Id: <20230105124528.93813-5-david@redhat.com>
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

ram_mig_ram_block_resized() will abort migration (including background
snapshots) when resizing a RAMBlock. ram_block_populate_read() will only
populate RAM up to used_length, so at least for anonymous memory
protecting everything between used_length and max_length won't
actually be protected and is just a NOP.

So let's only protect everything up to used_length.

Note: it still makes sense to register uffd-wp for max_length, such
that RAM_UF_WRITEPROTECT is independent of a changing used_length.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6a3dbee2c3..73a443f683 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1901,7 +1901,7 @@ int ram_write_tracking_start(void)
 
         /* Apply UFFD write protection to the block memory range */
         if (uffd_change_protection(rs->uffdio_fd, block->host,
-                block->max_length, true, false)) {
+                                   block->used_length, true, false)) {
             goto fail;
         }
 
-- 
2.39.0


