Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB13A9C82
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:48:16 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVtv-0005kI-Qt
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltVsV-0003wY-Sd
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltVsS-0005WK-7T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623851203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yk6rh8t8FTy6HeEpW5t40lYSJrOr1Tn6gpdrh8+ITM=;
 b=McL6nDkynd8lOiS65FKVJ5xuEvOLZeALzqDY1Nndp5lcR8PvG5K9L5XDk0e1++F/wA4LhI
 zAfB0RZOAmb5zVcNERhlyULOjnMX4UKn0r7MTUtTpNrEHO2vedwnSR18HkOePBq92N2LJE
 P9OupwIY2rJ8mSAn2rPXtz6Dhd/kEco=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-lfMxHDqEOdSoOhzFYYd_7Q-1; Wed, 16 Jun 2021 09:46:42 -0400
X-MC-Unique: lfMxHDqEOdSoOhzFYYd_7Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 a16-20020aa7cf100000b0290391819a774aso1072782edy.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5yk6rh8t8FTy6HeEpW5t40lYSJrOr1Tn6gpdrh8+ITM=;
 b=UKeNgXw+3L4sBt8H4vrAvl/Gn47sud2yyejJOGlsvB3R+RT0LLKGsgs6ZCmVnKqOhN
 JMaPjbWSNfDw/NkKMTLJmhGZRGj7ThTsCHeL0Y7jetwlxuRmrVKpuqG5RzEiGzZLRNqY
 HpdTvrqfy/K4L+QOsLUDmQcNmhAFdJ6fjbEBjF3KGSSgfSnLy+l4HmfGTdlTj7TcNZyb
 U0WmZwY7oBNz+dPfrxsD7f/AkmZJT7p0o8iU+UmqgWVm8LeCjyVWPjln/KCDVCAWm3A6
 HZqL1DfXe2f77TwqxlpGw/7jRRAfY5IW1I3YZQjJLshmeQaq80lnkOFU0I04+mtYRoz2
 WBmw==
X-Gm-Message-State: AOAM530EfjetY6rOV03ss8jVmxIRFErDeE1Ki5+7BmumbH92z5xz/sHZ
 VmzLuoShqO3Tbpdh/olkM1gIjDGJTKWHupGBYRjBRCyy0T/UXP2gynVpL089UaBWOpkYBUyNob0
 EMxaBr8+H8asdLX8=
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr5348711ejm.282.1623851201036; 
 Wed, 16 Jun 2021 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+23R/C+qWyM7uJWnhuKh+efsVjmq2DhTnKF9fxhL4emyxzv7lUz9qfge+g7MY1epn7XC/jg==
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr5348696ejm.282.1623851200851; 
 Wed, 16 Jun 2021 06:46:40 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e22sm1857088edu.35.2021.06.16.06.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:46:40 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
 <cb030dc0-ee6f-4c0b-723d-4197c51f8a61@redhat.com>
 <a684c31d-9da3-9e75-89c0-c68997760108@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <664fb7dd-a6ca-9165-8ed7-24dac1c0ef81@redhat.com>
Date: Wed, 16 Jun 2021 15:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a684c31d-9da3-9e75-89c0-c68997760108@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 16.06.21 15:18, Paolo Bonzini wrote:
> On 15/06/21 18:18, Max Reitz wrote:
>>>   }
>>> +/* Returns the maximum hardware transfer length, in bytes; 
>>> guaranteed nonzero */
>>> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
>>> +{
>>> +    BlockDriverState *bs = blk_bs(blk);
>>> +    uint64_t max = INT_MAX;
>>> +
>>> +    if (bs) {
>>> +        max = MIN_NON_ZERO(bs->bl.max_hw_transfer, 
>>> bs->bl.max_transfer);
>>> +    }
>>> +    return max;
>>
>> Both `max_hw_transfer` and `max_transfer` can be 0, so this could 
>> return 0, contrary to what the comment above promises.
>>
>> Should `max` be initialized to 0 with a `MIN_NON_ZERO(max, INT_MAX)` 
>> here (like `blk_get_max_transfer()` does it)?
>
> Yes, something to that effect.
>
>> (As for the rest, I think aligning to the request alignment makes 
>> sense, but then again we don’t do that for max_transfer either, so... 
>> this at least wouldn’t be a new bug.
>
> Ok, will do.  I will also add a new patch to align max_transfer to the 
> request alignment.
>
>> Regarding the comment, checkpatch complains about it, so it should be 
>> fixed so that /* is on its own line.
>
> That makes it different from every other comment in block_int.h 
> though.  Is it okay to fix all of them in a follow-up?

The reason it’s different is that the comment style in question was 
added to checkpatch only relatively recently. I can’t speak for others, 
but I’m a simple person. I just do what makes checkpatch happy. :)

Given that the checkpatch complaint is only a warning, I think it’s OK 
to keep the comment as it is here, and perhaps optionally fix all 
comments in block_int.h in a follow-up. I don’t think we need to fix 
existing comments, but, well, it wouldn’t be wrong.

Max


