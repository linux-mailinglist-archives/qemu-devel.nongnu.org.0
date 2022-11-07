Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6B6202CE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:57:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0P-0005vg-Mw; Mon, 07 Nov 2022 17:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0J-0005mh-OM
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0H-0004wx-Vu
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LO/qtuNrZ89fDPCMFSkl2M7QRcm1BKFrenr7dPdjQIM=;
 b=KAs0aPYog85RhSDBi0p1ybJN38nt8WRIbdhXpldWkVebvMELa1cn7NoMksXWs0EMAqiTqB
 CAbCqSCo7Gi8/XzEbXYdr5dBaCnBxr8q+hJlsmvLclVaQ9f7naQcubWZrnuTI35smEsUrC
 yenZQv4AM+/SjVZbHTEx46GPPDyqV90=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-9Y9YiIzjMBaostrnUMVr7A-1; Mon, 07 Nov 2022 17:54:04 -0500
X-MC-Unique: 9Y9YiIzjMBaostrnUMVr7A-1
Received: by mail-qk1-f197.google.com with SMTP id
 br12-20020a05620a460c00b006fa52448320so11367948qkb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LO/qtuNrZ89fDPCMFSkl2M7QRcm1BKFrenr7dPdjQIM=;
 b=opW0tvlo92Vkc8f0cW1bZeKCJvNgQNc2obX/27UmMbtpFFJbHrFhDZUO4DIEhb1Cr/
 HbEyv7H76GEqXuGYZJiSEgD+7LQafiv/+uu8fBlkKDIvatKT300rh6OTzJcTXmRXVRzV
 wKercjgQv+vkMSI2pJEaMT9+rd3oxQ258blROj95kLxH0ZQKXEkCJk4v1v7gAR9BrWBK
 S5FrfpFHUzAXQxgkE4Cc//qEZHFMDUxBZNwPP9Zjn7piw1plf/v9OLvaMWoT8BbdtkDQ
 b1/ZOvdZO8JftqwXbAa/bpwseHut7V7ua5Zahin1/c42NWetxCNK3qtz7UY9n63u336I
 a9zg==
X-Gm-Message-State: ACrzQf1VeCYhfGNYhuz4a9AuN+UHHyjNB6BKQhOmBeRO+08g8F7r3yx9
 UKHPBZyXqctoYdQV7q9koZ+jYEQKz0SKCXVRhHMcu/iY/95bu8PGo8omHyepcW7lNWTkMPwHM91
 p0+es/Wsw9wNk+qkhjkPkUlMx0Z1zV4EkBXK+FZ+ZVcY9RK8AHzzh0x+ZeDLz
X-Received: by 2002:a05:620a:150c:b0:6fa:2c95:e4be with SMTP id
 i12-20020a05620a150c00b006fa2c95e4bemr32494325qkk.584.1667861644023; 
 Mon, 07 Nov 2022 14:54:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6+IPbDQCSbC4ONbAn4LNRvc7+ASrcF0UuXu3T2tsRO2Y+FBJPy4UcPLm5GfQI+5b8QZG39vQ==
X-Received: by 2002:a05:620a:150c:b0:6fa:2c95:e4be with SMTP id
 i12-20020a05620a150c00b006fa2c95e4bemr32494306qkk.584.1667861643694; 
 Mon, 07 Nov 2022 14:54:03 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 w6-20020a05622a134600b0039ccbf75f92sm7122184qtk.11.2022.11.07.14.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:03 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 77/83] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20221107224600.934080-78-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


