Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA8478DDE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:34:52 +0100 (CET)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEJv-0001fa-3h
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myEHu-0008Kt-JK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myEHs-00067Q-T4
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvY+xjLSsNk6Eozn4R1VWyY6qMRRGATNTSo67akN+6Y=;
 b=TFj8h0JHLlNhtY+NCrnmjmC42Z4/VAA7AivdUMWAm096p+7TFCzTmYrH1Sgcuzl0+rSPKi
 nfyR8keRjAsyq8NO7Bf4rjZPGLxuK/p+DvQiRfQ8Mq7XE/8zhgKN1GbinJUz8Hwo52avOe
 ZNufOPqrfy7CIYhL0kx3iGva5cUWeR0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-QUYlyc8QOcC02uLliEoGBQ-1; Fri, 17 Dec 2021 09:32:43 -0500
X-MC-Unique: QUYlyc8QOcC02uLliEoGBQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so676163wrm.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ZvY+xjLSsNk6Eozn4R1VWyY6qMRRGATNTSo67akN+6Y=;
 b=vizjS7vi8O8n0pbv5YUdoqJVCIKxJDgs1mDOY/q1XfVBFBio+UFxwZwODIMixDOmrH
 gBgptlh5PRQK0LQC+ySfVOjTKzl+EqPOyJRBTkpB7S5kRiSxXpugymG3+Xrk5d0NCg4W
 drjzM+JvfvVqm9K2DoD1q7+gI4mVoJP1LudshqrMZZFElR1VNNnMVrBxqPbcsKO6zEq8
 VPcCbpvX/lR44hfLCcZZh+Z6jZNTTRjcMU3C6yrVz+FK4u67hRHLysUj7ySQItt9NSbx
 T+rfjlqdtERWesISP8Kjjvo/eu0tuTxlLdaDYMB0kd1gdf7236sivHroTYaYyDY6tcQx
 ramw==
X-Gm-Message-State: AOAM532QBB5EhrH+KKrXKWgcG6hELA5ZzrE45HUKNSdENvI/HfmRbkBn
 avwgK/kMCtnyOqh2ht+LuQt/L97wmUPeEMCH1lPKptVknemUOfk+BTOmkghyWpsu7WmLLt6u5gg
 PefKoeVhgDMCzIoc=
X-Received: by 2002:a05:600c:2902:: with SMTP id
 i2mr2901203wmd.168.1639751560999; 
 Fri, 17 Dec 2021 06:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdroCT/YBWYAlucalqND8VFixERDxMSvpJnd5nSy9Fae/7Gjt32d03SBroF0FAOZpTGgs6hA==
X-Received: by 2002:a05:600c:2902:: with SMTP id
 i2mr2901170wmd.168.1639751560638; 
 Fri, 17 Dec 2021 06:32:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id e12sm9575102wrq.20.2021.12.17.06.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:32:40 -0800 (PST)
Message-ID: <100a3b3c-b4fe-d989-2052-117cb261afa6@redhat.com>
Date: Fri, 17 Dec 2021 15:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 30/31] crypto: delegate permission functions to
 JobDriver .pre_run
From: Hanna Reitz <hreitz@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-31-eesposit@redhat.com>
 <ab01f9e1-447f-6c84-b409-2737548679d4@redhat.com>
In-Reply-To: <ab01f9e1-447f-6c84-b409-2737548679d4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.21 13:29, Hanna Reitz wrote:
> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>> block_crypto_amend_options_generic_luks uses the block layer
>> permission API, therefore it should be called with the BQL held.
>>
>> However, the same function is being called ib two BlockDriver
>
> s/ ib / by /
>
>> callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).
>>
>> The latter is I/O because it is invoked by block/amend.c's
>> blockdev_amend_run(), a .run callback of the amend JobDriver
>>
>> Therefore we want to 1) change block_crypto_amend_options_generic_luks
>> to use the permission API only when the BQL is held, and
>> 2) use the .pre_run JobDriver callback to check for
>> permissions before switching to the job aiocontext. This has also
>> the benefit of applying the same permission operation to all
>> amend implementations, not only luks.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/amend.c  | 20 ++++++++++++++++++++
>>   block/crypto.c | 18 ++++++++++++------
>>   2 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/block/amend.c b/block/amend.c
>> index 392df9ef83..fba6add51a 100644
>> --- a/block/amend.c
>> +++ b/block/amend.c
>> @@ -53,10 +53,30 @@ static int coroutine_fn blockdev_amend_run(Job 
>> *job, Error **errp)
>>       return ret;
>>   }
>>   +static int blockdev_amend_refresh_perms(Job *job, Error **errp)
>> +{
>> +    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
>> +
>> +    return bdrv_child_refresh_perms(s->bs, s->bs->file, errp);
>> +}
>
> I miss some documentation for this function, why we do it and how it 
> works together with the bdrv_co_amend implementation.
>
> I was trying to come up with an example text, but then I wondered – 
> how does it actually work?  bdrv_child_refresh_perms() eventually ends 
> up in block_crypto_child_perms().  However, that will only return 
> exceptional permissions if crypto->updating_keys is true. But that’s 
> set only in block_crypto_amend_options_generic_luks() – i.e. when the 
> job runs.  That’s exactly why that function calls 
> bdrv_child_refresh_perms() only after it has modified 
> crypto->updating_keys.
>
> Reproducer (amend on a LUKS image with read-only=true, so it doesn’t 
> have the WRITE permission continuously, but needs to take it as an 
> exception in block_crypto_child_perms()):
>
> $ qemu-img create \
>     -f luks \
>     --object secret,id=sec0,data=123456 \
>     -o key-secret=sec0 \
>     test.luks \
>     64M
> Formatting 'test.luks', fmt=luks size=67108864 key-secret=sec0
>
> $ ./qemu-system-x86_64 \
>     -object secret,id=sec0,data=123456 \
>     -object iothread,id=iothr0 \
>     -blockdev file,node-name=node0,filename=test.luks \
>     -blockdev 
> luks,node-name=node1,key-secret=sec0,file=node0,read-only=true \
>     -device virtio-blk,drive=node1,iothread=iothr0 -qmp stdio \
>     <<EOF
> {"execute": "qmp_capabilities"}
> {
>     "execute": "x-blockdev-amend",
>     "arguments": {
>         "job-id": "amend0",
>         "node-name": "node1",
>         "options": {
>             "driver": "luks",
>             "state": "active",
>             "new-secret": "sec0"
>         }
>     }
> }
> EOF
>
> {"QMP": {"version": {"qemu": {"micro": 93, "minor": 1, "major": 6}, 
> "package": "v6.2.0-rc3-50-gdb635fc4e7"}, "capabilities": ["oob"]}}
> {"return": {}}
> {"timestamp": {"seconds": 1639742600, "microseconds": 574641}, 
> "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": 
> "amend0"}}
> {"timestamp": {"seconds": 1639742600, "microseconds": 574919}, 
> "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": 
> "amend0"}}
> {"return": {}}
> qemu-system-x86_64: ../block/io.c:2041: bdrv_co_write_req_prepare: 
> Assertion `child->perm & BLK_PERM_WRITE' failed.
> [1]    55880 IOT instruction (core dumped)  ./qemu-system-x86_64 
> -object secret,id=sec0,data=123456 -object  -blockdev

Addendum: Running the iotests, I realized that (because 295 and 296 fail 
for luks) of course it doesn’t matter whether the job runs in the main 
loop or not in order to reproduce this assertion failure, so the 
`-object iothread,id=iothr0` and `-device 
virtio-blk,drive=node1,iothread=iothr0` can be dropped from the qemu 
command line.

Hanna


