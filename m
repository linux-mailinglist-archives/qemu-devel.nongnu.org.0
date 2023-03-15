Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29E6BBEF7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 22:24:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcYaS-0006fH-J9; Wed, 15 Mar 2023 17:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcYaM-0006dU-Fw
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 17:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcYaK-00076D-Pv
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 17:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678915378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9n1IFgPDRQOSbkNolksUFUJcltxKLa3COcLgGN9Enn0=;
 b=Mv+lmfgXEUXZFyqTuLFZyu8ORs3DPAc8tAbKy/tkwpgW/DxqSZ0wFvEMnuNWjXnOgZIN0U
 IoxNE3tnws7nxUwNke7e9PVP5RDHRLGDi34VqkzN1+DYtHlZ81JK7aqPr/exqjFAF3zHQU
 yRi2YjSgQFo07O2G01PjOM0SZiCo1c8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-pSySPmy1O8uTExYG0fncWA-1; Wed, 15 Mar 2023 17:22:57 -0400
X-MC-Unique: pSySPmy1O8uTExYG0fncWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso7169174wmb.6
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 14:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678915376;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9n1IFgPDRQOSbkNolksUFUJcltxKLa3COcLgGN9Enn0=;
 b=Y9HISI26Uh965BHogSbK5HxHk9Vzlh25eyFJSbi7bJ8AtREZZn4YJx26osm5H4iOl7
 BPkuMfeECD6ktSgwfUo0tP06KWMaBmQRUfHviFqevNNBAjH3NXLRFXOXdaA0w0/CWBkW
 Dwirh6hy/SSZ2PImRMq3gpofGseV34vBskuTL2tDtypE5X6GQzSNkRxuxR/gIB3ApcuK
 c7fxxbPdmuaspulmIZNbqnV9AjevS7BmRecuQSioBJNSTQ7yJ5sN1LiNLj3io4FaHTHH
 zkFDWx+HVRABCo0uiWa1S4xziGH0E7JvEBnBvp54X4hlnIOyEPky4jOYiDwCUGpzdoNM
 7k0Q==
X-Gm-Message-State: AO0yUKWPSFQ5BGJlj6FH2MTfubzvnYZ2kIbCqc7OL//Pr7hdtK4LlGYQ
 xud9kDXxKIy1LuXM/YZ5dMj8do57xSKLZSCp2fOCmwwfkMzSrRf42zHfegGqAffky0JorQIHmLf
 02BMMm8yx1MAKI5I=
X-Received: by 2002:a05:600c:198e:b0:3eb:2f3b:4477 with SMTP id
 t14-20020a05600c198e00b003eb2f3b4477mr18783560wmq.28.1678915376514; 
 Wed, 15 Mar 2023 14:22:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set+rWaHKplukFZQez3LeyMwa5rMqtn6mcenpLLr48eOxfPUDwqmy4nFBR4f1tec9O4tLqXsyng==
X-Received: by 2002:a05:600c:198e:b0:3eb:2f3b:4477 with SMTP id
 t14-20020a05600c198e00b003eb2f3b4477mr18783551wmq.28.1678915376206; 
 Wed, 15 Mar 2023 14:22:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 e25-20020a05600c219900b003ed1fa34bd3sm2965028wme.13.2023.03.15.14.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 14:22:55 -0700 (PDT)
Message-ID: <65a4bc93-ba15-7e60-765a-8691ebba94e5@redhat.com>
Date: Wed, 15 Mar 2023 22:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
 <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
 <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
 <CAFEAcA9qwYFpYOg9tG2Kh-dnR4sr6jYzmapqNjZKqie8L=WO4A@mail.gmail.com>
 <fea4486a-cb0f-3a23-eb5b-56fa4a6bca77@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <fea4486a-cb0f-3a23-eb5b-56fa4a6bca77@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/15/23 15:28, Vladimir Sementsov-Ogievskiy wrote:
> On 22.02.23 18:57, Peter Maydell wrote:
>> On Wed, 22 Feb 2023 at 14:19, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>
>>> On Wed, 15 Feb 2023 at 15:22, Vladimir Sementsov-Ogievskiy
>>> <vsementsov@yandex-team.ru> wrote:
>>>>
>>>> ping
>>>>
>>>> [add Stefan]
>>>
>>> I'm not familiar with the Coverity models. Peter Maydell is the 
>>> maintainer.
>>
>> We haven't run Coverity scans since September last year.
> 
> What's the problem with it? May I help somehow?

The container broke when libslirp was removed, and I've been 
procrastinating fixing it. :(

Paolo

> 
>> There's no point making changes to our model until we've
>> fixed that. Paolo?
>>
>> thanks
>> -- PMM
> 


