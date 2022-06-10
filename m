Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F8545EC3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:22:32 +0200 (CEST)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZuZ-0003kh-3l
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWW-0006V9-8y
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWT-0006DI-MP
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txbr1/Eph1tCF7BwGxf4OagG96JT8d5zHt5JyHeAurY=;
 b=Frg47rPzFomF4Tn3Pho+ixcNdgdAZ+dcGf1Znaut9r7/HtlUbwLBmxKiVcEdLrAwy5tJr8
 SEZWLPL6iH0L4UQBLBQmOpajO57zGDLpXvTHiU3NPyNHRTH899Rfhn6qT8XeIhrTBcK1JV
 IkIQ9PgxYrj34B3/P14avHBbN2N9BM8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-VRssWpOsMq2EEEdHGe_Ukw-1; Fri, 10 Jun 2022 03:57:35 -0400
X-MC-Unique: VRssWpOsMq2EEEdHGe_Ukw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b0039c7efa3e95so71486wme.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=txbr1/Eph1tCF7BwGxf4OagG96JT8d5zHt5JyHeAurY=;
 b=mHu89hvo+7XD+rJhwpyRgzjEnIqBmgInzakXn8lsoK9S3mc/swKwA9ZckOy30RyKF0
 7T0APGUgwyKD1H6pdAPmjNoRq0DE4nc3X8pirQ0jwQEykrKOJ7rukLHbvDkoUTpW1IBY
 l/IFSN/9nwT8RrFv1Riro8vdv6ivwP8RePYQsztPJaRTk6wlOwHerorrCV4gCk0d6h64
 5om1izMCcUmqB2uee+Ok/xAvEisjfoVVey86SDtap9UVI3iLCortMIbx0d5E9yaGdKXK
 XOgt4h9eE9YhE6jJVCwqlNtNvknxjzKp9Vjov84K9f8EHn1h5lw37A/6M0+9fGS3h3Fy
 w98w==
X-Gm-Message-State: AOAM532q+eaaK0rBYtwxLzQVAurm+ZQOZKl5hfDpJxzAiBt8sWRvnfuK
 mEcG3Sfwp/jSYt/LntLrgX9XMT/NfTum2qhSAAyLI5nTIf6dFZIEiB+DcmTbDhKt1YASEpR9Xrn
 y1oipJ3CMN2iwTb6cN+bv05cmuGWuipV8xIgeFodsNhSmaSVLTRESdWOc+B6W
X-Received: by 2002:a05:600c:3d8d:b0:39c:5232:107a with SMTP id
 bi13-20020a05600c3d8d00b0039c5232107amr7466279wmb.191.1654847853892; 
 Fri, 10 Jun 2022 00:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9sPGnNB50gwsWmvyA9uHtNDJytWYtUYlBFV0rJmxu4fmb4au7T2jgir/WPngm4jAEGMQDsQ==
X-Received: by 2002:a05:600c:3d8d:b0:39c:5232:107a with SMTP id
 bi13-20020a05600c3d8d00b0039c5232107amr7466258wmb.191.1654847853597; 
 Fri, 10 Jun 2022 00:57:33 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfdd4a000000b002102cc4d63asm31466888wrm.81.2022.06.10.00.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:33 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 10/54] tests: acpi: q35: add test for smbus-ipmi device
Message-ID: <20220610075631.367501-11-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

expected new device node:

    Device (MI1)
    {
        Name (_HID, EisaId ("IPI0001"))  // _HID: Hardware ID
        Name (_STR, "ipmi_smbus")  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.PCI0.SMB0",
                0x00, ResourceProducer, , Exclusive,
                )
        })
        Name (_IFT, 0x04)  // _IFT: IPMI Interface Type
        Name (_SRV, 0x0200)  // _SRV: IPMI Spec Revision
    }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a4a46e97f0..d896840270 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -955,6 +955,21 @@ static void test_acpi_q35_tcg_ipmi(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_smbus_ipmi(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".ipmismbus";
+    data.required_struct_types = ipmi_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(ipmi_required_struct_types);
+    test_acpi_one("-device ipmi-bmc-sim,id=bmc0"
+                  " -device smbus-ipmi,bmc=bmc0",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_ipmi(void)
 {
     test_data data;
@@ -1743,6 +1758,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
         qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
         qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
         qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-- 
MST


