Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63D43357A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:09:50 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnwC-000729-UO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnY1-0001UO-4O
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnXx-0005Ox-Nn
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634643885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MTl7gUEKm1cWJXeSR37GXErL3qD5+V2Dz4E6s6z5KXw=;
 b=Sf1F7kf4UcmRLCqa4IY3u3DEnjKXO+EWs1xIyKbaY8EK92Xa1gwXOWehjy0ZTO7jPhy3PD
 BjIoViWcgQUblBMEAi2GehVA3jyWlio/ddabIO7mkg5ziWqHEDC1vtOWOIuITCaYbk2Cwv
 sl0CbduU6npF+TVH0NlUT/o/QjyTvpQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-bO2WYLf1PiaqTyxxoR15xg-1; Tue, 19 Oct 2021 07:44:43 -0400
X-MC-Unique: bO2WYLf1PiaqTyxxoR15xg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a20-20020a1c9814000000b0032311c7fc54so146890wme.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MTl7gUEKm1cWJXeSR37GXErL3qD5+V2Dz4E6s6z5KXw=;
 b=oztp/bhsmBZZgqbMTiXOChzDeib4Q9PyPqlWHgNdrvLkilQFBY22ysN0rIK5EVtvwu
 wSce4iHttsk3utYxm8pNeLBYfsl+yo89sCG49LzNUMURw6V+DQg2+c3FkPpm5JzBcH3Y
 quLHEYEEnAXKV9kSjkUzHJq0qNccdugc9MMm/WKkF019cwRx05MvlHXkOm78qN21tf22
 w4mKuQGgLQMOZooOWzfS8pSUdLIElxhKtmYiHYWsvWz6H4vXO1KVTCQpQOd8doMRjUPi
 xkHE4tNWBFxgyaB3I6683wQhycaVitfbw3Ys5I1Wcne1sZ62p6O69r1Dj0B1ZnZWuXtY
 5Xpg==
X-Gm-Message-State: AOAM5322ap2Jsevt6+Q4UJCwB5SXmukfJZCp1IUr7sgi+n7H2EBHx33Y
 bgTd2g6O2u/hAvv3P95IOlr2IWhAB363SvmMf8XTPn79eAKlL1VMkvhzzfVd/g8OIrgCYXfuaXM
 4TOFj7wxZ9caHRPo=
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr5428748wmr.194.1634643882602; 
 Tue, 19 Oct 2021 04:44:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxABudBdBhMVniAj6hKpu3zuKz5Zq7Bn1GKsCMg5QsNt9LEGu+95unTqxXaRuWQjMGZwYsO5g==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr5428728wmr.194.1634643882378; 
 Tue, 19 Oct 2021 04:44:42 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id k17sm15167990wrq.7.2021.10.19.04.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:44:41 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:44:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211019074422-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
 <20211019114825.1464da19@redhat.com>
 <20211019061656-mutt-send-email-mst@kernel.org>
 <20211019133624.5cd5ae3d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019133624.5cd5ae3d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 01:36:24PM +0200, Igor Mammedov wrote:
> On Tue, 19 Oct 2021 06:23:40 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Oct 19, 2021 at 11:48:25AM +0200, Igor Mammedov wrote:
> > > On Mon, 18 Oct 2021 17:31:33 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:  
> > > > > Set -smp 1,maxcpus=288 to test for ACPI code that
> > > > > deal with CPUs with large APIC ID (>255).
> > > > > 
> > > > > PS:
> > > > > Test requires KVM and in-kernel irqchip support,
> > > > > so skip test if KVM is not available.
> > > > > 
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > ---
> > > > > v3:
> > > > >   - add dedicated test instead of abusing 'numamem' one
> > > > >   - add 'kvm' prefix to the test name
> > > > >       ("Michael S. Tsirkin" <mst@redhat.com>)
> > > > > v2:
> > > > >   - switch to qtest_has_accel() API
> > > > > 
> > > > > CC: thuth@redhat.com
> > > > > CC: lvivier@redhat.com
> > > > > ---
> > > > >  tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
> > > > >  1 file changed, 17 insertions(+)
> > > > > 
> > > > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > > > index 51d3a4e239..1f6779da87 100644
> > > > > --- a/tests/qtest/bios-tables-test.c
> > > > > +++ b/tests/qtest/bios-tables-test.c
> > > > > @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
> > > > >      free_test_data(&data);
> > > > >  }
> > > > >  
> > > > > +static void test_acpi_q35_kvm_xapic(void)
> > > > > +{
> > > > > +    test_data data;
> > > > > +
> > > > > +    memset(&data, 0, sizeof(data));
> > > > > +    data.machine = MACHINE_Q35;
> > > > > +    data.variant = ".xapic";
> > > > > +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > > > > +                  " -numa node -numa node,memdev=ram0"
> > > > > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> > > > > +    free_test_data(&data);
> > > > > +}
> > > > > +
> > > > >  static void test_acpi_q35_tcg_nosmm(void)
> > > > >  {
> > > > >      test_data data;    
> > > > 
> > > > 
> > > > This causes an annoying message each time I run it:
> > > > 
> > > > qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
> > > > 
> > > > what gives?  
> > > 
> > > it depends on kernel, see kvm_recommended_vcpus().
> > > 
> > > We probably should bump it on upstream kernel side
> > > (it's much more than that in RHEL8).
> > > 
> > > Is there anything that prevents bumping upstream kernel limits?  
> > 
> > what should we do with the annoying warning though?
> 
> I'd leave it alone.
> What do you suggest?
>  

reduce the value so a typical system does not trigger it?

> > > > > @@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
> > > > >  int main(int argc, char *argv[])
> > > > >  {
> > > > >      const char *arch = qtest_get_arch();
> > > > > +    const bool has_kvm = qtest_has_accel("kvm");
> > > > >      int ret;
> > > > >  
> > > > >      g_test_init(&argc, &argv, NULL);
> > > > > @@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
> > > > >          if (strcmp(arch, "x86_64") == 0) {
> > > > >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> > > > >          }
> > > > > +        if (has_kvm) {
> > > > > +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> > > > > +        }
> > > > >      } else if (strcmp(arch, "aarch64") == 0) {
> > > > >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> > > > >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > > > > -- 
> > > > > 2.27.0    
> > > >   
> > 


