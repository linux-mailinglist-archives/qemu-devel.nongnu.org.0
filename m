Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352D47672D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 02:00:37 +0100 (CET)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxf8N-0001WH-MG
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 20:00:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxf79-0000pQ-Sj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 19:59:19 -0500
Received: from [2607:f8b0:4864:20::534] (port=41739
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxf73-00088p-Vi
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 19:59:15 -0500
Received: by mail-pg1-x534.google.com with SMTP id k4so21536138pgb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 16:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Jy0CMrVe1K1LQkj7DHzSxfzWkMJGdyL3kQOwNvHVjsM=;
 b=uckJa5O4/bHirhke2BBIiJqWZ9+Nu8KQNbKWaUkQBRw7c1vp0yr/36KX8GMje9BTYg
 VzzhuhWo3tLU87BNClAp9rrfTDt1JKdroT2m+BwdJs51kgkLXZoptGL7tkXyKRQTdWwN
 v1qisgV6vlGKjm5aExfmgqhKAn/z21eS9RB2z6EZLFADkblNId0alfKksrFZgOFMtOCz
 2mnmMFauhVXqhcsmG13NuXiQiaLZO2K+hAc99e6MO7vH1QHcdjH8Y+AF3wVXtmWyMwZM
 Wmu3EBSxX2ForiEpdWkkLpi0jGyjfSX12Lno0qzW3nBOT/odqIyU07yvV7mG+fW+a589
 5wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jy0CMrVe1K1LQkj7DHzSxfzWkMJGdyL3kQOwNvHVjsM=;
 b=E6TvQNyfCu7oAgQtQGWUy0cmjVmWGuGiFo2KvdQ4GoFXSUV/rsVYb2zprw1mwfQu9H
 IBtxgbMu/GL5E8fMaHF0s2mEbmIo2JCH88iGEjWr4H/MywhXRwNSljVjyPivspnisPi8
 eXghIGRBJg/3rrYZgMJx6wIQFp4radEtnNSaMumFyDIJocRcS6Fd3tOc3jcfNj4XYOLD
 iDqxIHD4kDxfUa2QE2WU47oRE9RqJoKHuqTAPDZsy149TCVAAIM7+TxRDDLrncdl6SH9
 hZi3AI2/C2A7B0fMVkHPyF0O4S0IayVbwqdGaNPnrCTbM+nc0TdA6kWOBsE0kAuwR24N
 Mnhg==
X-Gm-Message-State: AOAM530Jlko8J5cujmLgEvFMdxyyT9HF6zGuir0nO7km+tCZSMI1a8d9
 hHoNJUPWvNWcyrTG3JnMwfXtnA==
X-Google-Smtp-Source: ABdhPJx40S/uHTPvnYwKq5crLwsNyzd9vkKEf32l+t8RbwC/SAYD0mnNQDm1iEamSoGwtJTf1HeMUQ==
X-Received: by 2002:a62:780f:0:b0:4ac:df3f:dad4 with SMTP id
 t15-20020a62780f000000b004acdf3fdad4mr11565080pfc.14.1639616352490; 
 Wed, 15 Dec 2021 16:59:12 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y4sm4111831pfi.178.2021.12.15.16.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 16:59:12 -0800 (PST)
Subject: Re: [PULL 31/33] tests/acpi: add test case for VIOT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
 <20211215104049.2030475-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org>
Date: Wed, 15 Dec 2021 16:59:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215104049.2030475-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 2:40 AM, Peter Maydell wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)

I should have been more careful while applying.  The aarch64 host failure for this is not 
transient as I first assumed:

PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
Broken pipe
ERROR qtest-aarch64/bios-tables-test - too few tests run (expected 6, got 5)
make: *** [Makefile.mtest:312: run-test-37] Error 1


r~

> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 258874167ef..58df53b15b5 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1465,6 +1465,42 @@ static void test_acpi_virt_tcg(void)
>       free_test_data(&data);
>   }
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
> +                  "-device virtio-iommu-pci "
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
> +                  "-device virtio-iommu-pci", &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_oem_fields(test_data *data)
>   {
>       int i;
> @@ -1639,6 +1675,7 @@ int main(int argc, char *argv[])
>               qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
>               qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
>           }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>       } else if (strcmp(arch, "aarch64") == 0) {
>           if (has_tcg) {
>               qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> @@ -1646,6 +1683,7 @@ int main(int argc, char *argv[])
>               qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>               qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>               qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +            qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>           }
>       }
>       ret = g_test_run();
> 


