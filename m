Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFA68C13C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3Jv-0000DM-NH; Mon, 06 Feb 2023 10:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pP3Jr-00009l-7O
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pP3Jo-0003lO-Mj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675696927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DolFaCsVV5F/iCGemVkE1D3cXy+E5w6ulv37yHG4Ho=;
 b=N1N282lNSeGCamRDKj4dDmJ5/neLOIXZLs72iCemdL4DSz8To8W8LHvApcPxI+drLA7Hjx
 s43gUEwNsWkNB61g6eotBsmiOLTXngVZi5RfmbdGfgH9P2bv1paWFqZ9F2ChKcG1lfU4Oi
 Vl/fVVZXyLjZe1m7QkW5Ia9+Nj4cheE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-mphMkjVxO22Z7fL8y4YIvw-1; Mon, 06 Feb 2023 10:21:49 -0500
X-MC-Unique: mphMkjVxO22Z7fL8y4YIvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso9093933wmp.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DolFaCsVV5F/iCGemVkE1D3cXy+E5w6ulv37yHG4Ho=;
 b=2wIi19anjcTXESNXmtz53UF9bpTQcZdAMJDmKx2whzLnEEs6oq2267hkzJFXH5e17l
 iNps2qIJWzZeoDWqNk1iE10Zo10PuAdTW1XisPtkRkh0iTy626VmyJeEH/DMa0YaExR+
 wlR+iEwpM327gnx7i6v5nRa4JOfxIt6ePYpzYb/8T76voAny3tVEnAB4cMwnJNONDSV0
 vI5Y9n6FPUfyEtDLZi+xjSmQOLJNXqaoD4heKn9hJtKaMgwX1o22r68NO7kTH/0aimjd
 rq53/mFbnDpz3ye0Ctadp5K0blFbjdbrWmj6vvUt5aU08Lqizap7dR3tNuxhRzYGxSbt
 OmLA==
X-Gm-Message-State: AO0yUKXPGZ1gS9tKysE4W8+3wwPteT1G3TjvGoiQ7bpgjshAFduZ6Aqy
 25iNomhVkIfMqya1aG/3lQntBQamDYwjTaH9I4aDkuelgOhzE+4R+irdrfHX4+iNCOVClTQwGf+
 YnFswCvqZmstyixo=
X-Received: by 2002:a05:600c:4b28:b0:3df:eda1:43b9 with SMTP id
 i40-20020a05600c4b2800b003dfeda143b9mr116943wmp.4.1675696907810; 
 Mon, 06 Feb 2023 07:21:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9e4Rv2nJFBaMQ7LEK742vaxJbmKtO/PZ3pLTHZ+eKvQ0aeWcMNPgDS+GF127joBtwRqeH2qg==
X-Received: by 2002:a05:600c:4b28:b0:3df:eda1:43b9 with SMTP id
 i40-20020a05600c4b2800b003dfeda143b9mr116925wmp.4.1675696907529; 
 Mon, 06 Feb 2023 07:21:47 -0800 (PST)
Received: from redhat.com ([2a06:c701:7430:4900:1e4f:d57b:58a7:762b])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b003dc54eef495sm12624919wms.24.2023.02.06.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:21:46 -0800 (PST)
Date: Mon, 6 Feb 2023 10:21:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 08/12] tests/qtest: Check for devices in bios-tables-test
Message-ID: <20230206102128-mutt-send-email-mst@kernel.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-9-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206150416.4604-9-farosas@suse.de>
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

On Mon, Feb 06, 2023 at 12:04:12PM -0300, Fabiano Rosas wrote:
> Do not include tests that require devices that are not available in
> the QEMU build.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge with rest of the patchset.

