Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F12EF0C4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:37:34 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxp9B-0007xO-GT
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxp7y-0006x1-Mq
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxp7u-00006M-R2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610102174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fJ9jFB3S8QUrQ9mVhHSO23ic7tetd0vHnRUvARgb3E=;
 b=Upxecl4/FF2hYAZoy127YTmhbbrVMst8FtjOle6Vg5ZdlNo5NNr++cx7R2YOYMkMuuRjsg
 QrRokFYaFyUlGECwNPUosQe3/ti8AcyAlOBNRtple2SZl1XI0OVMnKboNU6oOSdePvGUHJ
 uyKJGxhXlOLlZ9O3+aFX5r4EHueCIk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-0HZOwGKKMO6Qrgh4xdQ7sA-1; Fri, 08 Jan 2021 05:36:10 -0500
X-MC-Unique: 0HZOwGKKMO6Qrgh4xdQ7sA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3968042B5;
 Fri,  8 Jan 2021 10:36:08 +0000 (UTC)
Received: from [10.36.114.168] (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0E795D9C0;
 Fri,  8 Jan 2021 10:36:02 +0000 (UTC)
Subject: Re: [PATCH v1] s390x/tcg: Fix RISBHG
From: David Hildenbrand <david@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
 David Hildenbrand <dhildenb@redhat.com>
References: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
 <B6050D16-4BD3-4355-878F-33E3E7C3A75D@redhat.com>
 <CAKwvOdn068fXosDhtF_o-DVY2tQs4pWj59+uJ59_=JPfOK2Hsg@mail.gmail.com>
 <bbdd5d1b-6aa9-cd2c-eb9a-cf0345dbc999@redhat.com>
 <a039a6b7-11b2-1588-744a-7fe0780483d1@redhat.com>
Organization: Red Hat GmbH
Message-ID: <97447294-2a91-6e32-548b-d438525a2a9f@redhat.com>
Date: Fri, 8 Jan 2021 11:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a039a6b7-11b2-1588-744a-7fe0780483d1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jonas Paulsson <paulsson@linux.vnet.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.01.21 11:19, David Hildenbrand wrote:
> On 08.01.21 10:44, David Hildenbrand wrote:
>> On 08.01.21 03:20, Nick Desaulniers wrote:
>>> On Thu, Jan 7, 2021 at 3:27 PM David Hildenbrand <dhildenb@redhat.com> wrote:
>>>>
>>>>
>>>>> Am 08.01.2021 um 00:21 schrieb Nick Desaulniers <ndesaulniers@google.com>:
>>>>>
>>>>> ﻿On Thu, Jan 7, 2021 at 3:13 PM David Hildenbrand <david@redhat.com> wrote:
>>>>>>
>>>>>> RISBHG is broken and currently hinders clang builds of upstream kernels
>>>>>> from booting: the kernel crashes early, while decompressing the image.
>>>>>>
>>>>>>  [...]
>>>>>>   Kernel fault: interruption code 0005 ilc:2
>>>>>>   Kernel random base: 0000000000000000
>>>>>>   PSW : 0000200180000000 0000000000017a1e
>>>>>>         R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
>>>>>>   GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000fffffff0
>>>>>>         0000000000000000 00000000fffffff4 000000000000000c 00000000fffffff0
>>>>>>         00000000fffffffc 0000000000000000 00000000fffffff8 00000000008e25a8
>>>>>>         0000000000000009 0000000000000002 0000000000000008 000000000000bce0
>>>>>>
>>>>>> One example of a buggy instruction is:
>>>>>>
>>>>>>    17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32
>>>>>>
>>>>>> With %r14 = 0x9 and %r1 = 0x7 should result in %r1 = 0x900000007, however,
>>>>>> results in %r1 = 0.
>>>>>>
>>>>>> Let's interpret values of i3/i4 as documented in the PoP and make
>>>>>> computation of "mask" only based on i3 and i4 and use "pmask" only at the
>>>>>> very end to make sure wrapping is only applied to the high/low doubleword.
>>>>>>
>>>>>> With this patch, I can successfully boot a v5.10 kernel built with
>>>>>> clang, and gcc builds keep on working.
>>>>>>
>>>>>> Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
>>>>>> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
>>>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>
>>>>>> This BUG was a nightmare to debug and the code a nightmare to understand.
>>>>>>
>>>>>> To make clang/gcc builds boot, the following fix is required as well on
>>>>>> top of current master: "[PATCH] target/s390x: Fix ALGSI"
>>>>>> https://lkml.kernel.org/r/20210107202135.52379-1-david@redhat.com
>>>>>
>>>>> In that case, a huge thank you!!! for this work! ++beers_owed.
>>>>>
>>>>
>>>> :) a kernel build for z13 should work with the (default) „-cpu qemu“ cpu type.
>>>
>>> Hmm...so I don't think clang can build a Linux kernel image with
>>> CONFIG_MARCH_Z13=y just yet; just defconfig.  Otherwise looks like
>>> clang barfs on some of the inline asm constraints.
>>>
>>
>> Ah, right. I overwrote my manual config by a temporary defconfig :)
>>
>>
>> So, I'm on x86-64 F33.
>>
>> clang version 11.0.0 (Fedora 11.0.0-2.fc33)
>> LLVM version 11.0.0
>>
>> I cannot directly use "LLVM=1" for cross-compilation, as I keep getting
>> "error: unknown emulation: elf64_s390" from ld.lld and "error: invalid
>> output format: 'elf64-s390'" from llvm-objcopy. I assume that's fixed in
>> llvm12?
>>
>> 1. I patch around it (strange, I remember CC= .. used to work, but it no
>> longer does)
>>
>> ---
>>
>> index e30cf02da8b8..89c57062ed5d 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -427,13 +427,13 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>>  CPP            = $(CC) -E
>>  ifneq ($(LLVM),)
>>  CC             = clang
>> -LD             = ld.lld
>> -AR             = llvm-ar
>> -NM             = llvm-nm
>> -OBJCOPY                = llvm-objcopy
>> -OBJDUMP                = llvm-objdump
>> -READELF                = llvm-readelf
>> -STRIP          = llvm-strip
>> +LD             = $(CROSS_COMPILE)ld
>> +AR             = $(CROSS_COMPILE)ar
>> +NM             = $(CROSS_COMPILE)nm
>> +OBJCOPY                = $(CROSS_COMPILE)objcopy
>> +OBJDUMP                = $(CROSS_COMPILE)objdump
>> +READELF                = $(CROSS_COMPILE)readelf
>> +STRIP          = $(CROSS_COMPILE)strip
>>  else
>>  CC             = $(CROSS_COMPILE)gcc
>>  LD             = $(CROSS_COMPILE)ld
>>
>> ---
>>
>> 2. Compile using clang
>>
>>
>> Using latest linux-next (1c925d2030afd354a02c23500386e620e662622b) +
>> above patch
>>
>> ---
>>
>> #!/bin/bash
>> export ARCH=s390;
>> export CROSS_COMPILE=s390x-linux-gnu-
>> export LLVM=1
>> make distclean
>> make defconfig
>>
>> # Make F32 initrd boot without inserting modules
>> ./scripts/config -e CONFIG_SCSI_ISCSI_ATTRS
>> ./scripts/config -e CONFIG_ISCSI_TCP
>>
>> make -j40 > /dev/null
>>
>> ---
>>
>> 3. Run it via QEMU. I boot a full Fedora 32 using the cloud-image +
>> initrd from Fedora 32 (tried to stick to your cmdline where possible)
>>
>> ./build/qemu-system-s390x \
>> -m 512M \
>> -cpu qemu \
>> -display none \
>> -nodefaults \
>> -kernel ../linux-cross/arch/s390/boot/bzImage \
>> -append "root=/dev/vda1 conmode=sclp console=ttyS0" \
>> -initrd ../Fedora-Cloud-Base-32-1.6.x86_64-initrd.img \
>> -hda ../Fedora-Cloud-Base-32-1.6.x86_64-initrd.img \
> 
> ^ -hda ../Fedora-Cloud-Base-32-1.6.x86_64.qcow2 \
> 
> 

Using homebrew llvm-12/clang-12 results in a kernel that is indeed stuck
is in an endless program exception loop, seeming to try printing a
backtrace over and over again. Yet, no output besides

"KASLR disabled: CPU has no PRNG"

Kernel runs under KVM, so more debugging to do to get clang-12 builds
running as well.

-- 
Thanks,

David / dhildenb


