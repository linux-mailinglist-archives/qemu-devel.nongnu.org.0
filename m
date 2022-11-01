Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50818614E83
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 16:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprh6-00050A-99; Tue, 01 Nov 2022 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oprh3-0004zo-0l
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:52:41 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oprh0-0001Zb-Go
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:52:40 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1rxl45Gpz6883d;
 Tue,  1 Nov 2022 21:50:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 14:52:22 +0100
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 13:52:22 +0000
Date: Tue, 1 Nov 2022 13:52:21 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Julia
 Suvorova" <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>, "Ani
 Sinha" <ani@anisinha.ca>
Subject: Re: [PULL 21/86] bios-tables-test: add test for number of cores > 255
Message-ID: <20221101135221.00000a4a@huawei.com>
In-Reply-To: <20221031124928.128475-22-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-22-mst@redhat.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 08:51:44 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> From: Julia Suvorova <jusual@redhat.com>
> 
> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
> 
> Choose q35 as it allows to run with -smp > 255.

Getting a failure on this on i386.

qemu-system-i386: current -smp configuration requires kernel irqchip and X2APIC API support.

Note that was on bisection of this pull request applied to current mainline
(also in the CI report for the HMAT set - though there is another issue there.)

My guess is fix is don't run it unless 64 bit?

Jonathan


> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Message-Id: <20220731162141.178443-5-jusual@redhat.com>
> Message-Id: <20221011111731.101412-5-jusual@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d4fbe6791d..e402b57d46 100644
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


