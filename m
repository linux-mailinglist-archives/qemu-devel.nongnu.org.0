Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E91508DC7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:52:18 +0200 (CEST)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDYv-0003zH-JV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCvp-0002OR-IB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCvm-0006mx-G7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650471109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNYJJJFzUdxfHccBgDenUFLS1deY5WxHCdClwVXN22Y=;
 b=PUv/E9nwTtBa5ghqvFDVRg8hfWU3Y8WRBLW5K9zbbnlBo48B5+TRNEUwYf2rgp0ZR/qj9n
 1I4z1eZj7gC2TW5+I47JY3F88fVie3sjvghlY0ZZBIjSH9553o+rIAhWz+K8OaemFhIALo
 flwAtmceFHYLA8vokxz1eFVZtu2s9lQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-N_MP_m0MP4yrOJ1CxbtSWQ-1; Wed, 20 Apr 2022 12:11:47 -0400
X-MC-Unique: N_MP_m0MP4yrOJ1CxbtSWQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso536823wrh.18
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=pNYJJJFzUdxfHccBgDenUFLS1deY5WxHCdClwVXN22Y=;
 b=sRJiIwZXFxq6Qmmk8SFDw/SNabuVCpxoPtehFbmOIJ2YOp5io+CYRi8n6aAkp9QWNp
 2xwIE0hffTBS60yJYA/3MmN7MHzObFsQLHHpIvA8xDjAR1fRedOIAlX6Wbx2/Cm0uKxn
 J0VS8cEaArV3alGkp+gYoOqc3NIHua6Z5pj7kPg6Pi99yKjqHgyiEutLcF0K8peKD6vF
 aU5AktRyr4OTpaVno0UudmwDI+861ToPhJaGTF9RSsWLUHxD2ouXl2JSLVainX1GtvVa
 z3r5T97g5FcAiq2mLq9VeiT0k73s9QTj4TjNFRBa+37+xrFlTF33XaQTnT6r8FLj9ab/
 ZaZA==
X-Gm-Message-State: AOAM533c5mX+vk9U9P5KtQwxcQCC+M5k6C5cdNGv7vCpA/+2M7m+U9QD
 tzRH/nyZbF6gVbSbZVTNcfo5tMmMY+uCoHUCZHgnD7u8bnbY+1/niExr6kLViyGBKvHqnDQ+KMI
 OllK4sydGp5GJ5K0=
X-Received: by 2002:a05:600c:4313:b0:38e:b150:2f8e with SMTP id
 p19-20020a05600c431300b0038eb1502f8emr4439886wme.198.1650471106345; 
 Wed, 20 Apr 2022 09:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw18fMJCvfCr2GyyCTcmngKgJhhLzpQUZiS/BSZREu/e9cXWTYpj4PRWPYAC9nXnFae14LoBw==
X-Received: by 2002:a05:600c:4313:b0:38e:b150:2f8e with SMTP id
 p19-20020a05600c431300b0038eb1502f8emr4439861wme.198.1650471106053; 
 Wed, 20 Apr 2022 09:11:46 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfff90000000b0020947cf914bsm213989wrr.31.2022.04.20.09.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 09:11:44 -0700 (PDT)
Message-ID: <67453a39-a2a5-b523-9221-d932926a3594@redhat.com>
Date: Wed, 20 Apr 2022 18:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
 <YmAlm0WXIf2n4VRX@redhat.com>
 <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
In-Reply-To: <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 17.32, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Apr 20, 2022 at 7:24 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Wed, Apr 20, 2022 at 06:50:12PM +0400, Marc-André Lureau wrote:
>>> Hi
>>>
>>> On Wed, Apr 20, 2022 at 6:46 PM Marc-André Lureau
>>> <marcandre.lureau@redhat.com> wrote:
>>>>
>>>> Hi
>>>>
>>>> On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> On 20/04/2022 16.10, Daniel P. Berrangé wrote:
>>>>>> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wrote:
>>>>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>>
>>>>>>> According to our configure checks, this is the list of supported
>>>>>>> compilers.
>>>>>>>
>>>>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>>>> ---
>>>>>>>    docs/about/build-platforms.rst | 10 ++++++++++
>>>>>>>    1 file changed, 10 insertions(+)
>>>>>>>
>>>>>>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>>>>>>> index c29a4b8fe649..1980c5d2476f 100644
>>>>>>> --- a/docs/about/build-platforms.rst
>>>>>>> +++ b/docs/about/build-platforms.rst
>>>>>>> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
>>>>>>>    The version of the Windows API that's currently targeted is Vista / Server
>>>>>>>    2008.
>>>>>>>
>>>>>>> +Supported compilers
>>>>>>> +-------------------
>>>>>>> +
>>>>>>> +To compile, QEMU requires either:
>>>>>>> +
>>>>>>> +- GCC >= 7.4.0
>>>>>>> +- Clang >= 6.0
>>>>>>> +- XCode Clang >= 10.0
>>>>>>
>>>>>> Do we need to spell out the versions explicitly ? These versions are
>>>>>> all derived from what's available in the repos of the supported build
>>>>>> platforms, similar to any other build deps we have. I don't think we
>>>>>> want to start a precedent of duplicating versions in this doc for
>>>>>> build deps we have, and there's nothing particularly special about
>>>>>> compilers in this respect.
>>>>>
>>>>> I agree with Daniel - when I saw this patch, the first thought that I had
>>>>> was: "This will be getting out of sync quickly" ...
>>>>
>>>> I don't have the impression we bump our compiler requirement regularly
>>>> or lightly.
>>>>
>>>>> so I'd also recommend to rather not add this here.
>>>>
>>>> Outdated documentation is still better than no documentation. YMMV.
>>>
>>> Another question that is difficult to answer without being familiar
>>> with QEMU details is whether it can compile with MSVC. This
>>> documentation would, since it is explicit about the requirement.
>>
>> Documenting that we mandate GCC or Clang is reasonable. Ideally we could
>> have a list of all 3rd party deps we have in fact, I'm just not a fan of
>> copying the version numbers across from configure/meson.
>>
> 
> I agree, duplicating the version information is not optimal... Yet it
> is better than not having it, or having to read or run configure imho.

Well, no, it's better to have it in the configure script. Every user who 
wants to compile QEMU will run the configure script, but not necessarily 
read the documentation first.

> Sorry (or not) to insist, but it would help having an explicit list of
> supported compilers in the human doc

... and what about necessary libraries ... if you start with the compilers 
here, shouldn't we also list the necessary versions of glib, libfdt, pixman, 
etc. here? ... No, IMHO this really does not scale, you could maybe mention 
that GCC or Clang is necessary, and maybe that you need at least glib to 
compile QEMU, but listing the versions there is just duplicated information 
that will be ugly to maintain, without too much real benefit for the users 
(they already know whether their distro is supported or not), and way too 
much hassle for the developers.

  Thomas


