Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739753BB88
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:26:10 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmi9-00071s-3e
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nwmcV-0000n3-TV
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nwmcO-0007QN-8z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654183211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONHmbaO2S/00X2VuF3+3J/xtQPom6UHExPuJloh8qJI=;
 b=SwJk6GNBnoH+OPcaxLTD13/nBbSOwQQ7jb4pEGLFSpN3Pq5qGqqMhJ/11ycnGjmCYiabI2
 2jlXW3EF/zy1Ujwtrn2KffPoIx4OIwBoOJp9BfReqs4eoXpM5CJNNLBo3vwh2n3PGuBH+I
 pQ8W3wkZk0O+8KU6qLHqtyD6ET8uq/8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-SLf0V6wpPkiE1ffnaxtSXg-1; Thu, 02 Jun 2022 11:20:10 -0400
X-MC-Unique: SLf0V6wpPkiE1ffnaxtSXg-1
Received: by mail-ed1-f72.google.com with SMTP id
 eh10-20020a0564020f8a00b0042dd9bf7c57so3684824edb.17
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONHmbaO2S/00X2VuF3+3J/xtQPom6UHExPuJloh8qJI=;
 b=u7Cj49L4Zu38cEV3xd1Z3dP1AJ5iUAWm9wBnfg9znVLshCYfR8GjH0Ks874zJwqDX6
 OoD7u0NNx/f+sZC7xJbZKo1McO/ItNRmfrMGRTdMuaoFhaZ0eMCbiALAaWiVDBPuEnBc
 RhzU+OA7T7740esCJ+K+pvkSZlM4RynyF6SfOUs8VqcfKzq2iT9PeQuT5yuwHYezGjZ+
 jAXnSIbNATm5GqLSAlRY/1o/o1VeN1GPfqWcFpJQKzF4inzrRAWYeCP9uy9CzXGYMVjn
 T75hAftXW/+GvQB320D2NaMMGpg7bHRsCHrKQzN693FQzXn8vvx6iRq8KS5MxzR+s0qj
 SOWA==
X-Gm-Message-State: AOAM531aKHdflKjPxRaR4/XqhT/kyvWAHRiMPgZg20CkAjWpWIQtZs/D
 vGY1TUzyjcS91DpqR4iiw0mJ3dBAB4BV2KeV+efUP89siET7Ti2QsBuHfeNVQ2kvfFBXpBfjViU
 /mSVJNXqWXbhd1Ek=
X-Received: by 2002:a05:6402:3585:b0:42d:d6d9:385d with SMTP id
 y5-20020a056402358500b0042dd6d9385dmr5996034edc.334.1654183208901; 
 Thu, 02 Jun 2022 08:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSZpGdhxX/5trssFw7uMXWAzdbv7x/UQWcG8BKK2o88RTxV00dUsKLqxHNp1JyL/FgArSUEw==
X-Received: by 2002:a05:6402:3585:b0:42d:d6d9:385d with SMTP id
 y5-20020a056402358500b0042dd6d9385dmr5996001edc.334.1654183208661; 
 Thu, 02 Jun 2022 08:20:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n16-20020aa7c790000000b0042bced44061sm2619160eds.10.2022.06.02.08.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:20:08 -0700 (PDT)
Date: Thu, 2 Jun 2022 17:20:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
Message-ID: <20220602172007.27cd7e81@redhat.com>
In-Reply-To: <20220527165651.28092-5-jusual@redhat.com>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
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

On Fri, 27 May 2022 18:56:50 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
> 
> Choose q35 as it allows to run with -smp > 255.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0ba9d749a5..f2464adaa0 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -100,6 +100,8 @@ typedef struct {
>      smbios_entry_point smbios_ep_table;
>      uint16_t smbios_cpu_max_speed;
>      uint16_t smbios_cpu_curr_speed;
> +    uint8_t smbios_core_count;
> +    uint16_t smbios_core_count2;
>      uint8_t *required_struct_types;
>      int required_struct_types_len;
>      QTestState *qts;
> @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
>  
>  static bool smbios_cpu_test(test_data *data, uint32_t addr)
>  {
> +    uint8_t real_cc, expect_cc = data->smbios_core_count;

%s/expect/expected/
also I'd s/real_cc/core_count/

> +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
ditto

>      uint16_t expect_speed[2];
> -    uint16_t real;
>      int offset[2];
>      int i;
>  
> @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
>          }
>      }
>  
> +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> +
> +    if (expect_cc && (real_cc != expect_cc)) {
> +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> +                real_cc, expect_cc);
> +        return false;

since you are rewriting it anyways, how about 
if (expect_cc) {
  g_assert_cmpuint(...)
}

instead of printing/propagating error

> +    }
> +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> +                real_cc2, expect_cc2);
> +        return false;
> +    }
> +
>      return true;
>  }
>  
> @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_tcg_core_count2(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".core-count2",
> +        .required_struct_types = base_required_struct_types,
> +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> +        .smbios_core_count = 0xFF,
> +        .smbios_core_count2 = 275,
> +    };
> +
> +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_bridge(void)
>  {
>      test_data data;
> @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);


