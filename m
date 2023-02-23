Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19826A0939
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBAh-0003e6-Ck; Thu, 23 Feb 2023 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1pVBAY-0003KU-QR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1pVBAW-0001J8-9e
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677157071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=c/I/4dmZhw1+ZIY6//e2TSrGG8joxnCPE5ppp9w+aAU=;
 b=L3OuEYbM3gaGP8oKCv0ltZxo75NpCH4+2Wm4Tqw6re+zXNadNZY298eh1hhbW1pGVQf+C1
 Go1TfHdhzNYr4c0403hcq5hvFdtQGGXq6QzjZjHdmF+A5qTMyC17swyBrlNQczgsWrT20/
 XIyRKCPlhOSeBFHG03mY0yABq36hBBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-YG_sLIvKOb6QNtEwNDjPpA-1; Thu, 23 Feb 2023 07:57:50 -0500
X-MC-Unique: YG_sLIvKOb6QNtEwNDjPpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31CC8811E6E;
 Thu, 23 Feb 2023 12:57:50 +0000 (UTC)
Received: from fedora.. (unknown [10.43.2.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443CA2026D4B;
 Thu, 23 Feb 2023 12:57:49 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v2] hw/smbios: fix field corruption in type 4 table
Date: Thu, 23 Feb 2023 13:57:47 +0100
Message-Id: <20230223125747.254914-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
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

Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
strings which follow immediately after the struct fields have been
overwritten by unconditional filling of later fields such as core_count2.
Make these fields dependent on the SMBIOS version.

Fixes: 05e27d74c7 ("hw/smbios: add core_count2 to smbios table type 4")
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2169904

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
v2:
    * add fixes tag
    * check tbl_len instead of ep_type

 hw/smbios/smbios.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4869566cf5..d2007e70fb 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -750,14 +750,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
     t->core_enabled = t->core_count;
 
-    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
-
     t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
-    t->thread_count2 = cpu_to_le16(ms->smp.threads);
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
+    if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
+        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+        t->thread_count2 = cpu_to_le16(ms->smp.threads);
+    }
+
     SMBIOS_BUILD_TABLE_POST;
     smbios_type4_count++;
 }
-- 
2.38.1


