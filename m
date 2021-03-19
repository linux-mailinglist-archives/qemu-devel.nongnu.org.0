Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9931342147
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:53:35 +0100 (CET)
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNHRO-0000XB-Nw
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNHPU-0008EO-5M
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNHPN-00062z-62
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616169088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ovSbfSqfTpymAWs59wB9ok5DOq8rIqRbek0UFfmHjQ=;
 b=FFKj4KN+0Feh5hk1MVeScX0E9puWsj+W0C0Rn0QtQHIXIEa3qA0sT8zD+PvCFZUAkbhaFU
 09EQN84KJBODRzKG1brfJGUpm/MgUzpoDYQjRaNQI6B1FcXVgeT70mCJDFtsOHH3Xxwqb6
 2MZsk/MQ4Af8EfA+ampVrXFiXUTZrNo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Jx4Qx6Z7PJuqZaXKjdFnpA-1; Fri, 19 Mar 2021 11:51:26 -0400
X-MC-Unique: Jx4Qx6Z7PJuqZaXKjdFnpA-1
Received: by mail-ej1-f72.google.com with SMTP id h14so18468709ejg.7
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 08:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5ovSbfSqfTpymAWs59wB9ok5DOq8rIqRbek0UFfmHjQ=;
 b=kSVihhhoeU/kXAQ5YVEHoJ5/Nc1A91o5z+EqaM/Yraqd5PFufSFmShSXHu8YweQ8iF
 LtCpNOBOfQ0yZ5iZf88zjC+js6CTidzVdvWibqVisP9R0GxE+0fwJZRq9K0a4Lnz6Cvd
 mArv9pP9QPLeXQ9l+km+Vwk9d8nrbiYUJDS3/MrrAdZIDRKhp4ronbx2yS76rEnn26Us
 PmkUEF/riEK7wnG8IXf7moJL/SP7Grpz1D/qvKFIkORYMvKAUuXzl7diQhyNs4ZxL1bV
 YVGkXxHkgmwd+ZU3p9HSoxq0qqYAn0Tf9JDlCqO31GS9Jy2k6ZMmEzbe2ib8qeeK5pzJ
 Zp0g==
X-Gm-Message-State: AOAM530uQOic5KVg8MbSrlU18cc2V23WSB2DRbJ+cjOvCP2FDeMF5iaU
 j86xrfSuX1hRzQEnY3gD1a3vhORuCqTF9fF9kOr9207yJQ0boYCeINES7PMEKDsTQmz7YmzVwA8
 k6o0iV9e8RUsr0fI=
X-Received: by 2002:a17:906:e2d4:: with SMTP id
 gr20mr5221170ejb.432.1616169084351; 
 Fri, 19 Mar 2021 08:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWYspqUXolqsJ1+ioMJusHDqYc2ih3oLaLbwsEXnwjOkc0majGTwWedB2p6PVzXMsjMiT6TA==
X-Received: by 2002:a17:906:e2d4:: with SMTP id
 gr20mr5221142ejb.432.1616169084116; 
 Fri, 19 Mar 2021 08:51:24 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id r19sm3801200ejr.55.2021.03.19.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 08:51:23 -0700 (PDT)
