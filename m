Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43A6A7456
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:33:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSBb-0006Es-LE; Wed, 01 Mar 2023 14:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXSBZ-0006Ef-HA
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXSBY-0002s0-1F
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677699138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yU5c4SlhOv5pQpdk7Gl9mvXi9YLBHvJmnSYDL27YUfQ=;
 b=RTlgsAoMU3Rh1nEtheOHwdiBUv0hoXX2NgzdOi1mgjLiT1rPGGmIPNQBgUSLfHjf95LbEX
 Mwozf1zNtihTzik/MfqN89MRO3rcyZdiSG3jwr3aKo0E9h6WT71nNVb6EJu9eMXvyX9qs3
 WPkSHoC8KQTN+FkaqdeBcb8XX5O+M9E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-NsK1xpQkPeyujDzkEvHkCw-1; Wed, 01 Mar 2023 14:32:16 -0500
X-MC-Unique: NsK1xpQkPeyujDzkEvHkCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so118060wma.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yU5c4SlhOv5pQpdk7Gl9mvXi9YLBHvJmnSYDL27YUfQ=;
 b=iKpRCaxrwgS7etMCgl8gfPItRirD19gP/j17gigbjmIK9aRtxJCyZeaAHO0rc9TGdC
 X/ftsAsy1hA6YuiBnil0VY4muH0dcsa4QzVlFMke5GjOvU22yoXs7KZd8e/1qfFPp6gK
 wHpc+GQEzQdpUKOoWdTnW3DxnjTIsgjOnC3pGmMCFwo78JVuoVQ7BzZMGAlQGLb1uAcu
 Nfd/mrQFkeLV/OARRRPuYC0fSpnDIOnWIrS2rUWvrjBCXqd+zakaddAaD75Y/N9U9UkE
 Xz3JFX9+BUdZWcTDhI2jiwW7xPhwpRPOPkjKI7zp+a9vtHvr1/2dHroXqETo5GvSOqdQ
 EmQg==
X-Gm-Message-State: AO0yUKU817Vf2lvs70yAPiUnOiBL0yqx/g9EWyCBVeCnFUYMHVzFQH3m
 tsAvYOic5Lszno7mB1ld46OietmHsfKJGuJCb3INslad0qckD2mSRHB1/RNTPSc/uGNz6mZWmTy
 tKALglNkJZbYL1BE=
X-Received: by 2002:a05:600c:331c:b0:3ea:bc27:6a64 with SMTP id
 q28-20020a05600c331c00b003eabc276a64mr6206784wmp.10.1677699135641; 
 Wed, 01 Mar 2023 11:32:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8LdnZwqbY6ScvTSXwG5g6x56YXQ89Okb8kYiKPu9uvQRYsD5mMe6D2SF9NxlRotx1IyZ3N6w==
X-Received: by 2002:a05:600c:331c:b0:3ea:bc27:6a64 with SMTP id
 q28-20020a05600c331c00b003eabc276a64mr6206771wmp.10.1677699135353; 
 Wed, 01 Mar 2023 11:32:15 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfe842000000b002c552c6c8c2sm13510189wrn.87.2023.03.01.11.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 11:32:14 -0800 (PST)
Message-ID: <2ede6aca-dce8-d507-5352-d03d5de2dcd4@redhat.com>
Date: Wed, 1 Mar 2023 20:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
 <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 17.04, Peter Maydell wrote:
> On Mon, 27 Feb 2023 at 15:46, Alex Williamson
> <alex.williamson@redhat.com> wrote:
>>
>> On Mon, 27 Feb 2023 11:32:57 +0100
>> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Empty commit logs are a pet peeve of mine, there must be some sort of
>> motivation for the change, something that changed to make this
>> possible, or perhaps why this was never necessary.  Thanks,
> 
> I generally agree, but "this file doesn't actually need to
> include this header" seems straightforward enough that the commit
> subject says everything you'd want to say about it.

But not giving any description at all is really just bad style, we should 
avoid it. And in this case, there is even a good reason that should be 
mentioned here (e.g. "This header was the only reason this file needed to be 
built per target"). So I think it's fair to ask for a proper commit log 
message here.

  Thomas


