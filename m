Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18DE61506D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:19:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprva-0007Fg-T1; Tue, 01 Nov 2022 10:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprvX-0007FB-Bo
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprvV-0008P3-IN
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667311656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fw1tljSv2KljHszzNa3zXIz3qSAxF59RDJHuDtAN5lQ=;
 b=I9vMXB4CIZcFjcpviIiwXoMwz164vi2ggPzg8+U30va/nqj1j3MRjmPO3zDu8tEjqfb09u
 uWoea9InFfbGho8TIp3hS428X000gGSaUi9w0tV/ry337XekKpit4quNQkP8Q2PPspYd3R
 yTVaH5ciz+tixuA46h0dtxuoN4TCBUw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-6itF98GuPISP9eOmJj9roA-1; Tue, 01 Nov 2022 10:07:34 -0400
X-MC-Unique: 6itF98GuPISP9eOmJj9roA-1
Received: by mail-qk1-f200.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso12363761qkp.20
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fw1tljSv2KljHszzNa3zXIz3qSAxF59RDJHuDtAN5lQ=;
 b=70ZjToUAOqvECkWNWQbEyWqGnw6ti1kPx0RaenwjvdHtYvC5+NqERIcA5m1VePJ1pE
 ylGa0IkskXdJfHvw129GMKNZRUz9I52KrbmoE4XCblVSu/Cv/YtOhXZmeopZvns9NZpY
 4oIUjCIqyoilOGXe/VndcJv5HIMO7rL0LuKWPmxqW5VdgWaq1i1nuhTH8oSkrdEeXLtc
 wY5CCTRFYzZPCd1gwOdq/SgmD90cG8mRtJgSWRA4j/+v+80XsVN1wrxvSM+Q+zvM7jXy
 ec7mxL8/lEhFqt3ZcFePeE8rtmLGm2Xfaw/Z8Ar1Lm0iAY24rVkKpJQGMs8eUNGae3v2
 EBiA==
X-Gm-Message-State: ACrzQf3JjhSRvnqUEnUz+N7E5W4HlQt1BoUfq15bVOJnwlfZq90SzZq1
 hg79epfItTEO8gf2UwdstWK+5+vHuDIWEjlXkOkhd6XANSev3GxEmrZcSy5K4ZtSWU45bpQ1zVR
 kCfAK7QWYiyMhB94=
X-Received: by 2002:a05:620a:530a:b0:6df:b743:9671 with SMTP id
 oo10-20020a05620a530a00b006dfb7439671mr12784598qkn.762.1667311653858; 
 Tue, 01 Nov 2022 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bOhPFmZPdFkm9EjhuJp067pSTg31rrCN7+WKOXXl1pWFa6zJBIQPaKRxtvERwsOUppx3WAA==
X-Received: by 2002:a05:620a:530a:b0:6df:b743:9671 with SMTP id
 oo10-20020a05620a530a00b006dfb7439671mr12784559qkn.762.1667311653458; 
 Tue, 01 Nov 2022 07:07:33 -0700 (PDT)
