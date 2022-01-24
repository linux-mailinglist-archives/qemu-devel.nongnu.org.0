Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BD49821A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:27:30 +0100 (CET)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0Je-0003YV-2G
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:27:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0FS-00087F-Ir; Mon, 24 Jan 2022 09:23:11 -0500
Received: from [2a00:1450:4864:20::533] (port=33702
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0FR-0005ry-5U; Mon, 24 Jan 2022 09:23:10 -0500
Received: by mail-ed1-x533.google.com with SMTP id b13so57081006edn.0;
 Mon, 24 Jan 2022 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=27YILD9b7uNqh5Cib3Np9apbE6qns8EGgPxzYA1DRZE=;
 b=keSgelGn40DzvvcLmETNh05V4R59hhGgNdrkkeETA/l1xhg+UC79mVEnTo8pnxLJs/
 zf6Gd5lOINPq+UrcuXA0CaYXzppGgzp+mLLDzdfYkThya94MZ9iQyeJGx5L7bR7yIpyX
 QKsInHSt3o2KQENYr2mhZPQQLhnuxFj/akrl04zXp4OyZPPELmRrs0bP3wAVeWaX+Mxm
 yBkOOI5erepvz/9jPlHmndG90ottOYA1PCKZHWw9bOcfCO9TFT/n6K+xA4fZdunIuOyH
 sc4VypqQjPQMTSW7+2SRTJbHf+BpRYidyHPJyL/gt82yI5Lodj9xaDWvIJXJzc6bCxqT
 TRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=27YILD9b7uNqh5Cib3Np9apbE6qns8EGgPxzYA1DRZE=;
 b=8MqN4S1ViVuuFtMOrQzMq4LpPmo7RtfJy1zhb4AV9T7UOp3jJfVDhkAp4G9kvFSm7M
 s+YCP/OHUPiK2gT5uMzcCz+t/sKMtGThEiCpd7f7A2DhDjvHzlwcKSqwTlY4GU7+UYNd
 1EwpnrunyhdpUzjkWbHNW9+OH9+MQa7/Pt4M9ec2ZSnV7taZrkKZeiJtW4Ald8B0zQBt
 m3msd8GKdkeIDJth7uK1ubFXk2Yl98mWZlCWbD0nXoZbbDwemoeooxvI8RjLmDMyvtR5
 92l6a3sbcPkYOfL3+jQnlyLnDEdhmj0WLjUDny9eb7tkcq9o5sbgNX0NDb8UYHQh4Prg
 a7NA==
X-Gm-Message-State: AOAM530RovpvnuDDlmB6w68C+zxaYvqWrwOonPTZT7m+iPiOfYSLzGtc
 qcOaP+96Jy4ERGHbf44QPgc=
X-Google-Smtp-Source: ABdhPJw2+udDEhPVxs1Hs6yAi/9ZzWy9n+hY4lavHPGFG/ccnPQiXzW+2CTcO3o3bpLons4DBzDdXw==
X-Received: by 2002:a05:6402:2d4:: with SMTP id
 b20mr16633411edx.98.1643034176687; 
 Mon, 24 Jan 2022 06:22:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id co19sm6695609edb.7.2022.01.24.06.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:22:56 -0800 (PST)
Message-ID: <9d458486-9ed7-1fae-28ff-84ee3d7e34f8@redhat.com>
Date: Mon, 24 Jan 2022 15:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
 <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
 <4565cc3c-f472-e261-7ae3-e92253f1f3d6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4565cc3c-f472-e261-7ae3-e92253f1f3d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 16:18, Emanuele Giuseppe Esposito wrote:
>>>
>>
>> Better to use aio_co_schedule here, too, and move it under the 
>> previous WITH_JOB_LOCK_GUARD.
> 
> Unfortunately this does not work straightforward: aio_co_enter invokes 
> aio_co_schedule only if the context is different from the main loop, 
> otherwise it can directly enter the coroutine with 
> qemu_aio_coroutine_enter. So always replacing it with aio_co_schedule 
> breaks the unit tests assumptions, as they expect that when control is 
> returned the job has already executed.
> 
> A possible solution is to aio_poll() on the condition we want to assert, 
> waiting for the bh to be scheduled. But I don't know if this is then 
> useful to test something.

I think you sorted that out, based on IRC conversation?

Paolo

