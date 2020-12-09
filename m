Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95C2D494D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:45:01 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4SS-00007B-F3
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sl-00021S-2Q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sa-0007x7-2w
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=bRz6ndgQ8ZJVuwrcsK3t/wpfvZcBYLeOxSt01uz4HYzMsDrRn6jhJVQl0ei21Mb2/tfN0Z
 u12ZrbNAT8nMd70TbkOKdLbHPS9WuoZbl3VKpBnNMA06YWKI4IorAGRXOpzuGJSylHekK+
 9zVmTyTQWnkSLCJL7la5ILNF+wRrr9A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-_JzSLNPmOO-edNSR9ql8Ng-1; Wed, 09 Dec 2020 13:07:51 -0500
X-MC-Unique: _JzSLNPmOO-edNSR9ql8Ng-1
Received: by mail-wr1-f69.google.com with SMTP id r8so935044wro.22
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=thBLv5CFmvjl8xIN8RiNA23P6kYWj33yZ/SmXGMh9bhij+rFOnGWKVXDxA1OPOEduy
 llhWj2az8kxQQ8RgiXmIoO0RFYkhVOHQTxJfJPw8/WH6wk8TC66yaPfHOGyBUwYkZoax
 iChGlKqh4Xd0/W4QdvdBsE1vFx9YSFBxA8AXSdjYyB5Q1fYZKCiy19k21EDgfOPfrxr5
 nQzEYQnW/76yoO84yTjSom8E07YxhGWpqlnWYMWExSAEfnpOs2+oieHEFDhti8gBAIHu
 9aLXImJn/oJWzzHJn82tOLosN9fACZJTxUWsgBJoE13nV2O85uqVS8nesaHpkLIImOy0
 SXRQ==
X-Gm-Message-State: AOAM532S+y7TQvzS0X0lvJw760sC+aKzLqBjNc/osJ7XvqNz4WAiYAi2
 EMpgMhPhjPxQ6/J23cHtcLCVeJ3jQ+QhWC+U6uWFOLdiaCWx0NirJNbmb3e0GIZA9i4R07lHodr
 2jXhB23fEpvh7KwqvGX1ak31X/XhtjobWfqLh9r2Qm2aK6anlBwqE8bvWT8Gq
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr4059393wmh.29.1607537269555; 
 Wed, 09 Dec 2020 10:07:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz49e30RNto5gNReUDG9ekbQ76MD1gIi6G1BgDfBfys77UcAWv3bPOM1A/DyWBORacgOY8Feg==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr4059344wmh.29.1607537268978; 
 Wed, 09 Dec 2020 10:07:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 125sm4920272wmc.27.2020.12.09.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:48 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/65] acpi: Align the size to 128k
Message-ID: <20201209180546.721296-14-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


