Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0F4CF973
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:04:54 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAEX-0003BY-99
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABb-00008I-B7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABZ-0002ag-ER
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vqmzhFEM37dr6U0Ojjhlq+BZMQJdriqtIDbTT9ZpStw=;
 b=KKn1sQv6MZp9Zw1jeFcfBfeZaKOPn2NgUO4RBln1r0XqdL7favI5vJKal4kkd7tze7GvW/
 vyIZwX4oLfhJBCZMx1XBAh9Oc4ZW26FwondgBIV3b4EZeVr0PEo+2I5UJ0jMrb6MQmVPyt
 E8zle4Ep3cOordzFWxRVNvdJHTPTuR8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-fGLKVDKwMyG5ZZPSLQgg2A-1; Mon, 07 Mar 2022 05:01:47 -0500
X-MC-Unique: fGLKVDKwMyG5ZZPSLQgg2A-1
Received: by mail-ed1-f69.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso8304221edz.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vqmzhFEM37dr6U0Ojjhlq+BZMQJdriqtIDbTT9ZpStw=;
 b=2vEwZvbzyt7kANGHp2k+YY9toN3itXboMFNvj3AwsH3YcwxwR9vnP6k/EGPhMhZbuD
 +tokxYzgmsBdn19/m+WsUXVZPZ2RCmTClClnZAq1eB2TyiqqrnpTWkJXGCDB7hy+d2OI
 5WoNEAIGIHGmjUJeQM+hC9neFvf9DAxpUY0G9WTVrYyoc8NRODBxNFlv3luMjOY971hu
 dUWv+/7x+7B5ppKMxCue2Pfugwpcptmt+emxwjUs0668o2Q+v+7AlfK9TrIIpR/Gyc7B
 z3VUwEd0Ypc3uMlko1WhyUZFcl0xtSbeVgvu0MVC9tqF4LaOTw+acJAV24W7og92GBNI
 TNpw==
X-Gm-Message-State: AOAM530FFdDS8QpU+/4nEuJ7Rvq7Bo+HfVRZpQ4oKKTOQZCfvVOodKbr
 ktatSbsc273ofSg0v9NBQlq3g6mj2b0p8SdnS/xU+TcNckAMEkyIXhNcA33O5SM4YfkClAarMUL
 rDozi9/P+h9whESnrhLtO9rDFaJQz7omhfY1/yaH7KOE2ciK2aWBXvoG/hHfm
X-Received: by 2002:a17:907:3f93:b0:6da:b5e2:f325 with SMTP id
 hr19-20020a1709073f9300b006dab5e2f325mr8311384ejc.120.1646647306361; 
 Mon, 07 Mar 2022 02:01:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyssRTaOaH5uPfEocCJrhKQLH0w7lQOauYr/D1x0kXuvAHt9t7oOwW3hgd9Jqbjz9k8MYJU8Q==
X-Received: by 2002:a17:907:3f93:b0:6da:b5e2:f325 with SMTP id
 hr19-20020a1709073f9300b006dab5e2f325mr8311370ejc.120.1646647306084; 
 Mon, 07 Mar 2022 02:01:46 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm5875929edb.14.2022.03.07.02.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:45 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/47] hw/smbios: fix overlapping table handle numbers with
 large memory vms
Message-ID: <20220307100058.449628-8-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

The current smbios table implementation splits the main memory in 16 GiB
(DIMM like) chunks. With the current smbios table assignment code, we can have
only 512 such chunks before the 16 bit handle numbers in the header for tables
17 and 19 conflict. A guest with more than 8 TiB of memory will hit this
limitation and would fail with the following assertion in isa-debugcon:

ASSERT_EFI_ERROR (Status = Already started)
ASSERT /builddir/build/BUILD/edk2-ca407c7246bf/OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c(125): !EFI_ERROR (Status)

This change adds an additional offset between tables 17 and 19 handle numbers
when configuring VMs larger than 8 TiB of memory. The value of the offset is
calculated to be equal to the additional space required to be reserved
in order to accomodate more DIMM entries without the table handles colliding.
In normal cases where the VM memory is smaller or equal to 8 TiB, this offset
value is 0. Hence in this case, no additional handle numbers are reserved and
table handle values remain as before.

Since smbios memory is not transmitted over the wire during migration,
this change can break migration for large memory vms if the guest is in the
middle of generating the tables during migration. However, in those
situations, qemu generates invalid table handles anyway with or without this
fix. Hence, we do not preserve the old bug by introducing compat knobs/machine
types.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2023977

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220223143322.927136-7-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 56b412ce35..44c53797a4 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -799,12 +799,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-static void smbios_build_type_19_table(unsigned instance,
+static void smbios_build_type_19_table(unsigned instance, unsigned offset,
                                        uint64_t start, uint64_t size)
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + offset + instance,
+                           true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -996,7 +997,7 @@ void smbios_get_tables(MachineState *ms,
                        uint8_t **anchor, size_t *anchor_len,
                        Error **errp)
 {
-    unsigned i, dimm_cnt;
+    unsigned i, dimm_cnt, offset;
 
     if (smbios_legacy) {
         *tables = *anchor = NULL;
@@ -1026,6 +1027,16 @@ void smbios_get_tables(MachineState *ms,
 
         dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
 
+        /*
+         * The offset determines if we need to keep additional space betweeen
+         * table 17 and table 19 header handle numbers so that they do
+         * not overlap. For example, for a VM with larger than 8 TB guest
+         * memory and DIMM like chunks of 16 GiB, the default space between
+         * the two tables (T19_BASE - T17_BASE = 512) is not enough.
+         */
+        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
+                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
+
         smbios_build_type_16_table(dimm_cnt);
 
         for (i = 0; i < dimm_cnt; i++) {
@@ -1033,7 +1044,7 @@ void smbios_get_tables(MachineState *ms,
         }
 
         for (i = 0; i < mem_array_size; i++) {
-            smbios_build_type_19_table(i, mem_array[i].address,
+            smbios_build_type_19_table(i, offset, mem_array[i].address,
                                        mem_array[i].length);
         }
 
-- 
MST


