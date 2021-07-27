Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D443D79D6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:32:20 +0200 (CEST)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8P46-0001Tg-MH
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8P2l-0000XK-B5
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8P2i-0006r8-3V
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627399850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0Y+zy6/dSBrKce7d/LUEru/Tj9SrovxumlXph5Gpu4=;
 b=WlryKEy1xeqro+GHHC1WdC11zQIdVhbzMkTmSHmkohTDpsT2Fe+Y5qCNHhTfHd84YigPEA
 u+IPGnYcjRz82VYGoBvD+VU08ymTOt1va6K3caAvzFhaIo3XDYiPj8W7JQOrqLH99oLD+T
 cPJDgVMUw9YuhutybV58vOLEv1jP7ds=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-GCo-f3k4NQqBO8xqJ41E4g-1; Tue, 27 Jul 2021 11:30:48 -0400
X-MC-Unique: GCo-f3k4NQqBO8xqJ41E4g-1
Received: by mail-wr1-f72.google.com with SMTP id
 c5-20020a5d52850000b0290126f2836a61so6195695wrv.6
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=m0Y+zy6/dSBrKce7d/LUEru/Tj9SrovxumlXph5Gpu4=;
 b=kjlScoTbW5rktIPm6v80FyWuZUS5JTF6zcmo2BWeKKHSYvo4HcwamLVjppY0BweSay
 e98wHtQTd6ojVLRoNFHhMobEcsuqzw7UeQSDuXYzxUp6cM/75/+HkjGAVajln60Pdmx+
 GhcP4iEQxyiZH55HAF0AsGg/k/1dNLJAAMkhaoV+ya+145f9h1eChV/qGlTYOLZGbgJb
 hwcwCr3ujF/k31jZTCbJVJCWdf6hxV+pIarefEOdmn6YvxeeVs1klOHPrPKVyEj5DefF
 4LyR28IXZBkOI2lluoo9AGx/kdIvNIf7e2hPcIB0PJXh4Z9U5T80HEFNNYmWBag1n26Z
 QGAw==
X-Gm-Message-State: AOAM531fH4Lx8FELL9cjVXDNmheuSq/pVrosF7Odl1oJC1qapcLeeMhZ
 2bcsTJmGAbizwPXkMMxclEk8pAF0iIzV2SjSF8SxzjXh1XvPoO74WiNc30IQPRRUhIMMKfTsJNW
 f1mM3pohVneizo3M=
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4753060wmk.124.1627399847651; 
 Tue, 27 Jul 2021 08:30:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye0SfERQ/7zbgnO6jWl4qWml5W/V/gh//sKwgJkrGlReAg7i2hETQEi8+B+iNLwhD42EqXCw==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4753037wmk.124.1627399847350; 
 Tue, 27 Jul 2021 08:30:47 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k6sm2608918wrm.10.2021.07.27.08.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 08:30:47 -0700 (PDT)
Subject: Re: [PATCH for-6.1? 4/6] job: Add job_cancel_requested()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-5-mreitz@redhat.com>
 <a6a675f1-4ca3-a657-9fe0-35b73a6f441a@virtuozzo.com>
 <32463d65-834c-64ba-aab4-36f1810ddb43@redhat.com>
 <bd4d225d-0bcd-9a38-9813-af229d8fbe4f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <dd9d521a-24f2-650e-843e-e30a40a58d5b@redhat.com>
Date: Tue, 27 Jul 2021 17:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd4d225d-0bcd-9a38-9813-af229d8fbe4f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 16:47, Vladimir Sementsov-Ogievskiy wrote:
> 26.07.2021 10:09, Max Reitz wrote:
>>
>>>>           job->ret = -ECANCELED;
>>>>       }
>>>>       if (job->ret) {
>>>> @@ -704,7 +709,7 @@ static int job_finalize_single(Job *job)
>>>>         /* Emit events only if we actually started */
>>>>       if (job_started(job)) {
>>>> -        if (job_is_cancelled(job)) {
>>>> +        if (job_cancel_requested(job)) {
>>>>               job_event_cancelled(job);
>>>
>>> Same question here.. Shouldn't mirror report COMPLETED event in case 
>>> of not-force cancelled in READY state?
>>
>> Same here, I thought this is user-visible, nothing internal, so I 
>> should leave it as-is.
>>
>> Now I see that cancelling mirror post-READY indeed should result in a 
>> COMPLETED event.  So I’m actually not exactly sure how mirror does 
>> that, despite this code here
>
>
> Hmm. Now looking at mirror code, I see that it does 
> "s->common.job.cancelled = false"

*lol*, that’s nice.

So since we’ve missed the rc1 boat now, I think this is 6.2 material.  
I’ll look into whether we can drop that then, that would be nice.

Max


