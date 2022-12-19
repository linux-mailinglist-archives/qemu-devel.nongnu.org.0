Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB382650BE5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FCE-0001tv-PC; Mon, 19 Dec 2022 07:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FBy-0001s1-H3
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FBw-0007TQ-9A
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671452662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQbxjTI3mAit1VyKHrI5/C3jNn5Anr7OrURi/7+WkwQ=;
 b=UKS/EXueMwJAjP4Dl1zaicLJafkG7MLnp1tKPhUCkf9UvqgKlAhZL0fvqinc1fcAYQFwV0
 dtLHlRfQ6yPnesXYIk4k0dM5/5ZyxzANB7vynPK+zovmLiyRxneMc7OKgZ7Nr1x1Bzz02s
 tvmUU+JMDFNA+9AGZ48f/Ph1TfU+G/I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-_fG52ZbAPKGnGX8wWynCZQ-1; Mon, 19 Dec 2022 07:24:21 -0500
X-MC-Unique: _fG52ZbAPKGnGX8wWynCZQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso5525414qvr.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQbxjTI3mAit1VyKHrI5/C3jNn5Anr7OrURi/7+WkwQ=;
 b=0trNb+abbrV6AJPoLs62+wG6oVmrwVagiTIT/b8wI6HzxoI9SE2uijgkya75NbLye4
 KuOZbffybYUO/YQ09lGmcbdJyWj0ansL5gVpdqM+mmI/4YkT93WESaP7zmlNdjHyZLpS
 Mhld9ICo3PRJWna8R6tagN85lxii2B6l09KrvImNI5i3o+8u4KszCkqroyXPTCjWg1tF
 NYCga0buR/9zHyYY22VbGir9gr94GgSu26gTzjzW7CGMepk/92d96kOFgtidGzy3rGBv
 adONLxrG1C2n7SEAF4vo5olSHDkSIS3MnP3vepgSjo5KgR3g/3x75HODhGPohhzff8j8
 1Zow==
X-Gm-Message-State: ANoB5pmUbVwuVY4WUJRNpUZ3rDsoECTEZjh0AsNyGxXL63LVTditFlV7
 wcdDI344dSHDWCUIkuzzHksp86YjDRDPsxuVOj6g891987JQILwnav4IaJ5gNEZiw+4hIBmDYib
 VRi0L7dtqu3mg9ZQ=
X-Received: by 2002:ac8:464d:0:b0:3a7:f91d:917c with SMTP id
 f13-20020ac8464d000000b003a7f91d917cmr63671406qto.31.1671452660770; 
 Mon, 19 Dec 2022 04:24:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6BR7To8gr8lqRPWfmNyJfDLtY3j+LA+uihWUvhGco1v4JJcgIZnnU3YcwEx9B0jt++qbKt7Q==
X-Received: by 2002:ac8:464d:0:b0:3a7:f91d:917c with SMTP id
 f13-20020ac8464d000000b003a7f91d917cmr63671369qto.31.1671452660423; 
 Mon, 19 Dec 2022 04:24:20 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bn1-20020a05620a2ac100b006fafc111b12sm6845905qkb.83.2022.12.19.04.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 04:24:19 -0800 (PST)
Message-ID: <5b4a68e0-ba16-6b82-9455-1e902b660d82@redhat.com>
Date: Mon, 19 Dec 2022 13:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 02/14] block: Convert bdrv_io_plug() to co_wrapper
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-3-kwolf@redhat.com>
 <e1a3f722-2152-fa3d-1d5c-102da196482f@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e1a3f722-2152-fa3d-1d5c-102da196482f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 16/12/2022 um 15:26 schrieb Vladimir Sementsov-Ogievskiy:
> On 12/13/22 11:53, Kevin Wolf wrote:
>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> BlockDriver->bdrv_io_plug is categorized as IO callback, and it
>> currently doesn't run in a coroutine. We should let it take a graph
>> rdlock since the callback traverses the block nodes graph, which however
>> is only possible in a coroutine.
>>
>> The only caller of this function is blk_io_plug(), therefore make
>> blk_io_plug() a co_wrapper, so that we're always running in a coroutine
>> where the lock can be taken.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
> 
> [..]
> 
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -729,7 +729,7 @@ struct BlockDriver {
>>       void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent
>> event);
>>         /* io queue for linux-aio */
>> -    void (*bdrv_io_plug)(BlockDriverState *bs);
>> +    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
> 
> don't we want to rename it to _co_ too?

I think you realized this is done in patch 14

Thanks,
Emanuele

> 
> anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> 
> 


