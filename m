Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E314D260E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 11:17:23 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIUZW-00007K-Ny
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 05:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIUY1-0007XB-J8
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 05:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIUY0-0000bX-9O
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 05:15:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iIUXx-0000aE-4w; Thu, 10 Oct 2019 05:15:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F387030860C5;
 Thu, 10 Oct 2019 09:15:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C7860BE1;
 Thu, 10 Oct 2019 09:15:38 +0000 (UTC)
Date: Thu, 10 Oct 2019 11:15:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC PATCH 12/12] virt/acpi: add SDEI table if SDEI is enabled
Message-ID: <20191010111537.5e2dd584@redhat.com>
In-Reply-To: <1569338511-3572-13-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
 <1569338511-3572-13-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 10 Oct 2019 09:15:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, Dave Martin <Dave.Martin@arm.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Sep 2019 23:21:51 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> Add SDEI table if SDEI is enabled, so that guest OS can get aware and
> utilize the interfaces.
> 
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c    | 16 ++++++++++++++++
>  include/hw/acpi/acpi-defs.h |  5 +++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cdf156..1088214 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -32,6 +32,7 @@
>  #include "trace.h"
>  #include "hw/core/cpu.h"
>  #include "target/arm/cpu.h"
> +#include "target/arm/sdei.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/nvram/fw_cfg.h"
> @@ -475,6 +476,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>  

here should be a comment describing purpose with a reference to spec

>  static void
> +build_sdei(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    int sdei_start = table_data->len;
> +
> +    (void)acpi_data_push(table_data, sizeof(AcpiSdei));
> +    build_header(linker, table_data, (void *)(table_data->data + sdei_start),
> +                 "SDEI", table_data->len - sdei_start, 1, NULL, NULL);
> +}
that's dummy table and doesn't match what spec describes,
It doesn't look correct SDEI table.

> +
> +static void
>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      AcpiSerialPortConsoleRedirection *spcr;
> @@ -796,6 +807,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    if (sdei_enabled) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_sdei(tables_blob, tables->linker, vms);
> +    }
> +
>      if (ms->numa_state->num_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, vms);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 57a3f58..0a2265d 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -634,4 +634,9 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>  
> +struct AcpiSdei {
> +    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
> +} QEMU_PACKED;
> +typedef struct AcpiSdei AcpiSdei;

we don't use packed structures for ACPI anymore, see build_rsdp() for
example of how tables are composed and comment style required for each field.

>  #endif


