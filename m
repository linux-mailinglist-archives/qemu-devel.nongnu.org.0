Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ABF4348E3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:27:28 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8oh-0002Uz-7p
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8h1-0002vw-Qc
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gz-0002iK-03
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+JdS6odhHQCqe4i6vULlhCYcRkCV8MNyhPFF2gnM/c=;
 b=YT82Krb2mKpm670DXLL/4pihvtvx4Kyzfox28F65TFXUfVtybJeCxGx/nLYOZ9OaBUXmA0
 ZWs11xDo9s15o2mf7/OgP5Dj/66WQ2bgoyKATJg+3fnBfnCDYerqmshHLaUOHjEOqs54c7
 ZiMOt31u5NDxWaAgasrhAIvMTOdTT9c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-bpqPYhtLPtieV1knZ_yGJw-1; Wed, 20 Oct 2021 06:19:27 -0400
X-MC-Unique: bpqPYhtLPtieV1knZ_yGJw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so20547558edb.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l+JdS6odhHQCqe4i6vULlhCYcRkCV8MNyhPFF2gnM/c=;
 b=p/ZUiJbcBaQyBRocOng3MZMslv/lwlkYtxR7C40JU5M6G8DZAciCMnw9vS0tz1bfIK
 0pdVCuGXi0YkffFgFA09y3sCrNFVyUt+enGWyNGCeYFGjQ7mggYB01Xh3iu3917pnAw0
 nJccPUK3OzaUUd3I8RZdcGHHfULwfE64e2Gxx5QOUNPLszXJl6wJ545kqvlqugLrN9c+
 XNQjMFSzyKWrGJpJjgV64NQ4B5B2kGku+nBUo3KbH4aPha6lbtGR6sC01KJsW8H+uHZi
 PNy1xtNsCeYrQDG4G+1Js334WFbeulQWvjJqTyycy1Pn3Md2Gxbp62XSWDI/X62Yw3Wm
 zeAQ==
X-Gm-Message-State: AOAM532wy9EMpzhbDTLjLl32T8XVYzsjv+TbkWIfd5M186+9g0SSoW57
 3GsAnCdBpFuWOSl+glHWvijV5S1g1fzeJlJXCw2EoBEHzrm86dYzLWu86H8TF6NdYYYPTrUd25S
 CwCoftIkS77JDs5IG81OMfQokfLlIN3JwfHm4Qn8vvh9tVDDWtNBDaaZA3+aA
X-Received: by 2002:a50:9b4b:: with SMTP id a11mr62232493edj.316.1634725165849; 
 Wed, 20 Oct 2021 03:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj5sYQPKAOtqBMegzg2kL4GqOKEawWQONY3Bk3TKKRUuV2q6n5GH9bNmsTAjCzwntMprF7TQ==
X-Received: by 2002:a50:9b4b:: with SMTP id a11mr62232456edj.316.1634725165617; 
 Wed, 20 Oct 2021 03:19:25 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id v6sm1026913edc.52.2021.10.20.03.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:25 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/44] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211020101844.988480-5-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Set -smp 1,maxcpus=288 to test for ACPI code that
deal with CPUs with large APIC ID (>255).

PS:
Test requires KVM and in-kernel irqchip support,
so skip test if KVM is not available.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..87a94a59fa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_kvm_xapic(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".xapic";
+    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
+                  " -numa node -numa node,memdev=ram0"
+                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_nosmm(void)
 {
     test_data data;
@@ -1509,6 +1522,7 @@ static void test_acpi_oem_fields_virt(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1567,6 +1581,9 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        if (has_kvm) {
+            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
MST


