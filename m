Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA1391514
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 12:38:38 +0200 (CEST)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llqvt-0005aC-5x
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 06:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llquq-0004lx-89
 for qemu-devel@nongnu.org; Wed, 26 May 2021 06:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llqun-0006zD-7h
 for qemu-devel@nongnu.org; Wed, 26 May 2021 06:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622025447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMqc0s+eULmfpwz57gWASGGnQDivHFYVrgenHEZTUTs=;
 b=UQf94q44gGpjILjKfj15Dzv4EkMOP1+du8pXzrzKXZt6AZGiMq7Y4HQKjF/9mK+t7LczIe
 pf9EQIRv6bRCM3j6mdQFKu6Of3eVjpT5Od/2v3HEI8fbhMrbSgp9BDVvik9G2gKvAWWxX7
 xj+5xB83Wkdg5ngkUBHq7GKjrPEb7s0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-JunlY24qPo6xx_1jRQ8keg-1; Wed, 26 May 2021 06:37:25 -0400
X-MC-Unique: JunlY24qPo6xx_1jRQ8keg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so211428wri.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 03:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NMqc0s+eULmfpwz57gWASGGnQDivHFYVrgenHEZTUTs=;
 b=rYqvUNB+Vb8GjiUtr0QA1kRfWfhdztbfMesF6NYAhxXtFSdtfzgxOdyz1Ka8p6UIQA
 BYThOqvM2r5XWlXG38rmxr1L3w0tmGc1XCgTgC+kwlHYR8i7efAL2iHkBb+E0Zclya7z
 JSftkHvGvpkZj3j15xmSntcP7PDxGPpVBXgjzZlKG5ZXgKprDgkHB9cp51u9b0MfPCz8
 u5S/VdsNB5INX3ZQITgfYCzaBks+/M2XC3szJwOKVkE2YaDEJXGa67egXe33KuBuddtp
 lIZIeBvHCQmlGmun1uyqFFIoX1wlDpEyI7PUDOo6Ok5V+ZdCsSqOKeWW1IgJM0R3yM1n
 x9Bg==
X-Gm-Message-State: AOAM532jyXVeAc4hzylvhTsASMMCQ3DlUKApftV4poiyGaANXrEHzCoh
 u+eUdYKlGRgnK8ph7J1NAAV4/Z4CSGgZp2PlhzIeym7ZkFJjjJrvqv6Odh8hATKwvjaMJV8sJp4
 pKwguBuOsyT6vcXaK2VrQzxzWwJww+thkmPXILMGxUrxiViQw79nnniHPd1NYEp0M
X-Received: by 2002:a5d:508f:: with SMTP id a15mr29529876wrt.242.1622025443499; 
 Wed, 26 May 2021 03:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI4Kh5IyEvyD/gp6j9os+FRKNHmcrvKBkHhQkPRr9ptdG3XCAlZ8sOm+a2T+NVNXZZKGTs1w==
X-Received: by 2002:a5d:508f:: with SMTP id a15mr29529844wrt.242.1622025443177; 
 Wed, 26 May 2021 03:37:23 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n13sm20573917wrg.75.2021.05.26.03.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 03:37:22 -0700 (PDT)
Subject: Re: [PATCH] configure: Check whether we can compile the s390-ccw bios
 with -msoft-float
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210525142032.156989-1-thuth@redhat.com>
 <20210525163121.6901dca2.cohuck@redhat.com>
 <3a4f413f-7ce5-0d78-180c-e08b351b30df@redhat.com>
 <724c58f8-d879-6bee-dc87-356d054be8d6@redhat.com>
Message-ID: <6e7a8113-de8e-4b38-cadc-19414fe3a039@redhat.com>
Date: Wed, 26 May 2021 12:37:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <724c58f8-d879-6bee-dc87-356d054be8d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 5:13 PM, Philippe Mathieu-Daudé wrote:
> On 5/25/21 4:40 PM, Thomas Huth wrote:
>> On 25/05/2021 16.31, Cornelia Huck wrote:
>>> On Tue, 25 May 2021 16:20:32 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>> The -msoft-float switch is not available in older versions of Clang.
>>>> Since we rely on the compiler to not generate floating point
>>>> instructions
>>>> unexpectedly, we block those old compilers now via a test in the
>>>> configure
>>>> script. Note that for some weird reasons, the Clang compiler only
>>>> complains
>>>> about the missing soft-float support if no other flags are passed via
>>>> "-Wl,..." to the linker. So we have to use "compile_object" instead of
>>>> "compile_prog" for this check.
>>>
>>> Ugh.
>>
>> It's maybe better to use compile_object for testing -msoft-float anyway
>> since it could influence the way of linking against libraries (if I get
>> https://reviews.llvm.org/D72189 right).
>>
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   configure | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 676239c697..673419ff31 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -5462,7 +5462,7 @@ if test "$cpu" = "s390x" ; then
>>>>     write_c_skeleton
>>>>     compile_prog "-march=z900" ""
>>>>     has_z900=$?
>>>> -  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
>>>> +  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float
>>>> -Werror"; then
>>>
>>> Do you believe that we should have caught the various clang
>>> specialties now?
>>
>> Apart from one compiler warning that just popped up today, yes. I'm
>> seeing this compiler warning with Clang 12.0 now:
>>
>> roms/SLOF/lib/libnet/ipv6.c:447:18: warning: variable length array
>> folded to constant array as an extension [-Wgnu-folding-constant]
>>                 unsigned short raw[ip6size];
>>                                ^
>>
>> ... not sure what to do with that one yet.

See Eric's explanation:
https://www.mail-archive.com/qemu-block@nongnu.org/msg84461.html

> 
> Fix it? =)
> 
> Same class as:
> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/6690d55626cc
> 
> -- >8 --
> diff --git a/lib/libnet/ipv6.c b/lib/libnet/ipv6.c
> index 6420004..b7daeda 100644
> --- a/lib/libnet/ipv6.c
> +++ b/lib/libnet/ipv6.c
> @@ -441,10 +441,9 @@ static unsigned short ip6_checksum(struct ip6hdr
> *ip6h, unsigned char *packet,
>  {
>         int i;
>         unsigned long checksum;
> -       const int ip6size = sizeof(struct ip6hdr)/sizeof(unsigned short);
>         union {
>                 struct ip6hdr ip6h;
> -               unsigned short raw[ip6size];
> +               unsigned short raw[sizeof(struct ip6hdr) /
> sizeof(unsigned short)];
>         } pseudo;
> 
>         memcpy (&pseudo.ip6h, ip6h, sizeof(struct ip6hdr));
> @@ -455,7 +454,7 @@ static unsigned short ip6_checksum(struct ip6hdr
> *ip6h, unsigned char *packet,
>         for (checksum = 0, i = 0; i < bytes; i += 2)
>                 checksum += (packet[i] << 8) | packet[i + 1];
> 
> -       for (i = 0; i < ip6size; i++)
> +       for (i = 0; i < sizeof(pseudo.raw); i++)
>                 checksum += pseudo.raw[i];
> 
>         checksum = (checksum >> 16) + (checksum & 0xffff);
> ---
> 
> Do you want me to send the fix since I have it ready?
> 


