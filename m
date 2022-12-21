Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7C16531EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zGc-0000PL-Km; Wed, 21 Dec 2022 08:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7zGL-0000I1-NM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7zGJ-0001Jw-F1
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671629758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGV3Lwp3iaFZZ3hpqPpQHeV1B6FaPG2wrMP/NYSisWM=;
 b=X37lA8JhZfrJQCySAQ80R62i3zerdu6axXQSC++B7o+p1OrNecJPemB2HQtusf2qUPV+Eb
 D4bgGoTDWCwyRWp4k6flPrpu4zSZwr6Mfytzkh+h/OSEK0J7fO3bSbJdaVRYn9E0fn1cIH
 kF4NvHyQLEWW+Mipo8CZ6tG1ZPHcv2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-bkDrYljFPOit8TM3nT-IyA-1; Wed, 21 Dec 2022 08:35:53 -0500
X-MC-Unique: bkDrYljFPOit8TM3nT-IyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3682802BA7;
 Wed, 21 Dec 2022 13:35:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A944740C2004;
 Wed, 21 Dec 2022 13:35:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D0E021E6928; Wed, 21 Dec 2022 14:35:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/3] hw/sparc64/niagara: Use blk_name() instead of
 open-coding it
Date: Wed, 21 Dec 2022 14:35:50 +0100
Message-Id: <20221221133551.3967339-3-armbru@redhat.com>
In-Reply-To: <20221221133551.3967339-1-armbru@redhat.com>
References: <20221221133551.3967339-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


