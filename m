Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371BB6A946B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY21b-0000Fu-4d; Fri, 03 Mar 2023 04:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY21Y-0000F3-D5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY21W-0007Rn-HX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677836901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
 b=KXyC8oI9HcEzE09nMKQmSKFUS6JQ07OjC0FosGuZNHnc7bOwYjVsOFOpSlJ5NBLcrlHGL1
 sEhwp8QRSyn1SgGGQl9M58QIv+D7dJWQEI8iD243ki4NNAq+eZHPFPY4dloAyltbmFvY+l
 xr1NoAPo2meVjkTgs850MYfM5dKOYuY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-VYJtjclhMHC1_h1XeYlDkw-1; Fri, 03 Mar 2023 04:48:19 -0500
X-MC-Unique: VYJtjclhMHC1_h1XeYlDkw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n4-20020a5d5984000000b002c3b562d76cso298888wri.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
 b=VFSx6hrzXYQrnIWuf03DKQdZZmOA6q5uHKy5ci+LGYCfNTvNMKnmGpG5Dr6f77RI8a
 bWVO0fWweqttStvSPEiHpcHQgt1EY2j35xrw4v7OHtR5SHNJ04OjDp8SZEKTur0c9LCJ
 PLYD/z+cr1XkV0+wFGs1lbmzCCvOo9q1TA5/ZEZ+YnOE0yyc3IX/uELaZzRkxxS56VOD
 KJH0zmQFa25aKuA7Hsg+coFmEkDPRpzYpDmw2us3XPmfmPDRYld5Kq8/RKhy5g7IkYMn
 YmGxI/4BNGH4DAg0hwYEkfBC5Q8m0YH4wWNVxZs9id+OKQEVaNELyMKhjlj6plH3gVw7
 wi7g==
X-Gm-Message-State: AO0yUKWTN2HgyaESdBbRTuLshv53g169LwG7zQOqykXJGE3Nr4RQvEzN
 fubinhor6o08kGOiFLVTsAYP0STjImowP6cPOGdn+YzBfu6w8qoKYXjxH/IN41wl3gsXn8wV1Le
 a+//oCS4U/EtTZo4=
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id
 t9-20020a05600c450900b003eb29fe7343mr904169wmo.33.1677836898784; 
 Fri, 03 Mar 2023 01:48:18 -0800 (PST)
X-Google-Smtp-Source: AK7set90kOf+t50U+lkBEG3QcglfuhduO561ikJbIwTI1cvMR/JJzdn3/vk/aPcFI5eUoUJ7JyGBaQ==
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id
 t9-20020a05600c450900b003eb29fe7343mr904148wmo.33.1677836898529; 
 Fri, 03 Mar 2023 01:48:18 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm6271925wms.32.2023.03.03.01.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:48:18 -0800 (PST)
Message-ID: <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
Date: Fri, 3 Mar 2023 10:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/03/2023 23.07, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
>> We're struggling quite badly with our CI minutes on the shared
>> gitlab runners, so we urgently need to think of ways to cut down
>> our supported build and target environments. qemu-system-i386 and
>> qemu-system-arm are not really required anymore, since nobody uses
>> KVM on the corresponding systems for production anymore, and the
>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>> So it's time to deprecate them and the corresponding 32-bit host
>> environments now.
>>
>> This is a follow-up patch series from the previous discussion here:
>>
>>   
>> https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit x86 host support and for system emulation on
>> 32-bit arm hosts anymore, so it should be fine if we drop these host
>> environments soon (these are also the two architectures that contribute
>> the most to the long test times in our CI, so we would benefit a lot by
>> dropping those).
> 
> It is not clear from your cover that the deprecation only concern system
> emulation on these hosts, not user emulation.

x86 ==> deprecate both, user and system emulation support on
         32-bit hosts
arm ==> deprecate only system emulation on 32-bit hosts.

I tried to say it with the sentence "there is no real need for 32-bit x86 
host support and for system emulation on 32-bit arm hosts anymore, so it 
should be fine if we drop these host  environments soon" ... not sure why 
it's unclear, but if you have some better sentences, I'm open for suggestions.

> I wonder about tools. Apparently they depend on sysemu now. I was
> building a 'configure --enable-tools --disable-system' but now it
> is empty.

I just did a try in a fresh build directory, and for me it was working: it 
builds qemu-img, qemu-io, qemu-edid etc. just fine.

What was missing in your case?

  Thomas


