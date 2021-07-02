Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DD3BA251
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:47:15 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKRm-0002xT-61
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKQR-00024e-Mr
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKQL-0002zC-7N
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625237144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQ9mgpqPPTmN1+zuFiZPGMycxLomIBmpexLmypyZ0O0=;
 b=V4eMkJOzzU9o3hWrHvHKrYTJrfGFub8L0u2qHvIIZ5vFYffvmJsIZpOHhxZkeXNMdUq/rf
 ERY1dVwZqAlVaHk0Yg6LgU3xvlgSbY92PbONmOJLBkuLhdLAwowpQ93EGR0zlv1Oko4L+q
 gh+/sW8o5xJ0fFRwrpnMZoNglFwHo9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-t4KLImTvOHKVWMmUurFY4w-1; Fri, 02 Jul 2021 10:45:43 -0400
X-MC-Unique: t4KLImTvOHKVWMmUurFY4w-1
Received: by mail-wr1-f71.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so1919712wrs.11
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQ9mgpqPPTmN1+zuFiZPGMycxLomIBmpexLmypyZ0O0=;
 b=UJjRqPXLr+RBg/0at4Lk2gRN/ZPzpCIJdJz16P4EvwouufELE2BuYoe0orZrDjmNLO
 gHSnbzVuNMYkWg3pY/80aw/LH7HCs4g/ofTFiyUO5lrj2mFUhQs6UudoWGWrdqkLwDM3
 +ooYDl7dMA+dC24HKDsVeRzKwfUusUUAWNU0+swoOpht1PsML62JXlSdgHDCXcyc40i+
 gl9yu8MUIkhiIJpp3EEsDfXgF08A3oYjxM4wIIU9Lru6GbYXz092uapTROLvhF2IYhtu
 0JdutKJ0UtWZBlovdx23COU7L5ZgLhoMvSlVHe/Vq1usMV3pZO3SRbeBem5rSrmG452V
 02IQ==
X-Gm-Message-State: AOAM530ZM9IAQgT/DgQ9XuJcYXNqp+n8Oy218P0OhSOjav5uXLEOEi9G
 yi7JY/ZHJGRLmLYcY4PQhp2dPbeiAsn+zUfU7Lj7X0p9WkiUx96zKGczlJINbEA2ffROkwN+OD7
 A7Lvfw0uG4xgqtVw=
X-Received: by 2002:a1c:e1c6:: with SMTP id y189mr5870459wmg.43.1625237141959; 
 Fri, 02 Jul 2021 07:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+GlHGnOR0t5bPHTRy7rnHlM0duQoyHj+LLQ4pS+f3b0Od26+GAazWUQfdL5tdKUEIx+FnVw==
X-Received: by 2002:a1c:e1c6:: with SMTP id y189mr5870441wmg.43.1625237141740; 
 Fri, 02 Jul 2021 07:45:41 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id b15sm4248231wrr.27.2021.07.02.07.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 07:45:40 -0700 (PDT)
Date: Fri, 2 Jul 2021 10:45:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 04/53] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20210702104441-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-5-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625091818.1047980-5-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 05:17:28AM -0400, Igor Mammedov wrote:
> Set -smp 1,maxcpus=288 to test for ACPI code that
> deal with CPUs with large APIC ID (>255).
> 
> PS:
> Test requires KVM and in-kernel irqchip support,
> so skip test if KVM is not available.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Why don't we add a new test? Why change an existing one?
And I'd prefer kvm in the name since it's kvm specific.
E.g. kvmnumamem.


> ---
> v2:
>   - switch to qtest_has_accel() API
> 
> CC: thuth@redhat.com
> CC: lvivier@redhat.com
> ---
>  tests/qtest/bios-tables-test.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 51d3a4e239..ca496819fa 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1021,7 +1021,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
>      free_test_data(&data);
>  }
>  
> -static void test_acpi_q35_tcg_numamem(void)
> +static void test_acpi_q35_kvm_numamem(void)
>  {
>      test_data data;
>  
> @@ -1029,7 +1029,9 @@ static void test_acpi_q35_tcg_numamem(void)
>      data.machine = MACHINE_Q35;
>      data.variant = ".numamem";
>      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> -                  " -numa node -numa node,memdev=ram0", &data);
> +                  " -numa node -numa node,memdev=ram0"
> +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288"
> +                   , &data);
>      free_test_data(&data);
>  }
>  
> @@ -1506,6 +1508,7 @@ static void test_acpi_oem_fields_virt(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> +    const bool has_kvm = qtest_has_accel("kvm");
>      int ret;
>  
>      g_test_init(&argc, &argv, NULL);
> @@ -1536,7 +1539,6 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>          qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>          qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>          qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>          qtest_add_func("acpi/piix4/smm-compat",
>                         test_acpi_piix4_tcg_smm_compat);
> @@ -1561,6 +1563,9 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        if (has_kvm) {
> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_kvm_numamem);
> +        }
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> -- 
> 2.27.0


