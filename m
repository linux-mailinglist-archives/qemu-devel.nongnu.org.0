Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93A69FD5D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwFp-00045T-4l; Wed, 22 Feb 2023 16:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1pUwFm-00045J-O2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:02:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1pUwFl-0001OZ-2C
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677099735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=92XZzZ4BI7opGIJCoOokhBvRWfs2NwplU3CHzyYtH50=;
 b=UUor+eI/vpqXRWYaMh6e8mclgxE+xBL1ZUsCOUxnOfntNRc+tV5ruEmI0gZdPCm93iO3kQ
 zB9/aYmA8D8VOZubl5I0isRxO0BA3f7HX25oDEU3DyvHthqTP4iOLMb6I+o2Hn+s6wn4+b
 s9hufmcKWY7mC4K9tgcLLYp29tk4uCk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-MlseekfQNjaUaHfMz-QRSQ-1; Wed, 22 Feb 2023 16:01:07 -0500
X-MC-Unique: MlseekfQNjaUaHfMz-QRSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B81F385F365;
 Wed, 22 Feb 2023 21:01:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.242.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B698140EBF6;
 Wed, 22 Feb 2023 21:00:51 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] hw/smbios: fix field corruption in type 4 table
Date: Wed, 22 Feb 2023 22:00:49 +0100
Message-Id: <20230222210049.238599-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
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

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2169904

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/smbios/smbios.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index b4243de735..903fd22350 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -749,14 +749,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
     t->core_enabled = t->core_count;
 
-    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
-
     t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
-    t->thread_count2 = cpu_to_le16(ms->smp.threads);
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
+    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
+        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+        t->thread_count2 = cpu_to_le16(ms->smp.threads);
+    }
+
     SMBIOS_BUILD_TABLE_POST;
     smbios_type4_count++;
 }
-- 
2.38.1


