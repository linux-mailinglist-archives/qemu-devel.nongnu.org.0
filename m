Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3933B1DC2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:44:09 +0200 (CEST)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw52u-0001ia-FZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw51u-0000F3-W2
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw51r-0005sI-OD
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624462983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0jIFG1J1Ca1tRsqBYMzwAuJ/oloSfpzYlkjHkUguozE=;
 b=PYN01If1J8n0AvcDmdlhthB2JW99hy4lAI5y/8jTeGjgC28s/8KR8KMU7tA6snbPQBldcF
 AtCrn+bEp28Yhq8gM07UehNgdcJVRqovO7kjpCzuUJz8+OmtFkDF8PGYHug+kJUU5vc9e0
 GL4f5QDjGlfZtAn6hWAIX98R3CM1kf0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-fOHwZny-PxiAifnzuR4Qxw-1; Wed, 23 Jun 2021 11:43:01 -0400
X-MC-Unique: fOHwZny-PxiAifnzuR4Qxw-1
Received: by mail-ej1-f71.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso1147262ejp.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0jIFG1J1Ca1tRsqBYMzwAuJ/oloSfpzYlkjHkUguozE=;
 b=iEqq1eocv2NBKTVG4EB6XppsxDXn1tdMoAOA9+xmM95PG8EK19ap41s6GIXMlhn2Iu
 L1AJ90tE4dQQubWAHLf8lUX1venqnBX3+aTPLOpLuNQNmKWNaVU3/pDArOuXJz1SNw4D
 c+LwtYzNlS2uEA1hckg9z37V4MI2RGBGmHmkGG+C9VoFWCZdekptNpNw0d6BugdTQ8PN
 SZIOgssa+RLLkh1yxZdsVVI7eb0Lu4F9gFKEv9Rb52EN8KM8F7zn34TqVKzhhJzdLdOS
 9ujk89sIUw4nMSeUboMXfzM39lvHkrCgSxGaec+JxXtwYsYuEGmkq/v6284Z3cH7Hvro
 zymQ==
X-Gm-Message-State: AOAM532JzLY2bsW74r2plQEIAWz0U6LYnc80LWiuz2tHmuygutBA4p5q
 8Nsc8LzbiJxGRzV13as3GUWAz6Fu40wpCegyo0X2rv/mXjDCDsgPIMIsuASE0FH7tyhHGujXb3L
 gc14Zb2JFuGVzHtE=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr501834edd.116.1624462980533; 
 Wed, 23 Jun 2021 08:43:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPus0ElwfG1DrhVx5gApaVs8SrS+TDn4ox0c+xFtnHPH/5pPWxwwlEWwUCtvRO5SxmGzBZnw==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr501808edd.116.1624462980333; 
 Wed, 23 Jun 2021 08:43:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 qq26sm78643ejb.6.2021.06.23.08.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:42:59 -0700 (PDT)
Subject: Re: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-2-pbonzini@redhat.com>
 <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <370bcdef-15ae-f837-e5da-2293ca8f1342@redhat.com>
Date: Wed, 23 Jun 2021 17:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.06.21 21:14, Vladimir Sementsov-Ogievskiy wrote:
> 08.06.2021 16:16, Paolo Bonzini wrote:
>> Even though it was only called for devices that have bs->sg set (which
>> must be character devices), sg_get_max_segments looked at /sys/dev/block
>> which only works for block devices.
>>
>> On Linux the sg driver has its own way to provide the maximum number of
>> iovecs in a scatter/gather list, so add support for it.  The block 
>> device
>> path is kept because it will be reinstated in the next patches.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/file-posix.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index f37dfc10b3..536998a1d6 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>>           goto out;
>>       }
>>   +    if (S_ISCHR(st.st_mode)) {
>
> Why not check "if (bs->sg) {" instead? It seems to be more consistent 
> with issuing SG_ ioctl. Or what I miss?

I dismissed this in v3, because I didn’t understand why you’d raise this 
point.  The function is called sg_*(), and it’s only called if bs->sg is 
true anyway.  So clearly we can use SG_ ioctls, because the whole 
function is intended only for SG devices anyway.

This time, I looked forward, and perhaps starting at patch 4 I can 
understand where you’re coming from, because then the function is used 
for host devices in general.

So now I don’t particularly mind.  I think it’s still clear that if 
there’s a host device here that’s a character device, then that’s going 
to be an SG device, so I don’t really have a preference between 
S_ISCHR() and bs->sg.

Max

>> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
>> +            return ret;
>> +        }
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    if (!S_ISBLK(st.st_mode)) {
>> +        return -ENOTSUP;
>> +    }
>> +
>>       sysfspath = 
>> g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>>                                   major(st.st_rdev), minor(st.st_rdev));
>>       sysfd = open(sysfspath, O_RDONLY);
>>
>
>


