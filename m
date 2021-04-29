Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342736E83F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 11:56:41 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3PT-0008WC-QR
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 05:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc3O8-0007wO-Fy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc3O4-0000Rw-DX
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619690111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+T2I4FvIa6RhcZsuDUflbflDG/hk7WctC0CKh+Wa90=;
 b=GZgabzScmiS81KqWjVbEWz8/HFXLcrhtezyxQ5GNc/kZP8AhQAZVBPXZeXdpXGKKMlWYUq
 MXitE+F1+GZM8mrbJguk1a5hOGhM1TsUQpHLFPJR/ThaOPSHaMNvbFn+e7JtIjNKHzzf2g
 CtycFqHbF+2dlERW2d0QoUsOU4ucFH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-s1J6rDbsO-y_dpXbSHPkNg-1; Thu, 29 Apr 2021 05:55:04 -0400
X-MC-Unique: s1J6rDbsO-y_dpXbSHPkNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 60-20020adf85420000b0290109440de5e9so8133538wrh.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 02:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j+T2I4FvIa6RhcZsuDUflbflDG/hk7WctC0CKh+Wa90=;
 b=duaTG/ePX8GbECKn33WCw9D48M/nWJqyGPX297ofvtFaMggo3oOugdJU30AAu4wjyf
 LmWZ6ur9F/8o+ehfJmLuLIFe61NbVJCagv42nb/rpdQGQ36sdW8V1MTf0yoM6ra4pubO
 hIVfFUV4BlV7B3vZM/HeUkFoPgs8detVzMoNxAOP4qUUHNoKx2sKabd0SW2NRYC4kQXk
 vbKOlGf5LuwwzZXV10w4I5sRLJK7nnmWgZW9gIxRS51qLNqU3l7Z9PkA60+CA0UVAnbu
 SR4iQN+Ibpj0++uhJFrEEbVKPtUIw69n73ju5RY73/leVMSuQeDV2Jb0T1Nz+7G+yXKZ
 KW8Q==
X-Gm-Message-State: AOAM530GsdFkeAqIvDX0KVdsrzPTY/Q/JH4rzLJ+4pugr9LJwOuH+psD
 bQpGfwI4VkpVyykDxBg6xikfKUPNKAx6afNG4WgFQ7EbIEeb2Db/eGPkk/bTnONexazpZxM6oZJ
 naQU3Lf5wjqYIJTw=
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr1350364wru.387.1619690103161; 
 Thu, 29 Apr 2021 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKjKziVr59pnn7b/7z+eGCfuE1fvPbYiXky86iEuLvvLAwJ/3Qtj3E3AwHaytb8VzN4ernVQ==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr1350327wru.387.1619690102931; 
 Thu, 29 Apr 2021 02:55:02 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id e12sm3843731wrt.51.2021.04.29.02.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:55:02 -0700 (PDT)
Subject: Re: [PATCH] meson: change buildtype when debug_info=no
To: Joelle van Dyne <j@getutm.app>
References: <20210428195558.16960-1-j@getutm.app>
 <dd5fc80e-c08a-95a5-57e9-28a123196eff@redhat.com>
 <CA+E+eSD11QHWh5HUZT+74_1k3-KPAym09An6=8BtSKjROAY_fA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d68bafad-2618-dd60-bc9b-f5a85b6954aa@redhat.com>
Date: Thu, 29 Apr 2021 11:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+E+eSD11QHWh5HUZT+74_1k3-KPAym09An6=8BtSKjROAY_fA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:33 AM, Joelle van Dyne wrote:
> On Wed, Apr 28, 2021 at 10:07 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> On 4/28/21 9:55 PM, Joelle van Dyne wrote:
>>> Meson defaults builds to 'debugoptimized' which adds '-g -O2'
>>> to CFLAGS. If the user specifies '--disable-debug-info' we
>>> should instead build with 'release' which does not emit any
>>> debug info.
>>>
>>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>>> ---
>>>  configure | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/configure b/configure
>>> index 4f374b4889..5c3568cbc3 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -6398,6 +6398,7 @@ NINJA=$ninja $meson setup \
>>>          --sysconfdir "$sysconfdir" \
>>>          --localedir "$localedir" \
>>>          --localstatedir "$local_statedir" \
>>> +        --buildtype $(if test "$debug_info" = yes; then echo "debugoptimized"; else echo "release"; fi) \
>>
>> NAck. You are changing the default (which is 'debug') to 'release'.
> 
> I thought 'debugoptimized' was the default? From my build logs,
> there's always '-g -O2' which is why I needed to make this change. The
> default for 'debug_info' is yes so this keeps it on 'debugoptimized'
> and uses 'release' when explicitly disabling debug_info.

Again, I'm not concerned between 'debugoptimized' VS 'debug',
I'm worried to use 'release', because of the b_ndebug=if-release
option which disable assertions (unsupported QEMU build mode).

Also, 'release' sets optimization=3 which isn't supported neither.

Per https://mesonbuild.com/Builtin-options.html#build-type-options

  All other combinations of debug and optimization set buildtype
  to 'custom'.

So maybe this is what you want, with debug=false and optimization=2?

> 
>>
>> This should be at least mentioned in the commit description, but
>> I don't think this is what we want here. 'release' enables -O3,
>> which is certainly not supported. The 'debug' profile is what we
>> have been and are testing.
>>
>> I'd be OK if you had used "debugoptimized else debug".
>>
>> The mainstream project would rather use 'debug'/'debugoptimized', or
>> 'minsize', which are already tested. We might consider allowing forks
>> to use 'plain' profile eventually. But the 'release' type is an
>> unsupported landmine IMHO.
>>
>> If you want to use something else, it should be an explicit argument
>> to ./configure, then you are on your own IMO.
> 
> What do I need to avoid '-g'?

Why don't you simply use ./configure --extra-cflags='-g0 -O2'?

Regards,

Phil.


