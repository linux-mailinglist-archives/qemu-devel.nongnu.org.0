Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400F4332E5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:54:19 +0200 (CEST)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclp4-00025v-3D
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcljZ-0000Sl-9T
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcljU-0006Yg-RJ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634636910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCozy3Hl1ZzIdKk3HCUfrnR+8vtCGsDUfKQA6CSlkKo=;
 b=DO9EHfqfWOVpn7pf1vYSzUBY/BG2SdRUcsr6HTLdHeOTtWbiN0CulSJCQF8hy+mu6m64Fw
 yW0CTWYALENAz9LFVhVsMoJme50143WvuEwHaZg8wrugRywTCb45QH7A4gLkD1iiJ+0/57
 P5P0IpZtwDirx4SevV3LfUvfANRx/DI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-ZHeraZg3POOHoi8Kc5OSmw-1; Tue, 19 Oct 2021 05:48:29 -0400
X-MC-Unique: ZHeraZg3POOHoi8Kc5OSmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so926066wmj.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TCozy3Hl1ZzIdKk3HCUfrnR+8vtCGsDUfKQA6CSlkKo=;
 b=b9ysSya9IrWecjdQDsABxRmcVGIBaxOpZeSbjdsi1vDIF+u8LADV7deQGmAi1mYKOA
 MTbnmNGK39Z+jc/AxhvtA34dElv/W1GcLxFxlOiJ69EPpqGD10xj531BEw2/T5tb+Gry
 nIqcH1uS6PPlw4+CcV1nxJLKkoQlmobsPWd2eEmlxlRi2aarWNusx74HfQIJnE62P78c
 FwzTgrjZHddxbWEIY/vGf2Tj0lobfHmKY2Olv7judsdfiEpAnK8QqgjGXjjdgONn0AkD
 s3I194dtvE3v7kjGVSRvvFnOpRFO1CRhsS2P4v11+Q+iKivNXfRk9U9SOp2YLfKwTm6V
 0sAw==
X-Gm-Message-State: AOAM530jiE3X877OmIfHajA12muzJzqHkoInHiFMJJJD3U/EqoScxDVe
 vl1n54iVVhgclDb0b+j35DsGjhgQFcRffJQl0ouocFqdzDCjRXb8ioEp4bsAA5JHl0CoIajz1p2
 hmxEM+C4HEl6jUAA=
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr12172325wrp.100.1634636908078; 
 Tue, 19 Oct 2021 02:48:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9bQDBcR/K95euf8yznMSHgPFvfNUyV243jaGGL66bH13zdSFqU2ZRy3n9wN3c7OAWWxH+EA==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr12172303wrp.100.1634636907883; 
 Tue, 19 Oct 2021 02:48:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n68sm1724177wmn.13.2021.10.19.02.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:48:27 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:48:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211019114825.1464da19@redhat.com>
In-Reply-To: <20211018173052-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Oct 2021 17:31:33 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:
> > Set -smp 1,maxcpus=288 to test for ACPI code that
> > deal with CPUs with large APIC ID (>255).
> > 
> > PS:
> > Test requires KVM and in-kernel irqchip support,
> > so skip test if KVM is not available.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   - add dedicated test instead of abusing 'numamem' one
> >   - add 'kvm' prefix to the test name
> >       ("Michael S. Tsirkin" <mst@redhat.com>)
> > v2:
> >   - switch to qtest_has_accel() API
> > 
> > CC: thuth@redhat.com
> > CC: lvivier@redhat.com
> > ---
> >  tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 51d3a4e239..1f6779da87 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
> >      free_test_data(&data);
> >  }
> >  
> > +static void test_acpi_q35_kvm_xapic(void)
> > +{
> > +    test_data data;
> > +
> > +    memset(&data, 0, sizeof(data));
> > +    data.machine = MACHINE_Q35;
> > +    data.variant = ".xapic";
> > +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > +                  " -numa node -numa node,memdev=ram0"
> > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_tcg_nosmm(void)
> >  {
> >      test_data data;  
> 
> 
> This causes an annoying message each time I run it:
> 
> qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
> 
> what gives?

it depends on kernel, see kvm_recommended_vcpus().

We probably should bump it on upstream kernel side
(it's much more than that in RHEL8).

Is there anything that prevents bumping upstream kernel limits?

> > @@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
> >  int main(int argc, char *argv[])
> >  {
> >      const char *arch = qtest_get_arch();
> > +    const bool has_kvm = qtest_has_accel("kvm");
> >      int ret;
> >  
> >      g_test_init(&argc, &argv, NULL);
> > @@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
> >          if (strcmp(arch, "x86_64") == 0) {
> >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> >          }
> > +        if (has_kvm) {
> > +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> > +        }
> >      } else if (strcmp(arch, "aarch64") == 0) {
> >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > -- 
> > 2.27.0  
> 


