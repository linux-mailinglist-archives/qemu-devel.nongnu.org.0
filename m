Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052826471FD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:41:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3I3y-0001pO-0k; Thu, 08 Dec 2022 09:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I3v-0001oM-Ub
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I3t-0000G8-9F
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670510384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC17t0scWhn3zoKv3ItYLhlNoNMD33UCICN+VCQB4iw=;
 b=b24IWpanDeflodVShlCwU7Y6iskQP9Rzkms7Oyi4sul7vkE3kqPrFY8G1e4HpqyGh9xZwT
 Nx5kgT5byfrk8semzz3n609i1HvXdxTReRn9AjKFsIjICPBnVo2lXBvvSD6NFJ7yJs8+1g
 S/IH1NwbH4e6+/xUtMH89PcRBHrRNRo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-BGRKtBEGO2GzBL_D9AQ3Zg-1; Thu, 08 Dec 2022 09:39:42 -0500
X-MC-Unique: BGRKtBEGO2GzBL_D9AQ3Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925CF86C043;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6C42024CC1;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A4E821E6930; Thu,  8 Dec 2022 15:39:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH 2/3] hw/sparc64/niagara: Use blk_name() instead of open-coding
 it
Date: Thu,  8 Dec 2022 15:39:38 +0100
Message-Id: <20221208143939.2775453-3-armbru@redhat.com>
In-Reply-To: <20221208143939.2775453-1-armbru@redhat.com>
References: <20221208143939.2775453-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/sparc64/niagara.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index ab3c4ec346..6725cc61fd 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "block/block_int-common.h"
 #include "qemu/units.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -144,10 +143,9 @@ static void niagara_init(MachineState *machine)
             memory_region_add_subregion(get_system_memory(),
                                         NIAGARA_VDISK_BASE, &s->vdisk_ram);
             dinfo->is_default = 1;
-            rom_add_file_fixed(blk_bs(blk)->filename, NIAGARA_VDISK_BASE, -1);
+            rom_add_file_fixed(blk_name(blk), NIAGARA_VDISK_BASE, -1);
         } else {
-            error_report("could not load ram disk '%s'",
-                         blk_bs(blk)->filename);
+            error_report("could not load ram disk '%s'", blk_name(blk));
             exit(1);
         }
     }
-- 
2.37.3


