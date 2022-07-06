Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDE568878
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 14:38:09 +0200 (CEST)
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o94IC-0005rX-AK
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 08:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o94Gf-0004ee-7E
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o94Gc-0002gY-GE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657110989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzquAf+6L3d7L4vDrFIca+f6uL/lYJqxvH5e8P2InHg=;
 b=BS2Sdmr5IychyW6VlY1QrAMWCIGrBvkSFxMtZv7FBlA4dhV4Rl4xFiyvYu1H5kH1G512CU
 BYuj3JQwTuBJNn7N1ZKy61cmUlZSuVCdhL7VvqSnlIWwuRADazbMpct6Pa278lzFWVe/SO
 kXgmuijeeCoO+Az+TFjcbhH+25AicFk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-EW4hRFbVNzSFSPklKLmhlw-1; Wed, 06 Jul 2022 08:36:28 -0400
X-MC-Unique: EW4hRFbVNzSFSPklKLmhlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso714733wmb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 05:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzquAf+6L3d7L4vDrFIca+f6uL/lYJqxvH5e8P2InHg=;
 b=ymFgDPGcFHwFz71XzgfQPn6uQ8LoZBFls/ThXNRJyvfbWwNerrmNsqBAlF2sWPN5JJ
 I8TFJo/c5DE6pKpxvivASmU3PV1Ic4lt2mjMwpdM6fPo7MMZQ6aMtkfVvph9aLknvFCX
 HCP4ddWgrx9JMoWAM9PWyA4MZqIekcrgKuUtKcj3G2GyaPXAD5bRXlC58qkPdU4PxJQP
 v1N2o7bo5DicwbrRZQNhxFjEaXej2GOsMVE+CnfCm8YPuaa7FqdYCZ8iDYPwt1GMeR/z
 g2NpjrydD7MM9d7/bzpkEnzGy8HJuZ3HZdbUIuRxE5UDhlfLoBk6gsUjRbm+UR4EEbMg
 etQg==
X-Gm-Message-State: AJIora/eubdAdEwiUHui6A+XFE7/1eI6YXcVbiKQbKWWKLbBjXMwwrHg
 peEAT8FEusSJOizHfGK6ORf8rUrAWonroTL/e/Ei/rHUtvfTMOHbMx5p0ig/d+9LvL+aEBZZOB8
 7MtIDQi3u5/oO1Pw=
X-Received: by 2002:a5d:584f:0:b0:21b:a557:98fa with SMTP id
 i15-20020a5d584f000000b0021ba55798famr35542193wrf.462.1657110987171; 
 Wed, 06 Jul 2022 05:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcTbMlwyh57Ut72isdU8lC81tSuYYlFIVxUYxuSzQ+SmLjIqWTVNoft3dQpDaw7JtlWjNsUA==
X-Received: by 2002:a5d:584f:0:b0:21b:a557:98fa with SMTP id
 i15-20020a5d584f000000b0021ba55798famr35542159wrf.462.1657110986833; 
 Wed, 06 Jul 2022 05:36:26 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adfeb0a000000b0021d6a520ce9sm8776580wrn.47.2022.07.06.05.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 05:36:26 -0700 (PDT)
Message-ID: <233bbc9e-1eb2-4ab5-674d-83f234915a64@redhat.com>
Date: Wed, 6 Jul 2022 14:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job _locked() APIs
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
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
 <6c02430a-a8d8-0be3-18b4-1709e601cbf9@yandex-team.ru>
 <95c3dae0-a8dd-1ec6-0ba1-5a4b1e92c1a3@redhat.com>
 <a48ea347-3a44-28c7-b154-ce3dadbae23c@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <a48ea347-3a44-28c7-b154-ce3dadbae23c@yandex-team.ru>
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



Am 06/07/2022 um 14:23 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 15:05, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 05/07/2022 um 17:01 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>>>> Just as done with job.h, create _locked() functions in blockjob.h
>>>
>>> We modify not only blockjob.h, I'd s/blockjob.h/blockjob/ in subject.
>>>
>>> Also, we start to introduce _locked block_job_* APIs.
>>>
>>> Does it mean that BlockJob and Job share the global mutex to protect
>>> themselves? Than I think we should document in BlockJob struct what is
>>> protected by job_mutex.
>>
>> There is nothing in the struct (apart from Job) that is protected by the
>> job lock. I can add a comment "Protected by job mutex" on top of Job job
>> field?
> 
> Yes, I think that's worth doing.
> 
> Other fields doesn't need the lock?
> 
Well I didn't plan to actually look at it but now that you ask:

/** needs protection, so it can go under job lock */
BlockDeviceIoStatus iostatus;

/** mostly under lock, not sure when it is called as notifier callback
though. I think they are GLOBAL_STATE, what do you think?  */
int64_t speed;

/** thread safe API */
RateLimit limit;

/** I think it's also thread safe */
Error *blocker;

/* always under job lock */
Notifier finalize_cancelled_notifier;
Notifier finalize_completed_notifier;
Notifier pending_notifier;
Notifier ready_notifier;
Notifier idle_notifier;

Not sure about blockjob->speed though.

Emanuele


