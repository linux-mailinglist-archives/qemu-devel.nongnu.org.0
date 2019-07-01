Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27C4A134
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 14:56:08 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdDei-0000Jk-60
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 08:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38583)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hdDbf-00070s-CN
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hdDbd-00034K-U2
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:52:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hdDba-0002vs-Ji; Tue, 18 Jun 2019 08:52:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95B86356E4;
 Tue, 18 Jun 2019 12:52:35 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C93C35C207;
 Tue, 18 Jun 2019 12:52:30 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <653a6b3c-ac1a-f197-1240-a28f59890fa8@redhat.com>
Date: Tue, 18 Jun 2019 14:52:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 18 Jun 2019 12:52:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 0/8] ARM virt: ACPI memory hotplug
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shameer,

On 5/22/19 6:22 PM, Shameer Kolothum wrote:
> This series is an attempt to provide device memory hotplug support 
> on ARM virt platform. This is based on Eric's recent works here[1]
> and carries some of the pc-dimm related patches dropped from his
> series.
> 
> The kernel support for arm64 memory hot add was added recently by
> Robin and hence the guest kernel should be => 5.0-rc1.
> 
> NVDIM support is not included currently as we still have an unresolved
> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> can be included, but not done for now, for keeping it simple.
> 
> This makes use of GED device to sent hotplug ACPI events to the
> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> Sebastien to add the hardware-reduced support to Nemu using GED
> device[3]. (Please shout if I got the author/signed-off wrong for
> those patches or missed any names).
> 
> This is sanity tested on a HiSilicon ARM64 platform and appreciate
> any further testing.

I tested cold-plug and hot-plug of PCDIMM slots. I also tested
system_powerdown and system_reset. The series has minor conflicts with
master.

Feel free to add my T-b on next version:
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> [1] https://patchwork.kernel.org/cover/10837565/
> [2] https://patchwork.kernel.org/cover/10783589/
> [3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
> [4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
> 
> v4 --> v5
> -Removed gsi/ged-irq routing in virt.
> -Added Migration support.
> -Dropped support for DT coldplug case based on the discussions
>  here[4]
> -Added system_powerdown support through GED.
> 
> v3 --> v4
> Addressed comments from Igor and Eric,
> -Renamed "virt-acpi" to "acpi-ged".
> -Changed ged device parent to TYPE_DEVICE.
> -Introduced DT memory node property "hotpluggable" to resolve device
>  memory being treated as early boot memory issue(patch #7).
> -Combined patches #3 and #9 from v3 into #3.
> 
> v2 --> v3
> 
> Addressed comments from Igor and Eric,
> -Made virt acpi device platform independent and moved
>  to hw/acpi/generic_event_device.c
> -Moved ged specific code into hw/acpi/generic_event_device.c
> -Introduced an opt-in feature "fdt" to resolve device-memory being
>  treated as early boot memory.
> -Dropped patch #1 from v2.
> 
> RFC --> v2
> 
> -Use GED device instead of GPIO for ACPI hotplug events.
> -Removed NVDIMM support for now.
> -Includes dropped patches from Eric's v9 series.
> 
> Eric Auger (1):
>   hw/arm/virt: Add memory hotplug framework
> 
> Samuel Ortiz (2):
>   hw/acpi: Do not create memory hotplug method when handler is not
>     defined
>   hw/acpi: Add ACPI Generic Event Device Support
> 
> Shameer Kolothum (5):
>   hw/acpi: Make ACPI IO address space configurable
>   hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>   hw/acpi: Add system power down support to GED
>   hw/arm: Use GED for system_powerdown event
> 
>  hw/acpi/Kconfig                        |   4 +
>  hw/acpi/Makefile.objs                  |   1 +
>  hw/acpi/generic_event_device.c         | 348 +++++++++++++++++++++++++
>  hw/acpi/memory_hotplug.c               |  35 +--
>  hw/arm/Kconfig                         |   4 +
>  hw/arm/virt-acpi-build.c               |  58 ++---
>  hw/arm/virt.c                          |  88 ++++++-
>  hw/i386/acpi-build.c                   |   3 +-
>  include/hw/acpi/generic_event_device.h | 106 ++++++++
>  include/hw/acpi/memory_hotplug.h       |   9 +-
>  include/hw/arm/virt.h                  |   3 +
>  11 files changed, 603 insertions(+), 56 deletions(-)
>  create mode 100644 hw/acpi/generic_event_device.c
>  create mode 100644 include/hw/acpi/generic_event_device.h
> 

