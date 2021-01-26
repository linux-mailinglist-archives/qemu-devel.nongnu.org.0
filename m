Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71444303F34
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:48:59 +0100 (CET)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OiH-00051d-Lr
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Ogi-0004Uc-UP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Ogf-00036k-Uz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611668836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnucD0Q+6VDh3aCp4wulxjaeUqmXHXVBoG2m/W1jWmo=;
 b=KWQ5mdHHJWdH9B1qADwBU2+HnD5uz4sCyALjunji9/qzOTj3DpYko3mJNtWWMStkbGsjMa
 OekPZ+uXEz0G1F5Ej/qFgCAb1K3PTN7ARYQ5xQ/c8avOqctxBkYhvvZYa7RXbBVCKQj/Ye
 C4rnKFIX37YC/sfIIJYVcmkitCu/snQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-7NPnfdGYOyK5IRqGRzYRgQ-1; Tue, 26 Jan 2021 08:47:13 -0500
X-MC-Unique: 7NPnfdGYOyK5IRqGRzYRgQ-1
Received: by mail-ed1-f70.google.com with SMTP id q12so4568434edr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OnucD0Q+6VDh3aCp4wulxjaeUqmXHXVBoG2m/W1jWmo=;
 b=lsnc0VowVwqxG2fVMx/7J75kw/DFnir9ftBbMwqKOnhzW84pisv0WjNrAB130lw0TI
 gN3dAz/1tQ0lGX4LJquwZgGhHa1ag3KWznRWjHKs0mYGg8VUjh+srmFmx41GjA3JHRsv
 WTXF1+YtaVSICpgJUmixV7poDOgSU0dss/IgmdIpGhqo9FBf/bbDm3BhodhbhzAb0F1n
 E5F2YpoRJrvl/3XGdPnwntY1Mpw4Eux3cNYlcVPTRCDX2vd5FRY+vUaE+TRieQJZnHuU
 9+H/iQwYDeShvL+IHYFweI2X5WfMj8nyFHC16WNIcx64eRmDpQFRVPDYrI6FzIbwFNg5
 JjPg==
X-Gm-Message-State: AOAM533lHU0KsGWdSAD3ts0VtQ5tvzHCD5We6nybgP06gKKPAjvOzln9
 M3PXZLUdILHJxLORMaUeBjHFHn6fu2ib4evH37PBjZcaUyNOxFQqCGFsa+p9mWs95/UqweStt9I
 /osAQY/b9PjHv598=
X-Received: by 2002:a17:906:298b:: with SMTP id
 x11mr3612417eje.158.1611668831973; 
 Tue, 26 Jan 2021 05:47:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS+aoXy2IaBHlZDU3YQ2+j7Ppj1GIDsXzzuV09Lz9enybpK8XeelpTHmzzXD8IYww+ltqc5w==
X-Received: by 2002:a17:906:298b:: with SMTP id
 x11mr3612402eje.158.1611668831763; 
 Tue, 26 Jan 2021 05:47:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id br6sm7973509ejb.46.2021.01.26.05.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 05:47:10 -0800 (PST)
Subject: Re: [PATCH] meson: Restrict Cocoa framework check to macOS
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210126132637.3175037-1-philmd@redhat.com>
 <CAFEAcA8q=ZgMYvZfr75RP90T0SVvD1JUnT2sN08H5T8DLpanbg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <799ec5a4-7a0f-074b-87dd-99d0f80bbb35@redhat.com>
Date: Tue, 26 Jan 2021 14:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8q=ZgMYvZfr75RP90T0SVvD1JUnT2sN08H5T8DLpanbg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Brendan Shanks <brendan@bslabs.net>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 2:28 PM, Peter Maydell wrote:
> On Tue, 26 Jan 2021 at 13:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Do not check for Cocoa framework if the OS is not macOS.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 35a9eddf5cf..9a9ee5408b9 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -369,7 +369,10 @@
>>    endif
>>  endif
>>
>> -cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
>> +cocoa = not_found
>> +if targetos == 'darwin'
>> +  cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
>> +endif
>>  if cocoa.found() and get_option('sdl').enabled()
>>    error('Cocoa and SDL cannot be enabled at the same time')
>>  endif
> 
> What difference does this change make?

On my slow Fedora host it run cmake checks if it can build cocoa.

> Are there ever
> situations where the 'detect cocoa' test incorrectly
> finds cocoa on a non-macOS system and breaks something?

In my case it is not breaking, just slow. The host is slow anyway,
making it more apparent.

> 
> thanks
> -- PMM
> 


