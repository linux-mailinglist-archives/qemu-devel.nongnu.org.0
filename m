Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF534A86CB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:45:03 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdM6-00042U-Qw
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFczX-0008Rb-IK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFczV-00072X-3X
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643898100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFGT6kuqQlw0g/+wQRBjzcaLHkqDVfYAOjmI3MAZJuw=;
 b=dGk5/QykzRS46ZplAYb+6KzQjX4KJuhJ9qCzfPgkAn6I3Co2KenK16+U2yI5Rp5gi2qYDs
 rFpiQgyQiiTioZe8LbCqIqjM6Kdz8SIYktAq89Kwn75COtFUV0aCUxVjbS5UOgqFV9fPeG
 nTclYwvnkJsjWLDsAgT8p3Z+OTcmCqI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-XiCBlqgcOS2YgLukJOsurQ-1; Thu, 03 Feb 2022 09:21:39 -0500
X-MC-Unique: XiCBlqgcOS2YgLukJOsurQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 x5-20020ac84d45000000b002cf826b1a18so2027145qtv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 06:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bFGT6kuqQlw0g/+wQRBjzcaLHkqDVfYAOjmI3MAZJuw=;
 b=GWxsP8KL3pc1p4Jo1xelXmmcS2G7tovxVxnJSeB7A4mYbLdQcfQaAkZ4DfdmIgkNgu
 3hM2ijc/CShpMD8MptYDBIhVRuUBtOIkc9KbK74G2uEoPkkvXG3/ipveZA8NgqA2Saem
 dvjOnmzdewO26dubp4rRXx/CU6hlA1Ll+CXZcLZddt4l3jZ0jjyn5xbQaefDmu8cJkpt
 T/M0zJZv3HPBHo2ixeWUCvDLNZdLdWgEEGiH3pWgJYI12WaYatxZxVW1SK6cm0N4Dnvm
 bZweW+XZyrqxVMsf0B3x7UQS5s0j42E6TgXPq0mYFBe6BTAGHbWtIN/oXjnIJi10CYT7
 LeGA==
X-Gm-Message-State: AOAM532V9ssXlk+7t480t0xY0Ey4JekC/0dnYDhALrXnktz53YAshTGm
 7dFS4qH71w+7lAbslhx1VNC38GQBcSF060VySCttSwXQ5loOq1BvPDxh4X1bamh/INjPZCrPfWd
 EpwKyi5jpDiYgFLw=
X-Received: by 2002:a37:a597:: with SMTP id
 o145mr23176135qke.457.1643898098973; 
 Thu, 03 Feb 2022 06:21:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpVTvn4R4psgSK01xbXjnx5jUybpcsJX5BHUY050e4B0gWT6nPmgaHZaqXn6yoRN7q2AYZRw==
X-Received: by 2002:a37:a597:: with SMTP id
 o145mr23176117qke.457.1643898098719; 
 Thu, 03 Feb 2022 06:21:38 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id bj24sm11948693qkb.115.2022.02.03.06.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 06:21:38 -0800 (PST)
Message-ID: <30445d7b-0020-84e1-9ff4-1e287748d65a@redhat.com>
Date: Thu, 3 Feb 2022 15:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 09/12] jobs: ensure sleep in job_sleep_ns is fully
 performed
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-10-eesposit@redhat.com>
 <YfEuu6AGUEN4/5PQ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YfEuu6AGUEN4/5PQ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/01/2022 12:21, Stefan Hajnoczi wrote:
> On Tue, Jan 18, 2022 at 11:27:35AM -0500, Emanuele Giuseppe Esposito wrote:
>> If a drain happens while a job is sleeping, the timeout
>> gets cancelled and the job continues once the drain ends.
>> This is especially bad for the sleep performed in commit and stream
>> jobs, since that is dictated by ratelimit to maintain a certain speed.
>>
>> Basically the execution path is the followig:
> 
> s/followig/following/
> 
>> 1. job calls job_sleep_ns, and yield with a timer in @ns ns.
>> 2. meanwhile, a drain is executed, and
>>    child_job_drained_{begin/end} could be executed as ->drained_begin()
>>    and ->drained_end() callbacks.
>>    Therefore child_job_drained_begin() enters the job, that continues
>>    execution in job_sleep_ns() and calls job_pause_point_locked().
>> 3. job_pause_point_locked() detects that we are in the middle of a
>>    drain, and firstly deletes any existing timer and then yields again,
>>    waiting for ->drained_end().
>> 4. Once draining is finished, child_job_drained_end() runs and resumes
>>    the job. At this point, the timer has been lost and we just resume
>>    without checking if enough time has passed.
>>
>> This fix implies that from now onwards, job_sleep_ns will force the job
>> to sleep @ns, even if it is wake up (purposefully or not) in the middle
>> of the sleep. Therefore qemu-iotests test might run a little bit slower,
>> depending on the speed of the job. Setting a job speed to values like "1"
>> is not allowed anymore (unless you want to wait forever).
>>
>> Because of this fix, test_stream_parallel() in tests/qemu-iotests/030
>> takes too long, since speed of stream job is just 1024 and before
>> it was skipping all the wait thanks to the drains. Increase the
>> speed to 256 * 1024. Exactly the same happens for test 151.
>>
>> Instead we need to sleep less in test_cancel_ready() test-blockjob.c,
>> so that the job will be able to exit the sleep and transition to ready
>> before the main loop asserts.
> 
> I remember seeing Hanna and Kevin use carefully rate-limited jobs in
> qemu-iotests. They might have thoughts on whether this patch is
> acceptable or not.
> 

I think the speed was carefully set as "slow enough" just to give time
to the operation to happen while the job was running. Anyways, all tests
I run work as intended, I just increased their speed slightly.
Having speed=1 would make e job really really slow.

Emanuele


