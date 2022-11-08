Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7C6217B2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:10:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQEF-0007KU-8t; Tue, 08 Nov 2022 10:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osQEC-0007KB-Ri
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osQE7-0005uZ-O8
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667920161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ub9f5Wv1bizPlXViM9XJONRVleIcQXvvwBx5YeVq1t8=;
 b=AbuGLLFC85fLS+5HVcXl+JYoe8pBe5uzmsdeMyDCNdBz+hab0Lz4sn+Rfd02spiedkF7vq
 A5JTjpT+JxA7r6vtoZMQ6RqKhj5OXzVPhY083lgn5pIT3JBrzv5A7sZHmm4a6iUzraTHNi
 xVidgBQ3S9Lb5Qj/7KNfZLTlNQaOgCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-KvYOPE4OOYKi5i2qijQBmw-1; Tue, 08 Nov 2022 10:09:20 -0500
X-MC-Unique: KvYOPE4OOYKi5i2qijQBmw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i82-20020a1c3b55000000b003cf9bd60855so2817657wma.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ub9f5Wv1bizPlXViM9XJONRVleIcQXvvwBx5YeVq1t8=;
 b=RjbLaqNdl62Yfxj0oqQJjFDbRQk45C39bzEkMmt9MXWDv8K65TbZbKSmpSw6hUi61u
 KEanq/vDCICxq0WDcAnP1GeoJsPjR/iOrr/VCrZ6i34GkqiMy6Madb1R0h/woaxbIngy
 yunOFaRIG4Y34C4eb77vbGRTe8RQxQdTAYqFWGOqjg/Jt6+FR33M1kXSpNiA6IdgJC/9
 7Pl3uicyGw2i4B7sm2MZbkUWLPDgiDMJpxPW9UukPUG/1cdGJfd+4q1zaKfc18tXAAjC
 ByG0hUdz6bit/l0BanCUxhWlGESitXBay2nnjb4Wh15PBS8wR1t33rYi7dWVk9JY+nCm
 nqRQ==
X-Gm-Message-State: ACrzQf26eXjgLQh2unEU91CN+s4s8zgwQGFzy9cZAarez5lGkXjRFILe
 /kmaPNQtNwUUNAoqmCERtt/SL1gkskKuTR0jRKWURR3gQWqACuaK0zBmyUQT1OK0Xz5oXlNKhcS
 XYBLS9Rs7mpjGAK8=
X-Received: by 2002:a05:600c:1e8f:b0:3cf:7126:1fd0 with SMTP id
 be15-20020a05600c1e8f00b003cf71261fd0mr731889wmb.14.1667920158768; 
 Tue, 08 Nov 2022 07:09:18 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5AlFsdWvHvUjKnZC7DOjLhgrPFicGUaHXgh6yTqqImsEPgIR/5lAXf0mITwlM6JLfR/seiOg==
X-Received: by 2002:a05:600c:1e8f:b0:3cf:7126:1fd0 with SMTP id
 be15-20020a05600c1e8f00b003cf71261fd0mr731873wmb.14.1667920158437; 
 Tue, 08 Nov 2022 07:09:18 -0800 (PST)
Received: from [192.168.8.100] (tmo-064-15.customers.d1-online.com.
 [80.187.64.15]) by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm10383333wrq.24.2022.11.08.07.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 07:09:17 -0800 (PST)
Message-ID: <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
Date: Tue, 8 Nov 2022 16:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221030222841.42377-1-philmd@linaro.org>
 <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
 <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/11/2022 15.23, Philippe Mathieu-Daudé wrote:
> On 8/11/22 14:59, Peter Maydell wrote:
>> On Sun, 30 Oct 2022 at 22:29, Philippe Mathieu-Daudé <philmd@linaro.org> 
>> wrote:
>>>
>>> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
>>>
>>>    Merge tag 'dump-pull-request' of 
>>> https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 
>>> 10:53:49 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/philmd/qemu.git tags/mips-20221030
>>>
>>> for you to fetch changes up to 487099aee951e4966936acd3e9afd24c69de85ea:
>>>
>>>    hw/mips/malta: Use bootloader helper to set BAR registers (2022-10-30 
>>> 23:08:10 +0100)
>>>
>>> ----------------------------------------------------------------
>>> MIPS patches queue
>>>
>>> - Convert nanoMIPS disassembler from C++ to C (Milica Lazarevic)
>>
>> Was this the last use of C++ in the tree, or am I forgetting
>> some other part that still needs the C++ compiler?
>>
>> If it is the last thing, we should put in the "Build Dependencies"
>> part of the release notes that a C++ compiler is no longer required
>> and mention that the configure options to specify it will go away in
>> a future release.
> 
> I guess the last use is from the Guest Agent on Windows...
> 
> $ git ls-files | fgrep .cpp
> qga/vss-win32/install.cpp
> qga/vss-win32/provider.cpp
> qga/vss-win32/requester.cpp

Yes, I think the c++ configure options are still required for that Windows 
stuff ... but IIRC Paolo once mentioned that we could simplify the linker 
logic in configure or meson.build once the nanomips stuff has been 
converted, since we now do not have to mix C and C++ linkage anymore?

  Thomas


