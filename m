Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B621423994
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:18:03 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY27m-0002m2-3V
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY252-00013O-RJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:15:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY24o-0000hP-3m
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvGgk6twj7rWkkyp7QC6vvWZWx3oesWLXmbukEbEECU=;
 b=EWxhPbktICpEvzgUX/XavnE3YqTauvAjWkKMe4biXvjVxJluSluceCd8YRL6q0sDvUyuwM
 zQQ1OzMFyFaKmip0MEJ71ES9URuqGryCvzlGYLFGhkLuDW1qRPjYp5vfguM9TWmuoWB9Sj
 OsgBzkcS6dqg2igF0LhoRHhU5gdkjs8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-r-qaGR6gOzCvT53bbqhgtQ-1; Wed, 06 Oct 2021 04:14:56 -0400
X-MC-Unique: r-qaGR6gOzCvT53bbqhgtQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso1356337wrr.15
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvGgk6twj7rWkkyp7QC6vvWZWx3oesWLXmbukEbEECU=;
 b=Nq1tRvI7NRljpRNWLvNsEXsOwDy5fOe4jaagrLMg1bAzWHU+Aai8G7MaaF2fFLnsXc
 JgWvmm0TCSwW+o7oYo43GBG2PS/oSMtzQLZ3Dm/8pk9gIHPu0saBMUY3aHyM45HMxeLG
 5SWW+I0V0KATR3WaUHFdJC7LEPKV3d6J9f1dDp3MVhXlC7mRXNJ7ZZ3kkQlAazmRX8m7
 SdWHrEAbx54zsjIF+ifdfqzbVx0z+dUcNZGPiQx6ExIXqiE/6FaupRMBieCD1WFJFZtE
 6Qlhm/MSIFK7n0DPRDi0Iq41uXrclVlu67Pk8XyfcGwDe1yVA5xcl/yb/dBGE6A7wqG1
 ZWWw==
X-Gm-Message-State: AOAM530OnAGXEXRUCQAT8YdWgJu17a0KsLDnkwrQeeAhHUk9tjF6hVgY
 JjTAcmAdS97FRSYFT9C4w6i+5IXk5+owygT+yPPACgzDaMDNF3MO4r8I4+uGe+Assceqy0ys+ve
 10yS33XdpJWQHykU=
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr8427395wmi.10.1633508095284; 
 Wed, 06 Oct 2021 01:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/mmc4WJWHgyaYO4AoDPO89uT0I01tcCQD3ZW9rW22W4C9Jrsn+y9Xpt1TuIgevmgjYutQ2Q==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr8427368wmi.10.1633508095085; 
 Wed, 06 Oct 2021 01:14:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o15sm4294850wmc.21.2021.10.06.01.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:14:54 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:14:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
Message-ID: <20211006101453.62de5e54@redhat.com>
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Oct 2021 18:33:57 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..b6cb383bd9 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_viot(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".viot",
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
> @@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
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


