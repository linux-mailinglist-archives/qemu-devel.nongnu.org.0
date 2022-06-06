Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F45453E43D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:44:59 +0200 (CEST)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBAH-0004HR-6C
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyB4l-0003HE-9G
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyB4i-00022R-RW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654515551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dkJ/50IT1chfIPJoiIuxaMeoiGaeAPagSaxshNDN5s=;
 b=FOJhjLxozGsJVeDiS/o0+gZgshrgvXbx7NmW4GCFDo7xnqQWD8EEjvsi4OlCZYGdNCWxLr
 pyPDrxK1q6TZ1KHlON0mx6VcW5lpoNfPRT6rvt7gv5I3fgcnbHdA+o4ALaR6h/DaCEEPxN
 hqgh05OlA1lA33PUMdW+/4LyzmAlwxY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-003ZmLuCNhui7Cn05EWz5g-1; Mon, 06 Jun 2022 07:39:10 -0400
X-MC-Unique: 003ZmLuCNhui7Cn05EWz5g-1
Received: by mail-oi1-f198.google.com with SMTP id
 bf2-20020a056808190200b0032ea485bb7dso486641oib.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 04:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dkJ/50IT1chfIPJoiIuxaMeoiGaeAPagSaxshNDN5s=;
 b=ctZ85gmn/NSc3rs6rGoB3ntxn/WKqhWpe/7eFYc/Q/pVqBY9EOQkEI9Yx/6WL4NgFC
 tDgwwq4an8Mb/lvtvzsIo2ovH+puiubAt97j9Fp31WwVefRPxwXWDZG2Ppik5ICr9GLi
 T3/xGww0NvQVrX5rm++KTMw4VN0GH/7zWtnIIxCcCHw11OJ7e+PUXqnWdQ/fdGohw81M
 FZZqquSZGHzQDurFqjFl8dGbbFZ5bHVpPIL/NUkWZwYw2cuNIt+WktiAb+kHEeanIGaY
 +Z1NYXF2KOAxSDBjodbAhUusz2OpqpyLcvqOwhnMUhZtvsHOWwig6ZypmtcD7A2vGX3r
 6Fug==
X-Gm-Message-State: AOAM533fVXa+Hv0/1QY302sMxkBIynRmrSMQ2Gxknubnwb7BDyjdO+dp
 DK8/Qbg9phuGYqSJjodlOtq03qYxCbTLdpEeQEXEKeMEQxkbMJV5nNdAjZYgeROK0OmGilB5ApJ
 FeXhroaiGooQr/9VGEOBcjZQ96FLXnNA=
X-Received: by 2002:a05:6830:2708:b0:606:621f:b634 with SMTP id
 j8-20020a056830270800b00606621fb634mr10091740otu.1.1654515548621; 
 Mon, 06 Jun 2022 04:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0y4j+l7Mc9ii4ZcW36LRfJhf+fOwjogoegD1tzzh1hzpYDOtjGyHzg2iSRIbYCAIxy4XnScVgls8LFnzJooI=
X-Received: by 2002:a05:6830:2708:b0:606:621f:b634 with SMTP id
 j8-20020a056830270800b00606621fb634mr10091733otu.1.1654515548325; Mon, 06 Jun
 2022 04:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <20220602172007.27cd7e81@redhat.com>
In-Reply-To: <20220602172007.27cd7e81@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Mon, 6 Jun 2022 13:38:57 +0200
Message-ID: <CAMDeoFXrgTbG846RfURzEHZv+W+t9LmJ-M-p1uSk07NW_UR9Dg@mail.gmail.com>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
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

On Thu, Jun 2, 2022 at 5:20 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 27 May 2022 18:56:50 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
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
>
> %s/expect/expected/
> also I'd s/real_cc/core_count/
>
> > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
> ditto
>
> >      uint16_t expect_speed[2];
> > -    uint16_t real;
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
> > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > +                real_cc, expect_cc);
> > +        return false;
>
> since you are rewriting it anyways, how about
> if (expect_cc) {
>   g_assert_cmpuint(...)
> }
>
> instead of printing/propagating error

That works. But I still need to return something, unless you want to
change the original code too.

Best regards, Julia Suvorova.

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
> >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>


