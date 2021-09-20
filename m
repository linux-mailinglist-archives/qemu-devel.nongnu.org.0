Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3A411122
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:41:30 +0200 (CEST)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSErh-00040e-1s
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEq0-0002PF-99
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEpy-0003ce-3f
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632127181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLW8feb35vQkeFSkgOZH7oZVlvYkZWbF7TR5s1LFyI4=;
 b=VuesLYhkavpTHzYf0uGYYd/c/tv4SA+nCYgk7H5NJRm/OYuKdywqqPdmCwI+c0LR5a7id9
 HAWFa86ShS7ZwBHILb8GUe/oWgc49ZLhx7tdYQxpfT6M8sF4Xn+M/hjkvhI2mB1DQUF2rY
 M2jeIsxhv1cIa13mcHFKASnhGMfKU9s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-elMDvsNkObi7CwFUjpeftg-1; Mon, 20 Sep 2021 04:39:39 -0400
X-MC-Unique: elMDvsNkObi7CwFUjpeftg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so14928311edy.14
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLW8feb35vQkeFSkgOZH7oZVlvYkZWbF7TR5s1LFyI4=;
 b=Dyh2aBtBkD/ijgQ70xVCEk6JiVKd2kaT6MG+OniPfCbO96CoWzcn1Fm08PGO7Wyky4
 X5K4U1iy+ZJ59mmEr9n6lGIxo4z9uKgtYz/zuGArbqaQJRlCjRts/KsCKl9mZHtkHJht
 1TFApfpvtDj1ss4eKCoilzE5qR/qJU0Vv7OqbYbuEd4Pcp2BGqmkwfnGsFpX1zNS0bXV
 vv2zGA60HyatHaTnmEgtLIVFQk3029nW9QR+20PP3GWfMnhFzTFpu72ecQbR5RmHG8V5
 pWc5MPRydakyquQghODj29W+4MBDN2Vb55m4tsgPqeLLAVDdmIIEBdOv00ijCR1nQyaS
 X3xw==
X-Gm-Message-State: AOAM531WCeA39M/EqMONGSiZLnUXqsa3C/ks9dyENRkRUQMn7ZazFhR1
 a6PIfDI474PS+LAfS6825g390+UOtfZ+8d26qk0s4ZhP38I9EncyjNugD+O4yzjVRwQznEs7N4v
 zsESOJoGUmcdYAHQ=
X-Received: by 2002:a17:906:27c9:: with SMTP id
 k9mr27852134ejc.124.1632127178377; 
 Mon, 20 Sep 2021 01:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMoC0jVZAVMmxiLIystIIuy5V40BXbw9FcB2aCCVGriChdUdTzaA9jEZWS+YplmleoMukMgw==
X-Received: by 2002:a17:906:27c9:: with SMTP id
 k9mr27852117ejc.124.1632127178188; 
 Mon, 20 Sep 2021 01:39:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v25sm5791969eja.83.2021.09.20.01.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:39:37 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:39:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 07/10] tests/acpi: add test cases for VIOT
Message-ID: <20210920103936.2cc94969@redhat.com>
In-Reply-To: <20210914142004.2433568-8-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-8-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 15:20:02 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..f8bfe2f247 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1403,6 +1403,43 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_viot(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".viot",

> +        .blkdev = "virtio-blk,bus=pcie.0",
why is this necessary?

> +    };
> +
> +    /*
> +     * To keep things interesting, two buses bypass the IOMMU.
> +     * VIOT should only describes the other two buses.
> +     */
> +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> +                  "-device virtio-iommu "
> +                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
> +                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
> +                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_virt_viot(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-device virtio-iommu", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> @@ -1567,12 +1604,14 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>          qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);


