Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306CC4CD5FF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:11:58 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8ey-0002jZ-2k
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88R-0007oV-HJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88P-0000NW-03
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vqmzhFEM37dr6U0Ojjhlq+BZMQJdriqtIDbTT9ZpStw=;
 b=FDen2sR/pM9TL3rsEvEOehNHlnpRhm/tF0UmxzBDG6fqNgbvEEC94XMbDikf2AXmqRJefG
 4cMyCqLLn2PcybAsAupmrrG7/XDPUDT2o51LiBbviOVL977+VX35Fqn5M+S0r713i///M8
 NggA8mIi04I0CM/0S7sygX6ttAp5iNQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-0vCpuANkNl6GaW0nejbREg-1; Fri, 04 Mar 2022 08:38:14 -0500
X-MC-Unique: 0vCpuANkNl6GaW0nejbREg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so3379050wrg.20
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vqmzhFEM37dr6U0Ojjhlq+BZMQJdriqtIDbTT9ZpStw=;
 b=wURSN82zy2Ekh5QgrNBjfHne6TG1s7tLaWbO52ZkuvzHW1slg8ULhdkAd8SwhWvWqv
 UxCtcRLqi48LNWgC1OW4GJBfNbsMaNSVavLez49ePQ4Y4Com19S6CIQ9w1pc4pAR8g85
 EZMlS0/JLGUSHZsUqUhSwznOiujomLPEINCS66TS0CaToHsu1kqf9dhLQXwc1S+TjddK
 xIwx9fAWu2uRM7G53JX1fZBN0Yx0J6VUp3Wwzz039zUqZMCCaaOxwsWfahTG2iPGv6/l
 4qNXtnnfSfYO3w0XOgiwaLfuK8q88Bmiq5RZae32bAfmM7Q//2/iQrzxwAJADCitNdzf
 84dw==
X-Gm-Message-State: AOAM531BA0fpp0Ahy8S+f5unPfm7xzF+mv4nv3YS2jv1r+/ioRoSJhv7
 Ama1o1S0vks2LUYqTqU7fi25Dq0WppmHkludLzVtkdmfU9XsC3jen66yfYs08RiPQbm7u2uXaBQ
 cT6VxPJcreE9h5eUz/wd18kQtW6w5BoalD3Iz2jWJoy3l53UbJoa994jmsPq4
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr7963313wmh.56.1646401092905; 
 Fri, 04 Mar 2022 05:38:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNWxVe8QkueDfLDKgt8kCQgzc6onrzpx0r3pWUpgof3BHYTkoe0Z5KRGuSHKZ1ebPdJDMBQQ==
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr7963283wmh.56.1646401092573; 
 Fri, 04 Mar 2022 05:38:12 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm23741660wmg.36.2022.03.04.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:38:06 -0800 (PST)
Date: Fri, 4 Mar 2022 08:38:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] hw/smbios: fix overlapping table handle numbers with
 large memory vms
Message-ID: <20220304133556.233983-8-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


