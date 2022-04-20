Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF7508B6B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:00:43 +0200 (CEST)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBow-0000uI-UY
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBiE-00083t-6c
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBi8-0002Dk-FK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPZnR+48jQkK7/0Cjw9H+i3g/eZzqsr5W4xSMOq5FJc=;
 b=ZcegwTuOTUJbg7cQN+FuyNtJM/SpdcSK5P6xurn7MNsBf8wWVssYvEehLiU7JCDuzE0AMu
 HdB/8JkeZlaQF2dK8gRpYgNiv1hjw8QQo5KFBPB+rUyqaBsc8+zmjmAFSmt9tWFVdbyyAz
 DaKewhb15IuM+Y8Cx1+OdeOUj1j0Bzo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-fZ_P0memN8GespPU9cVfyw-1; Wed, 20 Apr 2022 10:53:38 -0400
X-MC-Unique: fZ_P0memN8GespPU9cVfyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso2578520wmc.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qPZnR+48jQkK7/0Cjw9H+i3g/eZzqsr5W4xSMOq5FJc=;
 b=Tlmbem+lp6+xzuOAAnyTDRv41HcNtv5lJuAzewBrla951oowvADqEH1jueR6XiEbgT
 3AZV1gJA5eIT1lcsB+gdy4MjFjvHvoJWQRZ9zXvQtStp7++Z/j+c2tL+piUf8KcfpTVp
 AjymY7TtmVBOtE+SUFkk7dnqW9BvR41UaK0FeEIoQn4uKUY613OtiSg1afA0yWE9QSQC
 utvd20wv8mErg0eKaQO3HY/UZXiEQDzH3YzHWTye+figB+L4NnSCJHJmo/ta6Yub7ONC
 f8a8EdRp8oMpZy9/TpUqBYSTZ9rVvIf+C1Ih9RoQqQiY/iQ1ZsZ2eTEuwTmmi2bZ6WgK
 zeXg==
X-Gm-Message-State: AOAM530gLAUbP1l3XPAFf78yie/nh4MUxf5vzayq8L5hPdj0SL3pK8mT
 xuJa8+p1YWS8fXTaogL1jPnCNngq/D9ynp4NTw4aSmZlauXJBS5QylSR7j/i1AwT+Q4VIWYq4Fc
 G/esx1RlLKOEP0Xs=
X-Received: by 2002:a05:6000:1689:b0:20a:ae38:4b1a with SMTP id
 y9-20020a056000168900b0020aae384b1amr3181247wrd.279.1650466417261; 
 Wed, 20 Apr 2022 07:53:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgD676yoK2BQDNckg1hKFOL7ZnALy2B0tmXGXKkiauWLTI3HOPx7TKf27eFqOESPzt4nCXBg==
X-Received: by 2002:a05:6000:1689:b0:20a:ae38:4b1a with SMTP id
 y9-20020a056000168900b0020aae384b1amr3181233wrd.279.1650466417007; 
 Wed, 20 Apr 2022 07:53:37 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b0039187bb7e9asm92244wmm.6.2022.04.20.07.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:53:36 -0700 (PDT)
Message-ID: <fec475b9-b1c9-e9bf-5e90-6c4b0c73d4e6@redhat.com>
Date: Wed, 20 Apr 2022 16:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 16.46, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 20/04/2022 16.10, Daniel P. Berrangé wrote:
>>> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wrote:
>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> According to our configure checks, this is the list of supported
>>>> compilers.
>>>>
>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>>>> ---
>>>>    docs/about/build-platforms.rst | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>>>> index c29a4b8fe649..1980c5d2476f 100644
>>>> --- a/docs/about/build-platforms.rst
>>>> +++ b/docs/about/build-platforms.rst
>>>> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
>>>>    The version of the Windows API that's currently targeted is Vista / Server
>>>>    2008.
>>>>
>>>> +Supported compilers
>>>> +-------------------
>>>> +
>>>> +To compile, QEMU requires either:
>>>> +
>>>> +- GCC >= 7.4.0
>>>> +- Clang >= 6.0
>>>> +- XCode Clang >= 10.0
>>>
>>> Do we need to spell out the versions explicitly ? These versions are
>>> all derived from what's available in the repos of the supported build
>>> platforms, similar to any other build deps we have. I don't think we
>>> want to start a precedent of duplicating versions in this doc for
>>> build deps we have, and there's nothing particularly special about
>>> compilers in this respect.
>>
>> I agree with Daniel - when I saw this patch, the first thought that I had
>> was: "This will be getting out of sync quickly" ...
> 
> I don't have the impression we bump our compiler requirement regularly
> or lightly.

"quickly" in the sense of that it will be out of sync once somebody bumps 
the version check in the "configure" script - since I doubt that it will be 
remembered to update this document here as well.

>> so I'd also recommend to rather not add this here.
> 
> Outdated documentation is still better than no documentation. YMMV.

Well, no. In this case, it might rather create wrong expectations for the 
users if they read that their compiler is still supported, but the configure 
script refuses it.

Anyway, if you feel like we need more information for the users about 
supported systems and compiler versions, feel free to update this page here 
instead, it has also fallen behind already quite a bit:

  https://wiki.qemu.org/Supported_Build_Platforms

  Thomas


