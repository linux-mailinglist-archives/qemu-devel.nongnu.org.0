Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873794230E2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:42:41 +0200 (CEST)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXqKm-0005Uf-Jh
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqJB-0003KE-GD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqJ9-00029d-Uj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633462859;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMbV8nhPdJh+Tj+5bauxglLgvBkliNLvzzUT5d7cjbE=;
 b=Dglvn0EbIxiHeRzoE8oPqUGQHW9AyTS+Ipsg1uci68trpxXHsYjuu8WR2fa6/FvWRfdEh9
 pqMm/TsUgmX5Llpe0pFjAVp7tg8BDgvvOhC+KQm5RV/H11lwXlFd2vFy421QY73KpFaR/u
 ZNTzJghAaFIyEcq8TS5aPgASlw78DNw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-2wdPuDTlOXCz0CnSk96DxQ-1; Tue, 05 Oct 2021 15:40:57 -0400
X-MC-Unique: 2wdPuDTlOXCz0CnSk96DxQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso160663wrb.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=RMbV8nhPdJh+Tj+5bauxglLgvBkliNLvzzUT5d7cjbE=;
 b=rtfDBO4d6H4LFy+BnV2pA8Wi99hcmwNzJxYv4NdJh5qNeXVZf0yC6+Wu14bXpvWlBp
 TjBGBvRJ5qJU1Dj6IVEOxdENsT9s4NbI+s6i8xbRNmD4rRNzGezMl6yLqJsr3vRat3LH
 okMvQgiHDXhdzvZdeBPPAikmlmgIpRgF0awv1kA1NJiPMKWNla4J9ZQptqJE8K5lH5OJ
 NE8Es6Qd6gGz6JxyyiMiaTANsU4+1WAjK/aLQJnKsuqB14Y3Zg6+GSsIql7vi3imtrKR
 pktMPYWYppqOFfrYFEqcTucBLMW/d41nxrEBkfaCzIhXhtmeDSawKFSYy4c5Jy8OeLtO
 ooEQ==
X-Gm-Message-State: AOAM530qr3eRDiTVDgHjL6MEh5SrYfQgjwbqZxIB8iqvPzg7iHhaJbq6
 VGTxXGUajaS4bQ8/ms+cGMOP8F83BRoO7h/KAnB5myJ1oIhBPLPbHXaSgebTsCfjrzW5cWypuoL
 u+LX+2pYvgZJeQCA=
X-Received: by 2002:a1c:a558:: with SMTP id o85mr5457243wme.110.1633462855892; 
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3cw4ZbcC5neMoyfXHW0lyKAQpeZJrNbkUHvFWa4H40PxYox5O6kUH1CzTDxYzdDpJqDFl9w==
X-Received: by 2002:a1c:a558:: with SMTP id o85mr5457227wme.110.1633462855729; 
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m21sm3144587wmq.37.2021.10.05.12.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4350da17-9675-2cde-c571-6b5952b75f31@redhat.com>
Date: Tue, 5 Oct 2021 21:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
may be better to use virtio-iommu-pci?
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
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric


