Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D663A469
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaBV-0001tV-FS; Mon, 28 Nov 2022 04:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozaBT-0001rB-AJ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozaBR-0002dw-5E
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669626732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z898VFjl02J3LPBT4XjWrtkQiaoq4zhDgjCJ+WNwGHc=;
 b=GZ8ijdo/X5EbuG2hztSJJyz6Ty1c10QCX4P25P+Bj/w8vBPLgJfbWjb/f54NA0X7Rxv4f6
 wf9glPT0SH4cfAC0JViaUIdTUZYFy+JOTn+7tZ1V3FplSF/j7ePBIz1bxEDPg82sgJ6dpo
 ITJE75yEC3JAXc7NLMvdkdDtmPnbwTo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-OPUK_eBxPfORAlp7wRta1A-1; Mon, 28 Nov 2022 04:12:02 -0500
X-MC-Unique: OPUK_eBxPfORAlp7wRta1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 206-20020a1c02d7000000b003d02dc20735so6063291wmc.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 01:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z898VFjl02J3LPBT4XjWrtkQiaoq4zhDgjCJ+WNwGHc=;
 b=Be+AZSaTI5s+ICcITm//9uioQbhdscmdc7MrvDcpLyoCTaDXkSR8dwFqnI/kJRfzlp
 3jV5KPtyktrvQsiHdUTaZFeZL75LnP8Q0qtSzdncjMZ3SIvBaG56ojdhC0WQDODEYZJB
 J3O++lJfow13bLDba2MUgQfBzpr5a9JNwos8vwt7ZaHB6PBFcDotPSwkzT5cRSVWCWLc
 8n3etw96IW3qGY3Z8+aeJbvDuPg6NLHQ/28yeWX8bsHwAVhQMKhMlyV+OelAs9947tX0
 3JSW1kfCEC18fh06FCUFKp8VODB6E9OyTMNWJnutQAhZ+UleNCApSVuBBgIdzfIyvrN6
 AbpQ==
X-Gm-Message-State: ANoB5pnf70J/0XDVRGZ212AkP9WJg7mgm7OUxZyVp7QgZl7RVmJEE4iV
 H2YyZ5z7PoXdAN7XOTLAKBubVg3QWNF2e5kHaFuZTWyIRCuzhv28Flab2eWY/hHUkLoULIwDXmX
 Tcw7Yk/AuAZGUen4=
X-Received: by 2002:a05:600c:2302:b0:3cf:a3c4:59b3 with SMTP id
 2-20020a05600c230200b003cfa3c459b3mr29102125wmo.198.1669626721065; 
 Mon, 28 Nov 2022 01:12:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FW3vdjXQ/l8j6U1lYDNS42Z+yoctUdL+GoFf0gpJqgTGkl7J5J/AS6dvRaveW5xABKGJtmg==
X-Received: by 2002:a05:600c:2302:b0:3cf:a3c4:59b3 with SMTP id
 2-20020a05600c230200b003cfa3c459b3mr29102107wmo.198.1669626720817; 
 Mon, 28 Nov 2022 01:12:00 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c205400b003b476cabf1csm14129073wmg.26.2022.11.28.01.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:12:00 -0800 (PST)
Message-ID: <4b36c016-e26b-796f-a5bd-bcc58b5bcba7@redhat.com>
Date: Mon, 28 Nov 2022 10:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 07/14] block: distinguish between bdrv_create running
 in coroutine and not
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-8-eesposit@redhat.com>
 <e45ea640-294d-201b-7b0d-94755eaccd30@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e45ea640-294d-201b-7b0d-94755eaccd30@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 25/11/2022 um 19:03 schrieb Vladimir Sementsov-Ogievskiy:
> On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
>> Call two different functions depending on whether bdrv_create
>> is in coroutine or not, following the same pattern as
>> generated_co_wrapper functions.
>>
>> This allows to also call the coroutine function directly,
>> without using CreateCo or relying in bdrv_create().
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block.c | 71 +++++++++++++++++++++++++++++----------------------------
>>   1 file changed, 36 insertions(+), 35 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 9d51e7b6e5..2cf50b37c4 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -528,63 +528,64 @@ typedef struct CreateCo {
>>       Error *err;
>>   } CreateCo;
>>   -static void coroutine_fn bdrv_create_co_entry(void *opaque)
>> +static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char
>> *filename,
>> +                                       QemuOpts *opts, Error **errp)
>>   {
>> -    Error *local_err = NULL;
>>       int ret;
>> +    GLOBAL_STATE_CODE();
>> +    ERRP_GUARD();
>> +    assert(*errp == NULL);
>> +    assert(drv);
> 
> Why we need these two assertions? These are general assumptions, and we
> don't assert it in all functions. Dereference of NULL will crash not
> worse than assertion. I'd drop them.
> 
>> +
>> +    if (!drv->bdrv_co_create_opts) {
>> +        error_setg(errp, "Driver '%s' does not support image creation",
>> +                   drv->format_name);
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    ret = drv->bdrv_co_create_opts(drv, filename, opts, errp);
>>   
> 
> and this empty line, looks accidental.
> 
> Offtopic: hope one day we fix *open* functions to always set errp on
> error paths.
> 
>> +    if (ret < 0 && !*errp) {
>> +        error_setg_errno(errp, -ret, "Could not create image");
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void coroutine_fn bdrv_create_co_entry(void *opaque)
>> +{
>>       CreateCo *cco = opaque;
>> -    assert(cco->drv);
>>       GLOBAL_STATE_CODE();
>>   -    ret = cco->drv->bdrv_co_create_opts(cco->drv,
>> -                                        cco->filename, cco->opts,
>> &local_err);
>> -    error_propagate(&cco->err, local_err);
>> -    cco->ret = ret;
>> +    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts,
>> &cco->err);
> 
> We need aio_wait_kick() call here, like in other co_entry() functions.
> Otherwise we may stuck in aio_poll()
> 
> with it:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> Hmm actually, we can simply merge this patch into patch 13 (and move 08
> to be after 13). Why to refactor bdrv_create twice?
> 

I think I'll leave the patches separate, otherwise I am worried that it
will be difficult to understand what is happending and why when we merge
these 2 operations (move all logic to _co_ and using co_wrapper) together.

I agree with the rest.

Thank you,
Emanuele


