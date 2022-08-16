Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6B595BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:43:20 +0200 (CEST)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvuh-0003SI-Vi
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNvrB-0007i6-8v
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNvr8-0003eI-0q
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660653577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mS1gj1lQMltftSk1i7s2NYRdyZ3yV2rkJ6XC3JDu0XI=;
 b=UFpXNdMLIvrzzY6d0zYnRBCWtj1eIm8QqFza3oUYNTpHtmWARxJ+af2WU4/pnNoMitZU0x
 6JR0CKxcpsqowvUdaXmTrvlBLBBdpg6hrEQPFj36FN7Vm0IgHeHWSGsfBHvF8OcRGzCgJy
 9GlrPFlIfJpR1mZzAUw5kS5WC8OsuPg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-MCQfBziDO4m9oEI4fhr32w-1; Tue, 16 Aug 2022 08:39:28 -0400
X-MC-Unique: MCQfBziDO4m9oEI4fhr32w-1
Received: by mail-wm1-f70.google.com with SMTP id
 z16-20020a05600c0a1000b003a5c18a66f0so4868462wmp.6
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=mS1gj1lQMltftSk1i7s2NYRdyZ3yV2rkJ6XC3JDu0XI=;
 b=pXmmeziwbR7LkTkMf7s6rPV2uEdPDd5pOnEEt9s1pig/XSGKvrqh0fMwIzzk4FBDUM
 3nuOFb67q7NgWyN2OUspLmm1UR3MQ31KElEUtmAmf/Xk+fS9ldq+/nWqkKRBh2IptxIf
 2o+NlrvJN/qNcKwZQC3IUPe9iBipgHm2/2Tt/X4UvPAxTlPpAd6ORGu2HWgQR1j5HmNc
 o9sxOvNCXS9rnPOom59sWqX25n0ZQLuPRrBc7lzFGZPeOyD4EmYsOzdJitCVqe7woZrQ
 yojaupv2mXdKj1ufP8DofPloda8qYWicxUUmuGhssK0UVL/57ftTksAt/U8Ocw84hBYb
 H1ww==
X-Gm-Message-State: ACgBeo3amwVoX1GHyUGLYh24qmqxRSdRtjlfrXIX9DvdI4iNh2ziKRCr
 MNPsmaS3zbrjgh6zaTByTZzMqAtgifWwNbBBiC4l7CCWwXXaG2KJTLjMWJ6ZYLUzZWyMAhymZq2
 RVH5pp5Dl0Ts1Of0=
X-Received: by 2002:a05:600c:1912:b0:3a5:f4fc:cd40 with SMTP id
 j18-20020a05600c191200b003a5f4fccd40mr6021104wmq.205.1660653567287; 
 Tue, 16 Aug 2022 05:39:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73hyWkksUhSEcjYCDAUMTZYPoUp7T7GKpws+LmsXE8NyD9vZdNGTO0G8eO9u9C0j9a7/pRpg==
X-Received: by 2002:a05:600c:1912:b0:3a5:f4fc:cd40 with SMTP id
 j18-20020a05600c191200b003a5f4fccd40mr6021079wmq.205.1660653567071; 
 Tue, 16 Aug 2022 05:39:27 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adffe84000000b0021eff2ecb31sm10239517wrr.95.2022.08.16.05.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 05:39:26 -0700 (PDT)
Message-ID: <4f1e3d46-88d7-301c-b98a-65f0e3b5c0c6@redhat.com>
Date: Tue, 16 Aug 2022 14:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 17/21] blockjob: protect iostatus field in BlockJob
 struct
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
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-18-eesposit@redhat.com>
 <41d4b19d-f0c1-99dd-b5c5-735694241dcc@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <41d4b19d-f0c1-99dd-b5c5-735694241dcc@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 27/07/2022 um 17:29 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/25/22 10:38, Emanuele Giuseppe Esposito wrote:
>> iostatus is the only field (together with .job) that needs
>> protection using the job mutex.
>>
>> It is set in the main loop (GLOBAL_STATE functions) but read
>> in I/O code (block_job_error_action).
> 
> Hmm, block_job_error_action doesn't read iostatus..

block_job_error_action -> block_job_iostatus_set_err_locked -> reads
iostatus

>  
> Also, iostatus is read by by mirror_run, which is not protected.

Will do, thanks

Emanuele

>>
>> In order to protect it, change block_job_iostatus_set_err
>> to block_job_iostatus_set_err_locked(), always called under
>> job lock.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   blockjob.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/blockjob.c b/blockjob.c
>> index 0663faee2c..448bdb5a53 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -363,7 +363,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>> **errp)
>>       return block_job_query_locked(job, errp);
>>   }
>>   -static void block_job_iostatus_set_err(BlockJob *job, int error)
>> +/* Called with job lock held */
>> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>>   {
>>       if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>           job->iostatus = error == ENOSPC ?
>> BLOCK_DEVICE_IO_STATUS_NOSPACE :
>> @@ -577,8 +578,8 @@ BlockErrorAction block_job_error_action(BlockJob
>> *job, BlockdevOnError on_err,
>>                    */
>>                   job->job.user_paused = true;
>>               }
>> +            block_job_iostatus_set_err_locked(job, error);
>>           }
>> -        block_job_iostatus_set_err(job, error);
>>       }
>>       return action;
>>   }
> 
> 


