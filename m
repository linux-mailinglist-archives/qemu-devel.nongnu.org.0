Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20215393A4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 17:09:02 +0200 (CEST)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3UT-0007g5-Gi
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw3R3-0005cE-TL
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw3Qz-0001P5-5Y
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654009522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qy/rlrdTz0BqFPYv3bCf/dvZ34jzqsHCJWUKQEd1BDk=;
 b=YfPbyYbAejlMvAiFRCELJwO3/KE5FWa+QQmRhWF6m+zFGwevMbD06AZRKCb7WjQ8rr/ZqJ
 XGdEHX7ePSX9KOUuqaO+U0eMlGHvZ/s2aaYWvBPyOj/MwgMi+27WkPsaY4+pv4XXAD5rjp
 j411dEG585qoQ1v1ms4TDMNPXRkC3NQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-iEUags9VNtupmLGHRoEpAg-1; Tue, 31 May 2022 11:05:21 -0400
X-MC-Unique: iEUags9VNtupmLGHRoEpAg-1
Received: by mail-oi1-f197.google.com with SMTP id
 t206-20020aca5fd7000000b0032b53f108d3so5063615oib.5
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 08:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qy/rlrdTz0BqFPYv3bCf/dvZ34jzqsHCJWUKQEd1BDk=;
 b=VmOypWrkWDqa+JBDidcaRKwUD9IuG2GAggvn2HeVCrcwrImHJVdjiqBAeMsLYAWjJ8
 A3ERCI6Sqiwtf9rf7FHrtSqtUNlyi5VoTPjwhgN3CHPMZRyOMVyZTNw/i+GSDtiP6ENC
 kmS39HPuWvSu6RPy27uAlDYfNapQQlvBTrtEAiICYeOHV/c9msrle0esgG1D4+l9tiCq
 Hlx5wLOObW97eV7Ul9wK+GtJapwKsBqnNzT9Rbj1ZakmIbfotxKYEpPEFnAZYNC17T8W
 hduhrXY+GbA6ebHkpz6iZU2d061aqlPXLDJrMoIvY5vnWZieI1OkA+jQ2eVSFgh/Ad9G
 H/pA==
X-Gm-Message-State: AOAM530QhFuE383xz+JWVXGBx0p43vj/XrDp1SKRk/SWe5cVo1XANM8m
 XwU+f7HtOTJZyWULfTZBKLMeCI+JNMMXHkn/llj8R0i3Thvkr1BYWPHJahuX0KRe65c/i/jPoLM
 zfMObkyViu3zCHQx1HnDEMbeFW+OmE1s=
X-Received: by 2002:a05:6870:5702:b0:e2:9f03:dae1 with SMTP id
 k2-20020a056870570200b000e29f03dae1mr14009076oap.201.1654009520397; 
 Tue, 31 May 2022 08:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLbR6tXMZLyFa/fJgC6WSt5yh/lysr12Z7uuEYV00lk/iqn30hgHDqiyAKLJaAT6GJFxh1BPctTGZtiZBBtSY=
X-Received: by 2002:a05:6870:5702:b0:e2:9f03:dae1 with SMTP id
 k2-20020a056870570200b000e29f03dae1mr14009007oap.201.1654009519118; Tue, 31
 May 2022 08:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205281039380.153682@anisinha-lenovo>
 <CAMDeoFVbjhKvAdNrn5xJ+g3Vk_vr48byPhP2KZpYQGCjEZNNsA@mail.gmail.com>
 <CAARzgwxgq8d2qPTvzm7wsYU0LfYY9D+euSo84+ieBCqQpmaEDw@mail.gmail.com>
In-Reply-To: <CAARzgwxgq8d2qPTvzm7wsYU0LfYY9D+euSo84+ieBCqQpmaEDw@mail.gmail.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Tue, 31 May 2022 17:05:08 +0200
Message-ID: <CAMDeoFV_0pm1enEe+gn5rbx-8_GA40dH0R3Qj8fwS2tKDkG7MA@mail.gmail.com>
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

