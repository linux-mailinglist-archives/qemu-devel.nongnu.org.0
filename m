Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC4341FBF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:38:32 +0100 (CET)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGGl-0004AI-BZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNGFW-0003J8-RV
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNGFU-0003bZ-Tn
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wstyNzV0FgW7RXon2VjQxyMzzorb/Ra4D3MNiOa/lw=;
 b=WYEPVZ+zVf/dmu6g1etwEwflvCQyR+Ld3oBBz22ieFgWBImMXzBxNMeAfnMgCqA+5vpQ5F
 POvuVWXidwBJPGfx1JmE72MkIcpKX1TYHFc+2E8dmL9u3l+eZn/gBl/kFZUU6CKLSOPKWC
 efkaG2+v9mjhAaJ1zGGUI0N1J8Dj4DQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-GRTKnf3SOuOROstAxBtU9g-1; Fri, 19 Mar 2021 10:37:08 -0400
X-MC-Unique: GRTKnf3SOuOROstAxBtU9g-1
Received: by mail-ej1-f72.google.com with SMTP id en21so18314059ejc.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7wstyNzV0FgW7RXon2VjQxyMzzorb/Ra4D3MNiOa/lw=;
 b=DElE69n8bPFb6g3055wNjB9xt9a53RIOHkx4qvX6VDZ8/Pk2JWE7U6J0kG2wpg5lA2
 PBiRfup9eDB1IC/wka1Q1Q9GwS5/esU6wxkLSJpvGMB58vWU8KiMaTtENq9Ec5bEApXB
 brSWgrb8McNv+swwWh6J6t7usUYY6+w8mZ1kMlF7vVzEu2XpNdjtKHEwoLbVg79CUYoX
 bTqb7Wqp1Ja7wJZs1vKwqfVLCGcFifQZZhlTx7ww3WECxBZGtj4RA6T9Gz5KSkUJbWqT
 M41PwdbtSdnKfTBiPV2Ma4+2HrcngG1s1X1kLS5YRnLhi6pUAVnONvRccYdJBdiZgnxi
 peGg==
X-Gm-Message-State: AOAM530dgbhfU2efjV9CbFnicFnZAmRebuCMzgdIpeJJaBWuwh4A+2kK
 S4Vfja63OFbTCOKPo8BcAfMRTHnieP6cHyltUDVSBCf6cKIZj8LAt7UGWLYUKTydGhTseJaGlnL
 0PfZqrlRAMlMv2s8=
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr4739511ejh.51.1616164627238; 
 Fri, 19 Mar 2021 07:37:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeacxN99yUIwYPleJv7S2lvs+aITgkl0HzVVMOAcYKRje+0gAR1g0DtO6Nk+zJe30XYrpZYw==
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr4739490ejh.51.1616164626988; 
 Fri, 19 Mar 2021 07:37:06 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id hy25sm3752345ejc.119.2021.03.19.07.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:37:06 -0700 (PDT)
Date: Fri, 19 Mar 2021 15:37:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <20210319143704.3hjhpdxruq33ov4q@steredhat>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
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

Sure, I'll take a look!
It's strange that on my F33, gcc doesn't tell me anything also forcing 
-Wtype-limits:

$ gcc --version
gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)

Thanks,
Stefano


