Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B698570202
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:28:26 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsWW-0006z1-T4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oAsTA-0003fj-5w
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oAsT7-0001RT-Ao
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657542292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW5nQ8v1zT6BFK9dFMFyWguHwWwy1kHBavsihAfCaJk=;
 b=BsUo1Kp94l628kw+2JlumiDqBbP+4yOTPHYGRVD6WNVnkymZnSLGdXh+wbdPQiHhlxG9J6
 K8LkxDc41e4u3ssKmeexNHbs0iM/CFxXfa8gI+407I20ctfkgW6TLBp71xj7dbev42CcBS
 t+7rv16V0vESgs3UIgzXvLNwVcQkZj0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-MhDyvVaoPKWyB8b9vnGjDQ-1; Mon, 11 Jul 2022 08:24:51 -0400
X-MC-Unique: MhDyvVaoPKWyB8b9vnGjDQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q12-20020adfab0c000000b0021d6dcb51e8so592167wrc.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lW5nQ8v1zT6BFK9dFMFyWguHwWwy1kHBavsihAfCaJk=;
 b=1IY645N2E/W8OJFVCvF3SiB0ksytDzXvGh7fn9VFIwp1Fyy3aRmxne25vjqhGP/10e
 BUceJkH82Eq6ckeoRReLM1rOVsvuEF7rvGKl0Ntavan/1h8yatejB0mMtBfadB57MycS
 4NcBXdWkuGBmIXi5j/gtMbaYJWfHx5TkK61ZQ96vQ4uisThxCyc/9+ipsefNqypVumyX
 mBxH4+bfW/1s4Z6H3H/2BlJ6LOQPK8gAyJf/FiTG/HZZSFOx3fzEblWIphJQ/qWCG3n5
 0lHdoi9yJ8pCmhH0t5df3HFlTiHEI2HnoAQYhCJs/VX/rV/yEHe3QaT3mo/sdzbOyxe7
 DQNA==
X-Gm-Message-State: AJIora+lPQdjwBJ9Wmdn++dw1pkxHyW/TewKY+A+SMBarRmSXqSWpMm2
 OBzDgBk4eMsDbdOWjVJKu4TQcFr5Uo0ofm1n8GiVzM/2cWlhrPNCMJijRwv7PXcRO8PPdUqLCp5
 JzN6/R05LZOiOL4w=
X-Received: by 2002:adf:fb43:0:b0:21a:22eb:da43 with SMTP id
 c3-20020adffb43000000b0021a22ebda43mr16314528wrs.347.1657542290534; 
 Mon, 11 Jul 2022 05:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHpUeE9DhXoHB658kr1dT1qtLOCxAoQrSd50NPwPmkk3ElKelmu6zKgYvyd3gVvriTi3FJKQ==
X-Received: by 2002:adf:fb43:0:b0:21a:22eb:da43 with SMTP id
 c3-20020adffb43000000b0021a22ebda43mr16314492wrs.347.1657542290200; 
 Mon, 11 Jul 2022 05:24:50 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b00397342e3830sm19074370wms.0.2022.07.11.05.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 05:24:49 -0700 (PDT)
Message-ID: <f78afe56-61c4-2f57-4f4a-62225aeff1bf@redhat.com>
Date: Mon, 11 Jul 2022 14:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 07/21] blockjob: introduce block_job _locked() APIs
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-8-eesposit@redhat.com>
 <636b3296-72c8-a359-2dd3-973822640848@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <636b3296-72c8-a359-2dd3-973822640848@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11/07/2022 um 14:04 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> Just as done with job.h, create _locked() functions in blockjob.h
>>
>> These functions will be later useful when caller has already taken
>> the lock. All blockjob _locked functions call job _locked functions.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> We not only create _locked() interfaces, but also make some functions
> correct relatively to job_mutex that was not correct pre-patch, for
> example:
> 
> block_job_iostatus_reset(): the function doesn't call any job_* APIs,
> but it access Job fields. After patch fields are accessed under mutex
> which is correct, and that's the significant change worth mentioning in
> commit message.
> 
> So, more correct is to say, that we make some functions of blockjob API
> correct relatively to job_mutex and Job fields.
> 
> With at least this clarified, I'm OK with the patch as is:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> 
> What kept in mind after the patch:
> 
> 1. Some functions still need an update, for example
> block_job_error_action, that access Job.user_pause without locking the
> job_mutex. Or, block_job_event_completed that accesses Job.ret..

This comes afterward, I didn't check the patches but the end result
covers what you mention above.

> 
> 2. What about BlockJob.nodes field? Shouldn't we protect it by the mutex?
> 

As I wrote in the comment in patch 17, seems to be always modified under
GLOBAL_STATE_CODE.

Thank you,
Emanuele


