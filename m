Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5239368D40
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:41:59 +0200 (CEST)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZpVm-0005v6-Hg
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZpU5-0005Lk-Qy
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZpU2-0007mh-Gx
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619160009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVryVbLAxQQuC8uY35rufncHPdvKuX8ZQkPhsbPXAo4=;
 b=b3dX0O8moClHD+Zo3sZcb+rVtW3U29xwLrKZoMRyy6I9kMShUGQ7RR9DozxrONGi0lYJ5K
 UdTshuJDKRQJYIb7RfLUs8/hzoI6aaX093dQjIJlkAwgh6m+j3NsCXs4WdeZktQ+5zIWED
 /ax6fwPAUvaNBRWkS5qpsLx8nHLMiV0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-4CjuEZEiNfGtC4Y47EvEXQ-1; Fri, 23 Apr 2021 02:40:05 -0400
X-MC-Unique: 4CjuEZEiNfGtC4Y47EvEXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so10579078edu.18
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 23:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zVryVbLAxQQuC8uY35rufncHPdvKuX8ZQkPhsbPXAo4=;
 b=iU2An7+kd3V5lhKUR/pSNagc8QNTGEmVSXOSk/orjAGnNvw8VkGta06LpgKMCzG1Ua
 GPVc3wwyh9GrOdOM3k7DGqopBvDMoHwlP1COmjpXqTrvKId16vyHjsi5/hQ5ssCJmGVQ
 krm5xStmH8VA9trYbhD4eOBbUyh9OGzsUaevFBP9nVOHHgKqzfDV0XAh7gpEo6GSGy8I
 qRiVgy/pR6ep8TL6mm0El2qdKGRB6lzGHIudZJNgCPTn7owfOOAl4wvazlK2ozJ27v1B
 8/tetEqrjn8BJ8cROjZ4GzH6P2+4J5qGoiRPpRrbONV2QvLdl98zyyeY21u5AkrM/LOg
 wguQ==
X-Gm-Message-State: AOAM532g7dHrZOgDgh0GsWrixE/MlOxqnnEHRAiejhvLnHeeS2mQf7NA
 wJanXgX6pZ4UCUZlYEaTSESdRkNdZqposAr+yxjSe3qEg03CUgivS4XPX7s+nw4N+LUO4klgXXT
 ei9xyKJFgrHVYBjY=
X-Received: by 2002:a17:906:e5a:: with SMTP id
 q26mr2512113eji.263.1619160004066; 
 Thu, 22 Apr 2021 23:40:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIGfyHSiks0sYZQ9wJT7LB96d9LMPacyr7gGndz5ixmY5eV4+n380QAvQNP474kP9kx2DXbg==
X-Received: by 2002:a17:906:e5a:: with SMTP id
 q26mr2512085eji.263.1619160003804; 
 Thu, 22 Apr 2021 23:40:03 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id g20sm3646537edu.91.2021.04.22.23.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 23:40:03 -0700 (PDT)
Date: Fri, 23 Apr 2021 08:40:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <20210423064001.fjouibdcwadtgijy@steredhat>
References: <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
 <20210422155238.kak7tl3xnup5vod7@steredhat>
 <da8f7353-8e2a-82f9-c324-18321649ccb5@redhat.com>
 <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:54:21PM +0200, Philippe Mathieu-Daudé wrote:
