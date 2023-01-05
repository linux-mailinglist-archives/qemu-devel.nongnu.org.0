Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47665E828
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMN1-00049n-Ks; Thu, 05 Jan 2023 04:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMy-000463-Mi
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMx-0007h8-86
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=33CZpHdF+tcuk4L8apS5bqjpuwv5xoitissTN5dMCIs=;
 b=FFMr62t/udm48qdCTePJZ0dh4CUjpErpUI5tnrKOI6lBUNYj8S6E+vddXscNdjxohivTYm
 hiFTsArnIpBovmH+0cL5xyVjNGB4lvBjwyUfGm+Ddu1ggdwN+uxGhWjUxT9RAeX+OeMbwK
 gKNSf0ndRXvRb/uAZCtfwUcUV3MYgwI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-DgzN2UOyPyS43_C29CZpyg-1; Thu, 05 Jan 2023 04:17:01 -0500
X-MC-Unique: DgzN2UOyPyS43_C29CZpyg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v4-20020adfa1c4000000b002753317406aso3916659wrv.21
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33CZpHdF+tcuk4L8apS5bqjpuwv5xoitissTN5dMCIs=;
 b=p4TsSvn3vM0fwxumeJEsAWqnD7Fqy91WNWpIjM3wdwkDVDJcPEFQDPwijnRRwOyCRe
 i/4Q7Ibn2+vrPM+NmupVtIlFs5pluNnoagQz6YFmR2KHwi6MYi/bCgpui5zC+yPJIFQ3
 4tXUq9pe5NU8D8XJygmsaXghYniaLLemyOry6Nq89gUv3WMjHWbYOK2lIVo5udoiSBB5
 VU3sPjHrrhRuzb+xf2gS9n2pFeDlVzyoz5VrBGJc15aSb7AWbmJZ+XF2VDtelUYmO1j0
 cuCXLRdOkQXSY3qr6PHBjeysgKEF7TVCDnoMKByGgCk/7QUTqU7KkuBund2gOBq0ahMh
 TH1g==
X-Gm-Message-State: AFqh2kq9zSfoy1TGyhQ1oPwvOzdojeiAxZlpasGtCBfmZbBbMXcRZI5k
 76uPJ5dPE9VJTeltmT4qNxZE+3zTT/omaMKvNrTar3eL9StezpGQ/EV77at9remQ82kBcw+/hnl
 gIFJ+vK2f8pRxWDRLj3C86CQzGad5qM3G1K/Wdaav6rrwmhTXl6xeULkmW6zO
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr34721577wmj.10.1672910219732; 
 Thu, 05 Jan 2023 01:16:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmk1uklPvsjnLG7WgTciEdmTH9BXmeLjlfZgPN0ZXetsauEz+7inFIQ31ZfIqoP2n2fw4YQQ==
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr34721559wmj.10.1672910219514; 
 Thu, 05 Jan 2023 01:16:59 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm1850899wmq.20.2023.01.05.01.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:59 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 48/51] tests: acpi: aarch64: Add topology test for aarch64
Message-ID: <20230105091310.263867-49-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add test for aarch64's ACPI topology building for all the supported
levels.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-6-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 395d441212..e954a9cb39 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1720,6 +1720,24 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_virt_tcg_topology(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .variant = ".topology",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_viot(void)
 {
     test_data data = {
@@ -2057,6 +2075,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
             qtest_add_func("acpi/virt/acpihmatvirt",
                             test_acpi_virt_tcg_acpi_hmat);
+            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
             qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-- 
MST


