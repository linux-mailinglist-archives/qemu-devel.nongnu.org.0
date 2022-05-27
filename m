Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A887F53666A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:11:28 +0200 (CEST)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudUk-0001OJ-Pi
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH4-0006Py-5H
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH1-00071O-1b
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653670634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/r0fVu3Mm/+J2eo2wSUrqlf4wYDaG8F36USSn1UEcY=;
 b=bymRuoNpuv1nH7smZL/EAYl23VKO9eHI78XsYVnCuV/2MFWndQa1QiIQ8zafgScPQZ7A6y
 Xmt2WIsEBS6OD/QG/Opin8Lqnt9yOBfalX3r50DYiCfW6rhBeSBrk4QgSUjXxdyh+4i1hK
 y+4PdhSyTz/H76eK574izlWsg+BmOes=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-9dV2EDGxM2-60v78ESxThQ-1; Fri, 27 May 2022 12:57:12 -0400
X-MC-Unique: 9dV2EDGxM2-60v78ESxThQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B1573833295;
 Fri, 27 May 2022 16:57:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7900C2026D64;
 Fri, 27 May 2022 16:57:11 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
Date: Fri, 27 May 2022 18:56:47 +0200
Message-Id: <20220527165651.28092-2-jusual@redhat.com>
In-Reply-To: <20220527165651.28092-1-jusual@redhat.com>
References: <20220527165651.28092-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to use the increased number of cpus, we need to bring smbios
tables in line with the SMBIOS 3.0 specification. This allows us to
introduce core_count2 which acts as a duplicate of core_count if we have
fewer cores than 256, and contains the actual core number per socket if
we have more.

core_enabled2 and thread_count2 fields work the same way.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 include/hw/firmware/smbios.h |  3 +++
 hw/smbios/smbios.c           | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 4b7ad77a44..c427ae5558 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -187,6 +187,9 @@ struct smbios_type_4 {
     uint8_t thread_count;
     uint16_t processor_characteristics;
     uint16_t processor_family2;
+    uint16_t core_count2;
+    uint16_t core_enabled2;
+    uint16_t thread_count2;
 } QEMU_PACKED;
 
 /* SMBIOS type 11 - OEM strings */
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..45d7be6b30 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
     SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
     SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
-    t->core_count = t->core_enabled = ms->smp.cores;
-    t->thread_count = ms->smp.threads;
+
+    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
+    t->core_enabled = t->core_count;
+
+    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+
+    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
+    t->thread_count2 = cpu_to_le16(ms->smp.threads);
+
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
-- 
2.35.1