Date: Fri, 19 Mar 2021 16:51:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <20210319155121.qmy7zonanp2arobv@steredhat>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 03:06:25PM +0100, Philippe Mathieu-Daudé wrote:
>Hi Stefano,
>
>On 2/5/19 7:14 PM, Paolo Bonzini wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> The new pvh.bin option rom can be used with SeaBIOS to boot
>> uncompressed kernel using the x86/HVM direct boot ABI.
>>
>> pvh.S contains the entry point of the option rom. It runs
>> in real mode, loads the e820 table querying the BIOS, and
>> then it switches to 32bit protected mode and jumps to the
>> pvh_load_kernel() written in pvh_main.c.
>> pvh_load_kernel() loads the cmdline and kernel entry_point
>> using fw_cfg, then it looks for RSDP, fills the
>> hvm_start_info required by x86/HVM ABI, and finally jumps
>> to the kernel entry_point.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
>> ---
>>  .gitignore                   |   4 +
>>  Makefile                     |   2 +-
>>  pc-bios/optionrom/Makefile   |   5 +-
>>  pc-bios/optionrom/pvh.S      | 200 +++++++++++++++++++++++++++++++++++++++++++
>>  pc-bios/optionrom/pvh_main.c | 116 +++++++++++++++++++++++++
>>  pc-bios/pvh.bin              | Bin 0 -> 1536 bytes
>>  6 files changed, 325 insertions(+), 2 deletions(-)
>>  create mode 100644 pc-bios/optionrom/pvh.S
>>  create mode 100644 pc-bios/optionrom/pvh_main.c
>>  create mode 100644 pc-bios/pvh.bin
>
>> +++ b/pc-bios/optionrom/Makefile
>> @@ -37,7 +37,7 @@ Wa = -Wa,
>>  ASFLAGS += -32
>>  QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), $(Wa)-32)
>>
>> -build-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin
>> +build-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>>
>> +++ b/pc-bios/optionrom/pvh_main.c
>> @@ -0,0 +1,116 @@
>> +/*
>> + * PVH Option ROM for fw_cfg DMA
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>> + *
>> + * Copyright (c) 2019 Red Hat Inc.
>> + *   Authors:
>> + *     Stefano Garzarella <sgarzare@redhat.com>
>> + */
>> +
>> +asm (".code32"); /* this code will be executed in protected mode */
>> +
>> +#include <stddef.h>
>> +#include <stdint.h>
>> +#include "optrom.h"
>> +#include "optrom_fw_cfg.h"
>> +#include "../../include/hw/xen/start_info.h"
>> +
>> +#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
>> +#define RSDP_AREA_ADDR          0x000E0000
>> +#define RSDP_AREA_SIZE          2048
>> +#define EBDA_BASE_ADDR          0x0000040E
>> +#define EBDA_SIZE               1024
>> +
>> +#define E820_MAXENTRIES         128
>> +#define CMDLINE_BUFSIZE         4096
>> +
>> +/* e820 table filled in pvh.S using int 0x15 */
>> +struct pvh_e820_table {
>> +    uint32_t entries;
>> +    uint32_t reserved;
>> +    struct hvm_memmap_table_entry table[E820_MAXENTRIES];
>> +};
>> +
>> +struct pvh_e820_table pvh_e820 asm("pvh_e820") __attribute__ ((aligned));
>> +
>> +static struct hvm_start_info start_info;
>> +static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
>> +
>> +
>> +/* Search RSDP signature. */
>> +static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>> +{
>> +    uint64_t *rsdp_p;
>> +
>> +    /* RSDP signature is always on a 16 byte boundary */
>> +    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
>> +         rsdp_p += 2) {
>> +        if (*rsdp_p == RSDP_SIGNATURE) {
>> +            return (uintptr_t)rsdp_p;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>
>gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
>
>pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
>pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
>due to limited range of data type [-Wtype-limits]
>   61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>      |                     ^~
>
>Can you have a look?

I replicated with `make docker-test-build@alpine`, but I'm a bit 
confused.

I tried to be more correct in this way:

--- a/pc-bios/optionrom/pvh_main.c
+++ b/pc-bios/optionrom/pvh_main.c
@@ -27,7 +27,7 @@ asm (".code32"); /* this code will be executed in protected mode */
  #include "optrom_fw_cfg.h"
  #include "../../include/hw/xen/start_info.h"

-#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
+#define RSDP_SIGNATURE          UINT64_C(0x2052545020445352) /* "RSD PTR " */


but I still had the warning, so the only way to mute the warning was 
with an explicit cast in the expression.
I honestly don't understand, that value should be representable on 64 
bits:

@@ -58,7 +58,7 @@ static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
      /* RSDP signature is always on a 16 byte boundary */
      for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
           rsdp_p += 2) {
-        if (*rsdp_p == RSDP_SIGNATURE) {
+        if (*rsdp_p == (uint64_t)RSDP_SIGNATURE) {
              return (uintptr_t)rsdp_p;
          }
      }

Any thoughts?

Thanks,
Stefano


