Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82105FB29A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:43:46 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEbp-0003va-NL
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIK-0002Vt-6O
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDID-0008C8-7E
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bllso7GEKOK50KAxldJgoZzy09aKkK4wktRwAKm3lqc=;
 b=UGLHM9B1KFYuyqP8TpYt4eAj/YJ3Oe/xX3EFonJLP+3rZp44A9hh2TbeLMdUMIRs5H4qBY
 8SZxCb4zaRjDkM/pcwQ03BpkSLYWSTKG9o0iV+66147Tk9oLxZMNtD0v+wrdn6x7PUISlX
 wt+aDpgX8PFG56iEnvzxBBMCKbgLmhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-n_8aCMnzPOi-7tJDGRzc8g-1; Tue, 11 Oct 2022 07:18:17 -0400
X-MC-Unique: n_8aCMnzPOi-7tJDGRzc8g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D44B7803481;
 Tue, 11 Oct 2022 11:18:16 +0000 (UTC)
Received: from ovpn-194-244.brq.redhat.com (ovpn-194-244.brq.redhat.com
 [10.40.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2E44B400F;
 Tue, 11 Oct 2022 11:18:15 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v3 1/5] hw/smbios: add core_count2 to smbios table type 4
Date: Tue, 11 Oct 2022 13:17:27 +0200
Message-Id: <20221011111731.101412-2-jusual@redhat.com>
In-Reply-To: <20221011111731.101412-1-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to use the increased number of cpus, we need to bring smbios
tables in line with the SMBIOS 3.0 specification. This allows us to
introduce core_count2 which acts as a duplicate of core_count if we have
fewer cores than 256, and contains the actual core number per socket if
we have more.

core_enabled2 and thread_count2 fields work the same way.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220731162141.178443-2-jusual@redhat.com>
---
 hw/smbios/smbios.c           | 19 ++++++++++++++++---
 hw/smbios/smbios_build.h     |  9 +++++++--
 include/hw/firmware/smbios.h | 12 ++++++++++++
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4c9f664830..591481d449 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -681,8 +681,14 @@ static void smbios_build_type_3_table(void)
 static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 {
     char sock_str[128];
+    size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
 
-    SMBIOS_BUILD_TABLE_PRE(4, T4_BASE + instance, true); /* required */
+    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
+        tbl_len = SMBIOS_TYPE_4_LEN_V30;
+    }
+
+    SMBIOS_BUILD_TABLE_PRE_SIZE(4, T4_BASE + instance,
+                                true, tbl_len); /* required */
 
     snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
     SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
@@ -709,8 +715,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
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
 
diff --git a/hw/smbios/smbios_build.h b/hw/smbios/smbios_build.h
index 56b5a1e3f3..351660024e 100644
--- a/hw/smbios/smbios_build.h
+++ b/hw/smbios/smbios_build.h
@@ -27,6 +27,11 @@ extern unsigned smbios_table_max;
 extern unsigned smbios_table_cnt;
 
 #define SMBIOS_BUILD_TABLE_PRE(tbl_type, tbl_handle, tbl_required)        \
+        SMBIOS_BUILD_TABLE_PRE_SIZE(tbl_type, tbl_handle, tbl_required,   \
+                                    sizeof(struct smbios_type_##tbl_type))\
+
+#define SMBIOS_BUILD_TABLE_PRE_SIZE(tbl_type, tbl_handle,                 \
+                                    tbl_required, tbl_len)                \
     struct smbios_type_##tbl_type *t;                                     \
     size_t t_off; /* table offset into smbios_tables */                   \
     int str_index = 0;                                                    \
@@ -39,12 +44,12 @@ extern unsigned smbios_table_cnt;
         /* use offset of table t within smbios_tables */                  \
         /* (pointer must be updated after each realloc) */                \
         t_off = smbios_tables_len;                                        \
-        smbios_tables_len += sizeof(*t);                                  \
+        smbios_tables_len += tbl_len;                                     \
         smbios_tables = g_realloc(smbios_tables, smbios_tables_len);      \
         t = (struct smbios_type_##tbl_type *)(smbios_tables + t_off);     \
                                                                           \
         t->header.type = tbl_type;                                        \
-        t->header.length = sizeof(*t);                                    \
+        t->header.length = tbl_len;                                       \
         t->header.handle = cpu_to_le16(tbl_handle);                       \
     } while (0)
 
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 4b7ad77a44..9615446f5d 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -18,6 +18,8 @@
 
 
 #define SMBIOS_MAX_TYPE 127
+#define offsetofend(TYPE, MEMBER) \
+       (offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
 
 /* memory area description, used by type 19 table */
 struct smbios_phys_mem_area {
@@ -187,8 +189,18 @@ struct smbios_type_4 {
     uint8_t thread_count;
     uint16_t processor_characteristics;
     uint16_t processor_family2;
+    /* SMBIOS spec 3.0.0, Table 21 */
+    uint16_t core_count2;
+    uint16_t core_enabled2;
+    uint16_t thread_count2;
 } QEMU_PACKED;
 
+typedef enum smbios_type_4_len_ver {
+    SMBIOS_TYPE_4_LEN_V28 = offsetofend(struct smbios_type_4,
+                                        processor_family2),
+    SMBIOS_TYPE_4_LEN_V30 = offsetofend(struct smbios_type_4, thread_count2),
+} smbios_type_4_len_ver;
+
 /* SMBIOS type 11 - OEM strings */
 struct smbios_type_11 {
     struct smbios_structure_header header;
-- 
2.37.3


