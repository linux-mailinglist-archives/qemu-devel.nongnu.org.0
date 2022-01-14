Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804048E6A3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:37:00 +0100 (CET)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8I4x-000414-1h
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n8I1u-00026h-IE
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n8I1l-0005dx-Nh
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642149221;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9Mqi81hNQl7yIDn+OKS73ATISedqr4KY1kCz2IcTLo=;
 b=KcUstV/YlJWV6meFxhRr9lX0m3gTf/mdJjOGTuCKN0QOwWbDB9xmGVqh0JwMsl4OZGSEq4
 MYieH/85UFO+VMcWklJ35+SSwM9tFxJrW4RNwVB2f7yKGQb1GNH1DrIcoZ+0ysovowJjKL
 BLSRbEiZTwrxc1j60Ox+HlD7+O3zFJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-zZA1I5vBP0-sBIkTmpDijQ-1; Fri, 14 Jan 2022 03:33:35 -0500
X-MC-Unique: zZA1I5vBP0-sBIkTmpDijQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so7591817wme.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=L9Mqi81hNQl7yIDn+OKS73ATISedqr4KY1kCz2IcTLo=;
 b=Id1q4bLVXkoeg+Eq6DMthwtPPrI1DbAjcQqxjLwRUDaTJXNckYEXZUaBdTSF+kkYf8
 Hlsid4bYAMlTmpyU7tCRsQnDvir/dNkfspMqV+9GEnaB43NM4USPXPoTUg0zoZ/d+3ma
 ZlVYOtQNAfm667Da+wK4kzrEZhLaN1744LEoWnvjnkgmHyMp3Mr7B508QjxAf6qEUjlS
 94cbmwjOfjYrFK9ZRidp2l4RiGbnkqxca1ehNDZ6cHm8/wphdvDJf2ytSeL2IF0KXodu
 l1GCMNZuJ4GNbzHla7lTZr9niutdmhMRPcu4y11EULU6oF+uSWdNiKHg1USm2LTac6uI
 rbTw==
X-Gm-Message-State: AOAM530uEGhZUa+nc4daF9ghS5PPKNX/84Y1xdyN7mx/arJWySchD0oG
 2I59dHhKbaEcJCksnClmjCgNgnYVtm7k/do5DS13iu62tRxRdri3LYcVVtr42U6oqInOY0Nn5yt
 nO5AEkvA9lahlIk8=
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr7489517wrp.167.1642149213817; 
 Fri, 14 Jan 2022 00:33:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWqDTrj4IRocQ5XS/JL9sTWRG//+wEOGX6Komv+MunfPbi2j1bEI0ynQvkrVRjowHtJw479A==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr7489494wrp.167.1642149213535; 
 Fri, 14 Jan 2022 00:33:33 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id w17sm5438410wmc.14.2022.01.14.00.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:33:33 -0800 (PST)
