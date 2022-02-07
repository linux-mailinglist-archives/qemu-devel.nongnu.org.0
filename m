Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2B4ABB94
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:38:58 +0100 (CET)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2MD-00030F-Qe
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:38:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2Ga-0008KP-Dw
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:33:08 -0500
Received: from [2607:f8b0:4864:20::436] (port=35632
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GU-0001j5-56
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:33:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id u130so12438390pfc.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sngXWR+9Dva/nHlSH1CNHSKXbraDehw/b6yUI8KdBMc=;
 b=FuAM3NrJSJ1nRMGhsSqO6qYjHtIdhOeakggmy62/NQ/9yDCTizIUBzsNhSIWRbBd9P
 c6U0f2svI8JTluO5AkSVnECLug36VLgZNIe1Rd1FHEU7eKkvs1U36oZYFnMLn8c9QzgF
 7F0Cvg2j7s70CSyslSL4Q+pkVP43BcFPFoDPJOZjCGZhLvZseMLZYQZOrofG76p/sXHz
 OacMti+LZtFPyN85/qndoGRdvctV/45/KOIDFZYWw8Lpda3g0lW5xc4BgosIG0Fpul0w
 xCpqkCW9fDVdxLvxbWQ9YE9Cdk60fK1JBQyeav/d7RQ9NBFjyVHcW/KG2vsCcy4Der3l
 poxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sngXWR+9Dva/nHlSH1CNHSKXbraDehw/b6yUI8KdBMc=;
 b=iJo5vgF5uZArKSHvm85XH/XOgZEUA9rhJMtM9QmadlHm6JtQV0O+ton+32QDIageip
 HjXzC8jTXUYQlx46JlJxq2ewfVdB/x/WlAi2xyCg5IetDqruqIh+G1RSa49hh0zv+yhO
 N2mDcd9zaG06dkkbMlXTvmUEw/b8oBlvVqDf7MWb5t9M/Avv3ktPSkb5+CUqggO8laaV
 aP6+pRVWmfVsWbJXRKAYq+cI1azwThCdsuSPdMMzwXbIvexK9hPz2NBmYYO22p+us/91
 2pssJyk7JxwseFBYibtneHclzKcJ3wP72fIRPP/qkPj+F80myDYCVjiH6sQcMIcl0YS5
 RZiQ==
X-Gm-Message-State: AOAM531XUmV4GevGgERCZX7z9s6KycwEyF0lHcwsph/e40/SbWFQferw
 sbf3eupYwEmZvgCfZtovyfz82aY+cXSwWX6Of+MjJg==
X-Google-Smtp-Source: ABdhPJx/WuhmnNn2ihzgbNN04wKU81+CJDzRhdOSZNXpXLnX01IUavzK4dc4biUwSt80Uztb0JD24g==
X-Received: by 2002:a63:83c6:: with SMTP id h189mr9010193pge.539.1644233575157; 
 Mon, 07 Feb 2022 03:32:55 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id h14sm13016345pfh.95.2022.02.07.03.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:32:54 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 2/3] hw/smbios: fix table memory corruption with large
 memory vms
Date: Mon,  7 Feb 2022 17:01:28 +0530
Message-Id: <20220207113129.2701722-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207113129.2701722-1-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

With the current smbios table assignment code, we can have only 512 DIMM slots
(each DIMM of 16 GiB in size) before tables 17 and 19 conflict with their
addresses. A guest with more than 8 TiB of memory will hit this limitation and
would fail with the following assertion in isa-debugcon:

ASSERT_EFI_ERROR (Status = Already started)
ASSERT /builddir/build/BUILD/edk2-ca407c7246bf/OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c(125): !EFI_ERROR (Status)

This change adds an additional offset between tables 17 and 19 when configuring
VMs larger than 8 TiB of memory. The value of the offset is calculated
to be equal to the additional space required to be reserved between the tables
in order to accomodate more DIMM devices without the table memories colliding.
In normal cases where the VM memory is smaller or equal to 8 TiB, this offset
value is 0. Hence in this case, no additional memory space is reserved and
table addresses remain as before.

Since table addresses are altered for large memory VMs, this change can break
migration in those cases. However, in those situations, qemu crashes anyway
without this fix and hence we do not preserve the old bug by introducing
compat knobs/machine types.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 56b412ce35..d7de740363 100644
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
+         * table 17 and table 19 so that they do not overlap. For example,
+         * for a VM with larger than 8 TB guest memory and DIMM size of 16 GiB,
+         * the default space between the two tables (T19_BASE - T17_BASE = 512)
+         * is not enough.
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
2.25.1


