Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A661DCDA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMnx-00071T-FE; Sat, 05 Nov 2022 13:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmQ-0006Vg-4j
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmO-0007LW-8Q
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LO/qtuNrZ89fDPCMFSkl2M7QRcm1BKFrenr7dPdjQIM=;
 b=E2g9PoHH1OqGhw8IR2wne7KXPWf72bQe6P8D6pVb9IMbeurpOU182KrY3QOJirH82MXAZ1
 4rEhX+eRGhAjY5CvzHIlvBsVz8j9flMj3NIwKJu5MaQs5riESw2G+m0q6LOXdwldFeEdCp
 n8tznN2hrZ2Z8Ytd9n0eeoN8yyMMHHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-JhDErvo4PYyUVr2wE9-H3A-1; Sat, 05 Nov 2022 13:16:21 -0400
X-MC-Unique: JhDErvo4PYyUVr2wE9-H3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso2467377wms.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LO/qtuNrZ89fDPCMFSkl2M7QRcm1BKFrenr7dPdjQIM=;
 b=RAfaz/ADXEgSOXoWk/JvKavNHBdrcJ5NCUa4GN4XFXjZzc6j7yh9P3BIZ+HMzXhXB1
 U8QXgyq9UhF27JZRXEwWT00hV8Rd/YwtpJFJLgDfoXMuJEHll4/BaTpX6ZBVH9Nx8hnl
 C0/s1nYf7C2qrchts8r3T1RPSIf9M2aeh0MNITqoK55eJhaEVLRLG0uCqvrRwQ+0ldBd
 6s8thIPcE4VEVeAgd3oRY/sp93ptSsXf67/DnfruLKnKWWGfbV+bvicOK1e++nPPcYGK
 mUhPGcz/F6nDDYlDY+0tiZuoM/jR6DSjcHYbJSSildrXco9kOOMdycaR2QmS3sf62tgN
 TU3Q==
X-Gm-Message-State: ACrzQf2T6BGB5nWOx2gkv4f15a2lCRkR2MTtic/A7CmgnIn+m0yb5FU4
 BMLYUo0X6UQn4zzyy/2ak3bluZMP2o+Cv3ESWRUQYo6hWQ/Zok8xjST2cqlSQ+g7bYFxuVuR2uY
 lPlM/x2wURW6FYbPEU2cZ9JNKyIhim2JTNqk0JCCHQWy7x8nFP8fgdrx8+0Dl
X-Received: by 2002:a5d:6f1e:0:b0:236:63f8:d03d with SMTP id
 ay30-20020a5d6f1e000000b0023663f8d03dmr26353147wrb.646.1667668579544; 
 Sat, 05 Nov 2022 10:16:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GU2WgYUrcy2Ug+PqcDVKsafYoVy9uFbWbh1uULLWs6GryAeILeIoeJHEQhAhEnRWj90Yq6g==
X-Received: by 2002:a5d:6f1e:0:b0:236:63f8:d03d with SMTP id
 ay30-20020a5d6f1e000000b0023663f8d03dmr26353130wrb.646.1667668579297; 
 Sat, 05 Nov 2022 10:16:19 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 n25-20020a1c7219000000b003cf774c31a0sm6234737wmc.16.2022.11.05.10.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:18 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 17/81] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20221105171116.432921-18-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

In order to use the increased number of cpus, we need to bring smbios
tables in line with the SMBIOS 3.0 specification. This allows us to
introduce core_count2 which acts as a duplicate of core_count if we have
fewer cores than 256, and contains the actual core number per socket if
we have more.

core_enabled2 and thread_count2 fields work the same way.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220731162141.178443-2-jusual@redhat.com>
Message-Id: <20221011111731.101412-2-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios_build.h     |  9 +++++++--
 include/hw/firmware/smbios.h | 12 ++++++++++++
 hw/smbios/smbios.c           | 19 ++++++++++++++++---
 3 files changed, 35 insertions(+), 5 deletions(-)

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
index e7d386f7c8..7f3259a630 100644
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
 /* SMBIOS type 8 - Port Connector Information */
 struct smbios_type_8 {
     struct smbios_structure_header header;
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 51437ca09f..b4243de735 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -711,8 +711,14 @@ static void smbios_build_type_3_table(void)
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
@@ -739,8 +745,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
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
MST