On Tue, May 31, 2022 at 3:14 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, May 31, 2022 at 5:53 PM Julia Suvorova <jusual@redhat.com> wrote:
> >
> > On Sat, May 28, 2022 at 7:22 AM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > >
> > >
> > > On Fri, 27 May 2022, Julia Suvorova wrote:
> > >
> > > > The new test is run with a large number of cpus and checks if the
> > > > core_count field in smbios_cpu_test (structure type 4) is correct.
> > > >
> > > > Choose q35 as it allows to run with -smp > 255.
> > > >
> > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > ---
> > > >  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > > index 0ba9d749a5..f2464adaa0 100644
> > > > --- a/tests/qtest/bios-tables-test.c
> > > > +++ b/tests/qtest/bios-tables-test.c
> > > > @@ -100,6 +100,8 @@ typedef struct {
> > > >      smbios_entry_point smbios_ep_table;
> > > >      uint16_t smbios_cpu_max_speed;
> > > >      uint16_t smbios_cpu_curr_speed;
> > > > +    uint8_t smbios_core_count;
> > > > +    uint16_t smbios_core_count2;
> > > >      uint8_t *required_struct_types;
> > > >      int required_struct_types_len;
> > > >      QTestState *qts;
> > > > @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
> > > >
> > > >  static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > > >  {
> > > > +    uint8_t real_cc, expect_cc = data->smbios_core_count;
> > > > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
> > > >      uint16_t expect_speed[2];
> > > > -    uint16_t real;
> > >
> > > while you are at it, I suggest renaming this to real_speed or some such so
> > > that its better redeable.
> >
> > Ok
> >
> > > >      int offset[2];
> > > >      int i;
> > > >
> > > > @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > > >          }
> > > >      }
> > > >
> > > > +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> > > > +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> > > > +
> > > > +    if (expect_cc && (real_cc != expect_cc)) {
> > >
> > > I think better to say if ((expect_cc < 256) && (real_cc != expect_cc))
> >
> > The check is not whether it fits into the field, but whether the field
> > is initialized.
>
> yes so the real_cc will contain the actual value of core count only
> when the core count value is less than 256. This value should be the
> same as the expect_cc (the cc value we pass). Is this not what is
> being tested?

The real_cc should always be equal to expect_cc (which is 0xFF with
-smp 275). So if the core count is less than 256, this checks for the
actual core counter, and if it's over, it checks if real_cc is equal
to 0xFF, which eliminates several unnecessary comparisons. If we
didn't initialize expect_cc in the test, the value is undefined, and
we shouldn't check anything.

Best regards, Julia Suvorova.

> >
> > > > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > > > +                real_cc, expect_cc);
> > > > +        return false;
> > > > +    }
> > > > +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> > > > +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> > > > +                real_cc2, expect_cc2);
> > > > +        return false;
> > > > +    }
> > > > +
> > > >      return true;
> > > >  }
> > > >
> > > > @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
> > > >      free_test_data(&data);
> > > >  }
> > > >
> > > > +static void test_acpi_q35_tcg_core_count2(void)
> > > > +{
> > > > +    test_data data = {
> > > > +        .machine = MACHINE_Q35,
> > > > +        .variant = ".core-count2",
> > > > +        .required_struct_types = base_required_struct_types,
> > > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> > > > +        .smbios_core_count = 0xFF,
> > > > +        .smbios_core_count2 = 275,
> > > > +    };
> > > > +
> > > > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> > > > +    free_test_data(&data);
> > > > +}
> > > > +
> > > >  static void test_acpi_q35_tcg_bridge(void)
> > > >  {
> > > >      test_data data;
> > > > @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
> > > >          qtest_add_func("acpi/piix4/pci-hotplug/off",
> > > >                         test_acpi_piix4_no_acpi_pci_hotplug);
> > > >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > > > +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
> > >
> > > How about checking thread count as well in the same test or in a
> > > different test?
> >
> > Maybe a different test.
> >
> > Best regards, Julia Suvorova.
> >
> > > >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > > >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> > > >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> > > > --
> > > > 2.35.1
> > > >
> > > >
> > >
> >
>


