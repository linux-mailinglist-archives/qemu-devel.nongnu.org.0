Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39749E7A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:36:06 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7kj-0007Mc-TQ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:36:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6ZU-0005VH-Rr
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6ZP-00040n-OG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkWkS3xp+0M05sMrGQxYgQctujCPIGIetcJubDJCE8Q=;
 b=NJk7dZZrEk3yHODNV/+2XOx05W9lev4iwF7NtP5vnlD0OAnZuO8FbUZUx9olB2cALvGx01
 fFFA60A3yDsNZf1P3L0fsm3Gi6BvEqPlmZG6IwnW93oDT54Kv+6Her+3kYEdsl3YJRDUEH
 TXK9P6eT6fPa3tie/SR8NHHJ9d/YJSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-BiLwoEHNOrKdNtrmqryKTg-1; Thu, 27 Jan 2022 10:20:08 -0500
X-MC-Unique: BiLwoEHNOrKdNtrmqryKTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F28DE19253C0;
 Thu, 27 Jan 2022 15:20:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F12EC72FA2;
 Thu, 27 Jan 2022 15:19:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] migration: No off-by-one for pss->page update in host
 page size
Date: Thu, 27 Jan 2022 16:05:44 +0100
Message-Id: <20220127150548.20595-35-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

We used to do off-by-one fixup for pss->page when finished one host huge page
transfer.  That seems to be unnecesary at all.  Drop it.

Cc: Keqian Zhu <zhukeqian1@huawei.com>
Cc: Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ca879c744f..58adcaf430 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1617,7 +1617,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
     /* Check if page is from UFFD-managed region. */
     if (pss->block->flags & RAM_UF_WRITEPROTECT) {
         void *page_address = pss->block->host + (start_page << TARGET_PAGE_BITS);
-        uint64_t run_length = (pss->page - start_page + 1) << TARGET_PAGE_BITS;
+        uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
 
         /* Flush async buffers before un-protect. */
         qemu_fflush(rs->f);
@@ -2230,7 +2230,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
     /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary) - 1;
+    pss->page = MIN(pss->page, hostpage_boundary);
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.34.1


