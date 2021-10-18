Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4543291B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:34:26 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcaH3-0000gy-6W
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcaES-0008Bi-6f
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcaEP-0006tP-JU
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634592700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEJ98USB6iIvAhI0ZDu5S5IUq0iKmTyj1qBcpsRP9Xc=;
 b=M6CX2IpnIO8i3SA5LD7ulWbz5a5dK9kGS+fi+0NpYpX0Q0BRiX/bwOgT5N2VjgRfL3f/qj
 oRxASjzX0FvhxuhRibhe8jmZnTRv9J12UrTYTajkJ2VlZqYt+K2AUOlQbT1iQhYFAR3WTg
 cZQXmxg8rv6Ind3p++ErQKLgMystgpg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-yjj3QU0WMuS17FQktWBdfQ-1; Mon, 18 Oct 2021 17:31:38 -0400
X-MC-Unique: yjj3QU0WMuS17FQktWBdfQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so9275759wrd.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bEJ98USB6iIvAhI0ZDu5S5IUq0iKmTyj1qBcpsRP9Xc=;
 b=fg4NG9a3zyN7DUod7ARCaIVmHUh9ybeXtx7DPWtZBlPB2fN1+ybot0VnUGCRmiRz43
 kJqE4vCufezynWFB0BnttQ8wRUhNxWFGiojSZ5n8Mnq6wkMLyIb1ZvFtf1WO586/ikqO
 sXLHuwuutLi7HLs7cd88pHYYYvfTeKZC67tshOmyEVHZBF9tHzC8C3C34Inye80NfCkw
 Z+a88IsDrxpMzpfePA69If0JAob8dxnZGFI7dHvGLAliBiiAWcmNr8IegZLCUkPjWxDS
 ihSSzRt5YsxHj1qiFc/8EoczEJICwFl8Uxxc473REQwzIvTlQDUgN0XhZzXhG8sU6oe3
 QjPw==
X-Gm-Message-State: AOAM531CszU5X+5xIQDvlRKZnK7d9Pyix3ca980xIrrs5f6U4wApl2vq
 yd5bNzy7hQ03OTgYUQqnJKAj550okEh3zVi+gA0oLKy5kgZ8r4eLjPzBP3PT1hYXMlJV+YA2MWi
 1KB4sp7CHARTE4LY=
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr1500076wmj.183.1634592697652; 
 Mon, 18 Oct 2021 14:31:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl2A/KndyytaLruU6jFuGqSiBRMuU7AqTySUwwTmqjSziiyf+KSNmT+l3+U29EQt/QRXvAMQ==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr1500063wmj.183.1634592697498; 
 Mon, 18 Oct 2021 14:31:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id a5sm13506058wrn.71.2021.10.18.14.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:31:36 -0700 (PDT)
Date: Mon, 18 Oct 2021 17:31:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211018173052-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902113551.461632-5-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:
> Set -smp 1,maxcpus=288 to test for ACPI code that
> deal with CPUs with large APIC ID (>255).
> 
> PS:
> Test requires KVM and in-kernel irqchip support,
> so skip test if KVM is not available.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   - add dedicated test instead of abusing 'numamem' one
>   - add 'kvm' prefix to the test name
>       ("Michael S. Tsirkin" <mst@redhat.com>)
> v2:
>   - switch to qtest_has_accel() API
> 
> CC: thuth@redhat.com
> CC: lvivier@redhat.com
> ---
>  tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 51d3a4e239..1f6779da87 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_kvm_xapic(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_Q35;
> +    data.variant = ".xapic";
> +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> +                  " -numa node -numa node,memdev=ram0"
> +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_nosmm(void)
>  {
>      test_data data;


This causes an annoying message each time I run it:

qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)

what gives?


> @@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> +    const bool has_kvm = qtest_has_accel("kvm");
>      int ret;
>  
>      g_test_init(&argc, &argv, NULL);
> @@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        if (has_kvm) {
> +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> +        }
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> -- 
> 2.27.0