Subject: Re: [PATCH 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
 <20220113103757.2801389-2-eric.auger@redhat.com>
 <75a7ffde-5ca4-cd98-2221-203fc5d771d6@linux.ibm.com>
 <b7eb78c2-4909-508f-b4d0-a5b95d13d6a7@redhat.com>
 <a980d96e-3a4b-f06b-dd77-588309f8109e@linux.ibm.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <880bf2e5-4202-9e37-45a0-9aeb721c1d3d@redhat.com>
Date: Fri, 14 Jan 2022 09:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a980d96e-3a4b-f06b-dd77-588309f8109e@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 1/13/22 4:38 PM, Stefan Berger wrote:
> On 1/13/22 09:40, Eric Auger wrote:
>
>> Hi Stefan,
>>
>> On 1/13/22 3:06 PM, Stefan Berger wrote:
>>> On 1/13/22 05:37, Eric Auger wrote:
>>>> Representing the CRB cmd/response buffer as a standard
>>>> RAM region causes some trouble when the device is used
>>>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>>>> as usual RAM but this latter does not have a valid page
>>>> size alignment causing such an error report:
>>>> "vfio_listener_region_add received unaligned region".
>>>> To allow VFIO to detect that failing dma mapping
>>>> this region is not an issue, let's use a ram_device
>>>> memory region type instead.
>>>>
>>>> The change in meson.build is required to include the
>>>> cpu.h header.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>    hw/tpm/meson.build |  2 +-
>>>>    hw/tpm/tpm_crb.c   | 10 ++++++++--
>>>>    2 files changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>>>> index 1c68d81d6a..3e74df945b 100644
>>>> --- a/hw/tpm/meson.build
>>>> +++ b/hw/tpm/meson.build
>>>> @@ -1,8 +1,8 @@
>>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true:
>>>> files('tpm_tis_common.c'))
>>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true:
>>>> files('tpm_tis_isa.c'))
>>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true:
>>>> files('tpm_tis_sysbus.c'))
>>>> -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>>>
>>>> +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>>>    specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'],
>>>> if_true: files('tpm_ppi.c'))
>>>>    specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'],
>>>> if_true: files('tpm_ppi.c'))
>>>>    specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true:
>>>> files('tpm_spapr.c'))
>>>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>>>> index 58ebd1469c..25f8e685e4 100644
>>>> --- a/hw/tpm/tpm_crb.c
>>>> +++ b/hw/tpm/tpm_crb.c
>>>> @@ -25,6 +25,7 @@
>>>>    #include "sysemu/tpm_backend.h"
>>>>    #include "sysemu/tpm_util.h"
>>>>    #include "sysemu/reset.h"
>>>> +#include "cpu.h"
>>>>    #include "tpm_prop.h"
>>>>    #include "tpm_ppi.h"
>>>>    #include "trace.h"
>>>> @@ -43,6 +44,7 @@ struct CRBState {
>>>>
>>>>        bool ppi_enabled;
>>>>        TPMPPI ppi;
>>>> +    uint8_t *crb_cmd_buf;
>>>>    };
>>>>    typedef struct CRBState CRBState;
>>>>
>>>> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev,
>>>> Error **errp)
>>>>            return;
>>>>        }
>>>>
>>>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>>>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>>>> +
>>> Do we need an unrealize function now to qemu_vfree() this memory?
>> I would say it is needed if the device can be hot-unplugged.
>> tpmppi->buf is not freeed either.
>
>
> Correct about PPI. My main concern would be the CRB related test cases
> that likely currently run without PPI but now could complain about a
> memory leak upon shutdown. I tried to compile with --enable-sanitizers
> and run the tests but it doesn't compile when the sanitizers are enabled.
>
>
> FAILED: libcommon.fa.p/disas_i386.c.o
> cc -m64 -mcx16 -Ilibcommon.fa.p -I../capstone/include/capstone
> -I../dtc/libfdt -I../slirp -I../slirp/src -I/usr/include/pixman-1
> -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0
> -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> -I/usr/include/libmount -I/usr/include/blkid
> -I/usr/include/gio-unix-2.0 -fdiagnostics-color=auto -Wall
> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
> /home/stefanb/dev/qemu/linux-headers -isystem linux-headers -iquote .
> -iquote /home/stefanb/dev/qemu -iquote /home/stefanb/dev/qemu/include
> -iquote /home/stefanb/dev/qemu/disas/libvixl -iquote
> /home/stefanb/dev/qemu/tcg/i386 -pthread -fsanitize=undefined
> -fsanitize=address -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
> -fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600
> -DNCURSES_WIDECHAR=1 -DSTRUCT_IOVEC_DEFINED -MD -MQ
> libcommon.fa.p/disas_i386.c.o -MF libcommon.fa.p/disas_i386.c.o.d -o
> libcommon.fa.p/disas_i386.c.o -c ../disas/i386.c
> In file included from /usr/include/string.h:519,
>                  from /home/stefanb/dev/qemu/include/qemu/osdep.h:87,
>                  from ../disas/i386.c:34:
> In function ?strcpy?,
>     inlined from ?PNI_Fixup? at ../disas/i386.c:6434:4,
>     inlined from ?PNI_Fixup? at ../disas/i386.c:6400:1:
> /usr/include/bits/string_fortified.h:79:10: error: ?__builtin_memcpy?
> offset [0, 7] is out of the bounds [0, 0] [-Werror=array-bounds]
>    79 |   return __builtin___strcpy_chk (__dest, __src,
> __glibc_objsize (__dest));
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function ?strcpy?,
>     inlined from ?PNI_Fixup? at ../disas/i386.c:6427:4,
>     inlined from ?PNI_Fixup? at ../disas/i386.c:6400:1:
> /usr/include/bits/string_fortified.h:79:10: error: ?__builtin_memcpy?
> offset [0, 5] is out of the bounds [0, 0] [-Werror=array-bounds]
>    79 |   return __builtin___strcpy_chk (__dest, __src,
> __glibc_objsize (__dest));
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

thank you for the tests and above trial. Anyway I can add the unrealize
and deal with the deallocation of both buffers

Eric
>
>    Stefan
>
>>
>> Thanks
>>
>> Eric
>>
>>>
>>>>        memory_region_init_io(&s->mmio, OBJECT(s),
>>>> &tpm_crb_memory_ops, s,
>>>>            "tpm-crb-mmio", sizeof(s->regs));
>>>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>>>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>>>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s),
>>>> "tpm-crb-cmd",
>>>> +                                      CRB_CTRL_CMD_SIZE,
>>>> s->crb_cmd_buf);
>>>> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
>>>>        memory_region_add_subregion(get_system_memory(),
>>>>            TPM_CRB_ADDR_BASE, &s->mmio);
>


