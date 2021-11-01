Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3DB44242B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:37:13 +0100 (CET)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgrX-0007cz-Pp
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgpv-0006Mf-4G
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgpf-0001Z7-1b
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635809713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5xOxHKwRfUcpMYgGKXDwswZEMYc4jXhOSgt9fezNXs=;
 b=SU0OqOh+RNqg3jM/5Pn5QtfxC2gfFHcNfuGLz6bhJ5B4vtxaJ2/SegL+bWVDfrX3rh40AP
 GjECJgELmZ27o1W1smbCS2cfAA3HeAmCcG9lPWRxvaxfx4hx+1lNoIM5yARi8NHNpjWDhC
 9J7my346AzSO5jDgN83C/OBc6mXbGPE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-RJ7qFddPOduKoGx80F5V6w-1; Mon, 01 Nov 2021 19:35:09 -0400
X-MC-Unique: RJ7qFddPOduKoGx80F5V6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so16993804edl.17
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f5xOxHKwRfUcpMYgGKXDwswZEMYc4jXhOSgt9fezNXs=;
 b=wcENiMSs8gkquETIXsAkgZCd1X+Z3LS84+bXQ8V1gSBQQ8GPl0n5W72aOsr1Aq2ZJs
 YTi2XveR/zibH5y22S2cddqrDCppAXvWsBvaUeNydsaiwGu7cw9wKdPmR6kmGptw6eBc
 DvC7Va13gUBSN2qrhaqtpqvfqqEK8yo1e4ADROsiYeLndMHtRGIVokMqR+3u7Lu0WT0Y
 dHTD+b68afE43DqlFhYOumiJlloxBFwp3AyK38zj66aYA9/RGbhhSvKl0q6AD6wt0Z7Y
 GXPlnsZlD38X19iC+K3pc8lIH6w2Z69YDpkA59DZL5iRcn4jsr5tqIxWrVQ2I5iFsSb0
 yANQ==
X-Gm-Message-State: AOAM533bT4uorkFkF6gLQ0hg6S3+YJwWpMFGwLwSEtBHHFdwlszmTjNl
 qnWk/6XlL5dvB/TiqpfMe7awzD3O//GVIdT6Ie6QnsyCkSE6NDy8MI4dZLTF7WyPrFl/Rkaru6o
 MuBZR858wdhjy0n0=
X-Received: by 2002:a05:6402:22da:: with SMTP id
 dm26mr39479426edb.208.1635809708861; 
 Mon, 01 Nov 2021 16:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5YvHGioK2B9qM3CiAVl5RSMyyspFjJGchL/JOncA/rGMNmTIMMQ86RBrIPKos3NJYT2t0JA==
X-Received: by 2002:a05:6402:22da:: with SMTP id
 dm26mr39479385edb.208.1635809708600; 
 Mon, 01 Nov 2021 16:35:08 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id f8sm480227edd.14.2021.11.01.16.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:35:08 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:35:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 6/7] tests/acpi: add test case for VIOT on q35 machine
Message-ID: <20211101193358-mutt-send-email-mst@kernel.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
 <20211026182024.2642038-7-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211026182024.2642038-7-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, eric.auger@redhat.com,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 07:20:25PM +0100, Jean-Philippe Brucker wrote:
> Add a test case for VIOT on the q35 machine. To test complex topologies
> it has two PCIe buses that bypass the IOMMU (and are therefore not
> described by VIOT), and two buses that are translated by virtio-iommu.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

seems to need the bypass property patch

qemu-system-x86_64: Property 'pc-q35-6.2-machine.default-bus-bypass-iommu' not found

given Paolo decided to pick that one up, pls ping me
once that one is merged.



> ---
>  tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 258874167e..a5e0fab9d5 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1465,6 +1465,26 @@ static void test_acpi_virt_tcg(void)
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
> +                  "-device virtio-iommu-pci "
> +                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
> +                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
> +                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> @@ -1639,6 +1659,7 @@ int main(int argc, char *argv[])
>              qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
>              qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
>          }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> -- 
> 2.33.0


