Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CB5FF03B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:24:25 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLbs-0003Qz-Cu
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ojLaJ-0001uw-0E
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:22:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ojLaD-0007NW-QY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665757358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMqZdZNAjJ7vNnHyHTUBLjS7WJi2KWMdpfEERM2gsN0=;
 b=WZZturamuSE4/NvdTZD+t6BgZmCyBv3mBUNodMl2EyErjCI75CEaxN58qmRk04Ruyfx1Md
 Bgg1fqpM549PFTZl2eYqdyBmYPMJF5mnuLWgUh8LOmCO/4DYGneh5how/QYU8f4/Xz5C6z
 I7VHJSxRk6RhJfjdsKsuDUZa/4hUhS0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-aAAhaxZ1NliJYdyBRXasVQ-1; Fri, 14 Oct 2022 10:22:35 -0400
X-MC-Unique: aAAhaxZ1NliJYdyBRXasVQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m10-20020a056402430a00b0045968bb0874so4072120edc.10
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMqZdZNAjJ7vNnHyHTUBLjS7WJi2KWMdpfEERM2gsN0=;
 b=rtIutpuBjRyQJ3CwdFYi9+ZozJBFp5qZUc0s7sCXrlcYMQ7pUvyW6pf7+eGTh4C93C
 uXhQ15k8Fspe1cDsrxgJR/3Rt/XZP2seRADo2rcAUus1Q9KbYYhGUrDxKjiEoyyxooub
 reDRZvWXBdW6kNmixVIw4VGnbNR5Nug1fcbBhzuJXdNQpIlg1gjHgW9j+NzDSjv5a4Wa
 P/aJe7GINhZu1tA7K98KU+0LhpXeF9Fb/yKg34vdqzVCoi56hYYlkhF6d6qTjNwR9KXv
 Yd0hbyeID9awhrKKJ35p6jnOiob3JwRjfYsFn8CUvVj3CfG70zA4qTqDKPQd6JX8tZ1o
 7aWg==
X-Gm-Message-State: ACrzQf2b3erJMlzFl8l+bKV5Mif6jYjpjNKcFfMicUOAR3XL9CVBwjVx
 zOAM1AXwzFlTrQlXLWI3UymMZR1J2EePpnh3kfwXPS0d9EAVr350znfC4AJRqsgfrw8hKdw0+aI
 FDWYTu+kLUFLC+8o=
X-Received: by 2002:a17:907:7290:b0:78d:ec20:fe4d with SMTP id
 dt16-20020a170907729000b0078dec20fe4dmr3832813ejc.528.1665757354392; 
 Fri, 14 Oct 2022 07:22:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5w45T7pX86XHb9RUS5DRdEjShAJ0NwrN8d2yeAiIKFuR0FVePw6mcUV6BlH7GS9/CaNC3dag==
X-Received: by 2002:a17:907:7290:b0:78d:ec20:fe4d with SMTP id
 dt16-20020a170907729000b0078dec20fe4dmr3832792ejc.528.1665757354081; 
 Fri, 14 Oct 2022 07:22:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056402045600b0044e01e2533asm1910624edw.43.2022.10.14.07.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:22:33 -0700 (PDT)
Date: Fri, 14 Oct 2022 16:22:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v3 4/5] bios-tables-test: add test for number of cores >
 255
Message-ID: <20221014162231.15ac01e5@redhat.com>
In-Reply-To: <20221011111731.101412-5-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
 <20221011111731.101412-5-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Oct 2022 13:17:30 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
> 
> Choose q35 as it allows to run with -smp > 255.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Message-Id: <20220731162141.178443-5-jusual@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f5fffdc348..4a76befc93 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -92,6 +92,8 @@ typedef struct {
>      SmbiosEntryPoint smbios_ep_table;
>      uint16_t smbios_cpu_max_speed;
>      uint16_t smbios_cpu_curr_speed;
> +    uint8_t smbios_core_count;
> +    uint16_t smbios_core_count2;
>      uint8_t *required_struct_types;
>      int required_struct_types_len;
>      QTestState *qts;
> @@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_t type)
>      }
>  }
>  
> -static bool smbios_cpu_test(test_data *data, uint32_t addr)
> +static void smbios_cpu_test(test_data *data, uint32_t addr,
> +                            SmbiosEntryPointType ep_type)
>  {
> -    uint16_t expect_speed[2];
> -    uint16_t real;
> +    uint8_t core_count, expected_core_count = data->smbios_core_count;
> +    uint16_t speed, expected_speed[2];
> +    uint16_t core_count2, expected_core_count2 = data->smbios_core_count2;
>      int offset[2];
>      int i;
>  
>      /* Check CPU speed for backward compatibility */
>      offset[0] = offsetof(struct smbios_type_4, max_speed);
>      offset[1] = offsetof(struct smbios_type_4, current_speed);
> -    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> -    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> +    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> +    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
>  
>      for (i = 0; i < 2; i++) {
> -        real = qtest_readw(data->qts, addr + offset[i]);
> -        if (real != expect_speed[i]) {
> -            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u expect %u\n",
> -                    real, expect_speed[i]);
> -            return false;
> -        }
> +        speed = qtest_readw(data->qts, addr + offset[i]);
> +        g_assert_cmpuint(speed, ==, expected_speed[i]);
>      }
>  
> -    return true;
> +    core_count = qtest_readb(data->qts,
> +                    addr + offsetof(struct smbios_type_4, core_count));
> +
> +    if (expected_core_count) {
> +        g_assert_cmpuint(core_count, ==, expected_core_count);
> +    }
> +
> +    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
> +        core_count2 = qtest_readw(data->qts,
> +                          addr + offsetof(struct smbios_type_4, core_count2));
> +
> +        /* Core Count has reached its limit, checking Core Count 2 */
> +        if (expected_core_count == 0xFF && expected_core_count2) {
> +            g_assert_cmpuint(core_count2, ==, expected_core_count2);
> +        }
> +    }
>  }
>  
>  static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
> @@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
>          set_bit(type, struct_bitmap);
>  
>          if (type == 4) {
> -            g_assert(smbios_cpu_test(data, addr));
> +            smbios_cpu_test(data, addr, ep_type);
>          }
>  
>          /* seek to end of unformatted string area of this struct ("\0\0") */
> @@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)
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
> @@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])
>                  qtest_add_func("acpi/q35/tpm12-tis",
>                                 test_acpi_q35_tcg_tpm12_tis);
>              }
> +            qtest_add_func("acpi/q35/core-count2",
> +                           test_acpi_q35_tcg_core_count2);
>              qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>              qtest_add_func("acpi/q35/multif-bridge",
>                             test_acpi_q35_multif_bridge);


