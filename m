Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06F57859C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:37:28 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRsF-0000WJ-DR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRbS-0001mn-1a
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRbN-0006Ew-Le
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658154001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNGaGEJT0I1fOnuHXH+I3Qjr0Ym2bfirs4XSjpZw1GU=;
 b=SY3l21mUGMPbPCKffr7a9e3LazcWFMs5DqA9BICxR89N4Yu5UhnPTikRwj+/sk7D4NZGyJ
 keyaPXB3+V1XAWRDDymTr9ujiAAuvLvmFCnAxM84wkmH8e40tlxqWfw8XITbFHMKyZ2GZo
 vOydC/mpQ3YDqxoS8d0l379uKY3CvdI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-dh-nlDWXMmGGzJvLVvKGGA-1; Mon, 18 Jul 2022 10:19:59 -0400
X-MC-Unique: dh-nlDWXMmGGzJvLVvKGGA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso7918957edd.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNGaGEJT0I1fOnuHXH+I3Qjr0Ym2bfirs4XSjpZw1GU=;
 b=d/NI7X5ayjSiqjxYt7fTOjt8JUy/qec7k66RI7YwxcoOxrZKvV5a1nR/YNgCe0jmBu
 GXkx8UMA8QOKWd9VrwgCgLHGjHLwwUji9HAE0KSKiGRJpLj7TIV0zqr3UKWzx4f0oNTY
 x0BeqSOP8n+6rLO+97TvWniFzjiZc5JwDP805IkZTlfckahZ3QyEKpRzYAYbyAzE118c
 TnGtJi3VdNEPdJQgsyFKGiz9DAo3mJtyqlbolW5KItX3jdf2oXSiTct4rtrRBOEj5d7v
 tQZsUr2JvmVr5YVEENopJ8KwpFL39/n0D1sp8D5dM0JGS9Zgl0juy6c3yg+MczV2K9y1
 S1iA==
X-Gm-Message-State: AJIora+raIVkhWwH9vf3ZRNtEUuaTJzvdQs9xcdAQ5YURWojmxJcjUCM
 6l/90W6vvlyRywFqRPW4qFAlKY/2u6l0K6sq6QYeE+X4pDMQcU4rKgZr1PPEMI32fgIhkXlCvUC
 HpRJnkIB7l13dUIY=
X-Received: by 2002:aa7:d695:0:b0:43b:6c14:140d with SMTP id
 d21-20020aa7d695000000b0043b6c14140dmr4153708edr.276.1658153996949; 
 Mon, 18 Jul 2022 07:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZatwS6TzNoScpLFkK2Km7VgnPI+EDmcqttWN36DQ0X1OqnUYJp0qz7maH1nFQVG0aUUrW0g==
X-Received: by 2002:aa7:d695:0:b0:43b:6c14:140d with SMTP id
 d21-20020aa7d695000000b0043b6c14140dmr4153672edr.276.1658153996638; 
 Mon, 18 Jul 2022 07:19:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 sz20-20020a1709078b1400b0072b31307a79sm5507248ejc.60.2022.07.18.07.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:19:56 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:19:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 3/8] tests: acpi: q35: add test for hmat nodes without
 initiators
