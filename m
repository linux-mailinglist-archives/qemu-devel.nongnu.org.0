Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BF539121
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:52:06 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1Lx-0003Kr-DP
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw0u1-0003KX-Bo
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw0tx-0005EM-EB
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653999787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3acN55Ish8/qCiLh224zH/aR3zXsczFq8K/A7x0O/0c=;
 b=XdtCNOaMsBcFqTlbIGBeHxCNQ5q4jevgrDMP1ai9ZNooJIkJP+mdRV/L++XYCMpD8/lcle
 byu3Kxgi43t/3ld3Alp8LmLZq+/aZAO1h0ILmiV25M3ROICmlDBP7svNVwu9Bozx6gyoQe
 NwekDzq03bdJxCVLCw5H5YmHFNih4kg=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-877lXy1mOtaZfnnX9jN7fg-1; Tue, 31 May 2022 08:23:04 -0400
X-MC-Unique: 877lXy1mOtaZfnnX9jN7fg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-e2b879af65so9303821fac.20
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3acN55Ish8/qCiLh224zH/aR3zXsczFq8K/A7x0O/0c=;
 b=FoJZuDiaPmKaLf0KSNaz0Ii4Y2mp1mKbkzFte3OQjTrJZFZXYP9hC42qSZXwJpyit+
 PryDCxYcQ9LF11aAZpSJD/7dQmpoB5D0HIvyP1sTUUzkx1MulDsucd9QL/71uXdKykPO
 6wtoXzq9g4GoEctaNxAGtHgDvqMHX4+xB/2mPHoAf0EkZXAYlnL2dFWyglEUS9cxREF1
 i3TMQAokNa0OfCZpHJfLmcTCKIiVzXV0P42E9BJfqe2jEGG1IX+nReuneYr7TEzM+ZC3
 2/zkG9A7ad6zDUUNeLjbgNqqi1Q2uHY+ffTDEXXqolG6nvBxt3ipwPRnqkX7ooOh0PWE
 hgrg==
X-Gm-Message-State: AOAM5322O2Fx0iDulzFe/IGQl39Id8mB5/dAmu5o/yExVwoJeLcU9eAa
 wxOHiKX4TCf6ScnRFDhk2M66LBuPIeCZZfLu0XSzmSzuENP18Ev+ojl+Qey2F8O4WD5gFOwKteC
 tN9El6wGQGxgtpcb4LbtwBWjPgda02ZE=
X-Received: by 2002:a9d:c24:0:b0:608:c7a1:5908 with SMTP id
 33-20020a9d0c24000000b00608c7a15908mr22964999otr.88.1653999783575; 
 Tue, 31 May 2022 05:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb6ORXQFlfiV6jt3I0SLCdyh5z3znmPtBzYahb4IN+3FcxBSkGoumjbxU0ZKs66uOP+8z7EDAIKiImPr1PUf4=
X-Received: by 2002:a9d:c24:0:b0:608:c7a1:5908 with SMTP id
 33-20020a9d0c24000000b00608c7a15908mr22964985otr.88.1653999783325; Tue, 31
 May 2022 05:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205281039380.153682@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2205281039380.153682@anisinha-lenovo>
From: Julia Suvorova <jusual@redhat.com>
Date: Tue, 31 May 2022 14:22:52 +0200
Message-ID: <CAMDeoFVbjhKvAdNrn5xJ+g3Vk_vr48byPhP2KZpYQGCjEZNNsA@mail.gmail.com>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
To: Ani Sinha <ani@anisinha.ca>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, May 28, 2022 at 7:22 AM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Fri, 27 May 2022, Julia Suvorova wrote:
>
> > The new test is run with a large number of cpus and checks if the
> > core_count field in smbios_cpu_test (structure type 4) is correct.
> >
> > Choose q35 as it allows to run with -smp > 255.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 0ba9d749a5..f2464adaa0 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -100,6 +100,8 @@ typedef struct {
> >      smbios_entry_point smbios_ep_table;
> >      uint16_t smbios_cpu_max_speed;
> >      uint16_t smbios_cpu_curr_speed;
> > +    uint8_t smbios_core_count;
> > +    uint16_t smbios_core_count2;
> >      uint8_t *required_struct_types;
> >      int required_struct_types_len;
> >      QTestState *qts;
> > @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
> >
> >  static bool smbios_cpu_test(test_data *data, uint32_t addr)
> >  {
> > +    uint8_t real_cc, expect_cc = data->smbios_core_count;
> > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
> >      uint16_t expect_speed[2];
> > -    uint16_t real;
>
> while you are at it, I suggest renaming this to real_speed or some such so
> that its better redeable.

Ok

> >      int offset[2];
> >      int i;
> >
> > @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> >          }
> >      }
> >
> > +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> > +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> > +
> > +    if (expect_cc && (real_cc != expect_cc)) {
>
> I think better to say if ((expect_cc < 256) && (real_cc != expect_cc))

The check is not whether it fits into the field, but whether the field
is initialized.

> > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > +                real_cc, expect_cc);
> > +        return false;
> > +    }
> > +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> > +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> > +                real_cc2, expect_cc2);
> > +        return false;
> > +    }
> > +
> >      return true;
> >  }
> >
> > @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_q35_tcg_core_count2(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".core-count2",
> > +        .required_struct_types = base_required_struct_types,
> > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> > +        .smbios_core_count = 0xFF,
> > +        .smbios_core_count2 = 275,
> > +    };
> > +
> > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_tcg_bridge(void)
> >  {
> >      test_data data;
> > @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
> >          qtest_add_func("acpi/piix4/pci-hotplug/off",
> >                         test_acpi_piix4_no_acpi_pci_hotplug);
> >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
>
> How about checking thread count as well in the same test or in a
> different test?

Maybe a different test.

Best regards, Julia Suvorova.

> >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> > --
> > 2.35.1
> >
> >
>


