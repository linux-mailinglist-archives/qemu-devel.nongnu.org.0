Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9894EACE5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:13:15 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAio-0008Ve-Ab
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:13:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZAg2-000785-NY
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZAfy-00081Q-Ry
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648555815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHO1KcSPWymHj0k5m4KYqCG+6I+Pa7aWhPyFofMxGyU=;
 b=BBtymG5OT5nTEvtn/gu2ai+CIE12j3skeCVxSIMKzGpNHNItQ0r8P5HqtWpu4Y2p51kyA6
 rxAbd9SnEwx7ZFsGy3b3X18x5Fe220ZWY/ZPt+6afrn6qjkMrPbs8M0Ba/2k9NW5GkPQKJ
 sb7WKOENWGcZAb+DicBLxzRrzOUa3Ek=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-ond1LpP1OpW9aXdz5npRRQ-1; Tue, 29 Mar 2022 08:10:12 -0400
X-MC-Unique: ond1LpP1OpW9aXdz5npRRQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ml20-20020a170906cc1400b006df8c9357efso8073975ejb.21
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AHO1KcSPWymHj0k5m4KYqCG+6I+Pa7aWhPyFofMxGyU=;
 b=wWkZj5kZCWtVaJbtkwmLdTRPv/TwB6It/MBkVLIyT+LwkvkJR07T509TAEqa86I/S2
 6ECXJ882TIXvDhEdSEUfEihcuZIILNnGRFp+cdRgkE9PN9avIadHdDcR0KcVeA38eQln
 vbSSO3y7wsNzJyGZiSHWviD/WOwxkQIIS1JbrVe876qIG9I7sn1Sq4UzVJDW+rp7A/E2
 NH5NkYdvStb1NvxAAgS7DPu+0lnp425aFMPmXUe8ErkunspsU888VlIDKR7rOH8TXDuq
 DXor/nzi4j5I1XgUdQp7GABPs6lnwxgUAQHG8oShDfyzurjuc4qpBJVLZi3wiGgqjwur
 P4Kw==
X-Gm-Message-State: AOAM533iX2mFFhZapWb0cgB2n8Tw/9JrR76VQBIZAWz/gNToXZhvNEKj
 XM+2uz3dYJWvw0fvBe4FEbFO/88efWB6P1iU6boktXA8ARCfS9tmKLu9TY0TgGo13llf6Cjalqb
 bVppt6RkTNf44uJg=
X-Received: by 2002:a05:6402:35d1:b0:419:7f2e:cdb7 with SMTP id
 z17-20020a05640235d100b004197f2ecdb7mr4147715edc.152.1648555811004; 
 Tue, 29 Mar 2022 05:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd/h5QjOxvYg6qKB69YwrLJLTMN5pWiJQYDzXHQie1huDKz89lcxe8swij4Gd5xkeOKQKC0Q==
X-Received: by 2002:a05:6402:35d1:b0:419:7f2e:cdb7 with SMTP id
 z17-20020a05640235d100b004197f2ecdb7mr4147688edc.152.1648555810745; 
 Tue, 29 Mar 2022 05:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906379100b006e0db5a5e33sm3964053ejc.82.2022.03.29.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:10:10 -0700 (PDT)
Message-ID: <d71bdcf6-d697-f667-e6c2-a02e6d73cb9f@redhat.com>
Date: Tue, 29 Mar 2022 14:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/4] Darwin patches for 2022-03-29
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
 <db936fb1-268e-9486-b954-fc6cb7ef3c32@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <db936fb1-268e-9486-b954-fc6cb7ef3c32@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.22 12:27, Philippe Mathieu-Daudé wrote:
> Hi Peter,
>
> On 29/3/22 00:40, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The following changes since commit 
>> 27fc9f365d6f60ff86c2e2be57289bb47a2be882:
>>
>>    Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu 
>> into staging (2022-03-28 10:16:33 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/darwin-20220329
>>
>> for you to fetch changes up to a4fd374364d4e23e0861273aaf7ff2ebddd57a17:
>>
>>    ui/console: Check console before emitting GL event (2022-03-29 
>> 00:19:37 +0200)
>>
>> ----------------------------------------------------------------
>> Darwin patches
>>
>> - UI fixes
>>
>> ----------------------------------------------------------------
>>
>> Akihiko Odaki (2):
>>    ui/cocoa: Respect left-command-key option
>>    ui/console: Check console before emitting GL event
>>
>> Philippe Mathieu-Daudé (2):
>>    gitattributes: Cover Objective-C source files
>>    qemu/main-loop: Disable block backend global state assertion on Cocoa
>
> Do you mind putting this PR on hold to see Hanna's answer whether we
> take her patch instead:
> https://lore.kernel.org/qemu-devel/dab63073-d532-2795-fce4-77bd0839f578@gmail.com/

To explicitly reply here (too): I would like to rebase my patch (and 
subsequent PR) on this PR here.  I’d therefore like this PR to proceed 
(if possible).

Hanna