>On 4/22/21 6:07 PM, Thomas Huth wrote:
>> On 22/04/2021 17.52, Stefano Garzarella wrote:
>>> On Thu, Apr 22, 2021 at 05:38:26PM +0200, Thomas Huth wrote:
>>>> On 22/04/2021 16.31, Philippe Mathieu-Daudé wrote:
>>>>> On 4/22/21 2:41 PM, Christian Borntraeger wrote:
>>>>>> On 22.04.21 13:47, Thomas Huth wrote:
>>>>>>> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>>>>>>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>>>>>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>>>>>>> <berrange@redhat.com> wrote:
>>>>>
>>>>>>>> This silents the warning however:
>>>>>>>>
>>>>>>>> -- >8 --
>>>>>>>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>>>>>>>> index bcdc45732d..2dea399904 100644
>>>>>>>> --- a/pc-bios/s390-ccw/libc.h
>>>>>>>> +++ b/pc-bios/s390-ccw/libc.h
>>>>>>>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>>>>>>>   typedef unsigned int       uint32_t;
>>>>>>>>   typedef unsigned long long uint64_t;
>>>>>>>>
>>>>>>>> +#pragma GCC diagnostic push
>>>>>>>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>>>>>>>   static inline void *memset(void *s, int c, size_t n)
>>>>>>>>   {
>>>>>>>>       size_t i;
>>>>>>>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c,
>>>>>>>> size_t n)
>>>>>>>>
>>>>>>>>       return s;
>>>>>>>>   }
>>>>>>>> +#pragma GCC diagnostic pop
>>>>>>>
>>>>>>> Honestly, that compiler "bug" sounds like it could trigger at any
>>>>>>> other spot in the bios code, too, since we are doing lots of direct
>>>>>>> accesses to low memory there. I think it's likely best if we shut it
>>>>>>> off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ...
>>>>>>> could you please try to add it there?
>>>>>>
>>>>>
>>>>> We are good with:
>>>>>
>>>>> -- >8 --
>>>>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>>>>> index 29fd9019b8..dcec09b6f9 100644
>>>>> --- a/pc-bios/s390-ccw/Makefile
>>>>> +++ b/pc-bios/s390-ccw/Makefile
>>>>> @@ -8,6 +8,9 @@ CFLAGS = -O2 -g
>>>>>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
>>>>> $1, @$1))
>>>>>  cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
>>>>> /dev/null \
>>>>>               2>&1 && echo OK), $1, $2)
>>>>> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
>>>>> +                >/dev/null 2>&1 && echo OK), $2, $3)
>>>>>
>>>>>  VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>>>>>  set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
>>>>> $(PATTERN) $1)))
>>>>> @@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
>>>>> menu.o \
>>>>>           virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o
>>>>> dasd-ipl.o
>>>>>
>>>>>  QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>>>>> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS),
>>>>> -Wno-stringop-overflow)
>>>>>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks
>>>>
>>>> I think you don't need the "cc-c-option" magic here. Just add the
>>>> -Wno-stringop-overflow. All supported versions of GCC and Clang
>>>> simply silently ignore unknown -Wno-something options (try e.g. "gcc
>>>> -Wno-yadayadayada" on the command line).
>>>
>>> Clang seems not to like it. It's always a mess to do anything for gcc
>>> and clang :-(
>
>I didn't know we could build s390-ccw with clang.
>
>Not with clang-12:
>
>clang version 12.0.0 (Fedora 12.0.0-0.3.rc1.fc34)
>
>warning: unknown warning option '-Wold-style-declaration'; did you mean
>'-Wout-of-line-declaration'? [-Wunknown-warning-option]
>warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean
>'-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>warning: unknown warning option '-Wno-stringop-overflow'; did you mean
>'-Wno-shift-overflow'? [-Wunknown-warning-option]
>warning: unknown warning option '-Wold-style-declaration'; did you mean
>'-Wout-of-line-declaration'? [-Wunknown-warning-option]
>warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean
>'-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>warning: unknown warning option '-Wno-stringop-overflow'; did you mean
>'-Wno-shift-overflow'? [-Wunknown-warning-option]
>error: unknown target CPU 'z900'
>note: valid target CPU values are: arch8, z10, arch9, z196, arch10,
>zEC12, arch11, z13, arch12, z14, arch13, z15

Ah, I didn't know that, I just tried the unknown -Wno-yadayadayada :-)

>
>>> Maybe we can set also `-Wno-unknown-warning-option`.
>>>
>>> $ clang -Wno-stringop-overflow -Werror main.c
>>> error: unknown warning option '-Wno-stringop-overflow'; did you mean
>>> '-Wno-shift-overflow'? [-Werror,-Wunknown-warning-option]
>>
>> D'oh, I was pretty sure that Clang behaves the same with regards to
>> -Wno-something, but seems I was wrong, sorry.

Np :-) I'm always confused between gcc and clang...

>>
>> So I think we should simply keep this v1 of Philippe's patch.
>>

Yep, I agree.

Thanks,
Stefano


