Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AC45B866
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:33:08 +0100 (CET)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppaN-0002Nr-7c
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:33:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCq-0003i3-Hb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCo-0007Um-JV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyaQbhI47239XzYkHuhr8Uht1Kvjv6WMJJcRmjTcEG8=;
 b=GlV7X3fEIZn4HDICDPMn80Jg3Ds8HjZhSDtDltx1MCJRwmeuGeHwiHg6ZjNjqcmah2hWSO
 gnywLHUovt2ZzUYPvyeIAQ7P0RD1RuutEBgvfUyPPjGdfIJL0pvqoYmfCU8DWeHTHcTrfa
 8wfVe7y25HhtesBr+frvdhg/Htzogy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-S5v_mbb2ORGNm4JXOx1Kzw-1; Wed, 24 Nov 2021 05:08:44 -0500
X-MC-Unique: S5v_mbb2ORGNm4JXOx1Kzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EC81800D41
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:08:43 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5584160843;
 Wed, 24 Nov 2021 10:08:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/23] migration: Use multifd before we check for the zero
 page
Date: Wed, 24 Nov 2021 11:06:17 +0100
Message-Id: <20211124100617.19786-24-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we use multifd to transmit zero pages.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..3ae094f653 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2138,6 +2138,17 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
     int res;
 
+    /*
+     * Do not use multifd for:
+     * 1. Compression as the first page in the new block should be posted out
+     *    before sending the compressed page
+     * 2. In postcopy as one whole host page should be placed
+     */
+    if (!save_page_use_compression(rs) && migrate_use_multifd()
+        && !migration_in_postcopy()) {
+        return ram_save_multifd_page(rs, block, offset);
+    }
+
     if (control_save_page(rs, block, offset, &res)) {
         return res;
     }
@@ -2160,17 +2171,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return res;
     }
 
-    /*
-     * Do not use multifd for:
-     * 1. Compression as the first page in the new block should be posted out
-     *    before sending the compressed page
-     * 2. In postcopy as one whole host page should be placed
-     */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()
-        && !migration_in_postcopy()) {
-        return ram_save_multifd_page(rs, block, offset);
-    }
-
     return ram_save_page(rs, pss, last_stage);
 }
 
-- 
2.33.1


