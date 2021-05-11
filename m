Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87E37A336
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:14:01 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOSm-0004e3-Q5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNqR-0008QC-L7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNqL-00046A-JV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620722057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CI9y4u5GoGanqT2gamg6x0bucQSkKIoIsEtjEK2kZl0=;
 b=Nxsar5SXYjEuM8juuhdANIwISqsS3RqEdTITI29GwiFTcu/umhevMsGP13TWXAhNpx8zFU
 kowmsAumrpNXagwsrz+HgCtVWevlaR582pAel5dTXvfO03LWmavA1i960tZ+5oTMEeF7yi
 38MdUlDtUFUuYJg0QYy8VJdXQLw/ioU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Gfd-GM7qOvOY1o3AyEjPvA-1; Tue, 11 May 2021 04:34:15 -0400
X-MC-Unique: Gfd-GM7qOvOY1o3AyEjPvA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso5029718edu.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CI9y4u5GoGanqT2gamg6x0bucQSkKIoIsEtjEK2kZl0=;
 b=fs755ZO1pm3fULIEEN3uY7zvQdaVISfdejmUhx4rin6F075SDxuFFIibSRpwszkgzN
 OPkNPYhnKM1G2iVYz8jYqe14XrYih41s4WJ8Zmcn5Lw3I+Yegy9vrh+a4Cdzu/t/5LJ6
 L7+Sjp21z6Xh93oLb3ArO3gWCJ0WxyzRvbUUWtYEYLU2+D0pzZCI+M0d4YT9QMXKBJ3r
 aY/uBRmwj0bNqfOay+fD0PfqycFvgmrT+gZidZRnJ8si8JQ+yeT+gWPlABonPnqMIGX/
 NjYw15Jr/UjX/pu0FeJJoAu7EJKZi0qc/lCvQOh+aaGu+9+LfeehDY1r9LqGDLhASAsn
 LUMw==
X-Gm-Message-State: AOAM532Z1Bzid48Oy5xTsQ/+uUg3PjNpJH0rTOgRlV7c5i4nmKA/9wnZ
 GVJ4dYObHziAi4dlHRUApWseIkE8q+5fhExrzVZ3/kfofSSP8TWDdAdEJPxrPdaUA2UE2hF+uRx
 V66Zkcx2p0xA9Uqc=
X-Received: by 2002:a17:906:768f:: with SMTP id
 o15mr7894358ejm.455.1620722054319; 
 Tue, 11 May 2021 01:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYT7Ig6XuOSgI2ELc3MnViQQT1gKxntTaTTNunxO6oDp3ujCuENFkPqHQYtrciMKiofBFb9g==
X-Received: by 2002:a17:906:768f:: with SMTP id
 o15mr7894342ejm.455.1620722054091; 
 Tue, 11 May 2021 01:34:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g13sm11112876ejx.51.2021.05.11.01.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 01:34:13 -0700 (PDT)
Subject: Re: [PATCH 6/6] aiopool: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-7-eesposit@redhat.com>
 <bb9be29f-a3ef-3869-ba6f-20a7acc1fe2a@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b77ec798-3af7-c0e8-ade1-0b13d745908b@redhat.com>
Date: Tue, 11 May 2021 10:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bb9be29f-a3ef-3869-ba6f-20a7acc1fe2a@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/21 13:56, Vladimir Sementsov-Ogievskiy wrote:
>>
>> +    }
>> -    if (task->ret < 0 && pool->status == 0) {
>> -        pool->status = task->ret;
>> +    if (ret < 0) {
>> +        qatomic_cmpxchg(&pool->status, 0, ret);
>>       }
> 
> Can we just do it inside critical section above and avoid extra cmpxchg? 
> We'll need just qatomic_set as a pair to qatomic_read()

Good idea.

>>       g_free(task);
>> -    if (pool->waiting) {
>> -        pool->waiting = false;
>> -        aio_co_wake(pool->main_co);
>> -    }
>> +    qemu_co_queue_next(&pool->queue);
> 
> this call doesn't need mutex protection?

It does indeed.

I second the idea of "stealing" Denis's two patches to block/aio_task 
and only adding the mutex (plus qatomic_read/set) here.

Paolo

> Then we should modify comment 
> insid AioTaskPool structure.
> 
> Anyway, I think it's simpler to just have one QEMU_MUTEX_GUARD() for the 
> whole function.


