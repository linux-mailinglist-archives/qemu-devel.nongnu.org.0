Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729140384B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvDk-0008PX-Ve
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNur1-0004WA-Gd
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNuqs-0007Bi-RT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTxpgwdCToam24etbK0p0OHqdsb0V1MGRnQNbF8ZnN8=;
 b=ANzHQK6UTRJrM0K05JC6dXwrB0KBgKuT6kKmDzfidle8GNc1U/V4jHdr21vfq7WiTRhTEI
 1JAfR/2ACIsx6TD5ZD6Kisw83epwzMERa5B7CQoAr8nhNm9dogBYvKiPUscbM0vvA8HDST
 9mXUhDtOU2wOdzORT93VJT0rzDHmuG0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Mp-fUlVcMtmS1HEGiu9JVA-1; Wed, 08 Sep 2021 06:30:44 -0400
X-MC-Unique: Mp-fUlVcMtmS1HEGiu9JVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so360160wrn.21
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTxpgwdCToam24etbK0p0OHqdsb0V1MGRnQNbF8ZnN8=;
 b=ZjDy2/VAblsOUUGuo0R9npop4uCyl2MG8ntO8fYvEUEQlcjDQcKH4PQokE5CQitweN
 psjWmZkCjHpc8nbdNKmyAbtKjNa0pz2Qe1gEk4P+kFcXNtrmAmGgJu84j1fLpuW7WEPe
 ClvjrPQCd9RnjC3BbMV1FRhEzSptCtoBqNC97+EaavHoMHpF+cqJWovUKR6NCY7A4jUO
 3ZE8XPK9cME/YHl+Ukk6KKyvTa0ILFJ0kjMFkKg8WA4AlngwMVgC8/1FCRLIQ0V8tTDt
 B6/YtBJcR8Wii/XcgrEPlInlTH3mq6+QaBFxaNskm70ossIZEPYAa58tqgeiIm0ULHCU
 i8Sg==
X-Gm-Message-State: AOAM5329Vn5QHpIS6d8DkHeGNUybTJucq3Jt1t5Pm8ArIYuUwn7hQoqB
 VC8hRUp0OZ9mSU4EHd+ZBmDAxCvU9iMySjK5gp/AwbhTTzrwP6+oJCxhUaaZmgluRCMkmeWw+qc
 jKcHtk+E6HEW8Fh8=
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr2782074wmj.24.1631097042755;
 Wed, 08 Sep 2021 03:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPGtNmqSts898fIE3Efa/mN68FxhentUWKS3naoIqeUYO3CbmIjIGVKKogTPJ+Gd3yPRUjYQ==
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr2782037wmj.24.1631097042460;
 Wed, 08 Sep 2021 03:30:42 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a10sm1772551wrd.51.2021.09.08.03.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 03:30:42 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined
To: Reinoud Zandijk <reinoud@NetBSD.org>, Thomas Huth <thuth@redhat.com>
References: <20210718134650.1191-1-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <6059b24a-a5ee-822f-8ff8-7277eb99896c@redhat.com>
 <YTiGc/0K+rupGIgD@gorilla.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad53ad6a-08d0-8c84-701b-8112a582a9f9@redhat.com>
Date: Wed, 8 Sep 2021 12:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTiGc/0K+rupGIgD@gorilla.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas

On 9/8/21 11:46 AM, Reinoud Zandijk wrote:
> On Tue, Sep 07, 2021 at 06:20:33PM +0200, Philippe Mathieu-Daudé wrote:
>> On 7/18/21 3:46 PM, Reinoud Zandijk wrote:
>>> Userland targers will otherwise use a poisoned CONFIG_NVMM
>>
>> Typo "targets", but do you mean bsd-user or linux-user?
> 
> Since its on NetBSD, I guess its bsd-user :)
> 
>> But what is the error you get here?
>>
>> cpu_report_tpr_access() is protected for !CONFIG_USER_ONLY,
>> target/i386/nvmm/ is only build on system emulation.
>>
>> So when can this happen? Last candidate is "sysemu/hw_accel.h";
>> does it really need to include "sysemu/nvmm.h"?
> 
> [5560/6718] Compiling C object libcommon.fa.p/hw_core_cpu-common.c.o
> FAILED: libcommon.fa.p/hw_core_cpu-common.c.o 
> gcc -Ilibcommon.fa.p -I../slirp -I../slirp/src -I../dtc/libfdt
> -I../capstone/include/capstone -I. -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/pkg/include -I/usr/pkg/include/glib-2.0 -I/usr/pkg/lib/glib-2.0/include
> -I/usr/pkg/include/gio-unix-2.0 -I/usr/X11R7/include
> -I/usr/pkg/include/spice-1 -I/usr/pkg/include/spice-server
> -I/usr/X11R7/include/pixman-1 -I/usr/pkg/include/libpng16
> -I/usr/pkg/include/SDL2 -I/usr/pkg/include/ncursesw
> -I/usr/X11R7/include/libdrm -I/usr/include -I/usr/pkg/include/ncurses
> -I/usr/pkg/include/python3.8 -I/usr/include/krb5 -fdiagnostics-color=auto
> -pipe -Wall -Winvalid-pch -std=gnu11 -O2 -iquote . -iquote
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b
> -iquote
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include
> -iquote
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/disas/libvixl
> -iquote
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/tcg/i386
> -pthread -U_FORTIFY_SOURCE -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE_EXTENDED=1
> -fPIC -D_NETBSD_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -D_REENTRANT
> -D_THREAD_SAFE -Wno-undef -MD -MQ libcommon.fa.p/hw_core_cpu-common.c.o -MF
> libcommon.fa.p/hw_core_cpu-common.c.o.d -o
> libcommon.fa.p/hw_core_cpu-common.c.o -c ../hw/core/cpu-common.c
> In file included from
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include/sysemu/hw_accel.h:19:0,
>                  from ../hw/core/cpu-common.c:24:
> /tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include/sysemu/nvmm.h:16:8:
> error: attempt to use poisoned "CONFIG_NVMM"
>  #ifdef CONFIG_NVMM
>         ^
> [5589/6718] Compiling C object libcommon.fa.p/hw_net_e1000e_core.c.o
> ninja: build stopped: subcommand failed.
> 
> With the patch it works fine.
> 
> With regards,
> Reinoud
> 
> 
>>> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
>>> ---
>>>  include/sysemu/nvmm.h | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
>>> index 6d216599b0..833670fccb 100644
>>> --- a/include/sysemu/nvmm.h
>>> +++ b/include/sysemu/nvmm.h
>>> @@ -10,8 +10,7 @@
>>>  #ifndef QEMU_NVMM_H
>>>  #define QEMU_NVMM_H
>>>  
>>> -#include "config-host.h"
>>> -#include "qemu-common.h"
>>> +#ifdef NEED_CPU_H
>>>  
>>>  #ifdef CONFIG_NVMM
>>>  
>>> @@ -23,4 +22,6 @@ int nvmm_enabled(void);
>>>  
>>>  #endif /* CONFIG_NVMM */
>>>  
>>> -#endif /* CONFIG_NVMM */
>>> +#endif /* NEED_CPU_H */
>>> +
>>> +#endif /* QEMU_NVMM_H */
>>>
> 


