Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFE368385
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:40:14 +0200 (CEST)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbR6-0002NS-K8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZbPk-0001pr-3o
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZbPg-0005cB-SZ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619105923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeGeWGx8/N7sQKa1hDQVh+19rIhB0kQBVfhyD9IKiTs=;
 b=SljZr3PuCBGxErlv83TIlORbO5OfNA34RAxTbpw9Le8qRxj3fpjFuv7Z1kLkpxqQQ6LaHS
 GGQhwshwI+47aSndLUUCj98OLNv4+ZpW4ec0gpL5Ur6AGH3pwgp4dHn0F12i984mBxeRoR
 AQ84TavvVU700ng3gFTS1uxFrA/etfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-Tj9o8jtXPbONI7xNockNdA-1; Thu, 22 Apr 2021 11:38:31 -0400
X-MC-Unique: Tj9o8jtXPbONI7xNockNdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A35083DBF8;
 Thu, 22 Apr 2021 15:38:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44B2A19C59;
 Thu, 22 Apr 2021 15:38:27 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
Date: Thu, 22 Apr 2021 17:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/04/2021 16.31, Philippe Mathieu-Daudé wrote:
> On 4/22/21 2:41 PM, Christian Borntraeger wrote:
>> On 22.04.21 13:47, Thomas Huth wrote:
>>> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>>> <berrange@redhat.com> wrote:
> 
>>>> This silents the warning however:
>>>>
>>>> -- >8 --
>>>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>>>> index bcdc45732d..2dea399904 100644
>>>> --- a/pc-bios/s390-ccw/libc.h
>>>> +++ b/pc-bios/s390-ccw/libc.h
>>>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>>>    typedef unsigned int       uint32_t;
>>>>    typedef unsigned long long uint64_t;
>>>>
>>>> +#pragma GCC diagnostic push
>>>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>>>    static inline void *memset(void *s, int c, size_t n)
>>>>    {
>>>>        size_t i;
>>>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
>>>>
>>>>        return s;
>>>>    }
>>>> +#pragma GCC diagnostic pop
>>>
>>> Honestly, that compiler "bug" sounds like it could trigger at any
>>> other spot in the bios code, too, since we are doing lots of direct
>>> accesses to low memory there. I think it's likely best if we shut it
>>> off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ...
>>> could you please try to add it there?
>>
> 
> We are good with:
> 
> -- >8 --
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index 29fd9019b8..dcec09b6f9 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -8,6 +8,9 @@ CFLAGS = -O2 -g
>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
> $1, @$1))
>   cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
> /dev/null \
>                2>&1 && echo OK), $1, $2)
> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
> +                >/dev/null 2>&1 && echo OK), $2, $3)
> 
>   VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>   set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
> $(PATTERN) $1)))
> @@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
> menu.o \
>            virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
> 
>   QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
>   QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks

I think you don't need the "cc-c-option" magic here. Just add the 
-Wno-stringop-overflow. All supported versions of GCC and Clang simply 
silently ignore unknown -Wno-something options (try e.g. "gcc 
-Wno-yadayadayada" on the command line).

  Thomas


