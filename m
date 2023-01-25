Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04767B222
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 13:01:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeRZ-0000lV-3g; Wed, 25 Jan 2023 06:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKeRX-0000lJ-BD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKeRV-0004Zz-3R
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674647991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaXU68pQPdD0Br/nCi36XxN4HGxsjDd29Ce6cxihJmk=;
 b=YyX+7AEY6/B7HAu8v7vW0AoyxxgYdGCnnW0ccDOQR7AgVLddJgDPtIVlrIw57PTvSJrdAO
 x5MFWMxDtm/E59FVNz2cYuTdsVkBeGpHdplqpa7EEVhGBDFFpw9yyunEhV9URQF076on7J
 tmJWeXlAVHCirPQtCHcj8LarqPZDc4o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-mH-dtIZ4OjibLSwrAmEs6Q-1; Wed, 25 Jan 2023 06:59:50 -0500
X-MC-Unique: mH-dtIZ4OjibLSwrAmEs6Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 k15-20020a0cd68f000000b00535261af1b1so9205115qvi.13
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 03:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TaXU68pQPdD0Br/nCi36XxN4HGxsjDd29Ce6cxihJmk=;
 b=wbHdtS0T3OpVhTdJFnASQJPJjqJFnd6UeDHbLKEAVMpbWqDO9sH0N0zvn6/5m0lDMM
 up/L1odlT+lGcA4+hDyk1yE2luxXsSMhPofeabAEAOzmz/45Cxf4chMZr4YnsG/9txws
 r9pY8DQrefxqB+R+PD6XE8AwKPeDufb7j4ZuSBRu1Y1Ylzdp8Lc5NZH3si4nX6ccr/+W
 YZIT7UaHRvm1oMmACWuracSCvTyIk8bgscW9pNt1iCm8IV14g6jfrazq8vDHqTMbT5T7
 G6fjr4vVUAGDF0VD5kybsESjB09mVrLS9/xeuLPdohErBre1PY2So3HAOlBrqNu0o1Ug
 nmnA==
X-Gm-Message-State: AFqh2koWdWgb1dVaNTm/T5OTLB2zexDYoOnk1Zb6MhIKLPyRG0ZoJSxJ
 W7/iFzWmk9S/E7SWuKWYmGMSFcg8gA5sxb349a3hD2YwVJVjepDgTbLjR5/UyoP88MMMb2sJdef
 H1GDEhpTuphA8cp0=
X-Received: by 2002:a05:622a:1828:b0:3b6:3a12:2bf9 with SMTP id
 t40-20020a05622a182800b003b63a122bf9mr55291680qtc.2.1674647989847; 
 Wed, 25 Jan 2023 03:59:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7Z4bX/4r7saANs8WCyv7hecbl4PbQ+nmqCrYkwm4Lgvf8Ea8zM1p/dKOL9tUSFTWFGv08cg==
X-Received: by 2002:a05:622a:1828:b0:3b6:3a12:2bf9 with SMTP id
 t40-20020a05622a182800b003b63a122bf9mr55291661qtc.2.1674647989596; 
 Wed, 25 Jan 2023 03:59:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 o17-20020ac841d1000000b003a5c6ad428asm3132098qtm.92.2023.01.25.03.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 03:59:49 -0800 (PST)
Message-ID: <ea77cd84-d71e-51b4-afca-8c2159cc43f3@redhat.com>
Date: Wed, 25 Jan 2023 12:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Nick Hudson <nick.hudson@gmx.co.uk>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Biswapriyo Nath <nathbappai@gmail.com>, skrll@netbsd.org
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <2bce671f-d91a-72ab-d38f-2e284d9d3ee2@redhat.com>
 <4f30fcd1-a773-40af-48c3-0e017f85e079@redhat.com>
 <3413ad2e-28dc-438c-a962-9a74533b25dc@gmx.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: NetBSD and libfdt
In-Reply-To: <3413ad2e-28dc-438c-a962-9a74533b25dc@gmx.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 25/01/2023 12.36, Nick Hudson wrote:
> hi,
> 
> On 24/01/2023 11:27, Thomas Huth wrote:
>> On 24/01/2023 10.20, Thomas Huth wrote:
>> [...]
>>>>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>
>>>>>>>>     Hi all,
>>>>>>>>
>>>>>>>> in some spare minutes, I started playing with a patch to try to 
>>>>>>>> remove the
>>>>>>>> dtc submodule from the QEMU git repository - according to
>>>>>>>> https://repology.org/project/dtc/versions our supported build platforms
>>>>>>>> should now all provide the minimum required version.
>> [...]
>>> Ok, I'll give my patch another try to see whether all the other systems 
>>> have a usable version of libfdt available, too.
>>
>> ... and I apparently missed NetBSD in my first research: Looks like NetBSD 
>> is still using dtc v1.4.7 which is too old for QEMU. (though 
>> https://www.netbsd.org/docs/software/3rdparty/ talks about v1.5.1, I only 
>> get dtc 1.4.7 in our NetBSD VM).
> 
> The not yet released netbsd-10 and -current have 1.5.1. Perhaps you can use 
> netbsd-10 for your VM?

Ah, ok, thanks, I didn't know yet that NetBSD 10 is just about to get 
released (hopefully?) soon...
Anyway, even if it gets released this year, it means we have to carry the 
dtc submodule in QEMU for two more years according to our support policy:

 
https://www.qemu.org/docs/master/about/build-platforms.html#linux-os-macos-freebsd-netbsd-openbsd

(since NetBSD will be supported by QEMU for two more years)

Will there be another minor release of NetBSD 9 where it would be possible 
to update dtc to at least version 1.5.1, too?

  Thanks,
   Thomas


