Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA748EC2D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:04:54 +0100 (CET)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8O8K-000897-TY
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8NYp-0002ji-CN
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8NYY-00069E-Mz
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642170473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JB+HW/cLvV/FJWKctK2co39OaqfJasnOQH2X/cXDhr4=;
 b=Pxh0x1hr+2l4TZdeEKsX9lP/3efl87cAsxcoECL8mlHAhgZPFlETuoZizoMDawmn/AEd4t
 J8ZEM5wtBHO1FNdEI/cGIILw/cOmZKqXobLKBb89KuXB8A4qGjXbaDRr1lVIhtjog9bIoo
 zgG+eZj8jwRXQGQFDmFNVYE2WZMOf44=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278--YnRmF09NyeA6zAdDkGNKw-1; Fri, 14 Jan 2022 09:27:52 -0500
X-MC-Unique: -YnRmF09NyeA6zAdDkGNKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so2296016wmg.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JB+HW/cLvV/FJWKctK2co39OaqfJasnOQH2X/cXDhr4=;
 b=yJGsC1kIqlPv/SiiKFY0UO0OmZ4uKK2rVaf0w3a0jkCjq/R2I11+UbAKrReU+Bq94Q
 5HKForlZ/u9tnqyRoIoYkjXYnR8oEv5fLgOClBM+aVy0S1DA8ZWSGlYDUIR7HU7yMIIp
 pR6GD3QRgdLOp0IXRjfGoXQdFiKRzpOe84UnU4xVnVe3U4IGxNp+8lCCAGEH6woNSsN5
 Wd7vlVEUImGmCS16JEI6Trz/ZsK+8n9PSo1RdoHHWSP7iBKw1nBzCwXA9L9b6DU44ME0
 BY40VtO6yXK3LfyTRmTzCqxt7p+wM99u5SSdzK0bP89BA8NhrI9Al2HRRWIGXw8ukPqD
 nu+g==
X-Gm-Message-State: AOAM533HjW1P8FopgeNqrPr3FnIMS8sqKFD7HXodTSGmlZcXUnmTDRR9
 wLoS81AH0Zy6sPz5OZn6uWyNplwFVM7fwwzBk0PXqPX2/4iUIW9tx9UHeSJjR6g8QVdqFcaCg4k
 +mlpTVamh10UUDkI=
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr8399611wrg.563.1642170471151; 
 Fri, 14 Jan 2022 06:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrV/4W8erl24h91da86K8VJgNAXhbSGeIcSDudmToz9FlBdIMA0J4JbyH4yFHVRrLU6usWrg==
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr8399591wrg.563.1642170470931; 
 Fri, 14 Jan 2022 06:27:50 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 1sm2410749wry.46.2022.01.14.06.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 06:27:50 -0800 (PST)
Message-ID: <a6da24a0-9ece-f0a8-9f07-8f5c946529c0@redhat.com>
Date: Fri, 14 Jan 2022 15:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] block/file-posix: Remove a deprecation warning on
 macOS 12
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220105235607.212848-1-f4bug@amsat.org>
 <54a82da6-3546-ddf1-692e-105174ddcaec@redhat.com>
 <9f852ddf-810b-c008-1887-52519358049a@amsat.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <9f852ddf-810b-c008-1887-52519358049a@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Arbuckle <programmingkidx@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.01.22 15:15, Philippe Mathieu-Daudé wrote:
> On 14/1/22 15:09, Hanna Reitz wrote:
>> On 06.01.22 00:56, Philippe Mathieu-Daudé wrote:
>>> When building on macOS 12 we get:
>>>
>>>    ../block/file-posix.c:3335:18: warning: 'IOMasterPort' is 
>>> deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>>>        kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>>>                     ^~~~~~~~~~~~
>>>                     IOMainPort
>>>
>>> Use IOMainPort (define it to IOMasterPort on macOS < 12),
>>> and replace 'master' by 'main' in a variable name.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   block/file-posix.c | 13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> I hope the [RFC] tag isn’t directed at me.
>>
>> Still, I can give my comment, of course.
>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index b283093e5b..0dcfce1856 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
>>>   #if defined(__APPLE__) && defined(__MACH__)
>>>   static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char 
>>> *bsdPath,
>>>                                   CFIndex maxPathSize, int flags);
>>> +
>>> +#if !defined(MAC_OS_VERSION_12_0)
>>
>> So AFAIU from my quick rather fruit-less googling, this macro is 
>> defined (to some version-defining integer) on every macOS version 
>> starting from 12.0?  (Just confirming because the name could also 
>> mean it’d be defined only on 12.0.)
>
> Thanks, I posted up to v3 and macOS users helped me, I will post a v4 
> soon.
>
> v3: 
> https://lore.kernel.org/qemu-devel/20220110131001.614319-1-f4bug@amsat.org/

I see.  The MAC_OS_X_VERSION_M{IN,AX}_REQUIRED thing was exactly what I 
didn’t really understand from said googling, but the important thing is 
that you do.  (Something to do with what runtime is actually in use 
rather than what the system can provide?  Well, I’ll just stop asking.)  O:)

Hanna