Message-ID: <20220718161955.071bbc5b@redhat.com>
In-Reply-To: <20220711104436.8363-4-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-4-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 11 Jul 2022 11:44:31 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
> expected HMAT:
> 
> [000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
> [004h 0004   4]                 Table Length : 00000120
> [008h 0008   1]                     Revision : 02
> [009h 0009   1]                     Checksum : 4F
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
> 
> [024h 0036   4]                     Reserved : 00000000
> 
> [028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [02Ah 0042   2]                     Reserved : 0000
> [02Ch 0044   4]                       Length : 00000028
> [030h 0048   2]        Flags (decoded below) : 0001
>             Processor Proximity Domain Valid : 1
> [032h 0050   2]                    Reserved1 : 0000
> [034h 0052   4] Attached Initiator Proximity Domain : 00000000
> [038h 0056   4]      Memory Proximity Domain : 00000000
> [03Ch 0060   4]                    Reserved2 : 00000000
> [040h 0064   8]                    Reserved3 : 0000000000000000
> [048h 0072   8]                    Reserved4 : 0000000000000000
> 
> [050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [052h 0082   2]                     Reserved : 0000
> [054h 0084   4]                       Length : 00000028
> [058h 0088   2]        Flags (decoded below) : 0001
>             Processor Proximity Domain Valid : 1
> [05Ah 0090   2]                    Reserved1 : 0000
> [05Ch 0092   4] Attached Initiator Proximity Domain : 00000001
> [060h 0096   4]      Memory Proximity Domain : 00000001
> [064h 0100   4]                    Reserved2 : 00000000
> [068h 0104   8]                    Reserved3 : 0000000000000000
> [070h 0112   8]                    Reserved4 : 0000000000000000
> 
> [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [07Ah 0122   2]                     Reserved : 0000
> [07Ch 0124   4]                       Length : 00000028
> [080h 0128   2]        Flags (decoded below) : 0000
>             Processor Proximity Domain Valid : 0
> [082h 0130   2]                    Reserved1 : 0000
> [084h 0132   4] Attached Initiator Proximity Domain : 00000080
> [088h 0136   4]      Memory Proximity Domain : 00000002
> [08Ch 0140   4]                    Reserved2 : 00000000
> [090h 0144   8]                    Reserved3 : 0000000000000000
> [098h 0152   8]                    Reserved4 : 0000000000000000
> 
> [0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0A2h 0162   2]                     Reserved : 0000
> [0A4h 0164   4]                       Length : 00000040
> [0A8h 0168   1]        Flags (decoded below) : 00
>                             Memory Hierarchy : 0
> [0A9h 0169   1]                    Data Type : 00
> [0AAh 0170   2]                    Reserved1 : 0000
> [0ACh 0172   4] Initiator Proximity Domains # : 00000002
> [0B0h 0176   4]   Target Proximity Domains # : 00000003
> [0B4h 0180   4]                    Reserved2 : 00000000
> [0B8h 0184   8]              Entry Base Unit : 0000000000002710
> [0C0h 0192   4] Initiator Proximity Domain List : 00000000
> [0C4h 0196   4] Initiator Proximity Domain List : 00000001
> [0C8h 0200   4] Target Proximity Domain List : 00000000
> [0CCh 0204   4] Target Proximity Domain List : 00000001
> [0D0h 0208   4] Target Proximity Domain List : 00000002
> [0D4h 0212   2]                        Entry : 0001
> [0D6h 0214   2]                        Entry : 0002
> [0D8h 0216   2]                        Entry : 0003
> [0DAh 0218   2]                        Entry : 0002
> [0DCh 0220   2]                        Entry : 0001
> [0DEh 0222   2]                        Entry : 0003
> 
> [0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0E2h 0226   2]                     Reserved : 0000
> [0E4h 0228   4]                       Length : 00000040
> [0E8h 0232   1]        Flags (decoded below) : 00
>                             Memory Hierarchy : 0
> [0E9h 0233   1]                    Data Type : 03
> [0EAh 0234   2]                    Reserved1 : 0000
> [0ECh 0236   4] Initiator Proximity Domains # : 00000002
> [0F0h 0240   4]   Target Proximity Domains # : 00000003
> [0F4h 0244   4]                    Reserved2 : 00000000
> [0F8h 0248   8]              Entry Base Unit : 0000000000000001
> [100h 0256   4] Initiator Proximity Domain List : 00000000
> [104h 0260   4] Initiator Proximity Domain List : 00000001
> [108h 0264   4] Target Proximity Domain List : 00000000
> [10Ch 0268   4] Target Proximity Domain List : 00000001
> [110h 0272   4] Target Proximity Domain List : 00000002
> [114h 0276   2]                        Entry : 000A
> [116h 0278   2]                        Entry : 0005
> [118h 0280   2]                        Entry : 0001
> [11Ah 0282   2]                        Entry : 0005
> [11Ch 0284   2]                        Entry : 000A
> [11Eh 0286   2]                        Entry : 0001
> 
> Raw Table Data: Length 288 (0x120)
> 
>     0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....OBOCHS
>     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>     0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
>     0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(...........
>     0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
>     0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ................
>     0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@...........
>     00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'......
>     00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
>     00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ................
>     00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@...........
>     00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
>     0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
>     0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ................
> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---
>  tests/qtest/bios-tables-test.c | 46 ++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 359916c228..f02b386d75 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1461,6 +1461,50 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>  
> +static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_Q35;
> +    data.variant = ".acpihmat-noinitiator";
> +    test_acpi_one(" -machine hmat=on"
> +                  " -smp 4"
> +                  " -m 128M"
> +                  " -object memory-backend-ram,size=32M,id=ram0"
> +                  " -object memory-backend-ram,size=32M,id=ram1"
> +                  " -object memory-backend-ram,size=64M,id=ram2"

> +                  " -numa node,nodeid=0,memdev=ram0,cpus=0-1"
> +                  " -numa node,nodeid=1,memdev=ram1,cpus=2-3"
don't use legacy syntax, see test_acpi_tcg_dimm_pxm() for example

> +                  " -numa node,nodeid=2,memdev=ram2"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_erst(const char *machine)
>  {
>      gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
> @@ -1803,6 +1847,8 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/q35/acpihmat-noinitiator",
> +                        test_acpi_q35_tcg_acpi_hmat_noinitiator);
>          qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
>          qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>          qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);