Received: from fedora (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id
 72-20020a370c4b000000b006fa43e139b5sm1566290qkm.59.2022.11.01.07.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:07:32 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:07:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, Peter
 Maydell <peter.maydell@linaro.org>, "Julia Suvorova" <jusual@redhat.com>,
 "Ani Sinha" <ani@anisinha.ca>
Subject: Re: [PULL 21/86] bios-tables-test: add test for number of cores > 255
Message-ID: <20221101150730.73098dd7@fedora>
In-Reply-To: <20221101135221.00000a4a@huawei.com>
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-22-mst@redhat.com>
 <20221101135221.00000a4a@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 1 Nov 2022 13:52:21 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 31 Oct 2022 08:51:44 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > From: Julia Suvorova <jusual@redhat.com>
> > 
> > The new test is run with a large number of cpus and checks if the
> > core_count field in smbios_cpu_test (structure type 4) is correct.
> > 
> > Choose q35 as it allows to run with -smp > 255.  
> 
> Getting a failure on this on i386.
> 
> qemu-system-i386: current -smp configuration requires kernel irqchip and X2APIC API support.

just posted a fixup, see my other reply to Stefan in this pull req.

> 
> Note that was on bisection of this pull request applied to current mainline
> (also in the CI report for the HMAT set - though there is another issue there.)
> 
> My guess is fix is don't run it unless 64 bit?
> 
> Jonathan
> 
> 
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Message-Id: <20220731162141.178443-5-jusual@redhat.com>
> > Message-Id: <20221011111731.101412-5-jusual@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
> >  1 file changed, 45 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index d4fbe6791d..e402b57d46 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -92,6 +92,8 @@ typedef struct {
> >      SmbiosEntryPoint smbios_ep_table;
> >      uint16_t smbios_cpu_max_speed;
> >      uint16_t smbios_cpu_curr_speed;
> > +    uint8_t smbios_core_count;
> > +    uint16_t smbios_core_count2;
> >      uint8_t *required_struct_types;
> >      int required_struct_types_len;
> >      QTestState *qts;
> > @@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_t type)
> >      }
> >  }
> >  
> > -static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > +static void smbios_cpu_test(test_data *data, uint32_t addr,
> > +                            SmbiosEntryPointType ep_type)
> >  {
> > -    uint16_t expect_speed[2];
> > -    uint16_t real;
> > +    uint8_t core_count, expected_core_count = data->smbios_core_count;
> > +    uint16_t speed, expected_speed[2];
> > +    uint16_t core_count2, expected_core_count2 = data->smbios_core_count2;
> >      int offset[2];
> >      int i;
> >  
> >      /* Check CPU speed for backward compatibility */
> >      offset[0] = offsetof(struct smbios_type_4, max_speed);
> >      offset[1] = offsetof(struct smbios_type_4, current_speed);
> > -    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> > -    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> > +    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> > +    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> >  
> >      for (i = 0; i < 2; i++) {
> > -        real = qtest_readw(data->qts, addr + offset[i]);
> > -        if (real != expect_speed[i]) {
> > -            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u expect %u\n",
> > -                    real, expect_speed[i]);
> > -            return false;
> > -        }
> > +        speed = qtest_readw(data->qts, addr + offset[i]);
> > +        g_assert_cmpuint(speed, ==, expected_speed[i]);
> >      }
> >  
> > -    return true;
> > +    core_count = qtest_readb(data->qts,
> > +                    addr + offsetof(struct smbios_type_4, core_count));
> > +
> > +    if (expected_core_count) {
> > +        g_assert_cmpuint(core_count, ==, expected_core_count);
> > +    }
> > +
> > +    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
> > +        core_count2 = qtest_readw(data->qts,
> > +                          addr + offsetof(struct smbios_type_4, core_count2));
> > +
> > +        /* Core Count has reached its limit, checking Core Count 2 */
> > +        if (expected_core_count == 0xFF && expected_core_count2) {
> > +            g_assert_cmpuint(core_count2, ==, expected_core_count2);
> > +        }
> > +    }
> >  }
> >  
> >  static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
> > @@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
> >          set_bit(type, struct_bitmap);
> >  
> >          if (type == 4) {
> > -            g_assert(smbios_cpu_test(data, addr));
> > +            smbios_cpu_test(data, addr, ep_type);
> >          }
> >  
> >          /* seek to end of unformatted string area of this struct ("\0\0") */
> > @@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)
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
> > @@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])
> >                  qtest_add_func("acpi/q35/tpm12-tis",
> >                                 test_acpi_q35_tcg_tpm12_tis);
> >              }
> > +            qtest_add_func("acpi/q35/core-count2",
> > +                           test_acpi_q35_tcg_core_count2);
> >              qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> >              qtest_add_func("acpi/q35/multif-bridge",
> >                             test_acpi_q35_multif_bridge);  
> 


