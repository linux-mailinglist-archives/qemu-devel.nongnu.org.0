Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BB6337E9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:06:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPEJ-0006Dw-8p; Tue, 22 Nov 2022 04:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxPDC-0006BI-3E
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxPDA-0007zV-KR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669107896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/bYDsYSTchHksdNvDlYrGIpG6HoXJslfOCTkyu5oE0=;
 b=Ny+OMoY4GQqfHdpmyDz6IgXpnkvOfb6ZZhoSo5Rd3p8Jpm0FPjeUzSw8D7G7xR5bfbrVPw
 COCwasyPmDZuDtrxoLZpALfA+1wSBDFoGw/NBDrOwiB5EBl2JxS5mIvam5Kuj2u30+uDTh
 ZtXZ/1PvkHNFb0Cc7e+tFDUjSg22maI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-H_Hx7OcuN8K68lqCH9zAgQ-1; Tue, 22 Nov 2022 04:04:54 -0500
X-MC-Unique: H_Hx7OcuN8K68lqCH9zAgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso7775128wme.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/bYDsYSTchHksdNvDlYrGIpG6HoXJslfOCTkyu5oE0=;
 b=F8qvK0jMLPOn5T53k+rnILMVM8N7cCjNgxxKPXaZ18quRmvDhfqFQUaEjtlN5nxN9z
 x8qDuyDauZhnEdl0VFx9LLgdE+XV1LEkOnwcGmvJ8+EDRq8IOK0/yxOJDTfma3YfPflR
 laXktxzLkTgUwL8MoKLZxaMHxOhvBtWVUWpIWQFn/Gdraw2z84md2P02gIRGhPChH5AL
 ngYiAONlxO1ZO4+hpsaBZL/576T8vYrgRwNDoYCBU3QzZVEL1rLX+7J2qqqZjgIpCScs
 YAtOb1r8BE0Nutc92ZyP6h0S/a8emdxMfFjTBe6ocDJTClLL4lRFwSVqlao1+/em3lj7
 lgVQ==
X-Gm-Message-State: ANoB5plLKrazp9L7p8pqpe0s6VstGlr9dA0OfkNsGhzm2yku+2RqKDwz
 FCM0gA3gJibvBWtXWZcj7yfcPsMdGhASn4OD45lP2msmWEX9ISnKwqC8vZp+bme88EjL7uKd1yR
 YABIny3X+uFjVfp8=
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr6684815wmb.153.1669107893495; 
 Tue, 22 Nov 2022 01:04:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6XNWuOd23dhqX4dhTQX4VUakXOmFCunRMbDS5h2IUOWzwKswjqT6ZgSP45sd2pLFLFTE0FHA==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr6684800wmb.153.1669107893286; 
 Tue, 22 Nov 2022 01:04:53 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j15-20020adfe50f000000b002366d1cc198sm13347265wrm.41.2022.11.22.01.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 01:04:52 -0800 (PST)
Message-ID: <df5c712d-4f8d-fd43-b96b-a0428c652dea@redhat.com>
Date: Tue, 22 Nov 2022 10:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 09/11] block: bdrv_create_file is a coroutine_fn
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-10-eesposit@redhat.com> <Y3yPJZDpIBGZnjrH@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y3yPJZDpIBGZnjrH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 22/11/2022 um 09:58 schrieb Kevin Wolf:
> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>> It is always called in coroutine_fn callbacks, therefore
>> it can directly call bdrv_co_create().
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block.c                            | 6 ++++--
>>  include/block/block-global-state.h | 3 ++-
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index c610a32e77..7a4c3eb540 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -534,6 +534,7 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
>>      int ret;
>>      char *filename_copy;
>>      GLOBAL_STATE_CODE();
>> +    assert(qemu_in_coroutine());
> 
> We don't generally assert this, otherwise it would have to be in every
> coroutine_fn.

That was my plan for the serie "Protect the block layer with a rwlock:
part 3", where I convert BlockDriver callbacks in coroutine, and thus
assert there because I know all the callers are coroutine_fn.

> 
>>      assert(*errp == NULL);
>>      assert(drv);
>>  
>> @@ -725,7 +726,8 @@ out:
>>      return ret;
>>  }
>>  
>> -int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>> +int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
>> +                                  Error **errp)
> 
> Should it be renamed as bdrv_co_create_file()?
> 
Ok (when I don't answer just assume that I agree).

Thank you,
Emanuele
>>  {
>>      QemuOpts *protocol_opts;
>>      BlockDriver *drv;
>> @@ -766,7 +768,7 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>>          goto out;
>>      }
>>  
>> -    ret = bdrv_create(drv, filename, protocol_opts, errp);
>> +    ret = bdrv_co_create(drv, filename, protocol_opts, errp);
>>  out:
>>      qemu_opts_del(protocol_opts);
>>      qobject_unref(qdict);
> 
> Kevin
> 


