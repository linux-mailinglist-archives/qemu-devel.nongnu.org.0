Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FB53FC85
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:56:48 +0200 (CEST)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWtE-0000LE-0X
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyW98-000374-NI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyW91-0007JH-Oa
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654596521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn0pa1DsbMz4rbWGbUK/YCcSSQ95PW/TzTo/6L0WWHU=;
 b=dZkFy0Zx4oLmbpBtvh7qfW+P532Ubc2WVPHA5ZcvAfhoCUz0HfcFfFVjy/Wk4dCltTJRv8
 m1c9H39IXoi+CJZdN/4vUURdKVIJzl5v7DT7aFbMGe6DLZFSgo/veecnqgVqm3ekDhr23z
 T4LiEuJhj+MJYQhrd9O9enGEpMzCM5k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-k2hPXKUOMVi2n4bEkqp0YQ-1; Tue, 07 Jun 2022 06:08:38 -0400
X-MC-Unique: k2hPXKUOMVi2n4bEkqp0YQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t5-20020a056402524500b0042deddb84c2so12420133edd.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mn0pa1DsbMz4rbWGbUK/YCcSSQ95PW/TzTo/6L0WWHU=;
 b=FQmjgrctqkahikOavWJmotqNJ+eDnJhk8hummdq3W2CbWyej8mxKKuhXxkffVHBG/N
 3Ksap2HDzvSTswNWGexGZK/4ajE7wvKGPnWwjw3rk8RRFTt2qYNSYQnDmmSnqdCCwu1L
 Mb0xhVO7MDeQJlUBbezbQ97/w3PL+XnnnKHULjgyAGCToxtm0He04Aa330weT295Xzgt
 ToZhVkhwyMCpL0zU2yO5bMYms/4WbGWp850O7AuQmNwupz4E6NlkgAorTAxi7KHqMLer
 YW/Puu/yQAoBVvWjxiqx0aJL7NacbVpqpmfKDvocfI27Vn/NRBvfoqhgGXm74Amq3h3U
 dxUw==
X-Gm-Message-State: AOAM531IT/6zJ7gddXVgN//B4nL16tT7aE5OOfZgS0RhwFptFB/zNvdL
 Xy5uj2iIIvJtelZ4YJD38tem9851obJU9xzQ1aGAMhydt0uG4F62CQTWKghYJCcb1lJHTcfvpSM
 2oSWgM0S7w7QVb8s=
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id
 di21-20020a170906731500b00711db45af4cmr4656937ejc.412.1654596516836; 
 Tue, 07 Jun 2022 03:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb/IppuoJrEP5env+J/ioxTRSL8/2OjuDrMEn519oOv36XwzxMsxKn4P0sncRAoERPd4Dvgw==
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id
 di21-20020a170906731500b00711db45af4cmr4656909ejc.412.1654596516563; 
 Tue, 07 Jun 2022 03:08:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 rl7-20020a170907216700b006f3ef214e27sm7527992ejb.141.2022.06.07.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:08:36 -0700 (PDT)
Date: Tue, 7 Jun 2022 12:08:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
Message-ID: <20220607120835.0b9e9cfb@redhat.com>
In-Reply-To: <CAMDeoFXrgTbG846RfURzEHZv+W+t9LmJ-M-p1uSk07NW_UR9Dg@mail.gmail.com>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <20220602172007.27cd7e81@redhat.com>
 <CAMDeoFXrgTbG846RfURzEHZv+W+t9LmJ-M-p1uSk07NW_UR9Dg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 6 Jun 2022 13:38:57 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> On Thu, Jun 2, 2022 at 5:20 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Fri, 27 May 2022 18:56:50 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >  
> > > The new test is run with a large number of cpus and checks if the
> > > core_count field in smbios_cpu_test (structure type 4) is correct.
> > >
> > > Choose q35 as it allows to run with -smp > 255.
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
> > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 0ba9d749a5..f2464adaa0 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -100,6 +100,8 @@ typedef struct {
> > >      smbios_entry_point smbios_ep_table;
> > >      uint16_t smbios_cpu_max_speed;
> > >      uint16_t smbios_cpu_curr_speed;
> > > +    uint8_t smbios_core_count;
> > > +    uint16_t smbios_core_count2;
> > >      uint8_t *required_struct_types;
> > >      int required_struct_types_len;
> > >      QTestState *qts;
> > > @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
> > >
> > >  static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > >  {
> > > +    uint8_t real_cc, expect_cc = data->smbios_core_count;  
> >
> > %s/expect/expected/
> > also I'd s/real_cc/core_count/
> >  
> > > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;  
> > ditto
> >  
> > >      uint16_t expect_speed[2];
> > > -    uint16_t real;
> > >      int offset[2];
> > >      int i;
> > >
> > > @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > >          }
> > >      }
> > >
> > > +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> > > +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> > > +
> > > +    if (expect_cc && (real_cc != expect_cc)) {
> > > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > > +                real_cc, expect_cc);
> > > +        return false;  
> >
> > since you are rewriting it anyways, how about
> > if (expect_cc) {
> >   g_assert_cmpuint(...)
> > }
> >
> > instead of printing/propagating error  
> 
> That works. But I still need to return something, unless you want to
> change the original code too.

just change it, as it makes code simpler (maybe a separate patch
that should go before this one)

> 
> Best regards, Julia Suvorova.
> 
> > > +    }
> > > +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> > > +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> > > +                real_cc2, expect_cc2);
> > > +        return false;
> > > +    }
> > > +
> > >      return true;
> > >  }
> > >
> > > @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
> > >      free_test_data(&data);
> > >  }
> > >
> > > +static void test_acpi_q35_tcg_core_count2(void)
> > > +{
> > > +    test_data data = {
> > > +        .machine = MACHINE_Q35,
> > > +        .variant = ".core-count2",
> > > +        .required_struct_types = base_required_struct_types,
> > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> > > +        .smbios_core_count = 0xFF,
> > > +        .smbios_core_count2 = 275,
> > > +    };
> > > +
> > > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> > > +    free_test_data(&data);
> > > +}
> > > +
> > >  static void test_acpi_q35_tcg_bridge(void)
> > >  {
> > >      test_data data;
> > > @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
> > >          qtest_add_func("acpi/piix4/pci-hotplug/off",
> > >                         test_acpi_piix4_no_acpi_pci_hotplug);
> > >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > > +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
> > >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> > >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);  
> >  
> 