> ---
>  tests/qtest/bios-tables-test.c | 75 ++++++++++++++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d8c8cda58e..d29a4e47af 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1008,6 +1008,12 @@ static void test_acpi_q35_multif_bridge(void)
>          .machine = MACHINE_Q35,
>          .variant = ".multi-bridge",
>      };
> +
> +    if (!qtest_has_device("pcie-root-port")) {
> +        g_test_skip("Device pcie-root-port is not available");
> +        goto out;
> +    }
> +
>      test_vm_prepare("-S"
>          " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
>          " -device pcie-root-port,id=rp0,multifunction=on,"
> @@ -1043,6 +1049,7 @@ static void test_acpi_q35_multif_bridge(void)
>      /* check that reboot/reset doesn't change any ACPI tables  */
>      qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
>      process_acpi_tables(&data);
> +out:
>      free_test_data(&data);
>  }
>  
> @@ -1396,6 +1403,11 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("nvdimm")) {
> +        g_test_skip("Device nvdimm is not available");
> +        return;
> +    }
> +
>      memset(&data, 0, sizeof(data));
>      data.machine = machine;
>      data.variant = ".dimmpxm";
> @@ -1444,6 +1456,11 @@ static void test_acpi_virt_tcg_memhp(void)
>          .scan_len = 256ULL * 1024 * 1024,
>      };
>  
> +    if (!qtest_has_device("nvdimm")) {
> +        g_test_skip("Device nvdimm is not available");
> +        goto out;
> +    }
> +
>      data.variant = ".memhp";
>      test_acpi_one(" -machine nvdimm=on"
>                    " -cpu cortex-a57"
> @@ -1457,7 +1474,7 @@ static void test_acpi_virt_tcg_memhp(void)
>                    " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
>                    " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
>                    &data);
> -
> +out:
>      free_test_data(&data);
>  
>  }
> @@ -1475,6 +1492,11 @@ static void test_acpi_microvm_tcg(void)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
>                    &data);
> @@ -1485,6 +1507,11 @@ static void test_acpi_microvm_usb_tcg(void)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".usb";
>      test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
> @@ -1496,6 +1523,11 @@ static void test_acpi_microvm_rtc_tcg(void)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".rtc";
>      test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
> @@ -1507,6 +1539,11 @@ static void test_acpi_microvm_pcie_tcg(void)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".pcie";
>      data.tcg_only = true; /* need constant host-phys-bits */
> @@ -1519,6 +1556,11 @@ static void test_acpi_microvm_ioapic2_tcg(void)
>  {
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".ioapic2";
>      test_acpi_one(" -machine microvm,acpi=on,ioapic2=on,rtc=off",
> @@ -1558,6 +1600,12 @@ static void test_acpi_virt_tcg_pxb(void)
>          .ram_start = 0x40000000ULL,
>          .scan_len = 128ULL * 1024 * 1024,
>      };
> +
> +    if (!qtest_has_device("pcie-root-port")) {
> +        g_test_skip("Device pcie-root-port is not available");
> +        goto out;
> +    }
> +
>      /*
>       * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
>       * the reason is the bus of pxb-pcie is also root bus, it would lead
> @@ -1576,7 +1624,7 @@ static void test_acpi_virt_tcg_pxb(void)
>                    " -cpu cortex-a57"
>                    " -device pxb-pcie,bus_nr=128",
>                    &data);
> -
> +out:
>      free_test_data(&data);
>  }
>  
> @@ -1764,6 +1812,12 @@ static void test_acpi_microvm_acpi_erst(void)
>      gchar *params;
>      test_data data;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        g_free(tmp_path);
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".pcie";
>      data.tcg_only = true; /* need constant host-phys-bits */
> @@ -1824,6 +1878,11 @@ static void test_acpi_q35_viot(void)
>          .variant = ".viot",
>      };
>  
> +    if (!qtest_has_device("virtio-iommu")) {
> +        g_test_skip("Device virtio-iommu is not available");
> +        goto out;
> +    }
> +
>      /*
>       * To keep things interesting, two buses bypass the IOMMU.
>       * VIOT should only describes the other two buses.
> @@ -1834,6 +1893,7 @@ static void test_acpi_q35_viot(void)
>                    "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
>                    "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
>                    &data);
> +out:
>      free_test_data(&data);
>  }
>  
> @@ -1894,8 +1954,10 @@ static void test_acpi_virt_viot(void)
>          .scan_len = 128ULL * 1024 * 1024,
>      };
>  
> -    test_acpi_one("-cpu cortex-a57 "
> -                  "-device virtio-iommu-pci", &data);
> +    if (qtest_has_device("virtio-iommu")) {
> +        test_acpi_one("-cpu cortex-a57 "
> +                       "-device virtio-iommu-pci", &data);
> +    }
>      free_test_data(&data);
>  }
>  
> @@ -2004,6 +2066,11 @@ static void test_acpi_microvm_oem_fields(void)
>      test_data data;
>      char *args;
>  
> +    if (!qtest_has_device("virtio-blk-device")) {
> +        g_test_skip("Device virtio-blk-device is not available");
> +        return;
> +    }
> +
>      test_acpi_microvm_prepare(&data);
>  
>      args = test_acpi_create_args(&data,
> -- 
> 2.35.3


