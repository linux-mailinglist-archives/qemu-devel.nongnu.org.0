Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223132D32D2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:54:35 +0100 (CET)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj4E-0006S0-47
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmil2-0005Ht-ET
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmiku-0004ub-La
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=Eqa3QA8r4GUXKuxmUatwyUtVmZHSFKXCGriKDq35NS3nWYdm4tLTTW1gaO2IaElwrNknpB
 yqhP+zVRgA2U/VHddy8hc53RyYeMn/1+6L7q9QLP3L1Wm/cWtgMKD6I6qhzGqNPH+Q38Aw
 kvXu+hlXnShsRnBuXrfkp2szTbl/0yQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-1E5trE7hMKWl939kvxdMaQ-1; Tue, 08 Dec 2020 14:34:23 -0500
X-MC-Unique: 1E5trE7hMKWl939kvxdMaQ-1
Received: by mail-wr1-f72.google.com with SMTP id b8so168473wrv.14
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=AjwbBe1vONKfv4mtAki9EbJfW8laRYNtdLYeuhGRLnV/P2kmWxQd64baasau1/yr5N
 +isrxDFCGgntMWQdL7j9enOYHmmjFI7xu16hxElxuNrogeutQ01X5k69cbNqwF6cnfCH
 99UKBeKslGP1iBRT9kPJB+wdfnUhR+DGirNiLX4mRudFdeETYmxI+DF/UnirWCFRZY+m
 GVyB/k3puR1DC55VEQGZdwxhjRzTDDeT9cYy1XeB9NHqNgLlgsVG3i5KKiTjk3QHAv4q
 cCUUWtmZXUAwgWOOS/gJPM6AqQCQ0JvWpNQTapapuzf4ehfmS3xlDYzgwJzhXXu2Iy5J
 6mxA==
X-Gm-Message-State: AOAM531ztKZr4K2U62JMWpjp8o9OsuHeisFZyMxa+ax/DNV42x2IwoFm
 mFmOlzbIkvcvVzdV9lagg/BnLxaH5HU36ymgJeRbiRA26/eAWy6M2txfL2kPb+8RXPFzM6JkkDN
 P3P1WWYNDrh884yrIdcXZOQQtNLMhHIGVl2MUAburIi8CXwGd8txCM2aEFUCl
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr9245604wrj.79.1607456062021; 
 Tue, 08 Dec 2020 11:34:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi21cw5Bzp2ohysEdBJU8enXbec5+uCudF8/enTUTMYaBsN6FXQByew6DZZN9TV97dFdHpsg==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr9245581wrj.79.1607456061785; 
 Tue, 08 Dec 2020 11:34:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id s13sm4904715wmj.28.2020.12.08.11.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:21 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/66] acpi: Align the size to 128k
Message-ID: <20201208193307.646726-14-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yubo Miao <miaoyubo@huawei.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

If table size is changed between virt_acpi_build and
virt_acpi_build_update, the table size would not be updated to
UEFI, therefore, just align the size to 128kb, which is enough
and same with x86. It would warn if 64k is not enough and the
align size should be updated.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-7-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e0bed9037c..711cf2069f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,6 +57,8 @@
 
 #define ARM_SPI_BASE 32
 
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
     uint16_t i;
@@ -656,6 +658,15 @@ struct AcpiBuildState {
     bool patched;
 } AcpiBuildState;
 
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -743,6 +754,20 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
     }
 
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
+
+
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
 }
-- 
MST


