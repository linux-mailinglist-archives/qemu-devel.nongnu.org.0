Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BC39EFE6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:48:18 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWTB-0007NH-DR
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqWRv-0006ds-Mr
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqWRs-00053k-Fq
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623138415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIzKi0HCICXqPFi50A+3RyQQ4ExN6dUeTZoiy/2nGoQ=;
 b=PWxppnKB8NUnLt9Q6Nc9s0WAMZwEbxetErsjuOSC7N2IbGLwcBeSpZ5yJXUEufJOTQWqhD
 Zq+AghwewnVOl1ohwXM2Syg49+1w7qWHsa04nTDg98+QpbV7QNgUC5/PU/kySDmfAq2VRI
 Mzbr48aUEjSwhqY6MqtaFMHnHzrZB0E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-NQ3JSSMSMYeGgQ_a2DGL5g-1; Tue, 08 Jun 2021 03:46:52 -0400
X-MC-Unique: NQ3JSSMSMYeGgQ_a2DGL5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 m33-20020a05600c3b21b02901a44b1d2d87so407892wms.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 00:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EIzKi0HCICXqPFi50A+3RyQQ4ExN6dUeTZoiy/2nGoQ=;
 b=E6hpIUWKoottIeFXMiAtyWabZmXIgpZR3zfvg0FAocrIW4Zz9GctywrLmYYWEkzt6K
 3qhJFmYP4S+rMYxdabyLT+UIRaxGmgBomoEX0r7p3heG4iradczn+dHdeihR/zun/oxE
 hqWkczqz2i4IFp0zCAuZXwHI6XkGth2Ff/hPSsKvIEdhbkMpTBw0ySX2z1XEATw9vHIZ
 3G1U0ZPmYxW8qt/h2yPfEBrFr6hWkvqJccEC2ZoRtNtwJS+EFVHmkRVZUo3URTer9gr9
 72fYzUs60JHNX0qrubqhmLX4TjDw29dvelZ7SYr2f2KUt4lCBMw0dEDJ6U6lccwMvKVi
 ILhw==
X-Gm-Message-State: AOAM533OQGkSPxp2P+6hUrI3Qw4mr9M/KSgULmaUrAMEzH2lHDo9JHoq
 ham2kmUltwOclqbo3EEV8MR4HjoK50kR24SFZFkgvMNuVyLA2naVMsQYTAy7sp2d8oCRnJZj45I
 h8nst5v6MosVwqUMrkmV8BgrxDgJKSEwD/pqmZNxj+iU3V4sCVnRH3zM3oRJFpWU=
X-Received: by 2002:adf:c392:: with SMTP id p18mr21267173wrf.373.1623138411277; 
 Tue, 08 Jun 2021 00:46:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNGdfWQT7LTao3i4EThAakG3kVgmK+cSg3E4OADHzoL+0QSBalm3Nxz9rQjgagDPNgN7JtDg==
X-Received: by 2002:adf:c392:: with SMTP id p18mr21267145wrf.373.1623138411009; 
 Tue, 08 Jun 2021 00:46:51 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id r18sm19235819wro.62.2021.06.08.00.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 00:46:50 -0700 (PDT)
Subject: Re: [PATCH] configure: Check whether we can compile the s390-ccw bios
 with -msoft-float
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210525142032.156989-1-thuth@redhat.com>
 <20210525163121.6901dca2.cohuck@redhat.com>
 <3a4f413f-7ce5-0d78-180c-e08b351b30df@redhat.com>
 <724c58f8-d879-6bee-dc87-356d054be8d6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <82df7700-1a9c-01db-d0fc-bfa5369a336e@redhat.com>
Date: Tue, 8 Jun 2021 09:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <724c58f8-d879-6bee-dc87-356d054be8d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/2021 17.13, Philippe Mathieu-Daudé wrote:
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
>>>>    configure | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 676239c697..673419ff31 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -5462,7 +5462,7 @@ if test "$cpu" = "s390x" ; then
>>>>      write_c_skeleton
>>>>      compile_prog "-march=z900" ""
>>>>      has_z900=$?
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
>>                  unsigned short raw[ip6size];
>>                                 ^
>>
>> ... not sure what to do with that one yet.
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
>   {
>          int i;
>          unsigned long checksum;
> -       const int ip6size = sizeof(struct ip6hdr)/sizeof(unsigned short);
>          union {
>                  struct ip6hdr ip6h;
> -               unsigned short raw[ip6size];
> +               unsigned short raw[sizeof(struct ip6hdr) /
> sizeof(unsigned short)];
>          } pseudo;
> 
>          memcpy (&pseudo.ip6h, ip6h, sizeof(struct ip6hdr));
> @@ -455,7 +454,7 @@ static unsigned short ip6_checksum(struct ip6hdr
> *ip6h, unsigned char *packet,
>          for (checksum = 0, i = 0; i < bytes; i += 2)
>                  checksum += (packet[i] << 8) | packet[i + 1];
> 
> -       for (i = 0; i < ip6size; i++)
> +       for (i = 0; i < sizeof(pseudo.raw); i++)
>                  checksum += pseudo.raw[i];
> 
>          checksum = (checksum >> 16) + (checksum & 0xffff);
> ---
> 
> Do you want me to send the fix since I have it ready?

Yes, please!

  Thanks,
   Thomas


