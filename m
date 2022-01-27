Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C049E762
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:22:52 +0100 (CET)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7Xv-0001Yd-SX
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Vu-0008KP-2D
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:16:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Vs-0003KY-FG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vopd49TCz+wjUPFGxCVUDJUhTwkiZxNTMIqVcxx9ykc=;
 b=hnm7pDkHYhA4Nw80kxhTU0iKeuBwVdEGL+tsAh5Y9pwGPrIWDlC8It7K1Ke76g4knNi0/8
 pAzCNCQwKIJp9pLHObK4h/ZXSa2hGaFxqkGV9PnIvCDYlcPY8m4nHZ/xoj0ic8yE+Y0FqV
 dJRkrWi2gjDLNUDH03tIGsa8ljBsLRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-v1Fx-LYfOvCxw9cphbct9g-1; Thu, 27 Jan 2022 10:16:31 -0500
X-MC-Unique: v1Fx-LYfOvCxw9cphbct9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEAEE92500;
 Thu, 27 Jan 2022 15:16:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E07570D2D;
 Thu, 27 Jan 2022 15:16:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/38] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Date: Thu, 27 Jan 2022 16:05:39 +0100
Message-Id: <20220127150548.20595-30-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
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

Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
huge page information; the 2nd time we send the discard ranges.  That's not
necessary - we can do them in a single loop.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 91d32002e8..d74a8c04b6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2454,6 +2454,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
     return 0;
 }
 
+static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
+
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
@@ -2475,6 +2477,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
 
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
+
         /*
          * Postcopy sends chunks of bitmap over the wire, but it
          * just needs indexes at this point, avoids it having
@@ -2575,7 +2585,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
-    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2587,15 +2596,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /*
-         * Deal with TPS != HPS and huge pages.  It discard any partially sent
-         * host-page size chunks, mark any partially dirty host-page size
-         * chunks as all dirty.  In this case the host-page is the host-page
-         * for the particular RAMBlock, i.e. it might be a huge page.
-         */
-        postcopy_chunk_hostpages_pass(ms, block);
-    }
     trace_ram_postcopy_send_discard_bitmap();
 
     return postcopy_each_ram_send_discard(ms);
-- 
2.34.1


