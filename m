Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EB36DE60
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:36:47 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbo7C-0002F8-3v
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbo2w-0007Hj-Tg
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbo2q-00016W-0K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619631133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/0UEpyH+lzR8CV8S1dhdxJXNx56u9OsBWOU1lGo9OA=;
 b=NYFzsQaN+Kde7n0NrVBTSUnWuaAruIlnnxzTzl+G32l7KNtsbZ8PrLPHjJur4TpnOSTGQu
 YnPG1c1eIkY8jMgiPOa+lhZE5+ATse5VMBM3viTqxdN84P25oBQmtgaRnavbpZ+1lwznQM
 tShbiFd5olkjnvV8CayQ1JhoaU+tsWQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-iHBIl6hdPXiho8vpyItgUQ-1; Wed, 28 Apr 2021 13:32:08 -0400
X-MC-Unique: iHBIl6hdPXiho8vpyItgUQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so509628wre.22
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v/0UEpyH+lzR8CV8S1dhdxJXNx56u9OsBWOU1lGo9OA=;
 b=lROQkSwNCxn9qy9gj++437SYlqVJ4h3KC2tu82FFsKlqcvaty5dsD+NpDYcgt9bMvh
 7R6CP0Qs2xVD3AXmqeOVmlbQIKsHHS7xyFq8hMCrAWz/8/ayuXEj80Sz09Ptz0vQ9bEn
 ahpwVz/esssooSvlfEi++EBbMGmIg7+rQonaLrFJq8LdBSGWJjbOsvSWln9NthlAFuK3
 VBTxAvFZR/408hGiThRxA8ptxe0zHU3D3WSOrJ24IMkmGUJVQlGVRi+a4Z8vqneY4k8W
 FAEXlXTPj7QX56sRno8NJ67HEg9HwDxhtDlif1pPmax3GHgAPVcUVfDCoOOuZn9udqZy
 dq3w==
X-Gm-Message-State: AOAM531PFT4gjpabjgsQgZje40dd/loBwfzo0Vv6yPz0VYuY9dDLxVWp
 svbt18BjZn9CKr0DM0UNVQ/WJF8V2HYlWnNZLRVv8jGhSzqxn41uxD+SstyFhm42pf1SD5Hs3hF
 R+GiwC+KmTsRHdKE=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr31730964wmq.128.1619631127213; 
 Wed, 28 Apr 2021 10:32:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ3XtpNO7PvgyERVo0DtfKvDNI3A9CAsEBywKZ0OJ22mM3dS9VPGXnpgFA74u3vx6AF7a+MA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr31730953wmq.128.1619631127060; 
 Wed, 28 Apr 2021 10:32:07 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m15sm546158wrx.32.2021.04.28.10.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 10:32:06 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
Date: Wed, 28 Apr 2021 19:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <874kfqs5gl.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:06 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Alex, Richard, do you mind reviewing this one please?
> 
> Isn't it already merged (with my r-b tag no less ;-)
> 
>   f77147cd4de8c726f89b2702f7a9d0c9711d8875

See ...

>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
> 
>>
>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> The previous attempt (commit f77147cd4de) doesn't work as

... ^ this comment :(

>>> expected, as we still have CONFIG_TCG=1 when using:
>>>
>>>   configure --disable-system --disable-user
>>>
>>> Now than we have removed the use of CONFIG_TCG from target-dependent
>>> files in tests/qtest/, we can remove the unconditional definition of
>>> CONFIG_TCG in config_host.
>>>
>>> This avoid to build a bunch of unrequired objects when building with
>>> --disable-tcg (in particular the softfloat tests):
>>>
>>> Before:
>>>
>>>   $ make
>>>   [1/812] Generating trace-qom.h with a custom command
>>>   ...
>>>
>>> After:
>>>
>>>   $ make
>>>   [1/349] Generating trace-qom.h with a custom command
>>>   ...
>>>
>>> A difference of 463 objects...
>>>
>>> Reported-by: Claudio Fontana <cfontana@suse.de>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> v3: Include Paolo's feedback:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
>>> therefore o not include Alex's R-b tag.
>>>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Emilio G. Cota <cota@braap.org>
>>> ---
>>>  meson.build | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index c6f4b0cf5e8..623cbe50685 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -262,7 +262,6 @@
>>>                          language: ['c', 'cpp', 'objc'])
>>>  
>>>    accelerators += 'CONFIG_TCG'
>>> -  config_host += { 'CONFIG_TCG': 'y' }
>>>  endif
>>>  
>>>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>>>
> 
> 


