Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3835C0C2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 17:59:10 +0200 (CEST)
Received: from localhost ([::1]:60351 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhyhx-0007vu-OG
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 11:59:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51114)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhyem-0005t0-AK
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhyek-0003be-Mj
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:55:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhyef-0003YD-P5; Mon, 01 Jul 2019 11:55:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 79D9381F0E;
 Mon,  1 Jul 2019 15:55:34 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFFD66F7EE;
 Mon,  1 Jul 2019 15:55:27 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA-w1AijFogZxX_9gz2+oDGH-=e2QAOdyCRdji_6k87d-A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <41f46a4b-5796-169a-1193-996ac94022c4@redhat.com>
Date: Mon, 1 Jul 2019 17:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-w1AijFogZxX_9gz2+oDGH-=e2QAOdyCRdji_6k87d-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 01 Jul 2019 15:55:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 0/8] ARM virt: ACPI memory hotplug
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 7/1/19 3:52 PM, Peter Maydell wrote:
> On Tue, 25 Jun 2019 at 13:15, Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com> wrote:
>>
>> This series is an attempt to provide device memory hotplug support
>> on ARM virt platform. This is based on Eric's recent works here[1]
>> and carries some of the pc-dimm related patches dropped from his
>> series.
>>
>> The kernel support for arm64 memory hot add was added recently by
>> Robin and hence the guest kernel should be => 5.0-rc1.
>>
>> NVDIM support is not included currently as we still have an unresolved
>> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
>> can be included, but not done for now, for keeping it simple.
>>
>> This makes use of GED device to sent hotplug ACPI events to the
>> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
>> Sebastien to add the hardware-reduced support to Nemu using GED
>> device[3]. (Please shout if I got the author/signed-off wrong for
>> those patches or missed any names).
>>
>> This is sanity tested on a HiSilicon ARM64 platform and appreciate
>> any further testing.
> 
> Hi; this seems to fail 'make check' (on an x86 host):
> 
> acpi-test: Warning! DSDT binary file mismatch. Actual
> [aml:/tmp/aml-01P83Z], Expected [aml:tests/data/acpi/virt/DSDT].
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-4ZP83Z.dsl,
> aml:/tmp/aml-01P83Z], Expected [asl:/tmp/asl-H7UE4Z.dsl,
> aml:tests/data/acpi/virt/DSDT].
> **
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
> assertion failed: (all_tables_match)
I fail to reproduce on my laptop:

make check-qtest-x86_64 executes

  TEST    check-qtest-x86_64: tests/bios-tables-test

and it does not seem to complain. But maybe I misunderstand the framework.

If I were able to reproduce I understand this is a matter to regenerate
the files we compare with by using
tests/data/acpi/rebuild-expected-aml.sh, right?

Thanks

Eric


> ERROR - Bail out!
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
> assertion failed: (all_tables_match)
> Aborted (core dumped)
> /home/petmay01/linaro/qemu-from-laptop/qemu/tests/Makefile.include:894:
> recipe for target 'check-qtest-aarch64' failed
> 
> Is there a need to update the reference DSDT used by the test?
> 
> thanks
> -- PMM
> 

