Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555E5785B1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:44:02 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRyb-0000bK-Ev
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRax-0001FW-H7
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRav-00069a-3W
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcdLCsFpqRGORG5Gklxq5tpO1A/StMsFhTS+ry5h+xo=;
 b=daDsJV35gWSYtgrme5d3tgnYOitq1KCo17jO/Y55GVUUDl4Nt+cdQ/NDCr5sdWMfkD11ct
 Se9vJNwDnKRUMhF+BFvft0oqDu9FpajY2R2OLAuU5mhZokh/hWNPlhqa3M2iqokg8Sbfvd
 QoxwJ3oZCMkCi8pzxW1+WPsSLtRNCpo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-wGNUR--CNOaadIo2D3wbXw-1; Mon, 18 Jul 2022 10:19:31 -0400
X-MC-Unique: wGNUR--CNOaadIo2D3wbXw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so7933238edd.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcdLCsFpqRGORG5Gklxq5tpO1A/StMsFhTS+ry5h+xo=;
 b=5uNeD2Qoh/PbQeQpLKD8Cqwr7S7ftLlCV3RaQXl5isCYnv8lel1ti0ACi+FevGH9Cc
 CetcaGs8Qcnvqbmt8RnFsiLRr+Z3C1pExyZa49KzSu5dFKE40Yk3Sf5FNqR64HqIS9j3
 GPLSWQ/IUEmiQPZZlru/GAIN4NU16HQmeY3dghDo0iP2IvvzG3tT9YJM9kWRAveMdQEw
 lPglaCZXeMDA2RCe8Bl26IVYmOOhafz6R9iiPlUFXaH2wIfeu90wNWOT1TTY8mjZa4BF
 IraLHzApmTvt1El4F2yqwWcTQ6ovWSGbewO5NnGqDw2/QFpE/hANxgC69NNuLbG2cmjr
 +SnA==
X-Gm-Message-State: AJIora+fmDA+OkS78srITINlAY9zU6aN6GzolI9dBtltIKsZf2fyrn3h
 3RcwkfHk3jSFXqgZcz4Mpy0if5/rfOuj5gz6O633SY8ybzhKT0jTtt9SEfHSOfxL7eTHk/MNER4
 8KR2iGUIdlWKRIik=
X-Received: by 2002:a05:6402:ca7:b0:43b:5cbd:291e with SMTP id
 cn7-20020a0564020ca700b0043b5cbd291emr10200323edb.4.1658153969830; 
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6n/cjIZRNzMKfg8/THLiTJ0bazgBEjZmIHF4bqpYoELdFkhD2hZ6fcKrPf1owL7AuV4VSzQ==
X-Received: by 2002:a05:6402:ca7:b0:43b:5cbd:291e with SMTP id
 cn7-20020a0564020ca700b0043b5cbd291emr10200294edb.4.1658153969676; 
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709066d5500b0072a4bb6bce8sm5527551ejt.168.2022.07.18.07.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:19:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 7/8] tests: acpi: aarch64/virt: add a test for hmat
 nodes with no initiators
Message-ID: <20220718161928.08fe6a4e@redhat.com>
In-Reply-To: <20220711104436.8363-8-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-8-hesham.almatary@huawei.com>
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

On Mon, 11 Jul 2022 11:44:35 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> This patch imitates the "tests: acpi: q35: add test for hmat nodes
> without initiators" commit to test numa nodes with different HMAT
> attributes, but on AArch64/virt.
> 
> Tested with:
> qemu-system-aarch64 -accel tcg \
>  -machine virt,hmat=on,gic-version=3  -cpu cortex-a57 \
>  -bios qemu-efi-aarch64/QEMU_EFI.fd \
>  -kernel Image -append "root=/dev/vda2 console=ttyAMA0" \
>  -drive if=virtio,file=aarch64.qcow2,format=qcow2,id=hd \
>  -device virtio-rng-pci \
>  -net user,hostfwd=tcp::10022-:22 -net nic \
>  -device intel-hda -device hda-duplex -nographic \
>  -smp 4 \
>  -m 3G \
>  -object memory-backend-ram,size=1G,id=ram0 \
>  -object memory-backend-ram,size=1G,id=ram1 \
>  -object memory-backend-ram,size=1G,id=ram2 \
>  -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>  -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>  -numa node,nodeid=2,memdev=ram2 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>  -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>  -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
>  -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
>  -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>  -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>  -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
> 
> Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
> ---
>  tests/qtest/bios-tables-test.c | 55 ++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f02b386d75..ed843c2abf 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1461,6 +1461,59 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>  
> +static void test_acpi_virt_tcg_acpi_hmat(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".acpihmatvirt";
> +
> +    test_acpi_one(" -machine hmat=on"
> +                  " -cpu cortex-a57"
> +                  " -smp 4"
> +                  " -m 256M"
> +                  " -object memory-backend-ram,size=64M,id=ram0"
> +                  " -object memory-backend-ram,size=64M,id=ram1"
> +                  " -object memory-backend-ram,size=128M,id=ram2"

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
> +
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
>  {
>      test_data data;
> @@ -1875,6 +1928,8 @@ int main(int argc, char *argv[])
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/acpihmatvirt",
> +                            test_acpi_virt_tcg_acpi_hmat);
>              qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>              qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);


