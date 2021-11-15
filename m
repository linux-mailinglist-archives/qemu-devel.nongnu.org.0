Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086A450620
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:57:56 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcUd-0007F9-4g
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmcTQ-0005pG-JC
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmcTM-0007DZ-TF
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9JHTK+UEKYzWYKiiTp4NkwRN2rQUajMsW3ghEHd4gY=;
 b=fzj+eAHpuWEQHiNzWfJW6w0imBl5+wVcpzs7cYRH/HzVtx7z9LKG1mevW3eIRdK/B7lKxm
 LtGFYHwF1tsrLz9hXF3zIb3wabamOVTzUAMaHdmr1BTcGKSjcHn59noaSqEn0n0CwrmcKE
 ZiC9HxmfjPG7oGW3tW01NIN5O4VxTyM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-ZMoo3EF7P9aITW4uN43DfQ-1; Mon, 15 Nov 2021 08:56:34 -0500
X-MC-Unique: ZMoo3EF7P9aITW4uN43DfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso9664186wme.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 05:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F9JHTK+UEKYzWYKiiTp4NkwRN2rQUajMsW3ghEHd4gY=;
 b=fcvnAMe5v4gLT7IFr7r7d36IHPyPo0/YMcsh2/L/l1pr3BiMv7ZRbGz8h1XvCVZVzb
 Ap0jfX60/ZHKNhNSSfwvCTen3AYN7lBtaq7ENdrZIgntBFQfxgwnEm+J0KCy+0h+qmNv
 7bsZhsM1aBPyr/FD+ulWSNFLtfuN9291DG6iji86ki/iAsjNA+mdHxjJA5YMvhki7/P8
 VEXnRVd5IaD80u5P+B7Hc8Vo/8ASJtOjf7CSJ1dfssxXqd5w6FAWO20/IXm0xvv6nBrJ
 kQIg4zY4NAXZYc+aB8vvgUxT5TZ+H+ByaSH8I4FuJeZtuYW28K3lcixoNEvuj5xA0WYY
 qMhg==
X-Gm-Message-State: AOAM530X5X0X/66vsxTv1IeECY+lh6L4Q4MZVYmAlEUc5N8VJt8Nve15
 lrpK660LavxnNjwd8m5mE8hJDnyhfCc41/ytHjYdzOL1om5NlyLUl8s9friqRLUKa2Gya04ktc+
 h+GIQvuYToz3D0vk=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr58618485wmi.173.1636984593466; 
 Mon, 15 Nov 2021 05:56:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRw8/p0HKESpftt1WbFVbI8JNP2pbNCBvIjD5RA+Uxav/FFUfis821qocIbmLnIlASZI3V4w==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr58618459wmi.173.1636984593252; 
 Mon, 15 Nov 2021 05:56:33 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n129sm9457946wmn.36.2021.11.15.05.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 05:56:32 -0800 (PST)
Message-ID: <c5a9a63e-e859-f6fe-d694-2ad4134d8bdc@redhat.com>
Date: Mon, 15 Nov 2021 14:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/10] iotests/030: Unthrottle parallel jobs in reverse
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-11-hreitz@redhat.com>
 <243c7e9a-88e4-ded3-721a-5f040aee36d5@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <243c7e9a-88e4-ded3-721a-5f040aee36d5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.11.21 17:25, Vladimir Sementsov-Ogievskiy wrote:
> 11.11.2021 15:08, Hanna Reitz wrote:
>> See the comment for why this is necessary.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/030 | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>> index 5fb65b4bef..567bf1da67 100755
>> --- a/tests/qemu-iotests/030
>> +++ b/tests/qemu-iotests/030
>> @@ -251,7 +251,16 @@ class TestParallelOps(iotests.QMPTestCase):
>>                                    speed=1024)
>>               self.assert_qmp(result, 'return', {})
>>   -        for job in pending_jobs:
>> +        # Do this in reverse: After unthrottling them, some jobs may 
>> finish
>> +        # before we have unthrottled all of them.  This will drain 
>> their
>> +        # subgraph, and this will make jobs above them advance 
>> (despite those
>> +        # jobs on top being throttled).  In the worst case, all jobs 
>> below the
>> +        # top one are finished before we can unthrottle it, and this 
>> makes it
>> +        # advance so far that it completes before we can unthrottle 
>> it - which
>> +        # results in an error.
>> +        # Starting from the top (i.e. in reverse) does not have this 
>> problem:
>> +        # When a job finishes, the ones below it are not advanced.
>
> Hmm, interesting why only jobs above the finished job may advance in 
> the situation..
>
> Looks like something may change and this workaround will stop working.
>
> Isn't it better just handle the error, and don't care if job was just 
> finished?
>
> Something like
>
> if result['return'] != {}:
>    # Job was finished during drain caused by finish of already 
> unthrottled job
>    self.assert_qmp(result, 'error/class', 'DeviceNotActive')

Well.  My explanation (excuse) is that I felt like this was the hack-ish 
solution that I could have gone for from the start without understanding 
what the issue is (and in fact it was the solution I used while 
debugging the other problems).  I went with `reversed()`, because that 
really addresses the problem.

You’re right in that it only addresses the problem for now and there’s a 
chance it might reappear.  If we want to go with ignoring 
DeviceNotActive errors, then I think we should at least query all block 
jobs before the unthrottle loop and see that at least at one point they 
were all running simultaneously.

I don’t really have a strong opinion.  We can exchange this patch now 
(though I’d rather not hold up the rest of the series for it), or have a 
patch on top later, or, well, just keep it for now.  I think the least 
stressful option would be to just fix it up later.

Hanna


