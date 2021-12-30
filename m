Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AAB4820CE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 00:03:47 +0100 (CET)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n34SX-0004Ti-Tt
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 18:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <puleglot@puleglot.ru>)
 id 1n33ws-0006eD-Qm
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:31:02 -0500
Received: from puleglot.ru ([195.201.32.202]:55208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <puleglot@puleglot.ru>)
 id 1n33wp-0008Td-8g
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=fSiu4d1NQ1v6fUKZYgSIqaRFYh76rGshZvhPzD5D7+s=; b=bm9Lw/13vO/VO4fGPP8iKLh9rv
 sfzR8qyV40ZoMnk3WB83Mi44iWZIWCONlu7kHuPUS11099UhvGmubSIB374IlS8dGVtamPvsyuz/D
 /52i5QtR5r6FLPQ++TJeDkVV4TwK4RpNQkHE6GuzWWk2kkkhZb8K8dM26q1ECV4EIBVA=;
Received: from [2a00:1370:8125:bd4b::b41]
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1n33wg-0001r6-KS; Fri, 31 Dec 2021 01:30:49 +0300
Message-ID: <05376f2228c860f5812927467930b58ce477cd0a.camel@tsoy.me>
Subject: Re: [PATCH 1/4] acpi: fix QEMU crash when started with SLIC table
From: Alexander Tsoy <alexander@tsoy.me>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 31 Dec 2021 01:30:48 +0300
In-Reply-To: <20211227193120.1084176-2-imammedo@redhat.com>
References: <20211227193120.1084176-1-imammedo@redhat.com>
 <20211227193120.1084176-2-imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.201.32.202; envelope-from=puleglot@puleglot.ru;
 helo=puleglot.ru
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:02:50 -0500
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
Cc: dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

В Пн, 27/12/2021 в 14:31 -0500, Igor Mammedov пишет:
> if QEMU is started with used provided SLIC table blob,
> 
>   -acpitable sig=SLIC,oem_id='CRASH
> ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_re
> v=00000000,data=/dev/null
> it will assert with:
> 
>   hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed:
> (len <= maxlen)
> 
> and following backtrace:
> 
>   ...
>   build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e
> "CRASH ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61
>   acpi_table_begin (desc=0x7fffffffd1b0, array=0x555556afe320) at
> hw/acpi/aml-build.c:1727
>   build_fadt (tbl=0x555556afe320, linker=0x555557ca3830,
> f=0x7fffffffd318, oem_id=0x555556afdb2e "CRASH ME",
> oem_table_id=0x555556afdb34 "ME") at hw/acpi/aml-build.c:2064
>   ...
> 
> which happens due to acpi_table_begin() expecting NULL terminated
> oem_id and oem_table_id strings, which is normally the case, but
> in case of user provided SLIC table, oem_id points to table's blob
> directly and as result oem_id became longer than expected.
> 
> Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
> return NULL terminated strings.
> 
> PS:
> After [1] refactoring, oem_id semantics became inconsistent, where
> NULL terminated string was coming from machine and old way pointer
> into byte array coming from -acpitable option. That used to work
> since build_header() wasn't expecting NULL terminated string and
> blindly copied the 1st 6 bytes only.
> 
> However commit [2] broke that by replacing build_header() with
> acpi_table_begin(), which was expecting NULL terminated string
> and was checking oem_id size.
> 
> 1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be
> changed")
> 2)
> Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use
> acpi_table_begin()/acpi_table_end() instead of build_header()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/786
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c       | 4 ++--
>  hw/i386/acpi-build.c | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078..3e811bf03c 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -345,8 +345,8 @@ int acpi_get_slic_oem(AcpiSlicOem *oem)
>          struct acpi_table_header *hdr = (void *)(u - sizeof(hdr-
> >_length));
>  
>          if (memcmp(hdr->sig, "SLIC", 4) == 0) {
> -            oem->id = hdr->oem_id;
> -            oem->table_id = hdr->oem_table_id;
> +            oem->id = g_strndup(hdr->oem_id, 6);
> +            oem->table_id = g_strndup(hdr->oem_table_id, 8);
>              return 0;
>          }
>      }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..0234fe7588 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2723,6 +2723,8 @@ void acpi_build(AcpiBuildTables *tables,
> MachineState *machine)
>  
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
> +    g_free(slic_oem.id);
> +    g_free(slic_oem.table_id);
>  }
>  
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)

Tested-by: Alexander Tsoy <alexander@tsoy.me>


