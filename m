Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B33BF9AC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:03:24 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SkV-0002Ai-5c
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1ShD-0008Vs-ET
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Sh8-0003YT-Q7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625745592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VNr6C2LAZApcv+VRFCdxGV4oPnlknlRzvQEwAwQqmfs=;
 b=RsvdoW5hmd7QYm90PbUlf4zmIoJrqB19uLu3lTZW9StQ/Wsb/47ygHfh61ekdUsNl9iCrM
 kztqeQ+kJufMz+fxaNSuTcllLbt9WGgH+Vr8GbB2blpRUptvT4Jp9+zHtNSlas9icPNLdD
 0z1/duAV0RS8aDbZHkpO5h38m+a8oYE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-icRqadmlNsCBLbTPwiT7cQ-1; Thu, 08 Jul 2021 07:59:51 -0400
X-MC-Unique: icRqadmlNsCBLbTPwiT7cQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso2297991wmj.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VNr6C2LAZApcv+VRFCdxGV4oPnlknlRzvQEwAwQqmfs=;
 b=kGhCwOTBivWixmuKK+nUfcOXi/HPHYLzka4xVni1NmOEEZf4K3GEyCIHuqS0mITj4M
 fjz/JmfjfRNfPeyNSFBGbCkQqE0j53WUsyyzDBOmbqUL6jIsooGUaZortnrrgMTxKlHT
 oW1yw/pGAHS8uqYCW0clkmJFwKghuut9GwmibIV9D17MHoC+f/IJFovNttg++KgB6vp+
 FLirqRPi5MUxUBuR1t5sntZV+3HqS08Ioyd2d9NSY5naEZ29xdRaPMlI8y1JqXM9Yqfk
 HEplyiQrju9cu04kXNEIg35IsBDbMwDhlR6mmPf2hxfGhfpwSqUY//mL1xGSh57UD9bX
 AX1g==
X-Gm-Message-State: AOAM531JJViWt8KzgnzwO9uJIzfNMa6Z8pSbfd837ehhw7SgzDHvLwlV
 6G9QuibR6GZT+086unaVS6GHwwBPfBZ/JyKxu8mz3pV5YlxYpP3P+FV5bhoip/mITYcYP1yJGC7
 IxqhflW/3rp1i5vg=
X-Received: by 2002:a5d:5189:: with SMTP id k9mr35327808wrv.250.1625745590742; 
 Thu, 08 Jul 2021 04:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8ZNri89M4cOw66j1F1tf4fe5Orxoo67KzsCEK8Dfvs8fuJMj0ixv/P8AftcVZlj4H+oXboA==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr35327782wrv.250.1625745590490; 
 Thu, 08 Jul 2021 04:59:50 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id p11sm1073062wro.78.2021.07.08.04.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 04:59:48 -0700 (PDT)
Date: Thu, 8 Jul 2021 07:59:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 04/53] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20210708075853-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-5-imammedo@redhat.com>
 <20210702104441-mutt-send-email-mst@kernel.org>
 <20210708111833.4e116fe4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708111833.4e116fe4@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

On Thu, Jul 08, 2021 at 11:18:33AM +0200, Igor Mammedov wrote:
> On Fri, 2 Jul 2021 10:45:37 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Jun 25, 2021 at 05:17:28AM -0400, Igor Mammedov wrote:
> > > Set -smp 1,maxcpus=288 to test for ACPI code that
> > > deal with CPUs with large APIC ID (>255).
> > > 
> > > PS:
> > > Test requires KVM and in-kernel irqchip support,
> > > so skip test if KVM is not available.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > Why don't we add a new test? Why change an existing one?
> > And I'd prefer kvm in the name since it's kvm specific.
> > E.g. kvmnumamem.
> 
> I've opted for changing existing one as it practically
> tests the same ACPI code in 'pc' variant, so changing
> q35 'duplicate' variant to handle more than 255 cpus
> seemed reasonable to me.
> 
> Anyways, I don't have any preferences here so I can
> easily change that to a new testcase if you still
> prefer it.


the reason I do is because this way we don't drop the test on non
kvm hosts.
 
> as for name, I'll amend it on test respin.
>  
> > 
> > > ---
> > > v2:
> > >   - switch to qtest_has_accel() API
> > > 
> > > CC: thuth@redhat.com
> > > CC: lvivier@redhat.com
> > > ---
> > >  tests/qtest/bios-tables-test.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 51d3a4e239..ca496819fa 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -1021,7 +1021,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
> > >      free_test_data(&data);
> > >  }
> > >  
> > > -static void test_acpi_q35_tcg_numamem(void)
> > > +static void test_acpi_q35_kvm_numamem(void)
> > >  {
> > >      test_data data;
> > >  
> > > @@ -1029,7 +1029,9 @@ static void test_acpi_q35_tcg_numamem(void)
> > >      data.machine = MACHINE_Q35;
> > >      data.variant = ".numamem";
> > >      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > > -                  " -numa node -numa node,memdev=ram0", &data);
> > > +                  " -numa node -numa node,memdev=ram0"
> > > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288"
> > > +                   , &data);
> > >      free_test_data(&data);
> > >  }
> > >  
> > > @@ -1506,6 +1508,7 @@ static void test_acpi_oem_fields_virt(void)
> > >  int main(int argc, char *argv[])
> > >  {
> > >      const char *arch = qtest_get_arch();
> > > +    const bool has_kvm = qtest_has_accel("kvm");
> > >      int ret;
> > >  
> > >      g_test_init(&argc, &argv, NULL);
> > > @@ -1536,7 +1539,6 @@ int main(int argc, char *argv[])
> > >          qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> > >          qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> > >          qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> > > -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> > >          qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> > >          qtest_add_func("acpi/piix4/smm-compat",
> > >                         test_acpi_piix4_tcg_smm_compat);
> > > @@ -1561,6 +1563,9 @@ int main(int argc, char *argv[])
> > >          if (strcmp(arch, "x86_64") == 0) {
> > >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> > >          }
> > > +        if (has_kvm) {
> > > +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_kvm_numamem);
> > > +        }
> > >      } else if (strcmp(arch, "aarch64") == 0) {
> > >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> > >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > > -- 
> > > 2.27.0  
> > 


